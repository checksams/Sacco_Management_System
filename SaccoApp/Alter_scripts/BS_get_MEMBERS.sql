USE [KAPSARA]
GO

/****** Object:  StoredProcedure [dbo].[BS_LOAN_DEDUCTION]    Script Date: 12/16/2017 9:57:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




alter procedure [dbo].[BS_get_MEMBERS]
(
  @MemberNo nvarchar(45),
  @SurName nvarchar(150),
  @OtherNames nvarchar(150),
  @IDNo nvarchar(30)
) 
as 
BEGIN -- PROCEDURE BODY
	SELECT MemberNo,StaffNo,IDNo,AccNo,SurName,OtherNames
	,upper(Sex)Sex,CONVERT(nvarchar(30), DOB, 103)DOB,
	Employer,Dept,Rank,upper(Terms)Terms,PresentAddr
	,OfficeTelNo,HomeAddr,HomeTelNo,RegFee,InitShares,
	CONVERT(nvarchar(30), AsAtDate, 103)AsAtDate
	,MonthlyContr,
	CONVERT(nvarchar(30), ApplicDate, 103)ApplicDate,
	CONVERT(nvarchar(30), EffectDate, 103)EffectDate,Signed,Accepted
	,Archived,Withdrawn,IsGuarantor,Province,District,Station
	,CompanyCode,PIN,ShareCap,BankCode,PassBookFee
	FROM dbo.BS_MEMBERS
	where MemberNo like '%'+ @MemberNo +'%' 
	and SurName like '%'+ @SurName +'%'
	and OtherNames like '%'+ @OtherNames +'%'
	and IDNo like '%'+ @IDNo +'%'
	order by SurName
  
END -- BODY
GO


