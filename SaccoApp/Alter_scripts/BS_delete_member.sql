USE [KAPSARA]
GO

/****** Object:  StoredProcedure [dbo].[update_member_photo]    Script Date: 12/16/2017 11:10:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE  [dbo].[BS_delete_member](@MemberNo nvarchar(45)
								)as
BEGIN
declare @v_error nvarchar(1000)
declare @var int
		
SET IMPLICIT_TRANSACTIONS ON
begin try
	
	if @MemberNo is null or @MemberNo = '' 
		RAISERROR ('Select a member to proceed...', 16,1)
	
	--if @v_photo_updatedby is null or @v_photo_updatedby = ''
	--	RAISERROR ('Login first to proceed...', 16,1)
	
	begin try
		delete from bs_members
		WHERE MemberNo = @MemberNo
	end try
	begin catch
		RAISERROR ('Unable to delete record...', 16,1)
	end catch
	COMMIT
end try
begin catch
	set @v_error = 'Error...' + ERROR_MESSAGE();
	RAISERROR (@v_error, 16,1)
end catch	
END 

GO


