USE kapsara
GO

/****** Object:  StoredProcedure [dbo].[get_user_privillages]    Script Date: 12/17/2017 12:08:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[get_user_privillages] as
begin
SELECT up_code,up_name,up_desc, 
	round(up_min_amt,0)up_min_amt,
	round(up_max_amt,0)up_max_amt,
	up_type
FROM BS_user_privillages

end 

GO


