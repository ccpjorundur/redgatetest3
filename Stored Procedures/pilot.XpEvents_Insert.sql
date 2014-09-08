SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[XpEvents_Insert]
  @eventTypeID  smallint,
  @pilotID      int,
  @shipClassID  tinyint,
  @amount       int,
  @balance      int
AS
  SET NOCOUNT ON

  INSERT INTO pilot.xpEvents (eventTypeID, pilotID, shipClassID, amount, balance) VALUES (@eventTypeID, @pilotID, @shipClassID, @amount, @balance)
GO
GRANT EXECUTE ON  [pilot].[XpEvents_Insert] TO [zzp_service]
GO
