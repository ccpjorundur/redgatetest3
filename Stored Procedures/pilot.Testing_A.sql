SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[Testing_A]
AS
  SET NOCOUNT ON

  PRINT 'pilot.Testing_A 1'

  EXEC pilot.Testing_B

  PRINT 'pilot.Testing_A 2'
GO
GRANT EXECUTE ON  [pilot].[Testing_A] TO [zzp_service]
GO
