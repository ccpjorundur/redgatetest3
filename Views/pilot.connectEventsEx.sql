SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [pilot].[connectEventsEx]
AS
  SELECT E.eventID, E.eventDate, E.eventTypeID, T.eventTypeName,
         E.pilotID, P.pilotName, E.seconds
    FROM pilot.connectEvents E
      LEFT JOIN pilot.eventTypes T ON T.eventTypeID = E.eventTypeID
      LEFT JOIN pilot.pilots P ON P.pilotID = E.pilotID
GO
GRANT SELECT ON  [pilot].[connectEventsEx] TO [zzp_service]
GO
