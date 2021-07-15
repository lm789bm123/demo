CREATE PROCEDURE [dbo].[DemoReport]
	@fronend_id varchar(10)
AS
BEGIN
	SELECT m.frontend_id, p.pool_id, SUM(bf.profit_loss) AS profit_loss
	FROM match_info m
	INNER JOIN pools p
	ON p.event_id = m.event_id
	INNER JOIN bet_financial bf
	on bf.pool_id = p.pool_id
	WHERE frontend_id = @fronend_id
	GROUP BY m.frontend_id, p.pool_id
END

