CREATE PROCEDURE [dbo].[usp_pools]
	@data dbo.udt_pools READONLY,
	@checkpoint_id BIGINT, 
	@operation_type TINYINT
AS
	BEGIN 
		BEGIN TRANSACTION
			
			BEGIN TRY
				
				DECLARE @pool_id BIGINT 
				
				SELECT @pool_id= pool_id
				FROM @data

				IF @operation_type = 1
				BEGIN
					INSERT INTO dbo.pools
					(
					[pool_id]		
					,[event_id]		
					,[bet_type]		
					,[create_at]		
					,[update_at]		
					,[checkpoint_id] 					 					 
					 )
					SELECT 
					[pool_id]
					,[event_id]	    
					,[bet_type]  
					,sysdatetime()    
					,sysdatetime()  
					,@checkpoint_id
					FROM @data
				END 

				ELSE IF @operation_type = 2
				BEGIN
				
					UPDATE pools
					SET 
					pools.bet_type = d.bet_type,    
					pools.update_at    = sysdatetime(),
					pools. checkpoint_id = @checkpoint_id
					FROM @data d
					WHERE d.event_id = pools.event_id

				END
				ELSE

				BEGIN

				DELETE FROM pools
				WHERE pool_id = @pool_id

				END 


			END TRY

			BEGIN CATCH
				SELECT ERROR_NUMBER()
			END CATCH
		COMMIT TRANSACTION 
	END

