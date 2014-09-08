CREATE TABLE [pilot].[xps]
(
[pilotID] [int] NOT NULL,
[shipClassID] [tinyint] NOT NULL,
[xp] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [pilot].[xps] ADD CONSTRAINT [xps_PK] PRIMARY KEY CLUSTERED  ([pilotID], [shipClassID]) ON [PRIMARY]
GO
GRANT SELECT ON  [pilot].[xps] TO [zzp_service]
GO
