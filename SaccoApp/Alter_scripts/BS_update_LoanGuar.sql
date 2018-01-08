use kapsara
go


/****** Object:  StoredProcedure [dbo].[BS_update_LoanGuar]    Script Date: 12/16/2017 9:57:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

alter procedure dbo.BS_update_LoanGuar(@UpdateType	nvarchar(45), --Add, Edit,
										@LoanNo    nvarchar(45),
										@MemberNo    nvarchar(45),
										@AllocatedAmt    decimal(19,2),
										@Balance    decimal(19,2),
										@v_user   nvarchar(45)
										)
as 
BEGIN
declare @v_error nvarchar(1000)
declare @var int, @v_cnt int, @v_apprs_cnt int
		
SET IMPLICIT_TRANSACTIONS ON
begin try
	
	if @MemberNo is null or @MemberNo = '' 
	begin
		set @v_error = 'Select a Guarantor...';
		RAISERROR (@v_error, 16,1)
	end
	
	if @LoanNo is null or @LoanNo = '' 
	begin
		set @v_error = 'Select a loan to proceed...';
		RAISERROR (@v_error, 16,1)
	end
	
	if @AllocatedAmt is null or @AllocatedAmt = 0 
	begin
		set @v_error = 'Enter the Guaranted Loan Amount...';
		RAISERROR (@v_error, 16,1)
	end
	if @Balance is null or @Balance = 0 
	begin
		set @v_error = 'There is no Amount Available...';
		RAISERROR (@v_error, 16,1)
	end
	
	if @AllocatedAmt > @Balance 
	begin
		set @v_error = 'The Allocated Amount ('+ CONVERT(nvarchar(30),@AllocatedAmt) 
						+') is more than the Amount Available ('+CONVERT(nvarchar(30),@Balance) +')...';
		RAISERROR (@v_error, 16,1)
	end
	
	if @v_user is null or @v_user = '' 
		RAISERROR ('Login to proceed...', 16,1)
		
	select @v_apprs_cnt = count(1) from BS_APPRAISAL where LoanNo=@LoanNo
	if @v_apprs_cnt > 0 
	begin
		set @v_error = 'Loan cannot be modified. It has been Appraised.';
		RAISERROR (@v_error, 16,1)
	end
	select @v_cnt = count(1) from BS_LOANGUAR
	where LoanNo = @LoanNo and MemberNo=@MemberNo
		
	if @UpdateType='Add' and @v_cnt=0
	begin	
		begin try
			INSERT INTO dbo.BS_LOANGUAR
			(MemberNo,LoanNo,Amount,Balance,AuditID,AuditTime)
			VALUES
			(@MemberNo,@LoanNo,@AllocatedAmt,@Balance,@v_user,GETDATE())
		
		end try
		begin catch
			set @v_error = 'Unable to add loan guarantor...' + ERROR_MESSAGE();
			RAISERROR (@v_error, 16,1)
		end catch
	end
	else if @UpdateType='Edit' or not (@UpdateType='Add' and @v_cnt=0)
	begin	
		begin try
			UPDATE dbo.BS_LOANGUAR
			   SET Amount = @AllocatedAmt,
				  Balance = @Balance,
				  AuditID = @v_user,
				  AuditTime = GETDATE()
			 WHERE LoanNo = @LoanNo
			 and MemberNo = @MemberNo

		end try
		begin catch
			set @v_error = 'Unable to update loan guarantor details..' + ERROR_MESSAGE();
			RAISERROR (@v_error, 16,1)
		end catch
	end 
	else
	begin
		set @v_error = 'Update Type not taken care of...'
		RAISERROR (@v_error, 16,1)
	end
	COMMIT
end try
begin catch
	set @v_error = 'Error...' + ERROR_MESSAGE();
	RAISERROR (@v_error, 16,1)
end catch	
END 
