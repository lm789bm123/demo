CREATE TYPE [dbo].[udt_pools] AS TABLE
(
	[pool_id]	BIGINT NOT NULL, 
	[event_id]	BIGINT NOT NULL,
	[bet_type]	TINYINT NOT NULL
)
