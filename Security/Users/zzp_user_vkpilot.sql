IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'zzp_user_vkpilot')
CREATE LOGIN [zzp_user_vkpilot] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [zzp_user_vkpilot] FOR LOGIN [zzp_user_vkpilot]
GO
