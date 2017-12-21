USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[get_user_roles_list]    Script Date: 12/17/2017 11:47:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE  [dbo].[get_user_roles_list](@v_usr_code bigint) as
begin
SELECT ur_code,ur_name,ur_desc
FROM BS_user_roles
where ur_code not in (select usg_ur_code from BS_user_roles_granted
				where usg_usr_code = @v_usr_code)
end

GO


