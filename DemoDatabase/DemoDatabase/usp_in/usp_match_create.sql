CREATE PROCEDURE [dbo].[usp_match_create]
	@data dbo.udt_match_info READONLY,
	@checkpoint_id BIGINT, 
	@operation_type TINYINT
AS
	BEGIN 
		BEGIN TRANSACTION
			
			BEGIN TRY
				
				DECLARE @event_id BIGINT 
				
				SELECT @event_id = event_id
				FROM @data

				IF @operation_type = 1
				BEGIN
					INSERT INTO dbo.match_info
					(
					[event_id]	    
					,[frontend_id]   
					,[create_at]     
					,[update_at]     
					,[checkpoint_id] )
					SELECT 
					[event_id]	    
					,[frontend_id]  
					,sysdatetime()    
					,sysdatetime()  
					,@checkpoint_id
					FROM @data
				END 

				ELSE IF @operation_type = 2
				BEGIN
				
					UPDATE [match_info]
					SET 
					[match_info].frontend_id = d.frontend_id,    
					[match_info].update_at    = sysdatetime(),
					[match_info]. checkpoint_id = @checkpoint_id
					FROM @data d
					WHERE d.event_id = [match_info].event_id

				END
				ELSE

				BEGIN

				DELETE FROM [match_info]
				WHERE event_id = @event_id

				END 


			END TRY

			BEGIN CATCH
				SELECT ERROR_NUMBER()
			END CATCH
		COMMIT TRANSACTION 
	END

