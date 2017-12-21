USE KAPSARA
GO

/****** Object:  StoredProcedure [dbo].[update_user_role_privlg]    Script Date: 12/17/2017 1:10:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[update_user_role_privlg](@v_urp_code bigint,
								@v_up_code bigint,
								@v_ur_code bigint,
								@v_min_amt decimal(25,5),
								@v_max_amt decimal(25,5),
								@v_urpcode bigint output
								)as
BEGIN
declare @var int,@v_cnt int
declare @v_error nvarchar(1000)

SET IMPLICIT_TRANSACTIONS ON
begin try

	if @v_urp_code > 0 
		set @v_urpcode = @v_urp_code
	else
	begin
		select @v_cnt = count(1)  from  BS_user_role_privlg
		where urp_ur_code = @v_ur_code and urp_up_code = @v_up_code

		if @v_cnt = 1 
		begin
			select @v_urpcode = urp_code from  BS_user_role_privlg
			where urp_ur_code = @v_ur_code and urp_up_code = @v_up_code
		end
	end

	if @v_urpcode is null or @v_urpcode = 0
	begin try
		INSERT INTO BS_user_role_privlg
		(urp_ur_code, urp_up_code, urp_date, urp_min_amt, urp_max_amt)
		VALUES
		(@v_ur_code, @v_up_code, {fn Now()}, @v_min_amt, @v_max_amt)
		select @v_urpcode = max(urp_code) from  BS_user_role_privlg
	end try
	BEGIN CATCH
		set @v_error = 'Unable to create record...' + ERROR_MESSAGE();
		ROLLBACK
		RAISERROR (@v_error, 16,1)
	END CATCH
	else	
	begin try
		UPDATE BS_user_role_privlg
		SET urp_min_amt = @v_min_amt, 
			urp_max_amt = @v_max_amt
		WHERE urp_code = @v_urpcode
	end try
	BEGIN CATCH
		set @v_error = 'Unable to update record...' + ERROR_MESSAGE();
		ROLLBACK
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


