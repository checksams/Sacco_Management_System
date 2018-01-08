USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[BS_rptAppliedLoans]    Script Date: 12/17/2017 12:08:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE  dbo.BS_rptAppliedLoans(@DateFrom nvarchar(45),
											  @DateTo nvarchar(45)) as
BEGIN
declare @v_error nvarchar(1000)
declare @var int
declare @v_DateFrom date, @v_DateTo date

SET IMPLICIT_TRANSACTIONS ON
begin try
	SET @v_error =' '
	select @var = len(@DateFrom) 
	if @var >= 10 
		select @v_DateFrom = CONVERT(date, @DateFrom, 103)
	else
	begin
		set @v_error = 'Enter Date From in the right format (DD/MM/RRRR)...';
		RAISERROR (@v_error, 16,1)
	end
	
	select @var = len(@DateTo) 
	if @var >= 10 
		select @v_DateTo = CONVERT(date, @DateTo, 103)
	else
	begin
		set @v_error = 'Enter Date To in the right format (DD/MM/RRRR)...';
		RAISERROR (@v_error, 16,1)
	end
	
	SELECT l.MemberNo, LoanNo,'' Applicant, convert(nvarchar(30),l.ApplicDate,103)ApplicDate, LoanAmt
	FROM BS_LOANS L
	--left join BS_MEMBERS M on (M.MemberNo=L.MemberNo)
	WHERE l.ApplicDate BETWEEN @v_DateFrom AND @v_DateTo
	order by l.ApplicDate

	
end try
begin catch
	set @v_error = 'Error...' + ERROR_MESSAGE();
	RAISERROR (@v_error, 16,1)
end catch	
END 


GO


