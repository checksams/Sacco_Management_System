use kapsara
go

alter table BS_MEMBERS ADD Web_Photo nvarchar(max)
go

alter table BS_USERS ADD usr_name nvarchar(30);
alter table BS_USERS ADD usr_full_name nvarchar(100);
alter table BS_USERS ADD usr_emp_code int;
alter table BS_USERS ADD usr_pwd nvarchar(1000);
alter table BS_USERS ADD usr_last_login smalldatetime;
alter table BS_USERS ADD usr_login_atempts int;
alter table BS_USERS ADD usr_pwd_reset nvarchar(5);
go
alter table BS_USERS ADD 
 CONSTRAINT [usr_code_pk] PRIMARY KEY CLUSTERED 
	(
		[usr_code] ASC
	)
go
--use serenehrdb 
--go
SELECT * FROM bs_USERS
UPDATE BS_USERS set usr_name=USR_USERID, usr_full_name=usr_username, 
usr_pwd=dbo.MD5('administrator') --SUBSTRING(sys.fn_sqlvarbasetostr(HASHBYTES('MD5', 'administrator')),3,32) 
where usr_name='Admin'
go
insert into bs_users (usr_userid,USR_USERNAME,STATUS,PASS,
						usr_name,usr_full_name,
						usr_pwd)
				VALUES('Admin','Administrator','Enabled','PASSWORD',
						'Admin','Administrator',dbo.MD5('administrator')
						)
GO

create table BS_WITHDRAWN_TRACKING(

);
GO
