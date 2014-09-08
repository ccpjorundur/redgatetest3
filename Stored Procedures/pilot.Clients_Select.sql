SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[Clients_Select]
  @clientID  bigint
AS
  SET NOCOUNT ON

  SELECT * FROM pilot.clients WHERE clientID = @clientID

GO
GRANT EXECUTE ON  [pilot].[Clients_Select] TO [zzp_service]
GO
