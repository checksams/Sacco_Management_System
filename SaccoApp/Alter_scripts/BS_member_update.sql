USE KAPSARA
GO

/****** Object:  StoredProcedure [dbo].[employee_update]    Script Date: 12/16/2017 2:42:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

alter PROCEDURE  [dbo].[BS_member_update](@UpdateType	nvarchar(45), --Add, Edit
								@MemberNo  nvarchar(45),
								@SurName  nvarchar(100),
								@OtherNames  nvarchar(100),
								@DOB  nvarchar(45),
								@ShareCap  decimal(18,2),
								@Station  nvarchar(100),
								@StaffNo  nvarchar(45),
								@Sex	nvarchar(45),
								@RegFee decimal(18,2),
								@RegDate	nvarchar(100),
								@Rank	nvarchar(45),
								@Province	nvarchar(45),
								@PIN	nvarchar(100),
								@PassBookFee	decimal(18,2),
								@OfficeTelNo nvarchar(34),
								@OfficeAddr	nvarchar(300),
								@InitShares	decimal(18,2),
								@IDNo	nvarchar(45),
								@HomeTelNo	nvarchar(33),
								@HomeAddr	nvarchar(300),
								@Terms	nvarchar(45),
								@Employer	nvarchar(300),
								@District	nvarchar(45),
								@Department	nvarchar(100),
								@MonthlyContr	decimal(18,2),
								@CompanyCode	nvarchar(45),
								@AsAtDate	nvarchar(45),
								@AccNo	nvarchar(45),
								@v_user		nvarchar(45),
								@v_MemberNo nvarchar(45) output
								) as
BEGIN
declare @v_DOB date, @v_AsAtDate date, @v_RegDate date
--declare @v_MemberNo nvarchar(45)
declare @var int,@v_cnt int
declare @v_error nvarchar(1000)

SET IMPLICIT_TRANSACTIONS ON
	begin try
		set @v_error = ' '
		
		select @var = len(@DOB) 
		if @var >= 10 
			select @v_DOB = CONVERT(date, @DOB, 103)

		select @var = len(@RegDate) 
		if @var >= 10 
			select @v_RegDate = CONVERT(date, @RegDate, 103)

		select @var = len(@AsAtDate) 
		if @var >= 10 
			select @v_AsAtDate = CONVERT(date, @AsAtDate, 103)
						
		if (@SurName is null or @SurName = '') and (@OtherNames is null or @OtherNames='')
		begin
			set @v_error = 'Enter member names'
			RAISERROR (@v_error, 16,1)
		end
		
		if @UpdateType='Add'
		begin
			select @v_cnt = count(1) from BS_MEMBERS
			where MemberNo = @MemberNo
			if @v_cnt > 0 
			begin
				select @v_MemberNo = ''
				set @v_error = 'A Member with this Member No. already exists...'
				RAISERROR (@v_error, 16,1)
			end
			else if not(@MemberNo is null and @MemberNo='')
			begin
				select @v_MemberNo=@MemberNo
			end
			else
			begin try
				select @v_MemberNo = max(convert(int,MemberNo))+1 from BS_MEMBERS
			end try
			begin catch
				set @v_error = 'Error generating Member No. ...' + ERROR_MESSAGE()
				RAISERROR (@v_error, 16,1)
			end catch
		
			--set @v_error = 'xxx@AsAtDate='+@AsAtDate + ' @DOB=' +@DOB+ ' @RegDate=' +@RegDate
			--				+' @MonthlyContr='+ convert(nvarchar,@MonthlyContr)
			--RAISERROR (@v_error, 16,1)

			INSERT INTO BS_MEMBERS
			(MemberNo,SurName,OtherNames,DOB,ShareCap,
			Station,StaffNo,Sex,RegFee,ApplicDate,
			Rank,Province,PIN,PassBookFee,OfficeTelNo,
			PresentAddr,InitShares,IDNo,HomeTelNo,HomeAddr,
			Terms,Employer,District,Dept,MonthlyContr,
			CompanyCode,AsAtDate,AccNo,AuditId,AuditTime)
			VALUES
			(@v_MemberNo, @SurName, @OtherNames, @v_DOB, @ShareCap, 
			@Station, @StaffNo, @Sex, @RegFee, @v_RegDate, 
			@Rank, @Province, @PIN, @PassBookFee, @OfficeTelNo, 
			@OfficeAddr, @InitShares, @IDNo, @HomeTelNo, @HomeAddr, 
			@Terms, @Employer, @District, @Department, @MonthlyContr, 
			@CompanyCode, @v_AsAtDate, @AccNo, @v_user, GETDATE())
		end
		else if @UpdateType='Edit'
		begin	
			select @v_MemberNo = @MemberNo
			UPDATE BS_MEMBERS
			SET
			SurName=@SurName,
			OtherNames=@OtherNames,
			DOB=@v_DOB,
			ShareCap=@ShareCap,
			Station=@Station,
			StaffNo=@StaffNo,
			Sex=@Sex,
			RegFee=@RegFee,
			ApplicDate=@v_RegDate,
			Rank=@Rank,
			Province=@Province,
			PIN=@PIN,
			PassBookFee=@PassBookFee,
			OfficeTelNo=@OfficeTelNo,
			PresentAddr=@OfficeAddr,
			InitShares=@InitShares,
			IDNo=@IDNo,
			HomeTelNo=@HomeTelNo,
			HomeAddr=@HomeAddr,
			Terms=@Terms,
			Employer=@Employer,
			District=@District,
			Dept=@Department,
			MonthlyContr=@MonthlyContr,
			CompanyCode=@CompanyCode,
			AsAtDate=@v_AsAtDate,
			AccNo=@AccNo,
			AuditId=@v_user,
			AuditTime=getdate()
			WHERE MemberNo = @v_MemberNo
			
		end 
		else
		begin
			set @v_error = 'Update Type not taken care of...'
			RAISERROR (@v_error, 16,1)
		end
		COMMIT;
	end try	
	BEGIN CATCH
		set @v_error = 'Unable to save record..' + @v_error + ERROR_MESSAGE()
		RAISERROR (@v_error, 16,1)
	END CATCH
END 


GO


