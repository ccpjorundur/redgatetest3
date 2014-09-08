SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [pilot].[xpEventsEx]
AS
  SELECT E.eventID, E.eventDate, E.eventTypeID, T.eventTypeName,
         E.pilotID, P.pilotName, E.shipClassID, S.shipClassName, E.amount, E.balance
    FROM pilot.xpEvents E
      LEFT JOIN pilot.eventTypes T ON T.eventTypeID = E.eventTypeID
      LEFT JOIN pilot.pilots P ON P.pilotID = E.pilotID
      LEFT JOIN pilot.shipClasses S ON S.shipClassID = E.shipClassID
GO
GRANT SELECT ON  [pilot].[xpEventsEx] TO [zzp_service]
GO
