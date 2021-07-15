CREATE TYPE [dbo].[udt_bet_financial] AS TABLE
(
	[ticket_id] BIGINT NOT NULL PRIMARY KEY,
	[pool_id]	BIGINT NOT NULL, 
	[combination_id] BIGINT NOT NULL,
	[sell_datetime] DATETIME2(7) NOT NULL,
	[unit_bet] DECIMAL(28,12) NOT NULL,
	[profit_loss] DECIMAL(28, 12) NOT NULL, 
	[account_no] VARCHAR(16)
)
