SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[Clients_Heartbeat]
  @clientID  bigint
AS
  SET NOCOUNT ON

  DECLARE @lastHeartbeat datetime2(0), @heartbeatCount int

  UPDATE pilot.clients
     SET @lastHeartbeat = heartbeat, @heartbeatCount = heartbeatCount,
         heartbeat = GETUTCDATE(), heartbeatCount += 1
   WHERE clientID = @clientID

  SELECT lastHeartbeat = @lastHeartbeat, heartbeatCount = @heartbeatCount + 1

GO
GRANT EXECUTE ON  [pilot].[Clients_Heartbeat] TO [zzp_service]
GO
