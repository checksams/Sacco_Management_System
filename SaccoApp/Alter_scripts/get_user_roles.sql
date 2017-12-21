USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[get_user_roles]    Script Date: 12/17/2017 12:03:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[get_user_roles] as
begin
SELECT ur_code,ur_name,ur_desc
FROM BS_user_roles

end 

GO


