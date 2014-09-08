SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[Clients_Delete]
  @clientID  bigint
AS
  SET NOCOUNT ON

  DELETE FROM pilot.clients WHERE clientID = @clientID

GO
GRANT EXECUTE ON  [pilot].[Clients_Delete] TO [zzp_service]
GO
