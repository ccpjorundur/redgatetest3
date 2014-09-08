CREATE TABLE [pilot].[shipClasses]
(
[shipClassID] [tinyint] NOT NULL,
[shipClassName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [pilot].[shipClasses] ADD CONSTRAINT [shipClasses_PK] PRIMARY KEY CLUSTERED  ([shipClassID]) ON [PRIMARY]
GO
GRANT SELECT ON  [pilot].[shipClasses] TO [zzp_service]
GO
