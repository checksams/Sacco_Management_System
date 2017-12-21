USE KAPSARA
GO

/****** Object:  StoredProcedure [dbo].[update_user_roles_granted]    Script Date: 12/17/2017 1:08:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[update_user_roles_granted](@v_usg_code bigint,
								@v_usr_code  int,
								@v_ur_code  int,
								@v_created_by  varchar(100),
								@v_usgcode bigint output
								)as
BEGIN
declare @var int, @v_cnt int
declare @v_error nvarchar(1000)

SET IMPLICIT_TRANSACTIONS ON
begin try

	if @v_usg_code > 0  
		set @v_usgcode = @v_usg_code
	else
	begin
		select @v_cnt = count(1) from  BS_user_roles_granted
		where usg_usr_code = @v_usr_code and usg_ur_code = @v_ur_code

		if @v_cnt = 1
		begin
			select @v_usgcode = usg_code from  BS_user_roles_granted
			where usg_usr_code = @v_usr_code and usg_ur_code = @v_ur_code
		end
	end


	if @v_usgcode is null or @v_usgcode = 0 
	begin try
		INSERT INTO BS_user_roles_granted
		(usg_usr_code,usg_ur_code,usg_date,usg_created_by)
		VALUES
		(@v_usr_code,@v_ur_code,{fn Now()},@v_created_by)
		select @v_usgcode = max(usg_code) from  BS_user_roles_granted
	end try
	BEGIN CATCH
		set @v_error = 'Error...' + ERROR_MESSAGE();
		ROLLBACK
		RAISERROR (@v_error, 16,1)
	END CATCH	

	COMMIT
end try
BEGIN CATCH
	set @v_error = 'Error saving record...' + ERROR_MESSAGE();
	ROLLBACK
	RAISERROR (@v_error, 16,1)
END CATCH	
END 

GO


