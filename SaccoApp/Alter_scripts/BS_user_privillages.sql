USE kapsara
GO

/****** Object:  Table [dbo].[BS_user_privillages]    Script Date: 12/17/2017 11:51:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BS_user_privillages](
	[up_code] [int] IDENTITY(1,1) NOT NULL,
	[up_name] [nvarchar](30) NOT NULL,
	[up_desc] [nvarchar](100) NULL,
	[up_min_amt] [decimal](25, 5) NULL,
	[up_max_amt] [decimal](25, 5) NULL,
	[up_type] [nvarchar](45) NULL,
 CONSTRAINT [up_code_pk] PRIMARY KEY CLUSTERED 
(
	[up_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


