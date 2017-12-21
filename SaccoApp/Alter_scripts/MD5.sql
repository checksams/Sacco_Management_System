USE kapsara
GO

/****** Object:  UserDefinedFunction [dbo].[MD5]    Script Date: 12/17/2017 12:15:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


	CREATE FUNCTION [dbo].[MD5]
	(
	  @value nvarchar(255)
	)
	RETURNS nvarchar(32)
	AS
	BEGIN
	  RETURN SUBSTRING(sys.fn_sqlvarbasetostr(HASHBYTES('MD5', @value)),3,32);
	END

GO


