USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[BS_get_parameters]    Script Date: 12/17/2017 12:08:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


alter PROCEDURE  dbo.BS_get_parameters as
BEGIN
	SELECT CONVERT(decimal(19,2), ShareInterest)ShareInterest,CONVERT(decimal(19), LoanInterest)LoanInterest
		,CONVERT(decimal(19), MinGuarantors)MinGuarantors
		,CONVERT(decimal(19), MaxGuarantors)MaxGuarantors
		,CONVERT(decimal(19), LoanToShareRatio)LoanToShareRatio,CONVERT(decimal(19), MinLoanPeriod)MinLoanPeriod
		,CONVERT(decimal(19,2), MinTotShares)MinTotShares,CONVERT(decimal(19), MaxContribPeriod)MaxContribPeriod
		,CONVERT(decimal(19), BankInterest)BankInterest,CONVERT(decimal(19), WithdrawalNotice)WithdrawalNotice
		,CONVERT(decimal(19), MinDivPeriod)MinDivPeriod,CONVERT(decimal(19,2), DeductAmt)DeductAmt
		,upper(SelfGuar)SelfGuar,CONVERT(decimal(19), GuarShareRatio)GuarShareRatio
		,CompanyName,AuditID
		,AuditTime,TransToFosa
		,CONVERT(decimal(19), TransToFosaAccCode)TransToFosaAccCode,TransFromFosa
		,CONVERT(decimal(19), TransFromFosaAccCode)TransFromFosaAccCode,SharesAcc
		,CONVERT(decimal(19), SharesAccCode)SharesAccCode,FundAcc
		,CONVERT(decimal(19), FundAccCode)FundAccCode,RegFeeAcc
		,CONVERT(decimal(19), RegFeeAccCode)RegFeeAccCode,CONVERT(decimal(19,2), RegFeeAmt)RegFeeAmt
		,PassBookFeeAcc,CONVERT(decimal(19), PassBookFeeAccCode)PassBookFeeAccCode
		,CONVERT(decimal(19,2), PassBookFeeAmt)PassBookFeeAmt,DeRegFeeAcc
		,CONVERT(decimal(19), DeRegFeeAccCode)DeRegFeeAccCode,CONVERT(decimal(19,2), DeRegFeeAmt)DeRegFeeAmt
		,Divident,CONVERT(decimal(19), DividentAccCode)DividentAccCode
		,DividentWhtx,CONVERT(decimal(19), DividentWhtxAccCode)DividentWhtxAccCode
	FROM dbo.BS_SYSPARAM

	
END 


GO


