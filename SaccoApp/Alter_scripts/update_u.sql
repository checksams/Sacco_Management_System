USE KAPSARA
GO

/****** Object:  StoredProcedure [dbo].[update_u]    Script Date: 12/17/2017 1:12:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE  [dbo].[update_u](@v_name  nvarchar(45),
								@v_pwd  nvarchar(100),
								@v_new_pwd  nvarchar(100),
								@v_re_new_pwd  nvarchar(100)
								)as
BEGIN
declare @var int,@v_cnt int
declare @v_error nvarchar(1000)
		
SET IMPLICIT_TRANSACTIONS ON
begin try
	if @v_name is null or @v_name = ''
		RAISERROR ('You must be logged in to perform this task.', 16,1)

	if @v_pwd is null or @v_pwd = '' 
		RAISERROR ('Enter the current password to proceed...', 16,1)

	if @v_new_pwd is null or @v_new_pwd = ''
		RAISERROR ('The new password cannot be null...', 16,1)

	if @v_new_pwd <> @v_re_new_pwd 
		RAISERROR ('The new password does not match the Re-entered new password...', 16,1)

	select @var = len(@v_new_pwd) 
	if @var < 6 
		RAISERROR ('The password should be atleast 6 characters long...', 16,1)
		
	Select @v_cnt = count(1) from BS_users 
	where usr_name=@v_name and usr_pwd= dbo.MD5((@v_pwd))
	--SUBSTRING(sys.fn_sqlvarbasetostr(HASHBYTES('MD5', @v_pwd)),3,32)

	if @v_cnt = 0
	begin
		UPDATE BS_users
		SET usr_login_atempts = case when usr_login_atempts is null then 0 else usr_login_atempts end +1
		WHERE usr_name = @v_name
		commit		
		RAISERROR ('The current password is wrong. Enter the correct password to proceed...', 16,1)
	end
	
	begin try
		UPDATE BS_users
		SET usr_pwd_reset = 'NO',
			usr_pwd = dbo.MD5(@v_new_pwd), --SUBSTRING(sys.fn_sqlvarbasetostr(HASHBYTES('MD5', @v_new_pwd)),3,32),
			usr_login_atempts = 0
		WHERE usr_name = @v_name
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
	RAISERROR (@v_error, 16,1)
END CATCH
END 



GO


