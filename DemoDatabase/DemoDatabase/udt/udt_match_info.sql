CREATE TYPE [dbo].[udt_match_info] AS TABLE
(
	[event_id]	BIGINT NOT NULL, 
	[frontend_id] NVARCHAR(10) NOT NULL
)
