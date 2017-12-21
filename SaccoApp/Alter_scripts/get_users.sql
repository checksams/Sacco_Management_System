USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[get_users]    Script Date: 12/17/2017 11:46:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[get_users] as
begin
SELECT usr_code, usr_name, usr_full_name,usr_emp_code,
usr_pwd_reset, usr_last_login, usr_login_atempts
FROM bs_users

end 

GO


