SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [pilot].[viskEventsEx]
AS
  SELECT E.eventID, E.eventDate, E.eventTypeID, T.eventTypeName,
         E.pilotID, P.pilotName, E.amount, E.balance
    FROM pilot.viskEvents E
      LEFT JOIN pilot.eventTypes T ON T.eventTypeID = E.eventTypeID
      LEFT JOIN pilot.pilots P ON P.pilotID = E.pilotID
GO
GRANT SELECT ON  [pilot].[viskEventsEx] TO [zzp_service]
GO
