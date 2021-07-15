CREATE TABLE [dbo].[pools]
(
	[pool_id]		BIGINT NOT NULL, 
	[event_id]		BIGINT NOT NULL,
	[bet_type]		TINYINT NOT NULL, 
	[create_at]		DATETIME2(7), 
	[update_at]		DATETIME2(7), 
	[checkpoint_id] BIGINT NOT NULL, 
    CONSTRAINT [PK_tbl_pools] PRIMARY KEY ([pool_id])
)
