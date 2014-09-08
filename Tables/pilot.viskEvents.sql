CREATE TABLE [pilot].[viskEvents]
(
[eventID] [bigint] NOT NULL IDENTITY(1, 1),
[eventDate] [datetime2] (0) NOT NULL CONSTRAINT [DF__viskEvent__event__60A75C0F] DEFAULT (getutcdate()),
[eventTypeID] [smallint] NOT NULL,
[pilotID] [int] NOT NULL,
[amount] [money] NOT NULL,
[balance] [money] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [pilot].[viskEvents] ADD CONSTRAINT [viskEvents_PK] PRIMARY KEY CLUSTERED  ([eventID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [viskEvents_IX_Pilot] ON [pilot].[viskEvents] ([pilotID]) INCLUDE ([eventTypeID]) ON [PRIMARY]
GO
GRANT SELECT ON  [pilot].[viskEvents] TO [zzp_service]
GO
