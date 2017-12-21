USE KAPSARA
GO

/****** Object:  StoredProcedure [dbo].[update_user_roles]    Script Date: 12/17/2017 1:09:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[update_user_roles](@v_ur_code bigint,
								@v_name  nvarchar(45),
								@v_desc  nvarchar(1000),
								@v_urcode bigint output
								)as
BEGIN
declare @var int
declare @v_error nvarchar(1000)
	
SET IMPLICIT_TRANSACTIONS ON
begin try

	if @v_ur_code is null or @v_ur_code = 0 
	begin
		begin try
			INSERT INTO BS_user_roles
			(ur_name,ur_desc)
			VALUES
			(@v_name,@v_desc)
			select @v_urcode = max(ur_code) from  BS_user_roles
		end try
		BEGIN CATCH
			set @v_error = 'Unable to delete record...' + ERROR_MESSAGE();
			ROLLBACK
			RAISERROR (@v_error, 16,1)
		END CATCH
	end
	else	
	begin
		begin try
			UPDATE BS_user_roles
			SET ur_name = @v_name,
			ur_desc = @v_desc
			WHERE ur_code = @v_ur_code
			set @v_urcode = @v_ur_code
		end try
		BEGIN CATCH
			set @v_error = 'Unable to update record...' + ERROR_MESSAGE();
			ROLLBACK
			RAISERROR (@v_error, 16,1)
		END CATCH
	end
	COMMIT
end try
BEGIN CATCH
	set @v_error = 'Error...' + ERROR_MESSAGE();
	ROLLBACK
	RAISERROR (@v_error, 16,1)
END CATCH
END 

GO


