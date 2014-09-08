CREATE TABLE [pilot].[users]
(
[userID] [int] NOT NULL IDENTITY(1, 1),
[userName] [nvarchar] (200) COLLATE Latin1_General_CI_AI NOT NULL,
[createDate] [datetime2] (0) NOT NULL CONSTRAINT [DF__users__createDat__5441852A] DEFAULT (getutcdate()),
[new_column_1] [int] NULL,
[new_column_2] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [pilot].[users] ADD CONSTRAINT [users_PK] PRIMARY KEY CLUSTERED  ([userID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [users_UQ_Name] ON [pilot].[users] ([userName]) ON [PRIMARY]
GO
GRANT SELECT ON  [pilot].[users] TO [zzp_service]
GO
