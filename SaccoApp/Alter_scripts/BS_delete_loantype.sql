use kapsara
go


/****** Object:  StoredProcedure [dbo].[BS_delete_loantype]    Script Date: 12/16/2017 9:57:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER procedure dbo.BS_delete_loantype(@LoanCode    nvarchar(45))
as 
BEGIN
declare @v_error nvarchar(1000), @v_cnt  int
		
SET IMPLICIT_TRANSACTIONS ON
begin try
		
	if @LoanCode is null or @LoanCode = '' 
	begin
		set @v_error = 'Select a loan type to proceed...';
		RAISERROR (@v_error, 16,1)
	end

	select @v_cnt=count(1) from bs_loans where LoanCode=@LoanCode
	if @v_cnt > 0 
		RAISERROR ('Loan type cannot be deleted because such Loans already exist...', 16,1)
	
	begin try
		DELETE FROM dbo.BS_LOANTYPE  WHERE LoanCode = @LoanCode
	end try
	begin catch
		set @v_error = 'Unable to delete loan type...' + ERROR_MESSAGE();
		RAISERROR (@v_error, 16,1)
	end catch

	COMMIT
end try
begin catch
	set @v_error = 'Error...' + ERROR_MESSAGE();
	RAISERROR (@v_error, 16,1)
end catch	
END 
