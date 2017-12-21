USE kapsara
GO

/****** Object:  Table [dbo].[BS_user_roles_granted]    Script Date: 12/17/2017 11:53:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BS_user_roles_granted](
	[usg_code] [int] IDENTITY(1,1) NOT NULL,
	[usg_usr_code] [int] NOT NULL,
	[usg_ur_code] [int] NOT NULL,
	[usg_date] [smalldatetime] NULL DEFAULT (getdate()),
	[usg_created_by] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[usg_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[BS_user_roles_granted]  WITH CHECK ADD  CONSTRAINT [usg_ur_code_fk] FOREIGN KEY([usg_ur_code])
REFERENCES [dbo].[BS_user_roles] ([ur_code])
GO

ALTER TABLE [dbo].[BS_user_roles_granted] CHECK CONSTRAINT [usg_ur_code_fk]
GO

ALTER TABLE [dbo].[BS_user_roles_granted]  WITH CHECK ADD  CONSTRAINT [usg_usr_code_fk] FOREIGN KEY([usg_usr_code])
REFERENCES [dbo].[BS_users] ([usr_code])
GO

ALTER TABLE [dbo].[BS_user_roles_granted] CHECK CONSTRAINT [usg_usr_code_fk]
GO


