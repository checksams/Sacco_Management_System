USE [KAPSARA]
GO

/****** Object:  StoredProcedure [dbo].[update_member_photo]    Script Date: 12/16/2017 11:10:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


alter PROCEDURE  [dbo].[update_member_photo](@MemberNo nvarchar(45),
								@v_photo_stream  nvarchar(max),
								@v_photo_updatedby nvarchar(100)
								)as
BEGIN
declare @v_error nvarchar(1000)
declare @var int
		
SET IMPLICIT_TRANSACTIONS ON
begin try

	select @var = len(@v_photo_stream)
	if @var is null or @var = 0 
		RAISERROR ('Upload a photo to proceed...', 16,1)
	
	if @MemberNo is null or @MemberNo = '' 
		RAISERROR ('Select a member to proceed...', 16,1)
	
	--if @v_photo_updatedby is null or @v_photo_updatedby = ''
	--	RAISERROR ('Login first to proceed...', 16,1)
	
	begin try
		UPDATE bs_members
		SET Web_Photo = @v_photo_stream
		WHERE MemberNo = @MemberNo
	end try
	begin catch
		RAISERROR ('Unable to update member photo...', 16,1)
	end catch
	COMMIT
end try
begin catch
	set @v_error = 'Error...' + ERROR_MESSAGE();
	RAISERROR (@v_error, 16,1)
end catch	
END 

GO


