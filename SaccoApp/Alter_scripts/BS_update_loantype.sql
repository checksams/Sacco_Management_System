use kapsara
go


/****** Object:  StoredProcedure [dbo].[BS_update_loantype]    Script Date: 12/16/2017 9:57:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

alter procedure dbo.BS_update_loantype(@UpdateType   nvarchar(45), --Add, Edit
										@LoanCode   nvarchar(45),
										@LoanType   nvarchar(100),
										@RepayPeriod     decimal(19), 
										@Interest    decimal(19),
										@MaxAmount    decimal(19,2),
										@Guarantor   nvarchar(45),
										@cr_acc_code    decimal(19),
										@cr_acc_sht_desc   nvarchar(45),
										@dr_acc_code    decimal(19),
										@dr_acc_sht_desc   nvarchar(45),
										@cr_Intr_acc_code    decimal(19),
										@cr_Intr_acc_sht_desc   nvarchar(45),
										@dr_Intr_acc_code    decimal(19),
										@dr_Intr_acc_sht_desc   nvarchar(45),
										@LoanPymtAcc   nvarchar(45),
										@LoanPymtAccCode    decimal(19),
										@Insurance_Type   nvarchar(45),
										@Insurance_Rate    decimal(19,5),
										@InsuranceAcc   nvarchar(45),
										@InsuranceAccCode    decimal(19),
										@v_user   nvarchar(45)
										)
as 
BEGIN
declare @v_error nvarchar(1000)
declare @var int, @v_cnt int
		
SET IMPLICIT_TRANSACTIONS ON
begin try
	set @v_error=' '

	if @v_user is null or @v_user = '' 
	begin
		RAISERROR ('Login to proceed.....', 16,1)
	end

	SELECT @v_cnt=count(1) FROM dbo.BS_LOANTYPE WHERE LoanCode=@LoanCode

	if (@LoanCode is null or @LoanCode='') or @UpdateType='Add'
	begin
		if @v_cnt > 0 
		begin
			set @v_error='A loan with such a LoanCode already exists'
			RAISERROR (@v_error, 16,1)
		end 

		begin try
			INSERT INTO dbo.BS_LOANTYPE
			(LoanCode,LoanType,RepayPeriod,Interest
			,MaxAmount,Guarantor,AuditID,AuditTime
			,cr_acc_code
			,cr_acc_sht_desc
			,dr_acc_code
			,dr_acc_sht_desc
			,cr_Intr_acc_code
			,cr_Intr_acc_sht_desc
			,dr_Intr_acc_code
			,dr_Intr_acc_sht_desc
			,LoanPymtAcc
			,LoanPymtAccCode
			,Insurance_Type,Insurance_Rate
			,InsuranceAcc
			,InsuranceAccCode)
			VALUES
			(@LoanCode,@LoanType,@RepayPeriod,@Interest
			,@MaxAmount,@Guarantor,@v_user,getdate()
			,case when @cr_acc_code=0 then null else @cr_acc_code end
			,@cr_acc_sht_desc
			,case when @dr_acc_code=0 then null else @dr_acc_code end 
			,@dr_acc_sht_desc
			,case when @cr_Intr_acc_code=0 then null else @cr_Intr_acc_code end 
			,@cr_Intr_acc_sht_desc
			,case when @dr_Intr_acc_code=0 then null else @dr_Intr_acc_code end 
			,@dr_Intr_acc_sht_desc
			,@LoanPymtAcc
			,case when @LoanPymtAccCode=0 then null else @LoanPymtAccCode end 
			,@Insurance_Type,@Insurance_Rate
			,@InsuranceAcc
			,case when @InsuranceAccCode=0 then null else @InsuranceAccCode end )

		end try
		begin catch
			set @v_error = 'Unable to create loan type..' + ERROR_MESSAGE();
			RAISERROR (@v_error, 16,1)
		end catch
	
	end
	else
	begin	
		begin try
			UPDATE dbo.BS_LOANTYPE
			SET LoanType = @LoanType,
			RepayPeriod = @RepayPeriod,
			Interest = @Interest,
			MaxAmount = @MaxAmount,
			Guarantor = @Guarantor,
			AuditID = @v_user,
			AuditTime = getDate(),
			cr_acc_code = case when @cr_acc_code=0 then null else @cr_acc_code end ,
			cr_acc_sht_desc = @cr_acc_sht_desc,
			dr_acc_code = case when @dr_acc_code=0 then null else @dr_acc_code end ,
			dr_acc_sht_desc = @dr_acc_sht_desc,
			cr_Intr_acc_code = case when @cr_Intr_acc_code=0 then null else @cr_Intr_acc_code end ,
			cr_Intr_acc_sht_desc = @cr_Intr_acc_sht_desc,
			dr_Intr_acc_code = case when @dr_Intr_acc_code=0 then null else @dr_Intr_acc_code end ,
			dr_Intr_acc_sht_desc = @dr_Intr_acc_sht_desc,
			LoanPymtAcc = @LoanPymtAcc,
			LoanPymtAccCode = case when @LoanPymtAccCode=0 then null else @LoanPymtAccCode end ,
			Insurance_Type = @Insurance_Type,
			Insurance_Rate = @Insurance_Rate,
			InsuranceAcc = @InsuranceAcc,
			InsuranceAccCode = case when @InsuranceAccCode=0 then null else @InsuranceAccCode end 
			WHERE LoanCode = @LoanCode
			
		end try
		begin catch
			set @v_error = 'Unable to update loan type details..' + ERROR_MESSAGE();
			RAISERROR (@v_error, 16,1)
		end catch
	end
	COMMIT
end try
begin catch
	set @v_error = 'Error...' + ERROR_MESSAGE();
	RAISERROR (@v_error, 16,1)
end catch	
END 
