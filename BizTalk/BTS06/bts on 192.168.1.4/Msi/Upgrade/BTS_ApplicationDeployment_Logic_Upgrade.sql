SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

INSERT INTO adpl_sat (applicationId, luid)
SELECT [nApplicationID], [nvcFullName]
		FROM [bts_assembly]
		JOIN [adm_Group] ON ([bts_assembly].[nGroupId] =  [adm_Group].[Id])
		JOIN [bts_application] ON ([bts_application].[nID] = [bts_assembly].[nApplicationID])
		WHERE ([adm_Group].Id = 1) -- TBD: hardcoded group id value
			AND ([bts_application].[isDefault] = 0) -- not in the default application
			AND ([bts_application].[isSystem] = 1) -- in the system application
			AND ([bts_assembly].[nSystemAssembly] = 1) -- system assembly
		ORDER BY
			[nvcFullName]

INSERT INTO adpl_sat (applicationId, luid)
SELECT [nApplicationID], [nvcFullName]
		FROM [bts_assembly]
		JOIN [adm_Group] ON ([bts_assembly].[nGroupId] =  [adm_Group].[Id])
		JOIN [bts_application] ON ([bts_application].[nID] = [bts_assembly].[nApplicationID])
		WHERE ([adm_Group].Id = 1) -- TBD: hardcoded group id value
			AND ([bts_application].[isDefault] = 1) -- in the default application
			AND ([bts_application].[isSystem] = 0) -- not in the system application
			AND ([bts_assembly].[nSystemAssembly] = 0) -- not system assembly
		ORDER BY
			[nvcFullName]

UPDATE adpl_sat
	SET sdmType = 'System.BizTalk:BizTalkAssembly'
	WHERE sdmType IS NULL

GO

