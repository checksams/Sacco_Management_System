use kapsara
go


/****** Object:  StoredProcedure [dbo].[BS_LOAN_DEDUCTION]    Script Date: 12/16/2017 9:57:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




Create procedure dbo.BS_update_withdrawn_status(@status nvarchar(5),
												@MemberNo nvarchar(45),
												@v_done_by nvarchar(45)
												)
as 
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
		update BS_MEMBERS set Withdrawn=@status where MemberNo=@MemberNo

		insert into BS_WITHDRAWN_TRACKING (wt_date,wt_value,wt_done_by,wt_MemberNo)
		values(getdate(),@status,@v_done_by,@MemberNo)
	end try
	begin catch
		RAISERROR ('Unable to update member withdrwan status...', 16,1)
	end catch
 
	COMMIT
end try
begin catch
	set @v_error = 'Error...' + ERROR_MESSAGE();
	RAISERROR (@v_error, 16,1)
end catch	
END 
