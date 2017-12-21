USE KAPSARA
GO

/****** Object:  StoredProcedure [dbo].[delete_user_roles_granted]    Script Date: 12/17/2017 1:14:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[delete_user_roles_granted](@v_usg_code bigint) as
BEGIN
declare @v_error nvarchar(1000)

SET IMPLICIT_TRANSACTIONS ON
	begin try
		DELETE FROM BS_user_roles_granted
		WHERE usg_code = @v_usg_code
		COMMIT
	end try
	BEGIN CATCH
		set @v_error = 'Unable to delete record'
		ROLLBACK
		RAISERROR (@v_error, 16,1)
	END CATCH
END

GO


