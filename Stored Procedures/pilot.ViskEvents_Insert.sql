SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [pilot].[ViskEvents_Insert]
  @eventTypeID  smallint,
  @pilotID      int,
  @amount       money,
  @balance      money
AS
  SET NOCOUNT ON

  INSERT INTO pilot.viskEvents (eventTypeID, pilotID, amount, balance) VALUES (@eventTypeID, @pilotID, @amount, @balance)
GO
GRANT EXECUTE ON  [pilot].[ViskEvents_Insert] TO [zzp_service]
GO
