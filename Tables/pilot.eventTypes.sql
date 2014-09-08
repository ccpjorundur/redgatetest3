CREATE TABLE [pilot].[eventTypes]
(
[eventTypeID] [smallint] NOT NULL,
[eventTypeName] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[description] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [pilot].[eventTypes] ADD CONSTRAINT [eventTypes_PK] PRIMARY KEY CLUSTERED  ([eventTypeID]) ON [PRIMARY]
GO
GRANT SELECT ON  [pilot].[eventTypes] TO [zzp_service]
GO
