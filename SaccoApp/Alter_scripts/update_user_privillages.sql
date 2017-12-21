USE KAPSARA
GO

/****** Object:  StoredProcedure [dbo].[update_user_privillages]    Script Date: 12/17/2017 1:11:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[update_user_privillages](@v_up_code bigint,
								@v_name  nvarchar(45),
								@v_desc  nvarchar(1000),
								@v_min_amt  decimal(25,5),
								@v_max_amt  decimal(25,5),
								@v_upcode bigint output,
								@v_type		nvarchar(45)
								)as
BEGIN
declare @var int
declare @v_error nvarchar(1000)
		
SET IMPLICIT_TRANSACTIONS ON
begin try

	if @v_up_code is null or @v_up_code = 0 
	begin try
		INSERT INTO BS_user_privillages
		(up_name,up_desc,up_min_amt,up_max_amt,up_type)
		VALUES
		(@v_name,@v_desc,@v_min_amt,@v_max_amt,@v_type)
		select @v_upcode = max(up_code)  from  BS_user_privillages
	end try
	BEGIN CATCH
		set @v_error = 'Unable to create record...' + ERROR_MESSAGE();
		RAISERROR (@v_error, 16,1)
	END CATCH
	else	
	begin try
		UPDATE BS_user_privillages
		SET up_name = @v_name,
		up_desc = @v_desc,
		up_min_amt = @v_min_amt,
		up_max_amt = @v_max_amt,
		up_type = @v_type
		WHERE up_code = @v_up_code
		set @v_upcode = @v_up_code
	end try
	BEGIN CATCH
		set @v_error = 'Unable to update record...' + ERROR_MESSAGE();
		RAISERROR (@v_error, 16,1)
	END CATCH

	COMMIT
end try
BEGIN CATCH
	set @v_error = 'Error...' + ERROR_MESSAGE();
	ROLLBACK
	RAISERROR (@v_error, 16,1)
END CATCH	
END

GO


