CREATE TABLE [zsystem].[versions]
(
[developer] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[version] [int] NOT NULL,
[versionDate] [datetime2] (2) NOT NULL,
[userName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[loginName] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[executionCount] [int] NOT NULL,
[lastDate] [datetime2] (2) NULL,
[lastLoginName] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[coreVersion] [int] NULL,
[firstDuration] [int] NULL,
[lastDuration] [int] NULL,
[executingSPID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [zsystem].[versions] ADD CONSTRAINT [versions_PK] PRIMARY KEY CLUSTERED  ([developer], [version]) ON [PRIMARY]
GO
GRANT SELECT ON  [zsystem].[versions] TO [zzp_service]
GO
