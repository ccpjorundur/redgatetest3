SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[Pilots_Select]
  @pilotID  int
AS
  SET NOCOUNT ON

  SELECT * FROM pilot.pilots WHERE pilotID = @pilotID

GO
GRANT EXECUTE ON  [pilot].[Pilots_Select] TO [zzp_service]
GO
