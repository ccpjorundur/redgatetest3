SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [pilot].[xpsEx]
AS
  SELECT X.pilotID, P.pilotName, X.shipClassID, S.shipClassName, X.xp
    FROM pilot.xps X
      LEFT JOIN pilot.pilots P ON P.pilotID = X.pilotID
      LEFT JOIN pilot.shipClasses S ON S.shipClassID = X.shipClassID
GO
GRANT SELECT ON  [pilot].[xpsEx] TO [zzp_service]
GO
