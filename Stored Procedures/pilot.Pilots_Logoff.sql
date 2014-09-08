SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[Pilots_Logoff]
  @pilotID  int
AS
  SET NOCOUNT ON

  DECLARE @logonDate datetime2(0), @logoffDate datetime2(0) = GETUTCDATE(), @logonSeconds int = 0

  SELECT @logonDate = logonDate FROM pilot.pilots WHERE pilotID = @pilotID

  IF @logonDate IS NOT NULL
    SET @logonSeconds = DATEDIFF(second, @logonDate, @logoffDate)

  UPDATE pilot.pilots SET logoffDate = @logoffDate, logonSeconds += @logonSeconds WHERE pilotID = @pilotID

  EXEC pilot.ConnectEvents_Insert 2, @pilotID, @logonSeconds
GO
GRANT EXECUTE ON  [pilot].[Pilots_Logoff] TO [zzp_service]
GO
