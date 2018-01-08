use kapsara
go


/****** Object:  StoredProcedure [dbo].[BS_update_loanApp]    Script Date: 12/16/2017 9:57:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

alter procedure dbo.BS_update_loanApp(@UpdateType	nvarchar(45), --Add, Edit,
										@LoanNo    nvarchar(45),
										@MemberNo    nvarchar(45),
										@LoanCode    nvarchar(45),
										@ApplicDate    nvarchar(45),
										@LoanAmt    decimal(19,2),
										@BasicSalary    decimal(19,2),
										@RepayPeriod    decimal(3),
										@WitMemberNo    nvarchar(45),
										@WitSigned    nvarchar(45),
										@SupMemberNo    nvarchar(45),
										@SupSigned    nvarchar(45),
										@PreparedBy   nvarchar(45) ,
										@AddSecurity    nvarchar(45),
										@Insurance    money,
										@InsPercent    decimal(19,2),
										@InsCalcType   nvarchar(45),
										@v_user   nvarchar(45),
										@v_LoanNo   nvarchar(45) output
										)
as 
BEGIN
declare @v_error nvarchar(1000)
declare @v_ApplicDate date
declare @var int, @v_cnt int, @v_apprs_cnt int
		
SET IMPLICIT_TRANSACTIONS ON
begin try
	
	if @MemberNo is null or @MemberNo = '' 
	begin
		set @v_error = 'Select a member...';
		RAISERROR (@v_error, 16,1)
	end
	
	if @LoanCode is null or @LoanCode = '' 
	begin
		set @v_error = 'Select a loan type...';
		RAISERROR (@v_error, 16,1)
	end
	
	if @LoanAmt is null or @LoanAmt = 0 
	begin
		set @v_error = 'Enter the Loan Amount...';
		RAISERROR (@v_error, 16,1)
	end

	if @RepayPeriod is null or @RepayPeriod = 0
	begin
		set @v_error = 'Enter the Loan Repayment Period (Months)...';
		RAISERROR (@v_error, 16,1)
	end

	if @v_user is null or @v_user = '' 
		RAISERROR ('Login to proceed...', 16,1)
		
	select @var = len(@ApplicDate) 
	if @var >= 10 
		select @v_ApplicDate = CONVERT(date, @ApplicDate, 103)
	else
	begin
		set @v_error = 'Enter loan application date to proceed...';
		RAISERROR (@v_error, 16,1)
	end

	select @v_apprs_cnt = count(1) from BS_APPRAISAL where LoanNo=@LoanNo
	if @v_apprs_cnt > 0 
	begin
		set @v_error = 'Loan cannot be modified. It has been Appraised.';
		RAISERROR (@v_error, 16,1)
	end
		
	if @UpdateType='Add'
	begin	
		begin try
			select @v_cnt = count(1) from BS_LOANS
			where LoanNo = @LoanNo and not (@LoanNo is null or @LoanNo='')
			if @v_cnt > 0 
			begin
				select @v_LoanNo = ''
				set @v_error = 'A Loan with this Loan No. already exists......'
				RAISERROR (@v_error, 16,1)
			end
			else if not(@LoanNo is null or @LoanNo='')
			begin
				select @v_LoanNo=@LoanNo
			end
			else
			begin try
				select @v_LoanNo = max(convert(int,LoanNo))+1 from BS_LOANS
			end try
			begin catch
				set @v_error = 'Error generating Loan No. ...' + ERROR_MESSAGE()
				RAISERROR (@v_error, 16,1)
			end catch

			if (@v_LoanNo is null or @v_LoanNo='')
			begin
				set @v_error = 'Loan No. was not generated when creating loan application...'
				RAISERROR (@v_error, 16,1)
			end
		
			INSERT INTO dbo.BS_LOANS
				(LoanNo,MemberNo,LoanCode,ApplicDate,LoanAmt,BasicSalary,RepayPeriod,
				WitMemberNo,WitSigned,SupMemberNo,SupSigned,
				PreparedBy,
				AddSecurity,Insurance,InsPercent,InsCalcType,
				Posted,AuditID,AuditTime)
			VALUES
				(@v_LoanNo,@MemberNo,@LoanCode,@v_ApplicDate,@LoanAmt,@BasicSalary,@RepayPeriod,
				@WitMemberNo,@WitSigned,@SupMemberNo,@SupSigned,
				case when @PreparedBy is null or @PreparedBy='' then @v_user else @PreparedBy end,
				@AddSecurity,@Insurance,@InsPercent,@InsCalcType,
				'NO',@v_user,GETDATE())
		end try
		begin catch
			set @v_error = 'Unable to add loan...' + ERROR_MESSAGE();
			RAISERROR (@v_error, 16,1)
		end catch
	end
	else if @UpdateType='Edit'
	begin	
		begin try
			if (@LoanNo is null or @LoanNo='')
			begin
				set @v_error = 'Cannot Edit a Loan that does not have a Loan No...'
				RAISERROR (@v_error, 16,1)
			end
			
			UPDATE dbo.BS_LOANS
			   SET LoanCode = @LoanCode,
				  ApplicDate = @v_ApplicDate,
				  LoanAmt = @LoanAmt,
				  BasicSalary = @BasicSalary,
				  RepayPeriod = @RepayPeriod,
				  WitMemberNo = @WitMemberNo,
				  WitSigned = @WitSigned,
				  SupMemberNo = @SupMemberNo,
				  SupSigned = @SupSigned,
				  PreparedBy = case when @PreparedBy is null or @PreparedBy='' then @v_user else @PreparedBy end,
				  AddSecurity = @AddSecurity,
				  Insurance = @Insurance,
				  InsPercent = @InsPercent,
				  InsCalcType = @InsCalcType,
				  Posted = 'NO',
				  AuditID = @v_user,
				  AuditTime = GETDATE()
			 WHERE LoanNo = @LoanNo
			 and MemberNo = @MemberNo

			 set @v_LoanNo = @LoanNo

		end try
		begin catch
			set @v_error = 'Unable to update loan application details..' + ERROR_MESSAGE();
			RAISERROR (@v_error, 16,1)
		end catch
	end 
	else
	begin
		set @v_error = 'Update Type not taken care of...'
		RAISERROR (@v_error, 16,1)
	end
	COMMIT
	/*
	if @v_LoanNo is null or @v_LoanNo=''	
		set @v_error = 'Loan output @v_LoanNo='
	else
		set @v_error = 'Loan output @v_LoanNo='+@v_LoanNo
	RAISERROR (@v_error, 16,1) */
end try
begin catch
	set @v_error = 'Error...' + ERROR_MESSAGE();
	RAISERROR (@v_error, 16,1)
end catch	
END 
