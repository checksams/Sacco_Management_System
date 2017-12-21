USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[BS_get_member_contrib]    Script Date: 12/17/2017 12:08:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  dbo.BS_get_member_contrib(@MemberNo nvarchar(45)) as
begin
SELECT CONVERT(nvarchar(30), Contrdate, 103)Contribdate,RefNo,Amount,ShareBal,TransBy,ReceiptNo,Posted,Remarks,Contrdate
FROM BS_CONTRIB
where MemberNo= @MemberNo
order by Contrdate

end 

GO


