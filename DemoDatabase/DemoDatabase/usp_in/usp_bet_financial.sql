CREATE PROCEDURE [dbo].[usp_bet_financial]
	@data dbo.udt_bet_financial READONLY,
	@checkpoint_id BIGINT, 
	@operation_type TINYINT
AS
	BEGIN 
		BEGIN TRANSACTION
			
			BEGIN TRY
				
				DECLARE @ticket_id BIGINT 
				
				SELECT @ticket_id = ticket_id
				FROM @data

				IF @operation_type = 1
				BEGIN
					INSERT INTO dbo.bet_financial
					(
						[ticket_id]		
						,[pool_id]		
						,[combination_id]
						,[sell_datetime]	
						,[unit_bet]		
						,[profit_loss]	
						,[account_no]	
						,[create_at]
						,[update_at]
						,[checkpoint_id]  					 					 
					 )
					SELECT 
					[ticket_id]		
					,[pool_id]		
					,[combination_id]
					,[sell_datetime]
					,[unit_bet]		
					,[profit_loss]	
					,[account_no]	
					,sysdatetime()    
					,sysdatetime()  
					,@checkpoint_id
					FROM @data
				END 

				ELSE IF @operation_type = 2
				BEGIN
				
					UPDATE bet_financial 
					SET 
					 bet_financial.[pool_id]		  = d.[pool_id]		
					,bet_financial.[combination_id] = d.[combination_id]
					,bet_financial.[sell_datetime]  = d.[sell_datetime]
					,bet_financial.[unit_bet]		  = d.[unit_bet]		
					,bet_financial.[profit_loss]	  = d.[profit_loss]	
					,bet_financial.[account_no]	  = d.[account_no]	
					,bet_financial.update_at    = sysdatetime()
					,bet_financial. checkpoint_id = @checkpoint_id
					FROM @data d
					WHERE d.ticket_id = bet_financial.ticket_id

				END
				ELSE

				BEGIN

				DELETE FROM bet_financial
				WHERE ticket_id = @ticket_id

				END 


			END TRY

			BEGIN CATCH
				SELECT ERROR_NUMBER()
			END CATCH
		COMMIT TRANSACTION 
	END

