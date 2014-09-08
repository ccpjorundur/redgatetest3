SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[Users_Logon]
  @userName  nvarchar(200)
AS
  SET NOCOUNT ON

  BEGIN TRY
    DECLARE @userID int, @pilotID int, @pilotName nvarchar(200)
    SELECT @userID = userID FROM pilot.users WHERE userName = @userName
    IF @userID IS NULL
    BEGIN
      -- Create user and pilot if user does not exist (a temporary hack)
      BEGIN TRANSACTION

      INSERT INTO pilot.users (userName) VALUES (@userName)
      SET @userID = SCOPE_IDENTITY()

      SET @pilotName = @userName
      EXEC @pilotID = pilot.Pilots_Insert @pilotName, @userID

      COMMIT TRANSACTION
    END
    ELSE
    BEGIN
      SELECT TOP 1 @pilotID = pilotID, @pilotName = pilotName FROM pilot.pilots WHERE userID = @userID ORDER BY pilotID
      IF @pilotID IS NULL
      BEGIN
        SET @pilotName = @userName
        EXEC @pilotID = pilot.Pilots_Insert @pilotName, @userID
      END
    END

    SELECT userID = @userID, pilotID = @pilotID, pilotName = @pilotName
  END TRY
  BEGIN CATCH
    IF @@TRANCOUNT > 0
      ROLLBACK TRANSACTION
    EXEC zsystem.CatchError 'pilot.Users_Logon'
    RETURN -1
  END CATCH
GO
GRANT EXECUTE ON  [pilot].[Users_Logon] TO [zzp_service]
GO
