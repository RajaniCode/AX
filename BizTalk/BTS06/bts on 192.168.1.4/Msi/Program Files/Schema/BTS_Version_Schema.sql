--/ Copyright (c) Microsoft Corporation.  All rights reserved. 
--/  
--/ THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
--/ WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
--/ WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
--/ THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
--/ AND INFORMATION REMAINS WITH THE USER. 
--/ 


-- Note: for database consolidation, we don't remove existing tables



--/---------------------------------------------------------------------------------------------------------------
--// Database version table
--/---------------------------------------------------------------------------------------------------------------
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BizTalkDBVersion]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
	CREATE TABLE [dbo].[BizTalkDBVersion]
	(
		BizTalkDBName		nvarchar(64)	not null,
		DatabaseMajor		int				not null,
		DatabaseMinor		int				not null,
		DatabaseBuildNumber	int				not null,
		DatabaseRevision	int				not null,
		ProductMajor		int				not null,
		ProductMinor		int				not null,
		ProductBuildNumber	int				not null,
		ProductRevision		int				not null,
		ProductLanguage		nvarchar(256)	not null,
		Description		nvarchar(256)	not null,
		Modified		datetime   	default(GetUTCDate()),


		CONSTRAINT BizTalkDBVersion_unique_key	unique(BizTalkDBName, ProductMajor, ProductMinor, ProductBuildNumber, ProductRevision),
	) ON [PRIMARY]
end
GO
-- No need to GRANT to anyone since this stored proc should only be called during
-- database creation, in which case the user is always db_owner
