use kapsara
go


/****** Object:  StoredProcedure [dbo].[BS_delete_LoanGuar]    Script Date: 12/16/2017 9:57:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure dbo.BS_delete_LoanGuar(@LoanNo    nvarchar(45),
										@MemberNo    nvarchar(45)
										)
as 
BEGIN
declare @v_error nvarchar(1000), @v_apprs_cnt int
		
SET IMPLICIT_TRANSACTIONS ON
begin try
	
	if @MemberNo is null or @MemberNo = '' 
	begin
		set @v_error = 'Select a member...';
		RAISERROR (@v_error, 16,1)
	end
	
	if @LoanNo is null or @LoanNo = '' 
	begin
		set @v_error = 'Select a loan to proceed...';
		RAISERROR (@v_error, 16,1)
	end

	select @v_apprs_cnt = count(1) from BS_APPRAISAL where LoanNo=@LoanNo
	if @v_apprs_cnt > 0 
	begin
		set @v_error = 'Loan cannot be deleted. It has been Appraised.';
		RAISERROR (@v_error, 16,1)
	end
	
	begin try
		DELETE FROM dbo.BS_LOANGUAR
		WHERE LoanNo = @LoanNo AND MemberNo = @MemberNo
	end try
	begin catch
		set @v_error = 'Unable to delete loan guarantor...' + ERROR_MESSAGE();
		RAISERROR (@v_error, 16,1)
	end catch
	COMMIT
end try
begin catch
	set @v_error = 'Error...' + ERROR_MESSAGE();
	RAISERROR (@v_error, 16,1)
end catch	
END 
