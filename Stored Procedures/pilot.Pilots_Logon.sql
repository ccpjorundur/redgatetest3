SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[Pilots_Logon]
  @pilotID  int
AS
  SET NOCOUNT ON

  UPDATE pilot.pilots SET logonDate = GETUTCDATE(), logonCount += 1 WHERE pilotID = @pilotID

  EXEC pilot.ConnectEvents_Insert 1, @pilotID
GO
GRANT EXECUTE ON  [pilot].[Pilots_Logon] TO [zzp_service]
GO
