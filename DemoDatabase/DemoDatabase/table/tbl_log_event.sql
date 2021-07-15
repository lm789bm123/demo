CREATE TABLE [dbo].[log_event]
(
	[checkpoint_id]	BIGINT NOT NULL, 
	[message_type]	NVARCHAR(32),
	[operation_type] TINYINT NOT NULL,
	[create_at]		DATETIME2(7), 
	[update_at]		DATETIME2(7), 
    CONSTRAINT [PK_tbl_checkpoint_id] PRIMARY KEY ([checkpoint_id])
)
