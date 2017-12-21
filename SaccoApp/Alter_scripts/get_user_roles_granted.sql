USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[get_user_roles_granted]    Script Date: 12/17/2017 12:02:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[get_user_roles_granted](@v_usr_code bigint) as
begin
SELECT ur_code,ur_name,ur_desc,usg_code
FROM BS_user_roles_granted usg
left join BS_user_roles ur on (ur.ur_code=usg_ur_code)
where usg_usr_code = @v_usr_code

end 

GO


