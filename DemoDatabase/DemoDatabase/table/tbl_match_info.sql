CREATE TABLE [dbo].[match_info]
(
	[event_id]	    BIGINT NOT NULL, 
	[frontend_id]   NVARCHAR(10) NOT NULL,
	[create_at]     DATETIME2(7), 
	[update_at]     DATETIME2(7), 
	[checkpoint_id] BIGINT NOT NULL, 
    CONSTRAINT [PK_tbl_match_info] PRIMARY KEY ([event_id])
)
