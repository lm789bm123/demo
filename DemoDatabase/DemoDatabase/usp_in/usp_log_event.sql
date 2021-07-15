CREATE PROCEDURE [dbo].[usp_log_event]
	@meta dbo.udt_operation READONLY,
	@checkpoint_id BIGINT OUTPUT,
	@operation_type TINYINT OUTPUT
AS
	BEGIN 
		BEGIN TRANSACTION
			
			BEGIN TRY
				
				SELECT @checkpoint_id = NEXT VALUE FOR checkpoint_id

				SELECT @operation_type = operation_type
				FROM @meta

				INSERT INTO dbo.log_event
				([checkpoint_id], [message_type], [operation_type], [create_at]	,[update_at])
				
				SELECT @checkpoint_id, message_type, operation_type, SYSDATETIME(), SYSDATETIME()
				FROM @meta

			END TRY

			BEGIN CATCH
				SELECT ERROR_NUMBER()
			END CATCH
		COMMIT TRANSACTION 
	END

