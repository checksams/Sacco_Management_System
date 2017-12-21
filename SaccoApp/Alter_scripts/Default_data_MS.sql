USE KAPSARA
GO

insert into bs_users (usr_userid,USR_USERNAME,STATUS,PASS,
						usr_name,usr_full_name,
						usr_pwd)
				VALUES('Admin','Administrator','Enabled','PASSWORD',
						'Admin','Administrator',dbo.MD5('administrator')
						)
GO
insert into bs_users (usr_userid,USR_USERNAME,STATUS,PASS,
						usr_name,usr_full_name,
						usr_pwd)
				VALUES('USER','USER','Enabled','PASSWORD',
						'USER','USER',dbo.MD5('user')
						)
GO

UPDATE BS_USERS
SET usr_pwd_reset = 'NO',
	usr_pwd = dbo.MD5('administrator'),
	usr_login_atempts = 0
WHERE usr_name = 'Admin';
UPDATE BS_USERS
SET usr_pwd_reset = 'NO',
	usr_pwd = dbo.MD5('user'),
	usr_login_atempts = 0
WHERE usr_name = 'USER';

insert into BS_user_roles(ur_name,ur_desc) values ('ADMIN','ADMINITRATIVE ROLE');
insert into BS_user_roles(ur_name,ur_desc) values ('USER','DEFAULT USER ROLE');
go

insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('System Privilages','System Privillages Setup',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('System Roles','System Roles Setup',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('User Setup','User Setup',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Members','Members',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Next of Kins','Next of Kins',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Statement','Statement',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Shares Contribution','Shares Contribution',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Shares Variation','Shares Variation',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Loan Application','Loan Application',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Loan Guarantors','Loan Guarantors',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Loan Appraisal','Loan Appraisal',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Loan Endorsement','Loan Endorsement',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Cheque Entry','Cheque Entry',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Effect Loan Repayments','Effect Loan Repayments',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Loan Transactions','Loan Transactions',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Loan Balances','Loan Balances',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Benevolent Fund','Benevolent Fund',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Member Savings','Member Savings',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Dividents','Dividents',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Periodic Transactions','Periodic Transactions',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Periodic Statements','Periodic Statements',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Receipt Allocation','Receipt Allocation',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Dormant Members','Dormant Members',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Member Withdrawal','Member Withdrawal',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Archived Members','Archived Members',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Guarantor Viewing','Guarantor Viewing',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Export To GL accounts','Export To GL accounts',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Transfers','Transfers',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Parameters','Parameters',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Loan Types','Loan Types',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Company Setup','Company Setup',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Bank Setup','Bank Setup',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Database Setup','Database Setup',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Rejection Reasons','Rejection Reasons',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Change Member No','Change Member No',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('System Privilages','System Privilages',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('System Roles','System Roles',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('User Setup','User Setup',0.00000,0.00000,'ACCESS');
insert into BS_user_privillages(up_name,up_desc,up_min_amt,up_max_amt,up_type) values ('Change Password','Change Password',0.00000,0.00000,'ACCESS');
go
