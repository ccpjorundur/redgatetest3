SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[Pilots_UpdateName]
  @pilotID    int,
  @pilotName  nvarchar(200)
AS
  SET NOCOUNT ON

  UPDATE pilot.pilots SET pilotName = @pilotName WHERE pilotID = @pilotID

GO
GRANT EXECUTE ON  [pilot].[Pilots_UpdateName] TO [zzp_service]
GO
