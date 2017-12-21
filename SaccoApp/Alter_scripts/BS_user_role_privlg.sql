USE kapsara
GO

/****** Object:  Table [dbo].[BS_user_role_privlg]    Script Date: 12/17/2017 11:50:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BS_user_role_privlg](
	[urp_code] [int] IDENTITY(1,1) NOT NULL,
	[urp_ur_code] [int] NULL,
	[urp_up_code] [int] NULL,
	[urp_date] [smalldatetime] NOT NULL DEFAULT (getdate()),
	[urp_min_amt] [int] NULL,
	[urp_max_amt] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[urp_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[BS_user_role_privlg]  WITH CHECK ADD  CONSTRAINT [urp_up_code_fk] FOREIGN KEY([urp_up_code])
REFERENCES [dbo].[BS_user_privillages] ([up_code])
GO

ALTER TABLE [dbo].[BS_user_role_privlg] CHECK CONSTRAINT [urp_up_code_fk]
GO

ALTER TABLE [dbo].[BS_user_role_privlg]  WITH CHECK ADD  CONSTRAINT [urp_ur_code_fk] FOREIGN KEY([urp_ur_code])
REFERENCES [dbo].[BS_user_roles] ([ur_code])
GO

ALTER TABLE [dbo].[BS_user_role_privlg] CHECK CONSTRAINT [urp_ur_code_fk]
GO


