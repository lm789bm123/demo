CREATE TABLE [dbo].[bet_financial]
(
	[ticket_id]			BIGINT NOT NULL PRIMARY KEY,
	[pool_id]			BIGINT NOT NULL, 
	[combination_id]	BIGINT NOT NULL,
	[sell_datetime]		DATETIME2(7) NOT NULL,
	[unit_bet]			DECIMAL(28,12) NOT NULL,
	[profit_loss]		DECIMAL(28, 12) NOT NULL, 
	[account_no]		VARCHAR(16),
	[create_at]			DATETIME2(7),
	[update_at]			DATETIME2(7),
	[checkpoint_id] BIGINT NOT NULL
)
