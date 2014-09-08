CREATE TABLE [zsystem].[settings]
(
[group] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[key] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[defaultValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[critical] [bit] NOT NULL CONSTRAINT [DF__settings__critic__36B12243] DEFAULT ((0)),
[allowUpdate] [bit] NOT NULL CONSTRAINT [DF__settings__allowU__37A5467C] DEFAULT ((0)),
[orderID] [int] NOT NULL CONSTRAINT [DF__settings__orderI__38996AB5] DEFAULT ((0))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [zsystem].[settings] ADD CONSTRAINT [settings_PK] PRIMARY KEY CLUSTERED  ([group], [key]) ON [PRIMARY]
GO
GRANT SELECT ON  [zsystem].[settings] TO [zzp_service]
GO
