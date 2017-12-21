USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[delete_user_roles]    Script Date: 12/17/2017 1:15:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[delete_user_roles](@v_ur_code bigint) as
BEGIN
declare @v_error nvarchar(1000)

SET IMPLICIT_TRANSACTIONS ON
	begin try
		DELETE FROM BS_user_roles
		WHERE ur_code = @v_ur_code

		COMMIT
	end try
	BEGIN CATCH
		select @v_error + 'Unable to delete record...'
		ROLLBACK
		RAISERROR (@v_error, 16,1)
	END CATCH
END 

GO


