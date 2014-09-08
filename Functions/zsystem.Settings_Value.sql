SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [zsystem].[Settings_Value](@group varchar(200), @key varchar(200))
RETURNS nvarchar(max)
BEGIN
  DECLARE @value nvarchar(max)
  SELECT @value = LTRIM(RTRIM([value])) FROM zsystem.settings WHERE [group] = @group AND [key] = @key
  RETURN ISNULL(@value, '')
END
GO
