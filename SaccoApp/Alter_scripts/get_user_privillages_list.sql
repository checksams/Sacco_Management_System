USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[get_user_privillages_list]    Script Date: 12/17/2017 12:08:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[get_user_privillages_list](@v_ur_code bigint) as
begin
SELECT up_code,up_name,up_desc, 
	round(up_min_amt,0)up_min_amt,
	round(up_max_amt,0)up_max_amt,
	up_type
FROM BS_user_privillages
where up_code not in (select urp_up_code from BS_user_role_privlg
				where urp_ur_code = @v_ur_code)

end 

GO


