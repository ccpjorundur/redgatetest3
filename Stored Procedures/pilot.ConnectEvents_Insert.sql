SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[ConnectEvents_Insert]
  @eventTypeID  smallint,
  @pilotID      int,
  @seconds      int = NULL
AS
  SET NOCOUNT ON

  INSERT INTO pilot.connectEvents (eventTypeID, pilotID, seconds) VALUES (@eventTypeID, @pilotID, @seconds)
GO
GRANT EXECUTE ON  [pilot].[ConnectEvents_Insert] TO [zzp_service]
GO
