CREATE TABLE [pilot].[connectEvents]
(
[eventID] [bigint] NOT NULL IDENTITY(1, 1),
[eventDate] [datetime2] (0) NOT NULL CONSTRAINT [DF__connectEv__event__4D94879B] DEFAULT (getutcdate()),
[eventTypeID] [smallint] NOT NULL,
[pilotID] [int] NOT NULL,
[seconds] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [pilot].[connectEvents] ADD CONSTRAINT [connectEvents_PK] PRIMARY KEY CLUSTERED  ([eventID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [connectEvents_IX_Pilot] ON [pilot].[connectEvents] ([pilotID]) INCLUDE ([eventTypeID]) ON [PRIMARY]
GO
GRANT SELECT ON  [pilot].[connectEvents] TO [zzp_service]
GO
