USE kapsara
GO

/****** Object:  Table [dbo].[shr_user_roles]    Script Date: 12/17/2017 11:48:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BS_user_roles](
	[ur_code] [int] IDENTITY(1,1) NOT NULL,
	[ur_name] [nvarchar](30) NOT NULL,
	[ur_desc] [nvarchar](100) NOT NULL,
 CONSTRAINT [ur_code_pk] PRIMARY KEY CLUSTERED 
(
	[ur_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


