SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[Pilots_Insert]
  @pilotName  nvarchar(200),
  @userID     int = NULL
AS
  SET NOCOUNT ON

  INSERT INTO pilot.pilots (pilotName, userID) VALUES (@pilotName, @userID)

  RETURN SCOPE_IDENTITY()
GO
GRANT EXECUTE ON  [pilot].[Pilots_Insert] TO [zzp_service]
GO
