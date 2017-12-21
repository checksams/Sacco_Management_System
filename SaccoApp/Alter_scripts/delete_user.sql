USE KAPSARA
GO

/****** Object:  StoredProcedure [dbo].[delete_user]    Script Date: 12/17/2017 1:17:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[delete_user](@v_usr_code bigint) as
BEGIN
declare @v_cnt int
declare @v_authorised nvarchar(5)
declare @v_error nvarchar(1000)
declare @v_name nvarchar(45)

SET IMPLICIT_TRANSACTIONS ON
begin try
	set @v_error = ' '

	select @v_cnt = count(1) FROM BS_users
	WHERE usr_code = @v_usr_code

	if @v_cnt > 0 
	begin
		select @v_name = upper(usr_name)  FROM BS_users
		WHERE usr_code = @v_usr_code
		if @v_name = 'ADMIN' 
		begin
			select @v_error = 'You are not allowed to delete an Administrator...'
			RAISERROR (@v_error, 16,1)
		end
	end

	DELETE FROM BS_users
	WHERE usr_code = @v_usr_code

	COMMIT
end try
BEGIN CATCH
	set @v_error = 'Unable to delete record...' + @v_error
	ROLLBACK
	RAISERROR (@v_error, 16,1)
END CATCH
END 

GO


