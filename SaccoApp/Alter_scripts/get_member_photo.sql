USE [KAPSARA]
GO


/****** Object:  StoredProcedure [dbo].[get_member_photo]    Script Date: 12/16/2017 11:06:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE  [dbo].[get_member_photo](@MemberNo nvarchar(45)) as
begin
SELECT Web_Photo
FROM BS_MEMBERS
where MemberNo = @MemberNo

end 

GO


