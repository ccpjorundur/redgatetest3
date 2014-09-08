CREATE TABLE [pilot].[xpEvents]
(
[eventID] [bigint] NOT NULL IDENTITY(1, 1),
[eventDate] [datetime2] (0) NOT NULL CONSTRAINT [DF__xpEvents__eventD__6B24EA82] DEFAULT (getutcdate()),
[eventTypeID] [smallint] NOT NULL,
[pilotID] [int] NOT NULL,
[shipClassID] [tinyint] NOT NULL,
[amount] [int] NOT NULL,
[balance] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [pilot].[xpEvents] ADD CONSTRAINT [xpEvents_PK] PRIMARY KEY CLUSTERED  ([eventID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [xpEvents_IX_Pilot] ON [pilot].[xpEvents] ([pilotID]) INCLUDE ([eventTypeID], [shipClassID]) ON [PRIMARY]
GO
GRANT SELECT ON  [pilot].[xpEvents] TO [zzp_service]
GO
