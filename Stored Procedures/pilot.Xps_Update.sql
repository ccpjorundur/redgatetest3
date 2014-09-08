SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[Xps_Update]
  @eventTypeID  smallint,
  @pilotID      int,
  @shipClassID  tinyint,
  @amount       int
AS
  SET NOCOUNT ON

  BEGIN TRY
    DECLARE @balance int

    BEGIN TRANSACTION

    UPDATE pilot.xps SET @balance = xp = xp + @amount WHERE pilotID = @pilotID AND shipClassID = @shipClassID
    IF @@ROWCOUNT = 0
    BEGIN
      INSERT INTO pilot.xps (pilotID, shipClassID, xp) VALUES (@pilotID, @shipClassID, @amount)
      SET @balance = @amount
    END

    EXEC pilot.XpEvents_Insert @eventTypeID, @pilotID, @shipClassID, @amount, @balance

    COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
    IF @@TRANCOUNT > 0
      ROLLBACK TRANSACTION
    EXEC zsystem.CatchError 'pilot.Xps_Update'
    RETURN -1
  END CATCH
GO
GRANT EXECUTE ON  [pilot].[Xps_Update] TO [zzp_service]
GO
