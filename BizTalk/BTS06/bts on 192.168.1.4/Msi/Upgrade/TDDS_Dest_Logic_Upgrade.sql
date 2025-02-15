ALTER TABLE TDDS_FailedTrackingData ALTER COLUMN ErrMessage ntext NOT NULL 	
GO

if (OBJECT_ID('[dbo].[TDDS_InsertFailedTrackingData]') IS NULL)
begin
	exec ('CREATE PROCEDURE [dbo].[TDDS_InsertFailedTrackingData]
		@ErrorMessage	ntext,
		@dataImage	image,
		@source		nvarchar(256),
		@formatID	uniqueidentifier,
		@DestinationID	tinyint
		AS
		')

	exec ('GRANT EXECUTE ON [dbo].[TDDS_InsertFailedTrackingData] TO BAM_EVENT_WRITER')
end
GO

ALTER PROCEDURE [dbo].[TDDS_InsertFailedTrackingData]
@ErrorMessage	ntext,
@dataImage	image,
@source		nvarchar(256),
@formatID	uniqueidentifier,
@DestinationID	tinyint

AS
	declare @currentTime datetime
	SET @currentTime = GETUTCDATE()

	INSERT INTO TDDS_FailedTrackingData
	( ErrMessage, DataImage, Source, FormatID, dtLogTime, DestinatioNID)
	VALUES
	( @ErrorMessage, @dataImage, @source, @formatID,@currentTime, @DestinationID )
GO


if (OBJECT_ID('[dbo].[TDDS_Lock]') IS NULL)
begin
	exec ('CREATE PROCEDURE [dbo].[TDDS_Lock]
	@resource nvarchar(128),
	@milisecTimeout int,
	@retVal int output
		AS
		')

	exec ('GRANT EXECUTE ON [dbo].[TDDS_Lock] TO BAM_EVENT_WRITER')
end
GO


ALTER PROCEDURE [dbo].[TDDS_Lock] 
	@resource nvarchar(128),
	@milisecTimeout int,
	@retVal int output
AS
exec @retVal = sp_getapplock @resource,  N'Exclusive', N'Session', @milisecTimeout
GO

ALTER PROCEDURE dbo.adm_ChangeHostTrackingPrivilege
	@ApplicationAccount nvarchar(128),
	@ProtectType nvarchar(10) 
AS	
	declare @ErrCode as int
	set @ErrCode = 0

	exec @ErrCode = adm_ChangeRolePrivForUser 'BAM_EVENT_WRITER', @ApplicationAccount, @ProtectType
	if(@ErrCode != 0)
	return @ErrCode
GO