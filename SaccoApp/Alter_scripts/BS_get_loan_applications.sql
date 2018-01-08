USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[BS_get_loan_applications]    Script Date: 12/17/2017 12:08:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE  dbo.BS_get_loan_applications(@MemberNo nvarchar(45),
											  @LoanNo nvarchar(45)) as
begin
if (@LoanNo is null or @LoanNo='' or @LoanNo='null')
	begin
		select l.LoanNo,l.LoanAmt, 0 Balance, l.RepayPeriod, l.LoanCode,lt.LoanType, 
		CONVERT(nvarchar(30), l.ApplicDate, 103)ApplicDate, BasicSalary Earnings,
		upper(WitSigned)WitSigned, WitMemberNo, ''WitnessNames,-- (wtm.OtherNames+' '+ wtm.SurName)WitnessNames,
		upper(SupSigned)SupSigned, SupMemberNo, ''SupervisorNames, --(spm.OtherNames+' '+ spm.SurName)SupervisorNames
		PreparedBy, AddSecurity, UPPER(InsCalcType) InsuranceType, Insurance,InsPercent,Posted
		FROM BS_LOANS as L
		left join BS_LOANTYPE as lt on (lt.LoanCode=l.LoanCode)
		--left join BS_MEMBERS as wtm on (wtm.MemberNo=l.MemberNo)
		--left join BS_MEMBERS as spm on (spm.MemberNo=l.SupMemberNo)
		where l.MemberNo= @MemberNo
		order by l.ApplicDate
	end
	else
	begin
		select l.LoanNo,l.LoanAmt, 0 Balance, l.RepayPeriod, l.LoanCode,lt.LoanType, 
		CONVERT(nvarchar(30), l.ApplicDate, 103)ApplicDate, BasicSalary Earnings,
		upper(WitSigned)WitSigned, WitMemberNo, ''WitnessNames,-- (wtm.OtherNames+' '+ wtm.SurName)WitnessNames,
		upper(SupSigned)SupSigned, SupMemberNo, ''SupervisorNames, --(spm.OtherNames+' '+ spm.SurName)SupervisorNames
		PreparedBy, AddSecurity, UPPER(InsCalcType) InsuranceType, Insurance,InsPercent,Posted
		FROM BS_LOANS as L
		left join BS_LOANTYPE as lt on (lt.LoanCode=l.LoanCode)
		--left join BS_MEMBERS as wtm on (wtm.MemberNo=l.MemberNo)
		--left join BS_MEMBERS as spm on (spm.MemberNo=l.SupMemberNo)
		where l.MemberNo= @MemberNo
		and l.LoanNo = @LoanNo
		order by l.ApplicDate

	end
end 

GO


