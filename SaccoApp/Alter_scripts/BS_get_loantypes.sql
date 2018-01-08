USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[BS_get_loantypes]    Script Date: 12/17/2017 12:08:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


alter PROCEDURE  dbo.BS_get_loantypes(@LoanCode nvarchar(45)) as
BEGIN
	if @LoanCode is null or @LoanCode='' or @LoanCode='null'
	begin
		SELECT LoanCode,LoanType,
		CONVERT(decimal(19), RepayPeriod)RepayPeriod,
		CONVERT(decimal(19), Interest)Interest
		,CONVERT(decimal(19,2), MaxAmount)MaxAmount,Guarantor,
		CONVERT(decimal(19), cr_acc_code)cr_acc_code,cr_acc_sht_desc
		,CONVERT(decimal(19), dr_acc_code)dr_acc_code,dr_acc_sht_desc,
		CONVERT(decimal(19), cr_Intr_acc_code)cr_Intr_acc_code,cr_Intr_acc_sht_desc
		,CONVERT(decimal(19), dr_Intr_acc_code)dr_Intr_acc_code,dr_Intr_acc_sht_desc,LoanPymtAcc,
		CONVERT(decimal(19), LoanPymtAccCode)LoanPymtAccCode
		,upper(Insurance_Type)Insurance_Type,Insurance_Rate,InsuranceAcc,
		CONVERT(decimal(19), InsuranceAccCode)InsuranceAccCode
		FROM dbo.BS_LOANTYPE
	end
	else
	begin
		SELECT LoanCode,LoanType,
		CONVERT(decimal(19), RepayPeriod)RepayPeriod,
		CONVERT(decimal(19), Interest)Interest
		,CONVERT(decimal(19,2), MaxAmount)MaxAmount,Guarantor,
		CONVERT(decimal(19), cr_acc_code)cr_acc_code,cr_acc_sht_desc
		,CONVERT(decimal(19), dr_acc_code)dr_acc_code,dr_acc_sht_desc,
		CONVERT(decimal(19), cr_Intr_acc_code)cr_Intr_acc_code,cr_Intr_acc_sht_desc
		,CONVERT(decimal(19), dr_Intr_acc_code)dr_Intr_acc_code,dr_Intr_acc_sht_desc,LoanPymtAcc,
		CONVERT(decimal(19), LoanPymtAccCode)LoanPymtAccCode
		,upper(Insurance_Type)Insurance_Type,Insurance_Rate,InsuranceAcc,
		CONVERT(decimal(19), InsuranceAccCode)InsuranceAccCode
		FROM dbo.BS_LOANTYPE
		where LoanCode = @LoanCode
	end
	
END 


GO


