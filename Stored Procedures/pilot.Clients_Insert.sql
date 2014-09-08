SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[Clients_Insert]
  @clientType    varchar(20),
  @pilotID       int,
  @build         varchar(200) = NULL,
  @platformType  varchar(20) = NULL,
  @appGUID       varchar(200) = NULL,
  @appRunNumber  bigint = NULL
AS
  SET NOCOUNT ON

  INSERT INTO pilot.clients (clientType, pilotID, createDate, build, platformType, appGUID, appRunNumber)
       VALUES (@clientType, @pilotID, GETUTCDATE(), @build, @platformType, @appGUID, @appRunNumber)

  SELECT clientID = SCOPE_IDENTITY()

GO
GRANT EXECUTE ON  [pilot].[Clients_Insert] TO [zzp_service]
GO
