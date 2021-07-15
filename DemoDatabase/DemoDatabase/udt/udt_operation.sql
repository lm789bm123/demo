CREATE TYPE [dbo].[udt_operation] AS TABLE
(
   message_type VARCHAR(32) NOT NULL, 
   operation_type TINYINT NOT NULL -- 1: Insert, 2: Update, 3: Delete 

)
