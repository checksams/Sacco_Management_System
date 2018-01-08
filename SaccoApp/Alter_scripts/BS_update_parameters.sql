use kapsara
go


/****** Object:  StoredProcedure [dbo].[BS_update_parameters]    Script Date: 12/16/2017 9:57:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

alter procedure dbo.BS_update_parameters(@ShareInterest     decimal(19,2), 
										@LoanInterest    decimal(19,2),
										@MinGuarantors    decimal(19),
										@MaxGuarantors    decimal(19),
										@LoanToShareRatio    decimal(19),
										@MinLoanPeriod    decimal(19),
										@MinTotShares    decimal(19,2),
										@MaxContribPeriod    decimal(19),
										@BankInterest    decimal(19),
										@WithdrawalNotice    decimal(19),
										@MinDivPeriod    decimal(19),
										@SelfGuar    nvarchar(5),
										@GuarShareRatio    decimal(19,2),
										@CompanyName   nvarchar(45),
										@v_user   nvarchar(45),
										@TransToFosa   nvarchar(45),
										@TransToFosaAccCode    decimal(19),
										@TransFromFosa   nvarchar(45),
										@TransFromFosaAccCode    decimal(19),
										@SharesAcc   nvarchar(45),
										@SharesAccCode    decimal(19),
										@FundAcc   nvarchar(45),
										@FundAccCode    decimal(19),
										@RegFeeAcc   nvarchar(45),
										@RegFeeAccCode    decimal(19),
										@RegFeeAmt    decimal(19,2),
										@PassBookFeeAcc   nvarchar(45),
										@PassBookFeeAccCode    decimal(19),
										@PassBookFeeAmt    decimal(19,2),
										@DeRegFeeAcc   nvarchar(45),
										@DeRegFeeAccCode    decimal(19),
										@DeRegFeeAmt    decimal(19,2),
										@Divident   nvarchar(45),
										@DividentAccCode    decimal(19),
										@DividentWhtx   nvarchar(45),
										@DividentWhtxAccCode    decimal(19)
										)
as 
BEGIN
declare @v_error nvarchar(1000)
declare @var int, @v_cnt int, @v_apprs_cnt int
		
SET IMPLICIT_TRANSACTIONS ON
begin try
	set @v_error=' '

	if @v_user is null or @v_user = '' 
	begin
		RAISERROR ('Login to proceed.....', 16,1)
	end
		
	begin try
		UPDATE dbo.BS_SYSPARAM
			SET ShareInterest = @ShareInterest,
				LoanInterest = @LoanInterest,
				MinGuarantors = @MinGuarantors,
				MaxGuarantors = @MaxGuarantors, 
				LoanToShareRatio = @LoanToShareRatio,
				MinLoanPeriod = @MinLoanPeriod,
				MinTotShares = @MinTotShares,
				MaxContribPeriod = @MaxContribPeriod,
				BankInterest = @BankInterest,
				WithdrawalNotice = @WithdrawalNotice,
				MinDivPeriod = @MinDivPeriod,
				SelfGuar = @SelfGuar,
				GuarShareRatio = @GuarShareRatio,
				CompanyName = @CompanyName,
				AuditID = @v_user,
				AuditTime = getdate(),
				TransToFosa = @TransToFosa,
				TransToFosaAccCode = case when @TransToFosaAccCode=0 then null else @TransToFosaAccCode end ,
				TransFromFosa = @TransFromFosa,
				TransFromFosaAccCode = case when @TransFromFosaAccCode=0 then null else @TransFromFosaAccCode end ,
				SharesAcc = @SharesAcc,
				SharesAccCode = case when @SharesAccCode=0 then null else @SharesAccCode end ,
				FundAcc = @FundAcc,
				FundAccCode = case when @FundAccCode=0 then null else @FundAccCode end ,
				RegFeeAcc = @RegFeeAcc,
				RegFeeAccCode = case when @RegFeeAccCode=0 then null else @RegFeeAccCode end ,
				RegFeeAmt = @RegFeeAmt,
				PassBookFeeAcc = @PassBookFeeAcc,
				PassBookFeeAccCode = case when @PassBookFeeAccCode=0 then null else @PassBookFeeAccCode end ,
				PassBookFeeAmt = @PassBookFeeAmt,
				DeRegFeeAcc = @DeRegFeeAcc,
				DeRegFeeAccCode = case when @DeRegFeeAccCode=0 then null else @DeRegFeeAccCode end ,
				DeRegFeeAmt = @DeRegFeeAmt,
				Divident = @Divident,
				DividentAccCode = case when @DividentAccCode=0 then null else @DividentAccCode end ,
				DividentWhtx = @DividentWhtx,
				DividentWhtxAccCode = case when @DividentWhtxAccCode=0 then null else @DividentWhtxAccCode end 
	end try
	begin catch
		set @v_error = 'Unable to update parameter details..' + ERROR_MESSAGE();
		RAISERROR (@v_error, 16,1)
	end catch
	COMMIT
end try
begin catch
	set @v_error = 'Error...' + ERROR_MESSAGE();
	RAISERROR (@v_error, 16,1)
end catch	
END 
