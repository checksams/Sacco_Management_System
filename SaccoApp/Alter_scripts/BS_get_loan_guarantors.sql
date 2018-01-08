USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[BS_get_loan_guarantors]    Script Date: 12/17/2017 12:08:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE  dbo.BS_get_loan_guarantors(@MemberNo nvarchar(45),
											  @LoanNo nvarchar(45)) as
begin
declare @GuarShareRatio decimal(19,2), @v_availableAmt decimal(19,2), @v_totalShares decimal(19,2)
	begin try
		select @GuarShareRatio=GuarShareRatio from BS_SYSPARAM 
	end try
	begin catch

	end catch

	if not (@LoanNo is null or @LoanNo='' or @LoanNo='null')
	begin
	
		select g.MemberNo GuarMemberNo,'' Guar_Names, -- (m.OtherNames+' '+ m.SurName) Guar_Names, 
			0 TotalShares, g.Amount AmountGuarteed, 
				0 OtherGuarteedLoanAmt, 
			g.Balance Balance, 0 AvailableAmt
		from BS_LOANGUAR G
		--left join BS_MEMBERS M on (g.MemberNo=m.MemberNo)
		--left join BS_SHARES S on (g.MemberNo=s.MemberNo)
		where g.LoanNo = @LoanNo 
		--and g.MemberNo=@MemberNo
		order by g.MemberNo, g.LoanNo

		/*
		select g.MemberNo GuarMemberNo, concat(m.OtherNames,' ', m.SurName) Guar_Names, 
			s.TotalShares, g.Amount AmountGuarteed, 
				(select sum(lg.Amount) from BS_LOANGUAR lg 
				where lg.LoanNo <> g.LoanNo and lg.MemberNo=g.MemberNo) OtherGuarteedLoanAmt, 
			g.Balance Balance
		from BS_LOANGUAR G
		left join BS_MEMBERS M on (g.MemberNo=m.MemberNo)
		left join BS_SHARES S on (g.MemberNo=s.MemberNo)
		where g.LoanNo = @LoanNo 
		and g.MemberNo=@MemberNo
		order by g.MemberNo, g.LoanNo
		*/


	end
end 

GO


