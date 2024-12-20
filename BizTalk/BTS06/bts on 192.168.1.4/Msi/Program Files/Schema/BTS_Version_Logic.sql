--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 


-- //////////////////////////////////////////////////////////////////////////////////////////////////
-- Remove existing schema and stored procedures
-- //////////////////////////////////////////////////////////////////////////////////////////////////
if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Query_BizTalkDBVersion]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Query_BizTalkDBVersion]

if exists (select * from sysobjects where id = object_id(N'[dbo].[adm_Register_BizTalkDB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[adm_Register_BizTalkDB]

GO

--========== stored procedures for Database Version Checking ==========--

CREATE PROCEDURE [dbo].[adm_Register_BizTalkDB]
@BizTalkDBName nvarchar(64),
@DatabaseMajor int,
@DatabaseMinor int,
@DatabaseBuildNumber int,
@DatabaseRevision int,
@ProductMajor int,
@ProductMinor int,
@ProductBuildNumber int,
@ProductRevision int,
@ProductLanguage nvarchar(256),
@Description nvarchar(256)
AS
	set nocount on
	set xact_abort on

	begin transaction

		-- Note: This will fail if there already exist an entry with the same BizTalkDBName
		insert into BizTalkDBVersion
		(
			BizTalkDBName,
			DatabaseMajor,
			DatabaseMinor,
			DatabaseBuildNumber,
			DatabaseRevision,
			ProductMajor,	
			ProductMinor,	
			ProductBuildNumber,
			ProductRevision,
			ProductLanguage,
			Description
		)
		values
		(
			@BizTalkDBName,
			@DatabaseMajor,
			@DatabaseMinor,
			@DatabaseBuildNumber,
			@DatabaseRevision,
			@ProductMajor,	
			@ProductMinor,	
			@ProductBuildNumber,
			@ProductRevision,
			@ProductLanguage,
			@Description
		)
		
	commit transaction
	set nocount off
GO

CREATE PROCEDURE [dbo].[adm_Query_BizTalkDBVersion]
@BizTalkDBName nvarchar(64)
AS
	set nocount on
	set xact_abort on

	select	top 1
		DatabaseMajor,
		DatabaseMinor,
		DatabaseBuildNumber,
		DatabaseRevision,
		ProductMajor,	
		ProductMinor,	
		ProductBuildNumber,
		ProductRevision,
		ProductLanguage,
		Description
	from
		BizTalkDBVersion
	where
		BizTalkDBName = @BizTalkDBName
	order by 
		ProductMajor desc, ProductMinor desc, ProductBuildNumber desc, ProductRevision desc

	set nocount off
GO

if exists (select * from sysusers where name = N'BTS_HOST_USERS' and issqlrole = 1)
	GRANT EXEC ON [dbo].[adm_Query_BizTalkDBVersion] TO BTS_HOST_USERS
	
if exists (select * from sysusers where name = N'BTS_ADMIN_USERS' and issqlrole = 1)
	GRANT EXEC ON [dbo].[adm_Query_BizTalkDBVersion] TO BTS_ADMIN_USERS

if exists (select * from sysusers where name = N'BTS_OPERATORS' and issqlrole = 1)
	GRANT EXEC ON [dbo].[adm_Query_BizTalkDBVersion] TO BTS_OPERATORS
GO
