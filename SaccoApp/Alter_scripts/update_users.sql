USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[update_users]    Script Date: 12/17/2017 12:58:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[update_users](@v_usr_code bigint,
								@v_name  varchar(45),
								@v_full_name  varchar(1000),
								@v_emp_code  int,
								@v_pwd_reset   varchar(5),
								@v_usrcode bigint output
								)as
BEGIN
declare @var int,@v_empcode int
declare @v_error nvarchar(1000)
		
SET IMPLICIT_TRANSACTIONS ON
begin try

	if @v_emp_code is null
		set @v_empcode = null

	if @v_usr_code is null or @v_usr_code = 0 
	begin 
		begin try
		select * from bs_users
			INSERT INTO bs_users
			(USR_USERID,USR_USERNAME,pass, 
			usr_name,usr_full_name,usr_emp_code,usr_pwd,
			usr_last_login,usr_login_atempts,usr_pwd_reset,STATUS)
			VALUES
			(@v_name,@v_full_name,dbo.MD5(@v_name),
			@v_name,@v_full_name,@v_empcode,dbo.MD5(@v_name),
			NULL,null,'YES','Enabled')
			select @v_usrcode = max(usr_code) from  BS_users
		end try
		BEGIN CATCH
			set @v_error = 'Unable to create record...' + ERROR_MESSAGE();
			RAISERROR (@v_error, 16,1)
		END CATCH
	end
	else	
	begin 
		begin try
			UPDATE bs_users
			SET usr_name = @v_name,
				usr_full_name = @v_full_name,
				usr_emp_code = @v_empcode,
				usr_pwd_reset = @v_pwd_reset,
				usr_login_atempts = 0
			WHERE usr_code = @v_usr_code
			set @v_usrcode = @v_usr_code

			if @v_pwd_reset = 'YES' 
			begin				
				UPDATE bs_users
				SET  usr_pwd = dbo.MD5(@v_name)
				WHERE usr_code = @v_usr_code
			end
		end try
		BEGIN CATCH
			set @v_error = 'Unable to update record...' + ERROR_MESSAGE();
			RAISERROR (@v_error, 16,1)
		END CATCH
	end

	COMMIT
end try
BEGIN CATCH
	set @v_error = 'Unable to update record...' + ERROR_MESSAGE();
	RAISERROR (@v_error, 16,1)
END CATCH
END 

GO


