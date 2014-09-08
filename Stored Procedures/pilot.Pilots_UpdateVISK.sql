SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[Pilots_UpdateVISK]
  @eventTypeID  smallint,
  @pilotID      int,
  @amount       money
AS
  SET NOCOUNT ON

  BEGIN TRY
    DECLARE @balance money

    BEGIN TRANSACTION

    UPDATE pilot.pilots SET @balance = visk = visk + @amount WHERE pilotID = @pilotID

    EXEC pilot.ViskEvents_Insert @eventTypeID, @pilotID, @amount, @balance

    COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
    IF @@TRANCOUNT > 0
      ROLLBACK TRANSACTION
    EXEC zsystem.CatchError 'pilot.Pilots_UpdateVISK'
    RETURN -1
  END CATCH
GO
GRANT EXECUTE ON  [pilot].[Pilots_UpdateVISK] TO [zzp_service]
GO
