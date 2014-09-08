CREATE ROLE [zzp_service]
AUTHORIZATION [sa]
GO
EXEC sp_addrolemember N'zzp_service', N'zzp_user_vkpilot'
GO
