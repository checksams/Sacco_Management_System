USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[get_user_role_privlg]    Script Date: 12/17/2017 12:04:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[get_user_role_privlg](@v_ur_code bigint) as
begin
SELECT up_code,up_name,up_type,urp_min_amt, urp_max_amt,urp_code,ur_code,
	case when urp_code is null then 0 else 1 end as checked
FROM BS_user_privillages up
left join BS_user_role_privlg urp on (urp.urp_up_code = up.up_code)
left join BS_user_roles ur on (ur.ur_code = urp.urp_ur_code)
where urp_ur_code = @v_ur_code

end 

GO


