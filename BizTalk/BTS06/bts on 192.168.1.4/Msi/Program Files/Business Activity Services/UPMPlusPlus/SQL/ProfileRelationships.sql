
/*******************************************************************************
* Copyright (c) Microsoft Corporation.  All rights reserved.
* 
* THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
* WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
* WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE. 
* THE ENTIRE RISK OF USE OR RESULTS IN CONNECTION WITH THE USE OF THIS CODE 
* AND INFORMATION REMAINS WITH THE USER.
********************************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DeleteProfileRelationships]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_DeleteProfileRelationships]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetRelatedProfiles]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetRelatedProfiles]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetRoles]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetRoles]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_IsInRole]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_IsInRole]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_RelateProfiles]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_RelateProfiles]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UnrelateProfiles]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UnrelateProfiles]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Profiles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Profiles]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Relationships]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Relationships]
GO

CREATE TABLE [dbo].[Profiles] (
	[ProfileID] [uniqueidentifier] NOT NULL ,
	[ProfileKey] [nvarchar] (128) NOT NULL ,
	[ProfileType] [nvarchar] (128) NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Profiles] WITH NOCHECK ADD 
	CONSTRAINT [PK_Profiles] PRIMARY KEY  CLUSTERED 
	(
		[ProfileID]
	)  ON [PRIMARY] 
GO

CREATE TABLE [dbo].[Relationships] (
	[SourceProfileID] [uniqueidentifier] NOT NULL ,
	[TargetProfileID] [uniqueidentifier] NOT NULL ,
	[Relationship] [nvarchar] (128) NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Relationships] WITH NOCHECK ADD 
	CONSTRAINT [PK_Relationships] PRIMARY KEY  CLUSTERED 
	(
		[SourceProfileID],
		[TargetProfileID],
		[Relationship]
	)  ON [PRIMARY] 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[sp_DeleteProfileRelationships]
    @profilekey nvarchar(128),
    @profiletype nvarchar(128)

AS

declare @profileid uniqueidentifier

SET NOCOUNT ON

-- Make sure the profile is in the Profiles table
SET @profileid = (SELECT ProfileID FROM Profiles
    WHERE ProfileKey = @profilekey AND ProfileType = @profiletype)

IF @profileid IS NULL
BEGIN
   return
END

BEGIN TRANSACTION

-- Delete the relationship & profile
DELETE FROM Relationships 
WHERE Relationships.SourceProfileID = @profileid OR
      Relationships.TargetProfileID = @profileid

--DELETE Profiles FROM Relationships
DELETE FROM Profiles
WHERE (Profiles.ProfileID NOT IN (SELECT SourceProfileID FROM Relationships) AND
       Profiles.ProfileID NOT IN (SELECT TargetProfileID FROM Relationships)) OR
      Profiles.ProfileID = @profileid

COMMIT TRANSACTION
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[sp_GetRelatedProfiles]
    @profilekey nvarchar(128),
    @profiletype nvarchar(128),
    @relationship nvarchar(128)
AS

SELECT Target.ProfileKey, Target.ProfileType
FROM Relationships INNER JOIN Profiles Source ON (Source.ProfileID = Relationships.SourceProfileID)
   INNER JOIN Profiles Target ON (Target.ProfileID = Relationships.TargetProfileID)
WHERE Source.ProfileKey = @profilekey
   AND Source.ProfileType = @profiletype
   AND Relationships.Relationship = @relationship
ORDER BY Target.ProfileType,Target.ProfileKey

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[sp_GetRoles]
    @profilekey nvarchar(128),
    @profiletype nvarchar(128),
    @roletype nvarchar(128),
    @rolerelationship nvarchar(128)
AS

SET NOCOUNT ON
DECLARE @level int, @line char(200)
CREATE TABLE #stack (profilekey nvarchar(128), profiletype nvarchar(128), level int)
INSERT INTO #stack VALUES (@profilekey, @profiletype, 1)
SELECT @level = 1

WHILE @level > 0
BEGIN
   IF EXISTS (SELECT * FROM #stack WHERE level = @level)
      BEGIN
	 INSERT #stack
	    SELECT DISTINCT Target.ProfileKey, Target.ProfileType, @level + 1
	    FROM Relationships INNER JOIN Profiles Source ON (Source.ProfileID = Relationships.SourceProfileID)
	       INNER JOIN Profiles Target ON (Target.ProfileID = Relationships.TargetProfileID)
	       INNER JOIN #stack ON (#stack.profilekey = Source.ProfileKey AND #stack.profiletype = Source.ProfileType)
	    WHERE Target.ProfileType = @roletype
	       AND Relationships.Relationship = @rolerelationship
	       AND #stack.level = @level
                    AND NOT EXISTS (SELECT * FROM #stack s1 WHERE Target.ProfileKey = s1.profilekey AND Target.ProfileType = s1.profiletype)
         IF @@ROWCOUNT > 0
            SELECT @level = @level + 1
	 ELSE
	    SELECT @level = -1
      END
END -- WHILE
SET NOCOUNT OFF
SELECT #stack.profilekey FROM #stack WHERE level <> 1
DROP TABLE #stack
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[sp_IsInRole]
    @profilekey nvarchar(128),
    @profiletype nvarchar(128),
    @role nvarchar(128),
    @roletype nvarchar(128),
    @rolerelationship nvarchar(128)
AS

SET NOCOUNT ON
DECLARE @level int
DECLARE @result bit
CREATE TABLE #stack (profilekey nvarchar(128), profiletype nvarchar(128), level int)
INSERT INTO #stack VALUES (@profilekey, @profiletype, 1)
SELECT @level = 1
SELECT @result = 0

WHILE @level > 0
BEGIN
   IF EXISTS (SELECT * FROM #stack WHERE level = @level)
      BEGIN
	 INSERT #stack
	    SELECT DISTINCT Target.ProfileKey, Target.ProfileType, @level + 1
	    FROM Relationships INNER JOIN Profiles Source ON (Source.ProfileID = Relationships.SourceProfileID)
	       INNER JOIN Profiles Target ON (Target.ProfileID = Relationships.TargetProfileID)
	       INNER JOIN #stack ON (#stack.profilekey = Source.ProfileKey AND #stack.profiletype = Source.ProfileType)
	    WHERE Target.ProfileType = @roletype
	       AND Relationships.Relationship = @rolerelationship
	       AND #stack.level = @level
                    AND NOT EXISTS (SELECT * FROM #stack s1 WHERE Target.ProfileKey = s1.profilekey AND Target.ProfileType = s1.profiletype)
         IF @@ROWCOUNT > 0
	    BEGIN

	       IF EXISTS(SELECT * FROM #stack WHERE profilekey = @role AND profiletype = @roletype AND level=@level+1)
	          BEGIN
  	             SELECT @result = 1
	 	     SELECT @level = -1 -- Exit the loop
		  END
	       ELSE
    	          SELECT @level = @level + 1
	    END
	    
	 ELSE
	    SELECT @level = -1 -- Exit the loop
      END
END -- WHILE
SET NOCOUNT OFF
SELECT @result Result
DROP TABLE #stack
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[sp_RelateProfiles]
    @sourcekey nvarchar(128),
    @sourcetype nvarchar(128),
    @targetkey nvarchar(128),
    @targettype nvarchar(128),
    @relationship nvarchar(128),
    @inverserelationship nvarchar(128)
AS
declare @sourceid uniqueidentifier
declare @targetid uniqueidentifier

BEGIN TRANSACTION

-- Make sure the source is in the Profiles table
SET @sourceid = (SELECT ProfileID FROM Profiles
    WHERE ProfileKey = @sourcekey AND ProfileType = @sourcetype)

IF @sourceid IS NULL
BEGIN
  SET @sourceid = NEWID()

  INSERT INTO Profiles (ProfileID, ProfileKey, ProfileType)
  VALUES(@sourceid, @sourcekey, @sourcetype)
END

-- Make sure the target is in the Profiles table
SET @targetid = (SELECT ProfileID FROM Profiles
    WHERE ProfileKey = @targetkey AND ProfileType = @targettype)

IF @targetid IS NULL
BEGIN
  SET @targetid = NEWID()

  INSERT INTO Profiles (ProfileID, ProfileKey, ProfileType)
  VALUES(@targetid, @targetkey, @targettype)
END

-- Insert the relationship into the Relationships table
IF NOT EXISTS (SELECT * FROM Relationships WHERE SourceProfileID = @sourceid AND TargetProfileID = @targetid AND Relationship = @relationship)
	INSERT INTO Relationships (SourceProfileID, TargetProfileID, Relationship)
	VALUES(@sourceid, @targetid, @relationship)

-- Insert the inverse relationship into the Relationships table
IF NOT EXISTS (SELECT * FROM Relationships WHERE SourceProfileID = @targetid AND TargetProfileID = @sourceid AND Relationship = @inverserelationship)
	INSERT INTO Relationships (SourceProfileID, TargetProfileID, Relationship)
	VALUES(@targetid, @sourceid, @inverserelationship)

COMMIT TRANSACTION
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE [dbo].[sp_UnrelateProfiles]
    @sourcekey nvarchar(128),
    @sourcetype nvarchar(128),
    @targetkey nvarchar(128),
    @targettype nvarchar(128),
    @relationship nvarchar(128),
    @inverserelationship nvarchar(128)
AS
declare @sourceid uniqueidentifier
declare @targetid uniqueidentifier


-- Make sure the source is in the Profiles table
SET @sourceid = (SELECT ProfileID FROM Profiles
    WHERE ProfileKey = @sourcekey AND ProfileType = @sourcetype)

-- Make sure the target is in the Profiles table
SET @targetid = (SELECT ProfileID FROM Profiles
    WHERE ProfileKey = @targetkey AND ProfileType = @targettype)

BEGIN TRANSACTION

-- Remove the relationship from the Relationships table
DELETE FROM Relationships
WHERE Relationships.SourceProfileID = @sourceid
AND   Relationships.TargetProfileID = @targetid
AND   Relationships.Relationship = @relationship

-- Remove the relationship from the Relationships table
DELETE FROM Relationships
WHERE Relationships.SourceProfileID = @targetid
AND   Relationships.TargetProfileID = @sourceid
AND   Relationships.Relationship = @inverserelationship

-- Remove the profile from the Profiles table if no more relationships exist
IF NOT EXISTS (SELECT * FROM Relationships WHERE SourceProfileID = @sourceid OR TargetProfileID = @sourceid)
	DELETE FROM Profiles WHERE @sourceid = Profiles.ProfileID

IF NOT EXISTS (SELECT * FROM Relationships WHERE SourceProfileID = @targetid OR TargetProfileID = @targetid)
	DELETE FROM Profiles WHERE @targetid = Profiles.ProfileID

COMMIT TRANSACTION
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

