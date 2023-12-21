/****** Object:  UserDefinedTableType [dbo].[BoothType]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[BoothType] AS TABLE(
	[prourl] [varchar](255) NULL,
	[streamname] [varchar](255) NULL,
	[servername] [varchar](255) NULL,
	[operatorName] [varchar](255) NULL,
	[operatorNumber] [numeric](18, 0) NULL,
	[operatorDesignation] [varchar](255) NULL,
	[district] [varchar](255) NULL,
	[accode] [varchar](255) NULL,
	[acname] [varchar](255) NULL,
	[PSNum] [varchar](255) NULL,
	[location] [varchar](255) NULL,
	[longitude] [varchar](255) NULL,
	[latitude] [varchar](255) NULL,
	[IsOutsideBooth] [bit] NULL,
	[IsPink] [bit] NULL,
	[IsAro] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[BulkSaveCameraStatusType]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[BulkSaveCameraStatusType] AS TABLE(
	[CameraID] [varchar](100) NULL,
	[Status] [varchar](50) NULL,
	[lastupdated] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[SaveCameraStatusType]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[SaveCameraStatusType] AS TABLE(
	[CameraID] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[SaveCameraStatusType_Dummy]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[SaveCameraStatusType_Dummy] AS TABLE(
	[CameraID] [varchar](100) NULL,
	[PublisherID] [varchar](100) NULL,
	[PublisherIP] [varchar](100) NULL,
	[osarch] [varchar](100) NULL,
	[osrelease] [varchar](100) NULL,
	[osplatform] [varchar](100) NULL,
	[cpuname] [varchar](500) NULL,
	[cpucore] [varchar](100) NULL,
	[cpumhz] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[SaveCameraStatusTypeInBytes]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[SaveCameraStatusTypeInBytes] AS TABLE(
	[CameraID] [varchar](100) NULL,
	[InBytes] [bigint] NULL,
	[CreateTime] [bigint] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UDT_SaveRecordingsize]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[UDT_SaveRecordingsize] AS TABLE(
	[DID] [varchar](100) NULL,
	[Date] [date] NULL,
	[Size] [float] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_UploadAssemblyWiseBooth]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[UT_UploadAssemblyWiseBooth] AS TABLE(
	[CameraDID] [varchar](100) NULL,
	[Part_No] [varchar](100) NULL,
	[PSNo] [varchar](100) NULL,
	[Location] [varchar](max) NULL,
	[Operator_Name] [varchar](100) NULL,
	[Operator_Mobile_No] [varchar](100) NULL,
	[Operator_Designation] [varchar](100) NULL,
	[IsOutside_booth] [bit] NULL,
	[IsPink_booth] [bit] NULL,
	[isARO] [bit] NULL,
	[IsAICamera] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_UploadAssemblyWiseoperator]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[UT_UploadAssemblyWiseoperator] AS TABLE(
	[CameraDID] [varchar](100) NULL,
	[Operator_Name] [varchar](100) NULL,
	[Operator_Mobile_No] [varchar](100) NULL,
	[Operator_Designation] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_UploadCameraList]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[UT_UploadCameraList] AS TABLE(
	[CameraDID] [nvarchar](100) NULL,
	[SERVERName] [nvarchar](100) NULL,
	[ProUrl] [nvarchar](100) NULL,
	[IsAI] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_UploadCameraOffline]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[UT_UploadCameraOffline] AS TABLE(
	[District] [nvarchar](100) NULL,
	[Assembly] [nvarchar](100) NULL,
	[PSNum] [nvarchar](100) NULL,
	[Location] [nvarchar](100) NULL,
	[OperatorName] [nvarchar](100) NULL,
	[CameraID] [nvarchar](100) NULL,
	[Date] [nvarchar](100) NULL,
	[StartTime] [nvarchar](100) NULL,
	[EndTime] [nvarchar](100) NULL,
	[Total] [nvarchar](100) NULL,
	[Remarks] [nvarchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_UploadCameraStatus]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[UT_UploadCameraStatus] AS TABLE(
	[District] [nvarchar](100) NULL,
	[Assembly] [nvarchar](100) NULL,
	[PSNum] [nvarchar](100) NULL,
	[Location] [nvarchar](100) NULL,
	[OperatorName] [nvarchar](100) NULL,
	[CameraNo] [nvarchar](100) NULL,
	[Date] [varchar](50) NULL,
	[Total] [varchar](50) NULL,
	[Online] [varchar](50) NULL,
	[OffLine] [varchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_UploadData]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[UT_UploadData] AS TABLE(
	[DistrictCode] [varchar](100) NULL,
	[District] [varchar](100) NULL,
	[AcCode] [varchar](100) NULL,
	[AcName] [varchar](100) NULL,
	[Zone] [varchar](100) NULL,
	[VehicleNo] [varchar](100) NULL,
	[VehicleType] [varchar](100) NULL,
	[DriverName] [varchar](500) NULL,
	[DriverNo] [varchar](100) NULL,
	[FSVName] [varchar](500) NULL,
	[FSVNo] [varchar](100) NULL,
	[GPSDID] [varchar](100) NULL,
	[CameraDID] [varchar](100) NULL,
	[CameraServerName] [varchar](500) NULL,
	[CameraProURL] [varchar](500) NULL,
	[ShiftName] [varchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_UploadInventoryTrn]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[UT_UploadInventoryTrn] AS TABLE(
	[District] [varchar](100) NULL,
	[Assembly] [varchar](100) NULL,
	[Location] [varchar](100) NULL,
	[StreamID] [varchar](100) NULL,
	[OwnerFrom] [varchar](100) NULL,
	[OwnerName] [varchar](100) NULL,
	[OwnerMob] [varchar](100) NULL,
	[AddDate] [varchar](100) NULL,
	[AddTime] [varchar](100) NULL,
	[Status] [varchar](100) NULL,
	[ISConfirm] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_Uploadoperator]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[UT_Uploadoperator] AS TABLE(
	[CameraDID] [varchar](100) NULL,
	[District] [varchar](150) NULL,
	[PSNo] [varchar](100) NULL,
	[Location] [varchar](max) NULL,
	[Operator_Name] [varchar](100) NULL,
	[Operator_Mobile_No] [varchar](100) NULL,
	[Operator_Designation] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_Uploadoperator_1]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[UT_Uploadoperator_1] AS TABLE(
	[CameraDID] [varchar](100) NULL,
	[District] [varchar](150) NULL,
	[AcName] [varchar](150) NULL,
	[PSNo] [varchar](100) NULL,
	[Location] [varchar](max) NULL,
	[Operator_Name] [varchar](100) NULL,
	[Operator_Mobile_No] [varchar](100) NULL,
	[Operator_Designation] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_UploadUserData]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[UT_UploadUserData] AS TABLE(
	[UserName] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[UserType] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[VehicleInstallationType]    Script Date: 7/19/2023 2:59:46 PM ******/
CREATE TYPE [dbo].[VehicleInstallationType] AS TABLE(
	[District] [varchar](255) NULL,
	[Accode] [varchar](255) NULL,
	[VehicleNo] [varchar](255) NULL,
	[VehicleType] [varchar](255) NULL,
	[SchduledDate] [date] NULL,
	[ActualDateOfArrival] [date] NULL,
	[InstallationDate] [date] NULL,
	[status] [tinyint] NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[ModifyDate] [datetime] NULL DEFAULT (getdate()),
	[Zone] [varchar](255) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[GetCurrentShift]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetCurrentShift]()
RETURNS INT  
 AS  
BEGIN  
    DECLARE @ID INT = 0;

	SELECT @ID = [id] FROM [DBO].[vehicleshift] 
	WHERE 
	CONVERT(TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'))
		BETWEEN CONVERT(TIME, starttime) AND CONVERT(TIME, endtime)

	IF (ISNULL(@ID,0) = 0)
	BEGIN
		SELECT @ID = [id] FROM [DBO].[vehicleshift] 
		WHERE 
		starttime > endtime
	END

	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[GETIST]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GETIST]()
RETURNS DATETIME  
 AS  
BEGIN  
    RETURN (SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'))  
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetShift]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetShift](@DateTime DATETIME)
RETURNS INT  
 AS  
BEGIN  
    DECLARE @ID INT = 0;

	SELECT @ID = [id] FROM [DBO].[vehicleshift] 
	WHERE 
	CONVERT(TIME, SWITCHOFFSET(@DateTime, '+05:30'))
		BETWEEN CONVERT(TIME, starttime) AND CONVERT(TIME, endtime)

	IF (ISNULL(@ID,0) = 0)
	BEGIN
		SELECT @ID = [id] FROM [DBO].[vehicleshift] 
		WHERE 
		starttime > endtime
	END

	RETURN @ID
END
GO
/****** Object:  Table [dbo].[AILocationType]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AILocationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LocationType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booth]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booth](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[streamid] [int] NOT NULL,
	[operatorid] [int] NULL,
	[district] [nvarchar](max) NOT NULL,
	[accode] [nvarchar](max) NULL,
	[acname] [nvarchar](max) NOT NULL,
	[PSNum] [nvarchar](50) NOT NULL,
	[location] [nvarchar](max) NOT NULL,
	[boothstateid] [int] NULL,
	[isdisplay] [bit] NULL,
	[updatedBy] [nvarchar](50) NULL,
	[updatedDate] [datetime] NULL,
	[updatedFrom] [nvarchar](50) NOT NULL,
	[longitude] [decimal](12, 9) NOT NULL,
	[latitude] [decimal](12, 9) NOT NULL,
	[bkpstreamid] [nvarchar](max) NULL,
	[selbooth] [bit] NULL,
	[cameralocationtype] [nvarchar](100) NULL,
	[IsPink] [bit] NULL,
	[IsOutsideBooth] [bit] NULL,
	[AddDatetime] [datetime] NULL,
	[addedBy] [varchar](255) NULL,
	[IsAro] [varchar](255) NULL,
	[Trial1] [bit] NULL,
	[Trial2] [bit] NULL,
	[isdelete] [bit] NULL,
	[isupdated] [bit] NULL,
	[AddedFromPage] [varchar](100) NULL,
	[UpdatedFromPage] [varchar](100) NULL,
	[AddedFrom] [varchar](100) NULL,
 CONSTRAINT [PK_booth] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[boothhistory]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[boothhistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[boothid] [int] NOT NULL,
	[streamid] [int] NOT NULL,
	[operatorid] [int] NULL,
	[district] [nvarchar](max) NOT NULL,
	[accode] [nvarchar](max) NULL,
	[acname] [nvarchar](max) NOT NULL,
	[PSNum] [nvarchar](50) NOT NULL,
	[location] [nvarchar](max) NOT NULL,
	[boothstateid] [int] NULL,
	[isdisplay] [bit] NULL,
	[updatedBy] [nvarchar](50) NULL,
	[updatedDate] [datetime] NULL,
	[updatedFrom] [nvarchar](50) NOT NULL,
	[longitude] [decimal](12, 9) NOT NULL,
	[latitude] [decimal](12, 9) NOT NULL,
	[bkpstreamid] [nvarchar](max) NULL,
	[selbooth] [bit] NULL,
	[cameralocationtype] [nvarchar](100) NULL,
	[IsPink] [bit] NULL,
	[IsOutsideBooth] [bit] NULL,
	[AddDatetime] [datetime] NULL,
	[addedBy] [varchar](255) NULL,
	[IsAro] [varchar](255) NULL,
	[Trial1] [bit] NULL,
	[Trial2] [bit] NULL,
	[Action] [varchar](50) NULL,
	[IPAddress] [varchar](50) NULL,
	[isdelete] [bit] NULL,
	[AddedFromPage] [varchar](100) NULL,
	[UpdatedFromPage] [varchar](100) NULL,
	[isupdated] [bit] NULL,
	[AddedFrom] [varchar](100) NULL,
 CONSTRAINT [PK_boothhistory12] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CameraOffline]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CameraOffline](
	[District] [nvarchar](100) NULL,
	[AcName] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CameraOfflineReasonMaster]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CameraOfflineReasonMaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[desc] [varchar](255) NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CameraOfflineStaticRpt]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CameraOfflineStaticRpt](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[District] [varchar](50) NULL,
	[Assembly] [varchar](50) NULL,
	[PsNo] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Operator] [varchar](500) NULL,
	[CameraDID] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[StartTime] [varchar](50) NULL,
	[EndTime] [varchar](50) NULL,
	[Time] [varchar](50) NULL,
	[Remark] [varchar](5000) NULL,
	[ShiftName] [varchar](255) NULL,
 CONSTRAINT [PK_CameraOfflineStaticRpt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CameraStatus]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CameraStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CameraID] [varchar](255) NULL,
	[Status] [varchar](255) NULL,
	[lastupdated] [varchar](255) NULL,
	[ShiftID] [int] NULL,
 CONSTRAINT [PK_CameraStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CameraStatusStaticRpt]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CameraStatusStaticRpt](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[District] [varchar](50) NULL,
	[Assembly] [varchar](50) NULL,
	[PsNo] [varchar](50) NULL,
	[Location] [varchar](500) NULL,
	[OperatorName] [varchar](50) NULL,
	[CameraDID] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Total] [varchar](50) NULL,
	[Online] [varchar](50) NULL,
	[Offline] [varchar](50) NULL,
 CONSTRAINT [PK_CameraStatusStaticRpt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CameraStopDuration]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CameraStopDuration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[streamname] [varchar](50) NULL,
	[OffLineStartTime] [datetime] NULL,
	[OffLineStopTime] [datetime] NULL,
	[ShiftID] [int] NULL,
	[Reason] [varchar](1000) NULL,
	[CreateDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
 CONSTRAINT [PK_CameraStopDuration1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CamSimList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CamSimList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[streamName] [nvarchar](50) NULL,
	[MobileNum] [nvarchar](50) NULL,
 CONSTRAINT [PK_CamSimList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[district]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stateid] [int] NULL,
	[district] [nvarchar](max) NULL,
	[accode] [nvarchar](max) NULL,
	[acname] [nvarchar](max) NULL,
	[isenable] [bit] NULL,
	[isdeleted] [bit] NULL,
 CONSTRAINT [PK_district12] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DistrictManager]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DistrictManager](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[District] [varchar](255) NULL,
	[Manager_Name] [varchar](255) NULL,
	[Manager_Number] [varchar](255) NULL,
	[Added_By] [varchar](100) NULL,
	[whenAdded] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DownloadRecordings]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DownloadRecordings](
	[DID] [nvarchar](255) NULL,
	[DurationInHour] [nvarchar](255) NULL,
	[Link] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[DurationInSeconds] [int] NULL,
	[Duration] [varchar](20) NULL,
	[recordingdate] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[downloads]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[downloads](
	[camera] [nvarchar](50) NOT NULL,
	[size] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[file] [nvarchar](50) NOT NULL,
	[url] [nvarchar](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emails]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](max) NULL,
	[IsActive] [bit] NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_Emails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EVMStop_History]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVMStop_History](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StreamId] [int] NULL,
	[Time] [datetime] NULL,
	[isEVMStop] [bit] NULL,
	[EMStopId] [int] NULL,
 CONSTRAINT [PK_EVMStop_History] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GetVehicleDetailBackup]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GetVehicleDetailBackup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NULL,
	[VehicleId] [int] NULL,
	[ShiftId] [int] NULL,
	[AssignDate] [date] NULL,
	[isdeleted] [bit] NULL,
	[AddedOn] [datetime] NULL,
	[LastEditedOn] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoLive_History]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoLive_History](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StreamId] [int] NULL,
	[OldSFlag] [int] NULL,
	[NewSFlag] [int] NULL,
	[Time] [datetime] NULL,
	[ManupulationId] [int] NULL,
 CONSTRAINT [PK_GoLive_History] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GPSLocationList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPSLocationList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[deviceId] [bigint] NULL,
	[name] [varchar](100) NULL,
	[deviceImei] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[lastUpdate] [datetime] NULL,
	[posId] [bigint] NULL,
	[phone] [varchar](50) NULL,
	[type] [varchar](50) NULL,
	[latitude] [varchar](50) NULL,
	[longitude] [varchar](50) NULL,
	[deviceFixTime] [datetime] NULL,
	[speed] [float] NULL,
	[course] [varchar](50) NULL,
	[ignition] [bit] NULL,
	[totalDistance] [float] NULL,
	[alarm] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[boothid] [int] NULL,
	[VehicleID] [int] NULL,
	[ShiftID] [int] NULL,
	[DriverID] [int] NULL,
	[FSVID] [int] NULL,
	[IsStopped] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GPSStopDuration]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPSStopDuration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[deviceid] [varchar](50) NULL,
	[StartTime] [datetime] NULL,
	[StopTime] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
	[VehicleID] [int] NULL,
	[ShiftID] [int] NULL,
	[DriverID] [int] NULL,
	[FSVID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GPSStopReasons]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPSStopReasons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [datetime] NULL,
	[StopTime] [datetime] NULL,
	[ReasonStartTime] [datetime] NULL,
	[ReasonStopTime] [datetime] NULL,
	[Reason] [varchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[deviceid] [varchar](50) NULL,
	[GPSStopDurationID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncidenceDetails]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncidenceDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DistrictID] [int] NULL,
	[AcCode] [int] NULL,
	[vehicalId] [int] NULL,
	[IncidenceDetails] [varchar](max) NULL,
	[AddedBy] [varchar](255) NULL,
	[LastEditedBy] [varchar](255) NULL,
	[AddedOn] [datetime] NULL,
	[LastEditedOn] [datetime] NULL,
	[isDeleted] [bit] NULL,
	[DriverName] [varchar](300) NULL,
	[DriverContact] [varchar](100) NULL,
	[streamname] [varchar](255) NULL,
	[IncidentDateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryDetails]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Streamid] [nvarchar](100) NULL,
	[Type] [nvarchar](100) NULL,
	[Router] [nvarchar](100) NULL,
	[SdCard] [bit] NULL,
	[Extensionwire] [bit] NULL,
	[SimCardId] [nvarchar](50) NULL,
	[PowerBank] [bit] NULL,
	[Stand] [bit] NULL,
	[AddDateTime] [datetime] NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_InventoryDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryTrn]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryTrn](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[District] [varchar](50) NULL,
	[Assembly] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[StreamID] [varchar](50) NULL,
	[OwnerFrom] [varchar](50) NULL,
	[OwnerName] [varchar](50) NULL,
	[OwnerMob] [varchar](50) NULL,
	[AddDate] [varchar](50) NULL,
	[AddTime] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[ISConfirm] [varchar](50) NULL,
 CONSTRAINT [PK_InventoryTrn] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventoryupdatation]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventoryupdatation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[districtname] [varchar](255) NULL,
	[acname] [varchar](255) NULL,
	[vehicleNo] [varchar](255) NULL,
	[material] [varchar](255) NULL,
	[oldsnno] [varchar](255) NULL,
	[newsnno] [varchar](255) NULL,
	[accode] [varchar](255) NULL,
	[repaired/replaced] [bit] NULL,
	[startdate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[AddedBy] [varchar](255) NULL,
	[LastEditedBy] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[location_info]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[boothid] [int] NOT NULL,
	[longitude] [decimal](12, 9) NULL,
	[latitude] [decimal](12, 9) NULL,
	[distance1] [nvarchar](50) NULL,
	[distance2] [nvarchar](50) NULL,
	[distance3] [nvarchar](50) NULL,
	[UpdateDatetime] [datetime] NULL,
	[gps_did] [nvarchar](50) NULL,
	[VehicleNo] [varchar](50) NULL,
 CONSTRAINT [PK_location_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginUserHistory]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginUserHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [varchar](50) NULL,
	[UserID] [nchar](10) NULL,
	[LoginDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[desc] [varchar](255) NULL,
	[active] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuMaster]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuMaster](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[SubmenuID] [int] NULL,
	[MenuName] [varchar](50) NULL,
	[Url] [nvarchar](100) NULL,
	[UserID] [varchar](255) NULL,
 CONSTRAINT [PK_MenuMaster] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[cameradid] [nvarchar](50) NOT NULL,
	[sendtime] [datetime] NOT NULL,
	[msg] [nvarchar](max) NULL,
	[imgurl] [nvarchar](max) NULL,
	[an_id] [int] NULL,
	[ImgCount] [int] NULL,
 CONSTRAINT [PK_notification4] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfflineColumnName]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfflineColumnName](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ColumnName] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[IsStatusActive] [bit] NULL,
 CONSTRAINT [PK_OfflineColumnName] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnlineOfflineSummary]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineOfflineSummary](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[District] [varchar](100) NULL,
	[Acname] [varchar](100) NULL,
	[Total] [int] NULL,
	[Online] [int] NULL,
	[Offline] [int] NULL,
	[UpdatedTime] [datetime] NULL,
	[Connecectonce] [int] NULL,
 CONSTRAINT [PK_OnlineOfflineSummary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operator_data]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operator_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[operatornumber] [numeric](10, 0) NULL,
	[district] [varchar](max) NULL,
	[acname] [varchar](max) NULL,
	[psnum] [varchar](50) NULL,
	[sdstatus] [bit] NULL,
	[camstatus] [bit] NULL,
	[imgdata] [varbinary](max) NULL,
	[statustime] [datetime] NULL,
	[stateid] [int] NULL,
 CONSTRAINT [PK_operator_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operator_info]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operator_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[operatorName] [nvarchar](100) NULL,
	[operatorNumber] [numeric](10, 0) NULL,
	[operatorAltNumber] [numeric](10, 0) NULL,
	[district] [nvarchar](max) NULL,
	[stateid] [int] NULL,
	[operatorName_alt] [nvarchar](max) NULL,
	[Designation] [nvarchar](100) NULL,
	[streamid] [int] NULL,
	[acname] [varchar](100) NULL,
	[cameraid] [varchar](100) NULL,
	[PSNum] [varchar](100) NULL,
 CONSTRAINT [PK_operator_info1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpertorInfoTemp]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpertorInfoTemp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DID] [varchar](50) NULL,
	[OpertorName] [varchar](50) NULL,
	[MobileNo] [varchar](50) NULL,
 CONSTRAINT [PK_OpertorInfoTemp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reason]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reason](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[desc] [varchar](255) NULL,
	[active] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rtmp_feedList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rtmp_feedList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[rtmpURL] [nvarchar](max) NULL,
 CONSTRAINT [PK_rtmp_feedList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RunTimeDownloadURL]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RunTimeDownloadURL](
	[DID] [nvarchar](20) NULL,
	[Date] [datetime] NULL,
	[FileName] [nvarchar](max) NULL,
	[Size] [nvarchar](100) NULL,
	[URL] [nvarchar](max) NULL,
	[AssignDate] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServerDetails]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Cameraid] [varchar](max) NOT NULL,
	[Inbytes] [decimal](18, 0) NULL,
	[Kbps] [decimal](18, 2) NULL,
	[CreateTime] [numeric](18, 0) NULL,
 CONSTRAINT [PK_ServerDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SizeMaster]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SizeMaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[deviceid] [nvarchar](50) NULL,
	[Size] [float] NULL,
 CONSTRAINT [PK_SizeMaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff_Info]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff_Info](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[contact_no] [varchar](255) NULL,
	[Type] [tinyint] NULL,
	[isdeleted] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statename] [nvarchar](50) NOT NULL,
	[isdisplay] [bit] NULL,
	[stcode] [nvarchar](50) NULL,
	[dashboard] [bit] NULL,
	[mincount] [int] NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StopReasons]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StopReasons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[districtname] [varchar](255) NULL,
	[acname] [varchar](255) NULL,
	[vehicleNo] [varchar](255) NULL,
	[startTime] [datetime] NULL,
	[stopTime] [datetime] NULL,
	[reason] [varchar](max) NULL,
	[addedOn] [datetime] NULL,
	[remark] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[streamlist]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[streamlist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stateID] [int] NULL,
	[prourl] [nvarchar](50) NULL,
	[deviceid] [nvarchar](50) NULL,
	[streamname] [nvarchar](50) NOT NULL,
	[servername] [nvarchar](50) NOT NULL,
	[schoolid] [int] NULL,
	[status] [nvarchar](50) NOT NULL,
	[IsEnable] [bit] NOT NULL,
	[isLive] [bit] NULL,
	[hasalarm] [bit] NOT NULL,
	[lastseen] [datetime] NULL,
	[stop] [bit] NULL,
	[isdownload] [bit] NULL,
	[isvod] [bit] NULL,
	[selected] [bit] NULL,
	[statusFlag] [int] NULL,
	[streamnamebkp] [nvarchar](50) NULL,
	[jionum] [nvarchar](50) NULL,
	[isdeleted] [bit] NULL,
	[AddDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[UpdatedBy] [varchar](100) NULL,
	[AddedFrom] [varchar](100) NULL,
	[UpdatedFrom] [varchar](100) NULL,
	[IsAICamera] [bit] NULL,
	[IMEINo] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[streamstatustest]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[streamstatustest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[streamid] [int] NULL,
	[streamname] [nvarchar](50) NULL,
	[deviceid] [nvarchar](50) NULL,
	[statustime] [datetime] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_streamstatustest24] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UpdatedCameraLog]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpdatedCameraLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoothID] [int] NULL,
	[StreamID] [int] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedFrom] [varchar](50) NULL,
 CONSTRAINT [PK_UpdatedCameraLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[usercode] [nvarchar](max) NULL,
	[identifier] [int] NULL,
	[IsEnable] [bit] NOT NULL,
	[isDvr] [bit] NULL,
	[stateID] [int] NULL,
	[islogin] [bit] NULL,
	[chklogin] [bit] NULL,
	[logincount] [int] NULL,
	[logincountenable] [bit] NULL,
	[AssemblyAccesIds] [varchar](4000) NULL,
	[MenuID] [varchar](500) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicleshift]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicleshift](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[starttime] [varchar](255) NULL,
	[endtime] [varchar](255) NULL,
	[active] [bit] NULL,
	[isdeleted] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zoneInfo]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zoneInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[zoneName] [nvarchar](max) NOT NULL,
	[zoneDistrict] [nvarchar](max) NOT NULL,
	[zoneSchoolname] [nvarchar](max) NULL,
 CONSTRAINT [PK_zoneInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[boothhistory] ADD  CONSTRAINT [DF_boothhistory_streamid12]  DEFAULT ((0)) FOR [streamid]
GO
ALTER TABLE [dbo].[boothhistory] ADD  CONSTRAINT [DF_boothhistory_operatorid12]  DEFAULT ((0)) FOR [operatorid]
GO
ALTER TABLE [dbo].[boothhistory] ADD  CONSTRAINT [DF_boothhistory_isdisplay12]  DEFAULT ((1)) FOR [isdisplay]
GO
ALTER TABLE [dbo].[boothhistory] ADD  CONSTRAINT [DF_boothhistory_longitude12]  DEFAULT ((0.000000000)) FOR [longitude]
GO
ALTER TABLE [dbo].[boothhistory] ADD  CONSTRAINT [DF_boothhistory_latitude12]  DEFAULT ((0.000000000)) FOR [latitude]
GO
ALTER TABLE [dbo].[boothhistory] ADD  CONSTRAINT [DF__boothhistory__selboothhistory__11158940]  DEFAULT ((0)) FOR [selbooth]
GO
ALTER TABLE [dbo].[boothhistory] ADD  CONSTRAINT [DF__boothhist__Trial__4CCC1742]  DEFAULT ((0)) FOR [Trial1]
GO
ALTER TABLE [dbo].[boothhistory] ADD  CONSTRAINT [DF__boothhist__Trial__4DC03B7B]  DEFAULT ((0)) FOR [Trial2]
GO
ALTER TABLE [dbo].[boothhistory] ADD  CONSTRAINT [DF_boothhistory_isdelete]  DEFAULT ((0)) FOR [isdelete]
GO
ALTER TABLE [dbo].[boothhistory] ADD  CONSTRAINT [DF_boothhistory_isupdated]  DEFAULT ((0)) FOR [isupdated]
GO
ALTER TABLE [dbo].[CameraStatus] ADD  DEFAULT ([dbo].[GetCurrentShift]()) FOR [ShiftID]
GO
ALTER TABLE [dbo].[CameraStopDuration] ADD  CONSTRAINT [DF_CameraStopDuration_ShiftID1]  DEFAULT ([dbo].[GetCurrentShift]()) FOR [ShiftID]
GO
ALTER TABLE [dbo].[CameraStopDuration] ADD  CONSTRAINT [DF_CameraStopDuration_CreateDate1]  DEFAULT (switchoffset(getdate(),'+05:30')) FOR [CreateDate]
GO
ALTER TABLE [dbo].[CameraStopDuration] ADD  CONSTRAINT [DF_CameraStopDuration_ModifyDate1]  DEFAULT (switchoffset(getdate(),'+05:30')) FOR [ModifyDate]
GO
ALTER TABLE [dbo].[GPSLocationList] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[GPSStopDuration] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[GPSStopDuration] ADD  DEFAULT (getdate()) FOR [ModifyDate]
GO
ALTER TABLE [dbo].[GPSStopReasons] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[inventoryupdatation] ADD  DEFAULT ('SYSTEM') FOR [AddedBy]
GO
ALTER TABLE [dbo].[inventoryupdatation] ADD  DEFAULT ('SYSTEM') FOR [LastEditedBy]
GO
ALTER TABLE [dbo].[location_info] ADD  CONSTRAINT [DF_location_info_boothid]  DEFAULT ((0)) FOR [boothid]
GO
ALTER TABLE [dbo].[location_info] ADD  CONSTRAINT [DF_location_info_longitude]  DEFAULT ((0.000000000)) FOR [longitude]
GO
ALTER TABLE [dbo].[location_info] ADD  CONSTRAINT [DF_location_info_latitude]  DEFAULT ((0.000000000)) FOR [latitude]
GO
ALTER TABLE [dbo].[LoginUserHistory] ADD  DEFAULT ([dbo].[GETIST]()) FOR [LoginDateTime]
GO
ALTER TABLE [dbo].[operator_data] ADD  CONSTRAINT [DF_operator_data_sdstatus]  DEFAULT ((0)) FOR [sdstatus]
GO
ALTER TABLE [dbo].[operator_data] ADD  CONSTRAINT [DF_operator_data_camstatus]  DEFAULT ((0)) FOR [camstatus]
GO
ALTER TABLE [dbo].[operator_data] ADD  CONSTRAINT [DF_operator_data_statustime]  DEFAULT (getdate()) FOR [statustime]
GO
ALTER TABLE [dbo].[state] ADD  CONSTRAINT [DF_state_isdisplay]  DEFAULT ((1)) FOR [isdisplay]
GO
ALTER TABLE [dbo].[streamstatustest] ADD  CONSTRAINT [DF_streamstatus_statustimetest24]  DEFAULT (getdate()) FOR [statustime]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_identifier]  DEFAULT ((0)) FOR [identifier]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_IsEnable]  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_isDvr]  DEFAULT ((0)) FOR [isDvr]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_stateID]  DEFAULT ((0)) FOR [stateID]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_islogin]  DEFAULT ((0)) FOR [islogin]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_chklogin]  DEFAULT ((0)) FOR [chklogin]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF__users__logincoun__4222D4EF]  DEFAULT ((0)) FOR [logincount]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF__users__logincoun__4316F928]  DEFAULT ((0)) FOR [logincountenable]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_state] FOREIGN KEY([stateID])
REFERENCES [dbo].[state] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_state]
GO
/****** Object:  StoredProcedure [dbo].[AddIncidenceDetail]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddIncidenceDetail]  
@districtName Varchar(255),  
@acName Varchar(255),  
@UserName VARCHAR(255),
@vehicleId int,
@incidenceDetailText varchar(max),
@incidenceid int,
@incidenceDateTime varchar(255)
AS  
 BEGIN  
  DECLARE @acCode VARCHAR(255), @districtId INT, @toDay DATETIME, @driverName varchar(200), @driverContact varchar(200), @streamname VARCHAR(255), @streamId VARCHAR(255);
  
  SET @incidenceDateTime = convert(datetime, @incidenceDateTime, 120)
	    
  SET @toDay = SWITCHOFFSET(GETDATE(), '+05:30');  
  --select  * FROM [dbo].[district] WHERE district = '02-GURDASPUR'  and acname='004-Gurdaspur'  AND isenable = 1 AND isdeleted = 0;  
	SELECT @acCode = accode, @DistrictId = id FROM [dbo].[district] WHERE district = @districtName AND acname = @acName AND isenable = 1 AND isdeleted = 0;  
	--select @driverName=[name], @driverContact=contact_no, @streamId = Streamid from Vehicle_Staff_Mapping v Inner join Staff_Info s on v.StaffId=s.Id where VehicleId=@vehicleId and Type=1
	--		and AssignDate=CONVERT(DATE,  @toDay)
	SELECT @streamname = streamname FROM [dbo].[streamlist] WHERE id = @streamId
  
  if @incidenceid=0 
  begin
	INSERT INTO [dbo].[IncidenceDetails]([DistrictID],[AcCode],[vehicalId],[IncidenceDetails],[AddedBy],[LastEditedBy],[AddedOn],[LastEditedOn],[isDeleted],[DriverName],[DriverContact],[streamname],[IncidentDateTime])
	VALUES(@districtId,@acCode,@vehicleId,@incidenceDetailText,@UserName,@UserName,@toDay,@toDay,0,@driverName,@driverContact, @streamname, @incidenceDateTime)
  end
  else
  begin
	update [IncidenceDetails] set  [DistrictID]=@districtId,[AcCode]= @acCode,[vehicalId]=@vehicleId,[IncidenceDetails]=@incidenceDetailText, [LastEditedBy]= @UserName,
	[LastEditedOn]=@toDay,[DriverName]=@driverName,[DriverContact]=@driverContact, [IncidentDateTime] = @incidenceDateTime
	where id=@incidenceid
  end

end 
GO
/****** Object:  StoredProcedure [dbo].[AddVehicleDetail]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[AddVehicleDetail]
@districtName Varchar(255),
@acName Varchar(255),
@vehicleNo Varchar(255),
@shiftId VARCHAR(255),
@streamId VARCHAR(255),
@vehicleType VARCHAR(255),
@driverId INT,
@staffId INT,
@UserName VARCHAR(255)
AS
	BEGIN
		DECLARE @acCode VARCHAR(255), @districtId INT, @vehicleId INT, @BoothId INT, @toDay DATETIME, @updationId INT;
		
		SET @toDay = SWITCHOFFSET(GETDATE(), '+05:30');

		SELECT @acCode = accode, @DistrictId = id FROM [dbo].[district] WHERE district = @districtName AND acname = @acName AND isenable = 1 AND isdeleted = 0;

		IF	ISNULL(@acCode,'') != '' AND
			ISNULL(@streamId,0) != 0 AND
			ISNULL(@districtId,0) != 0 AND
			ISNULL(@vehicleNo,'') != '' AND
			ISNULL(@vehicleType,'') != '' AND 
			NOT EXISTS (
				SELECT TOP 1 * FROM [dbo].[vehicalDetail] WHERE Accode = @acCode AND Vehicle_No = @vehicleNo 
															AND DistrictId = @districtId AND streamid = @streamId AND VehicleType = @vehicleType
															AND isdeleted = 0
			)
			BEGIN
				INSERT INTO [dbo].[vehicalDetail] (Accode, streamid, DistrictId, Vehicle_No, VehicleType, isdeleted, AddedBy, LastEditedBy)
				VALUES (@acCode, @streamId, @districtId, @vehicleNo, @vehicleType, 0, @UserName, @UserName)
			END

		SELECT @vehicleId = vehicalId FROM [dbo].[vehicalDetail]  
		WHERE Accode = @acCode AND streamid = @streamId AND isdeleted = 0
		AND DistrictId = @districtId AND Vehicle_No = @vehicleNo AND @vehicleType = @vehicleType
		
		IF	ISNULL(@driverId,0) != 0 AND 
			ISNULL(@vehicleId,0) != 0 AND   
			ISNULL(@shiftId,0) != 0 AND 
			ISNULL(@streamId,0) != 0 AND
			NOT EXISTS(
			SELECT TOP 1 * FROM [dbo].[Vehicle_Staff_Mapping] 
			WHERE isdeleted = 0 AND StaffId = @driverId AND VehicleId = VehicleId AND ShiftId = @shiftId AND AssignDate = CONVERT(DATE, @toDay) AND Streamid = @streamId
		)
		BEGIN
			INSERT INTO [dbo].[Vehicle_Staff_Mapping](StaffId,VehicleId,ShiftId,AssignDate,isdeleted,AddedOn,LastEditedOn, Streamid, GpsDeviceId, AddedBy, LastEditedBy)
			VALUES (@driverId, @vehicleId, @shiftId, CONVERT(DATE, @toDay) ,0, @toDay, @toDay, @streamId, NULL, @UserName, @UserName)
		END

		IF	ISNULL(@staffId,0) != 0 AND 
			ISNULL(@vehicleId,0) != 0 AND   
			ISNULL(@shiftId,0) != 0 AND 
			ISNULL(@streamId,0) != 0 AND
			NOT EXISTS(
			SELECT TOP 1 * FROM [dbo].[Vehicle_Staff_Mapping] 
			WHERE isdeleted = 0 AND StaffId = @staffId AND VehicleId = VehicleId AND ShiftId = @shiftId AND AssignDate = CONVERT(DATE, @toDay) AND Streamid = @streamId
		)
		BEGIN
			INSERT INTO [dbo].[Vehicle_Staff_Mapping](StaffId,VehicleId,ShiftId,AssignDate,isdeleted,AddedOn,LastEditedOn, Streamid, GpsDeviceId, AddedBy, LastEditedBy)
			VALUES (@staffId, @vehicleId, @shiftId, CONVERT(DATE, @toDay) ,0, @toDay, @toDay, @streamId, NULL, @UserName, @UserName)
		END
		
		SELECT @BoothId = b.id FROM 
		[DBO].[vehicalDetail] vd
		INNER JOIN [DBO].[booth] b ON b.streamid = vd.streamid
		WHERE vd.Vehicle_No = @vehicleNo AND vd.isdeleted = 0

		
		DECLARE @NeWBoothID INT = 0

		IF	ISNULL(@streamId,0) != 0 AND 
			ISNULL(@districtName,'') != '' AND  
			ISNULL(@acCode,'') != '' AND 
			ISNULL(@acName,'') != '' AND
			ISNULL(@vehicleNo,'') != '' AND
			ISNULL(@UserName,'') != '' AND
			NOT EXISTS(
			SELECT TOP 1 * FROM [dbo].[booth]
			WHERE streamid = @streamId AND district = @districtName AND accode = @acCode AND acname = @acName AND isdisplay = 1
		)
		BEGIN
			INSERT INTO [dbo].[booth] (streamid, operatorid, district, accode, acname, PSNum, [location], boothstateid, isdisplay, updatedBy, updatedDate, updatedFrom, longitude, latitude, bkpstreamid, selbooth)
			VALUES 
			(@streamId, 0, @districtName, @acCode, @acName, 1, @vehicleNo, 1,1,@UserName, @toDay, 'VehicleMaster', 0.000000000, 0.000000000, NULL, 0)

			SET @NeWBoothID = IDENT_CURRENT('booth')
		END
		
		IF	ISNULL(@NeWBoothID,0) != 0 
			BEGIN
				INSERT INTO [dbo].[location_info] (boothid,longitude, latitude, UpdateDatetime, VehicleNo)
				VALUES
				(@NeWBoothID, 0,0, [dbo].GetIST(), @vehicleNo)
			END
		--UPDATE [dbo].[location_info]
		--SET [VehicleNo] = @vehicleNo,
		--boothid = @NeWBoothID
		--WHERE [boothid] = @BoothId

		SELECT @updationId = id FROM [dbo].[inventoryupdatation] WHERE [districtname] = @districtName AND [acname] = @acName AND [vehicleNo] = @vehicleNo AND [material] = 'Vehicle'
													AND [newsnno] = 'Deleted' AND [accode] = @acCode AND [repaired/replaced] = 1 
													AND [startdate] = @toDay AND [enddate] = @toDay AND [AddedBy] = @UserName AND [LastEditedBy] = @UserName

		IF(ISNULL(@updationId,0) = 0)
		BEGIN
			INSERT INTO [dbo].[inventoryupdatation]([districtname], [acname], [vehicleNo], [material], [oldsnno], [newsnno], [accode], [repaired/replaced], [startdate], [enddate], [AddedBy], [LastEditedBy]) --1
			VALUES (@districtName, @acName, @vehicleNo, 'Vehicle', 'Added', @vehicleId, @acCode, 1, @toDay, @toDay,@UserName, @UserName)
		END
		ELSE
		BEGIN
			UPDATE [dbo].[inventoryupdatation] SET [newsnno] = @vehicleId WHERE id = @updationId
		END
	END
GO
/****** Object:  StoredProcedure [dbo].[Assemblywise_bulkBooth_Deleete]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec Assemblywise_bulkBooth_Deleete 'DemoDistrict','DemoAssembly','',''

CREATE Procedure [dbo].[Assemblywise_bulkBooth_Deleete]
(
 @District nvarchar(100)  =''
 ,@AcName nvarchar(100)  =''
 ,@UserName  nvarchar(500)  =''
 ,@IPAddress varchar(50) =''
)
AS
BEGIN
Declare  @Msg varchar(200) = ''
--Exec Getbulkdeletehistory 'DELETE',@District,@AcName

UPDATE booth
	SET
		isdelete = 1,
		updatedDate = [dbo].[GETIST](),
		updatedBy = @UserName,
		updatedFrom = 'BULKDELETE',
		UpdatedFromPage='BoothMaster.aspx'
	WHERE district=@District and acname=@AcName

	UPDATE boothhistory
	SET
		isdelete = 1,
		updatedDate=[dbo].[GETIST](),
		updatedBy = @UserName,
		updatedFrom = 'BULKDELETE',
		UpdatedFromPage='BoothMaster.aspx'
	WHERE district=@District and acname=@AcName AND isnull(isdelete,0)=0

	INSERT INTO boothhistory(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,
	longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,updatedDate,updatedBy,updatedFrom,
	Action,boothid,isdelete,IPAddress,UpdatedFromPage,AddedFrom,AddedFromPage)
	SELECT streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,
		longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,
		[dbo].[GETIST](),@UserName,'BULKDELETE',
		'DELETE',id,1,@IPAddress,'BoothMaster.aspx','BULKDELETE','BoothMaster.aspx'
	FROM booth where district=@District and acname=@AcName AND isdelete=1 and AddedFrom='BULKDELETE'

	SET @Msg='Booth Deleted Successfully!!'
			Select @Msg as msg
END
GO
/****** Object:  StoredProcedure [dbo].[BackupRequiredTables]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BackupRequiredTables]
AS
BEGIN
	DECLARE @TableSuffix VARCHAR(50) = '', @SQL NVARCHAR(MAX) = ''
	SET @TableSuffix = REPLACE(CONVERT(VARCHAR, [dbo].[GETIST](), 111),'/','') + '_' + FORMAT(DATEPART(HOUR,[dbo].[GETIST]()),'00')

	SET @SQL = N'
	SELECT * INTO booth_' + @TableSuffix + ' FROM booth WITH (NOLOCK)
	SELECT * INTO streamlist_' + @TableSuffix + ' FROM streamlist WITH (NOLOCK)
	SELECT * INTO CameraStopDuration_' + @TableSuffix + ' FROM CameraStopDuration WITH (NOLOCK)
	SELECT * INTO operator_info_' + @TableSuffix + ' FROM operator_info WITH (NOLOCK)
	SELECT * INTO users_' + @TableSuffix + ' FROM users WITH (NOLOCK)
	'
	EXEC (@SQL)
END
GO
/****** Object:  StoredProcedure [dbo].[BulkInsertCamera]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BulkInsertCamera]  
(  
@tblData as UT_UploadCameraList Readonly,  
@UserName varchar(100),
@UpdatedFrom varchar(50)
)  
AS  
BEGIN  
Create Table #Temp  
(  
id INT IDENTITY(1,1) PRIMARY KEY,  
CameraID varchar(100),  
ServerName varchar(100),  
Prourl varchar(100), 
IsAI bit,  
streamid INT default(0),  
ErrorMessage VARCHAR(MAX) default(''),  
)  
  
Insert into #Temp(CameraID,ServerName,Prourl,IsAI) Select CameraDID,SERVERName,ProUrl,IsAI from @tblData  
  
  
 UPDATE T  
 SET streamid = s.id  
 FROM #Temp T  
 INNER JOIN streamlist s ON s.deviceid = T.CameraID AND T.streamid = 0  
  
 UPDATE T  
 SET ErrorMessage = 'CameraDID exists In StreamList'  
 FROM #Temp T  
 WHERE T.streamid <> 0  
  
 UPDATE T  
 SET ErrorMessage = 'CameraDID Not found in Server'  
 FROM #Temp T  
 WHERE T.Prourl = 'NA' OR T.ServerName='NA'  
  
   
 Insert Into streamlist ( stateID,prourl,deviceid,streamname,servername,schoolid,status,IsEnable,isLive,hasalarm,lastseen,stop,isdownload  
       ,isvod,selected,statusFlag,isdeleted,AddDate,UpdateDate,AddedBy,AddedFrom,IsAICamera)  
        Select 1,Prourl,CameraID,CameraID,ServerName,9999,'STOPPED',1,0,0,'1970-01-01 00:00:00.000',0,0,  
        0,0,0,0,[dbo].[GETIST](),[dbo].[GETIST](),@UserName,@UpdatedFrom,0  
           from #Temp where ISNULL(ErrorMessage,'') = ''  
  
 Update S set S.prourl=T.Prourl,S.servername=T.ServerName,S.IsAICamera=T.IsAI,S.UpdatedBy=@UserName,S.UpdatedFrom=@UpdatedFrom,   
 UpdateDate=[dbo].[GETIST]() From streamlist S  
 INNER JOIN #Temp T ON S.deviceid=T.CameraID  where T.ErrorMessage<>''  
  
 Select CameraID,Prourl,ServerName,IsAI,ErrorMessage from #Temp WHERE ISNULL(ErrorMessage,'') = 'CameraDID Not found in Server'   
  
END  
GO
/****** Object:  StoredProcedure [dbo].[BulkSaveCameraStatusByID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BulkSaveCameraStatusByID]
(
	@BulkSave AS dbo.BulkSaveCameraStatusType READONLY
)
AS
BEGIN
	INSERT INTO CameraStatus(CameraID, Status,lastupdated)
	SELECT CameraID, Status, lastupdated FROM @BulkSave

	UPDATE streamlist
	SET
		status=b.Status,
		lastseen= b.lastupdated,
		isLive = CASE WHEN b.Status = 'RUNNING' THEN 1 ELSE 0 END
	FROM streamlist sl
	INNER JOIN @BulkSave b ON b.CameraID = sl.deviceid
	WHERE sl.isEnable = 1
END
GO
/****** Object:  StoredProcedure [dbo].[BulkUserInsert]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BulkUserInsert]  
(  
 @tbl [dbo].[UT_UploadUserData] READONLY    
)  
AS  
BEGIN  
CREATE TABLE #TempTable   
 (    
  id INT  
  ,UserName VARCHAR(100)    
  ,Password VARCHAR(100)    
  ,UserType VARCHAR(100)  
  ,ErrorMessage VARCHAR(MAX) default(''),   
 )   
  
 INSERT INTO #TempTable(id,UserName,Password,UserType)    
 SELECT 0,UserName,Password,UserType FROM @tbl  
   
 UPDATE T      
 SET id = u.id      
 FROM #TempTable T      
 INNER JOIN users u ON u.username = T.UserName  AND u.usercode=T.UserType  
  
 UPDATE T      
 SET ErrorMessage = 'User exists In UserList'      
 FROM #TempTable T      
 WHERE T.id <> 0    

   
 INSERT INTO users(UserName,Password,usercode,identifier,IsEnable,isDvr,  
 stateID,islogin,chklogin,logincount, logincountenable,AssemblyAccesIds )   
 SELECT UserName,Password,UserType,1,1,0,1,0,0,0,0,'' FROM #TempTable  
 where ISNULL(ErrorMessage,'') = ''   
  
  Update u set u.username=T.username,u.Password=T.Password,u.usercode=T.UserType  
  From users u     
 INNER JOIN #TempTable T ON u.username = T.UserName  AND u.usercode=T.UserType  
 where T.ErrorMessage<>''  
 Declare @msg varchar(200)  
 Set @msg='User List Uploaded Successfully!!!'  
 Select @msg as Msg  
  
END
GO
/****** Object:  StoredProcedure [dbo].[CameraNotification]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[CameraNotification]
(
@camid nvarchar(50)='',
@senddate datetime,
@msg nvarchar(MAX)='',
@imgurl nvarchar(MAX)='',
@an_id int,
@imgcount int
)
AS
BEGIN 
declare @update datetime =NULL
Select   @update=cast(CONVERT(VARCHAR(16),sendtime, 120) as datetime) from  notification where cameradid=@camid
and cast(CONVERT(VARCHAR(16),sendtime, 120) as datetime)=cast(CONVERT(VARCHAR(16), [dbo].[GETIST](), 120) as datetime)   
IF(@update is null)
BEGIN
INSERT INTO notification(cameradid,sendtime,msg,imgurl,an_id,ImgCount) VALUES(@camid,@senddate,@msg,@imgurl,@an_id,@imgcount)
END
END
GO
/****** Object:  StoredProcedure [dbo].[CameraStatusStaticSP]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Drop PROCEDURE [dbo].[CameraStatusStaticSP]  
--truncate table CameraStatusStaticRpt
CREATE PROCEDURE [dbo].[CameraStatusStaticSP]  
@tblData AS dbo.UT_UploadCameraStatus READONLY  
AS  
BEGIN  
 Declare @msg varchar(200)  
 CREATE TABLE #Temp  
 (  
  District varchar(100),  
  acname varchar(100),  
  psnum varchar(max),  
  VehicleNo varchar(100),  
  DriverName varchar(100),  
  streamname varchar(100),  
  Dt varchar(50),
  Total varchar(50),
  Online varchar(50),
  OffLine varchar(50)
 )  
   insert into #Temp  
   SELECT District,Assembly,PSNum,Location,OperatorName,CameraNo,Date,Total,Online,OffLine FROM @tblData  
  
   Delete from CameraStatusStaticRpt where Date=(Select distinct Dt from #Temp)  
  
   INSERT INTO CameraStatusStaticRpt (District,Assembly,PsNo,Location,OperatorName,CameraDID,Date,Total,Online,Offline)  
   SELECT District,Assembly,PSNum,Location,OperatorName,CameraNo,Date,Total,Online,OffLine FROM @tblData  
  
   Set @msg='Camera Status Report Uploaded Successfully!!'  
   Select  @msg as Msg  
 --  Select  District as District,acname  as acname,PSNum as PSNum,VehicleNo as VehicleNo,  
 --           DriverName as DriverName,streamname as streamname,Dt as Dt, CONVERT(VARCHAR(5),CONVERT(DATETIME, Total, 0), 108) as Total,  
 --CONVERT(VARCHAR(5),CONVERT(DATETIME, Online, 0), 108) as Online,  CONVERT(VARCHAR(5),CONVERT(DATETIME, Offline, 0), 108) as Offline from #Temp  
  Select  District as District,acname  as acname,PSNum as PSNum,VehicleNo as VehicleNo,  
            DriverName as DriverName,streamname as streamname,Dt as Dt, Total,  
Online,Offline from #Temp  
  
END
GO
/****** Object:  StoredProcedure [dbo].[CheckCameraDIDExists]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckCameraDIDExists]
(
	@tbl [dbo].[SaveCameraStatusType] READONLY
)
AS
BEGIN
	IF OBJECT_ID('tempdb..#tmpStreamList') IS NOT NULL DROP TABLE #tmpStreamList
	CREATE TABLE #tmpStreamList
	(
		CameraID varchar(50)
	)

	INSERT INTO #tmpStreamList(CameraID)
	SELECT CameraID FROM @tbl

	SELECT CameraID FROM #tmpStreamList
	WHERE CameraID NOT IN (SELECT deviceid FROM streamlist WHERE ISNULL(isdeleted,0) = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[Create_CameraStatus]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Create_CameraStatus]        
AS            
BEGIN            
 DECLARE @TableName VARCHAR(50) = ''            
            
 SET @TableName = 'CameraStatus_' + REPLACE(CONVERT(VARCHAR, [dbo].[GETIST](), 111),'/','') + '_' + FORMAT(DATEPART(HOUR,[dbo].[GETIST]()),'00')            
 DECLARE @tblSQL VARCHAR(MAX) = N'            
 IF NOT EXISTS(SELECT name FROM sys.tables WHERE name='''+@TableName+''' AND type=''U'')            
 BEGIN            
   CREATE TABLE [dbo].['+@TableName+'](        
 [id] [int] IDENTITY(1,1) NOT NULL,        
 [CameraID] [varchar](255) NULL,
 [InBytes] bigint NULL,
 [CreateTime] bigint NULL,
 [Status] [varchar](255) NULL,        
 [lastupdated] DATETIME NULL,        
 [ShiftID] [int] NULL,        
 CONSTRAINT [PK_' + @TableName + '] PRIMARY KEY CLUSTERED         
 (        
  [id] ASC        
 )WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]        
 ) ON [PRIMARY]            
            
 END          
         
 '            
 --print @tblSQL    
 EXEC (@tblSQL)            
END
GO
/****** Object:  StoredProcedure [dbo].[Create_CameraStatus_Hr]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Create_CameraStatus_Hr]  
AS  
BEGIN  
 DECLARE @TableName VARCHAR(50) = ''  
  
 SET @TableName = 'CameraStatus_Hr_' + REPLACE(CONVERT(VARCHAR, [dbo].[GETIST](), 111),'/','')  
 DECLARE @tblSQL VARCHAR(MAX) = N'  
 IF NOT EXISTS(SELECT name FROM sys.tables WHERE name='''+@TableName+''' AND type=''U'')  
 BEGIN  
  CREATE TABLE [dbo].['+@TableName+'](  
   [id] [int] IDENTITY(1,1) NOT NULL,  
   [streamname] [nvarchar](50) NULL,  
   [remarks] [nvarchar](max) NULL,  
   [T_0] [int] NULL DEFAULT ((0)),  
   [T_1] [int] NULL DEFAULT ((0)),  
   [T_2] [int] NULL DEFAULT ((0)),  
   [T_3] [int] NULL DEFAULT ((0)),  
   [T_4] [int] NULL DEFAULT ((0)),  
   [T_5] [int] NULL DEFAULT ((0)),  
   [T_6] [int] NULL DEFAULT ((0)),  
   [T_7] [int] NULL DEFAULT ((0)),  
   [T_8] [int] NULL DEFAULT ((0)),  
   [T_9] [int] NULL DEFAULT ((0)),  
   [T_10] [int] NULL DEFAULT ((0)),  
   [T_11] [int] NULL DEFAULT ((0)),  
   [T_12] [int] NULL DEFAULT ((0)),  
   [T_13] [int] NULL DEFAULT ((0)),  
   [T_14] [int] NULL DEFAULT ((0)),  
   [T_15] [int] NULL DEFAULT ((0)),  
   [T_16] [int] NULL DEFAULT ((0)),  
   [T_17] [int] NULL DEFAULT ((0)),  
   [T_18] [int] NULL DEFAULT ((0)),  
   [T_19] [int] NULL DEFAULT ((0)),  
   [T_20] [int] NULL DEFAULT ((0)),  
   [T_21] [int] NULL DEFAULT ((0)),  
   [T_22] [int] NULL DEFAULT ((0)),  
   [T_23] [int] NULL DEFAULT ((0)),  
    CONSTRAINT [PK_' + @TableName + '] PRIMARY KEY CLUSTERED   
   (  
    [id] ASC  
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
  )  
  
  INSERT INTO ['+@TableName+']([streamname])  
  SELECT DISTINCT deviceid from streamlist  
 END
 ELSE
 BEGIN
	INSERT INTO ['+@TableName+']([streamname])  
	SELECT DISTINCT deviceid from streamlist sl
	LEFT JOIN ['+@TableName+'] tbl ON tbl.streamname = sl.deviceid
	WHERE tbl.streamname IS NULL
 END
 '  
 EXEC (@tblSQL)  
END
GO
/****** Object:  StoredProcedure [dbo].[CreateNewFakeStreamName]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateNewFakeStreamName]
AS
BEGIN
	DECLARE @cnt INT = 0,@DID VARCHAR(50)
	SELECT @cnt = COUNT(*) FROM streamlist WHERE deviceid LIKE 'AMBI-%-CIBMA'

	SET @DID = 'AMBI-' + FORMAT((@cnt + 1), '000000') + '-CIBMA'
	
	INSERT INTO streamlist (deviceid,streamname,prourl,servername)
	VALUES (@DID,@DID,'fake.ambicam.com:9999','fake.vmukti.com')

	SELECT SCOPE_IDENTITY() AS streamID

END
GO
/****** Object:  StoredProcedure [dbo].[CreateUserBYR]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Select * from users
Create PROCEDURE [dbo].[CreateUserBYR]

AS
BEGIN
  	CREATE TABLE #upUser
	(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[usercode] [nvarchar](max) NULL,
	[identifier] [int] NULL,
	[IsEnable] [bit]  NULL,
	[isDvr] [bit] NULL,
	[stateID] [int] NULL,
	[islogin] [bit] NULL,
	[chklogin] [bit] NULL,
	[logincount] [int] NULL,
	[logincountenable] [bit] NULL,
	[AssemblyAccesIds] [varchar](4000) NULL,
	[MenuID] [varchar](500) NULL,
	district nvarchar(max),
	acname nvarchar(max),
	Errormessage nvarchar(max) NULL,
	Successmessage nvarchar(max) NULL,
	rn INT
	)

	DECLARE @statename varchar(50) = (select lower(statename) from state where id=1);
	DECLARE @statecode varchar(50) = (select lower(stcode) from state where id=1);
	DECLARE @CEO varchar(50) = CONCAT(@statename,'ceo');
	DECLARE @ECI varchar(50) = CONCAT(@statename,'eci');
	DECLARE @VMukti_Internal varchar(50) = 'VmuktiInternal';
	DECLARE @VMukti_Internal2 varchar(50) = CONCAT('vmukti',@statename);
	DECLARE @all_access_id nvarchar(max) = (
	SELECT STUFF((
		SELECT ',' + CAST(id AS VARCHAR)
		FROM district as d where isdeleted=0
		
		FOR XML PATH ('')
	), 1, 1, '') 
)



		INSERT INTO #upUser (district,usercode)  SELECT distinct(district),'District_Level' from district where isdeleted=0

		update 	up set username =LOWER(REPLACE(TRANSLATE(district,'1234567890-()[]\ ','                 '),' ' ,'')),

		 password = LOWER(CONCAT(REPLACE(TRANSLATE(district,'1234567890-()[]\ ','                 '),' ' ,''),'@', lower(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',(abs(checksum(newid())) % 26)+1, 1)), lower(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',(abs(checksum(newid())) % 26)+1, 1)) , ABS(CHECKSUM(NEWID())) % 99999)),
		 identifier = 1,IsEnable = 1,isDvr =1,stateID=1,islogin=0,chklogin=1,logincount=0,logincountenable=0,
		 AssemblyAccesIds = (
SELECT STUFF((
		SELECT ',' + CAST(id AS VARCHAR)
		FROM district as d
		WHERE district = up.district
		FOR XML PATH ('')
	), 1, 1, '') 
)

	from #upUser as up
		where usercode='District_Level'
	




		INSERT INTO #upUser (acname,usercode) 
		SELECT distinct(acname),'Assembly_Level' from district where isdeleted=0


				update 	up set username =LOWER(REPLACE(TRANSLATE(acname,'1234567890-()[]\ ','                 '),' ' ,'')),
		
		 password = LOWER(CONCAT(REPLACE(TRANSLATE(acname,'1234567890-()[]\ ','                 '),' ' ,''),'@', lower(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',(abs(checksum(newid())) % 26)+1, 1)), lower(substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',(abs(checksum(newid())) % 26)+1, 1)) , ABS(CHECKSUM(NEWID())) % 99999)),
		 identifier = 1,IsEnable = 1,isDvr =1,stateID=1,islogin=0,chklogin=1,logincount=0,logincountenable=0,
		 AssemblyAccesIds = (
SELECT STUFF((
		SELECT ',' + CAST(id AS VARCHAR)
		FROM district as d
		WHERE acname = up.acname
		FOR XML PATH ('')
	), 1, 1, '') 
)

	from #upUser as up
		where usercode='Assembly_Level'
	

	INSERT INTO #upUser (username,password,usercode,AssemblyAccesIds, identifier ,IsEnable ,isDvr ,stateID,islogin,chklogin,logincount,logincountenable) values 
	(@CEO,LOWER(CONCAT(@CEO,'@',@statecode, ABS(CHECKSUM(NEWID())) % 99999)),'CEO',@all_access_id,1,1,1,1,0,1,0,0),
	(@ECI,LOWER(CONCAT(@ECI,'@',@statecode, ABS(CHECKSUM(NEWID())) % 99999)),'ECI',@all_access_id,1,1,1,1,0,1,0,0),
	(@VMukti_Internal,LOWER(CONCAT(@statename,'@',@statecode, ABS(CHECKSUM(NEWID())) % 99999)),'VMukti_Internal',@all_access_id,1,1,1,1,0,1,0,0),
	(@VMukti_Internal2,LOWER(CONCAT(@statename,'@',@statecode, ABS(CHECKSUM(NEWID())) % 99999)),'VMukti_Internal',@all_access_id,1,1,1,1,0,1,0,0)

	UPDATE ud
	SET Errormessage='This user already exist!!!'
	FROM #upUser ud
	INNER JOIN users as u on u.username = ud.username
	


	INSERT INTO users (username
,password
,usercode
,identifier
,IsEnable
,isDvr
,stateID
,islogin
,chklogin
,logincount
,logincountenable
,AssemblyAccesIds
,MenuID
)
SELECT  upt.username
,upt.password
,upt.usercode
,upt.identifier
,upt.IsEnable
,upt.isDvr
,upt.stateID
,upt.islogin
,upt.chklogin
,upt.logincount
,upt.logincountenable
,upt.AssemblyAccesIds
,upt.MenuID
FROM #upUser as upt
WHERE upt.Errormessage is NULL;



UPDATE ud
	SET Successmessage='This user successfully added !!!'
	FROM #upUser as ud
	where  ud.Errormessage is NULL


	select username,password,usercode,Errormessage,Successmessage  
	from #upUser WHERE ISNULL(Errormessage,'') != ''



END


GO
/****** Object:  StoredProcedure [dbo].[DeleteBoothByID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBoothByID]
(
	@ID INT = 0,
	@UserName varchar(500),
	@IPAddress varchar(50)
)
AS
BEGIN
Declare  @Msg varchar(200) = ''
	UPDATE booth
	SET
		isdelete = 1,
		updatedDate = [dbo].[GETIST](),
		updatedBy = @UserName,
		updatedFrom='Delete Booth',
		UpdatedFromPage = 'BoothMaster.aspx'
	WHERE id = @ID

	UPDATE boothhistory
	SET
		isdelete = 1,
		updatedDate=[dbo].[GETIST](),
		updatedBy = @UserName,
		updatedFrom='Delete Booth',
		UpdatedFromPage = 'BoothMaster.aspx'
	WHERE boothid = @ID AND isnull(isdelete,0)=0

	INSERT INTO boothhistory(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,
	longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,updatedDate,updatedBy,
	UpdatedFromPage,updatedFrom,Action,boothid,isdelete,IPAddress)
	SELECT streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,
		longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,
		[dbo].[GETIST](),@UserName,'BoothMaster.aspx','Delete Booth','DELETE',id,1,@IPAddress
	FROM booth where id = @ID

	SET @Msg='Booth Deleted Successfully!!'
			Select @Msg as msg
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteIncidenceDetail]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteIncidenceDetail]  
@IncidenceID int,  
@UserName varchar(255)  
AS  
 BEGIN  
 Declare @toDay DATETIME
  
  SET @toDay = CONVERT(DATE, SWITCHOFFSET(GETDATE(), '+05:30'));  
  
  UPDATE [dbo].[IncidenceDetails] SET [isdeleted] = 1,  [LastEditedBy] = @UserName  , [LastEditedOn]=CONVERT(DATE, SWITCHOFFSET(GETDATE(), '+05:30'))
  WHERE  id = @IncidenceID  

 END
GO
/****** Object:  StoredProcedure [dbo].[DeleteStreamByID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStreamByID]  
(  
 @ID INT = 0,
 @UserName varchar(100)
)  
AS  
BEGIN  
Declare  @Msg varchar(200) = ''  
 UPDATE streamlist  
 SET  
  isdeleted = 1 ,
  UpdateDate=[dbo].[GETIST](),
  UpdatedBy=@UserName,
  UpdatedFrom='StreamlistMaster.aspx'
    
 WHERE id = @ID  
  
   
 SET @Msg='Stream  Deleted Successfully!!'  
   Select @Msg as msg  
END  
GO
/****** Object:  StoredProcedure [dbo].[DeleteVehicleDetail]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[DeleteVehicleDetail]
@vehicleNo VARCHAR(255),
@ShiftName VARCHAR(255),
@UserName varchar(255)
AS
	BEGIN
		DECLARE @vehicleId int, @ShiftId int, @districtId INT,@acCode INT, @districtName VARCHAR(255), @acName VARCHAR(255), @toDay DATETIME, @boothId INT;

		SET @toDay = SWITCHOFFSET(GETDATE(), '+05:30');
		SELECT @vehicleId = vehicalId, @districtId = DistrictId FROM [dbo].[vehicalDetail] WHERE Vehicle_No = @vehicleNo AND isdeleted = 0
		SELECT @districtName = district, @acName = acname FROM [DBO].[district] WHERE id = @districtId
		SELECT @ShiftId = id FROM [dbo].[vehicleshift] WHERE [name] = @ShiftName 
		
		SELECT @BoothId = b.id FROM 
		[DBO].[vehicalDetail] vd
		INNER JOIN [DBO].[booth] b ON b.streamid = vd.streamid
		WHERE vd.Vehicle_No = @vehicleNo AND vd.isdeleted = 0

		INSERT INTO [dbo].[inventoryupdatation]([districtname], [acname], [vehicleNo], [material], [oldsnno], [newsnno], [accode], [repaired/replaced], [startdate], [enddate], [AddedBy], [LastEditedBy]) --1
		VALUES (@districtName, @acName, @vehicleNo, 'Vehicle', @vehicleId, 'DELETED', @acCode, 1, @toDay, @toDay,@UserName, @UserName)

		UPDATE [dbo].[vehicalDetail]
		SET [isdeleted] = 1,
			[LastEditedBy] = @UserName
		WHERE
			[vehicalId] = @vehicleId

		UPDATE [dbo].[Vehicle_Staff_Mapping] 
		SET [isdeleted] = 1 ,
			[LastEditedBy] = @UserName,
			[LastEditedOn] = @toDay
		WHERE 
			[ShiftId] = @ShiftId AND
			[VehicleId] = @vehicleId AND
			[AssignDate] = CONVERT(DATE, SWITCHOFFSET(GETDATE(), '+05:30'))

		UPDATE [dbo].[location_info]
		SET 
		[VehicleNo] = NULL,
		[UpdateDatetime] = @toDay
		WHERE [boothid] = @boothId

		UPDATE [dbo].[booth] 
		SET 
		isdisplay = 0,
		updatedBy = @UserName,
		updatedDate = @toDay,
		updatedFrom = 'Vehicle Master'
		WHERE id = @boothId

	END
GO
/****** Object:  StoredProcedure [dbo].[DeleteVehicleInstallationByID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteVehicleInstallationByID]
(
	@ID INT
)
AS
BEGIN
	DELETE FROM VehicleInstallation WHERE Id = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[FetchCSDWithNull]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchCSDWithNull]
AS
BEGIN
	SELECT
		 [streamname]
		,[OffLineStartTime]
	  FROM [CameraStopDuration]
	  WHERE [OffLineStopTime] is null  
END
GO
/****** Object:  StoredProcedure [dbo].[gaugechartdistrictwise]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[gaugechartdistrictwise]
AS 
BEGIN
Select district,COUNT(s.id) as Total,COUNT(CASE WHEN Status = 'RUNNING'  then 1 ELSE NULL END) as 'Online',  
(count(DISTINCT b.id)-COUNT(CASE WHEN Status = 'RUNNING'  then 1 ELSE NULL END)) as 'Offline'
from booth b
inner join streamlist s on b.streamid=s.id
where ISNULL(b.isdelete,'')=0 
group by district
order by district 
END

--Select * from users 
GO
/****** Object:  StoredProcedure [dbo].[GetActiveStreamList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetActiveStreamList]
AS
BEGIN
	SELECT
		servername,
		streamname,
		status
	FROM streamlist
	WHERE IsEnable = 1
	ORDER BY deviceid
END
GO
/****** Object:  StoredProcedure [dbo].[GetAIBoothListNew]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAIBoothListNew]                    
(                    
 @district varchar(100)='',                    
 @assembly varchar(100)='',                  
 @status varchar(50)='',              
 @isPink int = -1  ,                
 @isARO int = -1  ,                
 @booth varchar(511) = '',              
 @streamname varchar(255) = '',              
 @OrderBY varchar(255) = 'status'              
)                    
                  
AS                    
BEGIN              
 IF @OrderBY = 'dist' --OR @OrderBY = 'status'              
 BEGIN              
  SELECT *,ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b                    
   inner join streamlist s on b.streamid = s.id AND IsAICamera=1                   
   --inner join operator_info oi on b.operatorid = oi.id                    
   INNER JOIN operator_info op on b.operatorid = op.id                    
   inner join district d on d.district = b.district and d.acname = b.acname                
  where b.isdisplay = 1 AND s.IsEnable = 1 and ISNULL(isdelete,'')=0  
AND ((@district='') OR (b.district = @district))                    
   AND ((@assembly='') OR (b.acname = @assembly))                   
   AND ((@status='') OR (status = @status))                    
   --AND ((@isPink = -1) OR (b.IsPink = @isPink))              
   AND ((@booth = '') OR (b.location = @booth))              
   --AND ((@isARO = -1) OR (b.IsAro = @isARO))              
   AND ((@streamname = '') OR (s.streamname like '%' + LTRIM(RTRIM(@streamname)) + '%'))     
    and ISNULL(isdelete, '')=0   
  ORDER BY s.statusFlag desc,s.lastseen,s.status, b.district, b.acname, b.location, b.cameralocationtype              
 END              
 ELSE              
 BEGIN              
  SELECT *,ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b                    
   inner join streamlist s on b.streamid = s.id   AND IsAICamera=1                      
   --inner join operator_info oi on b.operatorid = oi.id                    
   INNER JOIN operator_info op on b.operatorid = op.id                    
   inner join district d on d.district = b.district and d.acname = b.acname                
  where b.isdisplay = 1 AND s.IsEnable = 1 and ISNULL(isdelete,'')=0  
  
   AND ((@district='') OR (b.district = @district))                    
   AND ((@assembly='') OR (b.acname = @assembly))                   
   AND ((@status='') OR (status = @status))                    
   --AND ((@isPink = -1) OR (b.IsPink = @isPink))                  
   AND ((@booth = '') OR (b.location = @booth))                  
   --AND ((@isARO = -1) OR (b.IsAro = @isARO))                  
   AND ((@streamname = '') OR (s.streamname like '%' + LTRIM(RTRIM(@streamname)) + '%'))       
     
  ORDER BY s.statusFlag desc,s.lastseen,s.status,b.district, b.acname, b.location, b.cameralocationtype desc      
 END              
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCamaraDIDForMaster]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCamaraDIDForMaster]
(
	@vehicleNo varchar(100)
)
AS
BEGIN
	SELECT DISTINCT id,[streamname] FROM [dbo].[streamlist] s
	WHERE s.IsEnable = 1 and s.isdeleted=0
	EXCEPT
	SELECT DISTINCT s.id,s.[streamname] FROM streamlist s
	INNER JOIN vehicalDetail v on v.streamid = s.id and v.isdeleted = 0
	UNION ALL
	SELECT DISTINCT s.id,s.[streamname] FROM streamlist s
	INNER JOIN vehicalDetail v on v.streamid = s.id and v.isdeleted = 0
	AND v.Vehicle_No = @vehicleNo and s.isdeleted=0
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllDriverStaffForMaster]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllDriverStaffForMaster]
(
	@vehicleNo varchar(100) = ''
)
AS
BEGIN
	SELECT [Id], [name], [contact_no] FROM [dbo].[Staff_Info]
	WHERE [isdeleted] = 0 AND [Type] = 1
	EXCEPT
	SELECT DISTINCT si.[Id], si.[name], si.[contact_no] FROM [dbo].[Staff_Info] si
	INNER JOIN Vehicle_Staff_Mapping vsm on vsm.StaffId = si.Id
	WHERE si.[isdeleted] = 0 AND si.[Type] = 1
	UNION
	SELECT DISTINCT si.[Id], si.[name], si.[contact_no] FROM [dbo].[Staff_Info] si
	INNER JOIN Vehicle_Staff_Mapping vsm on vsm.StaffId = si.Id
	INNER JOIN vehicalDetail v ON v.vehicalId = vsm.VehicleId
	WHERE si.[isdeleted] = 0 AND si.[Type] = 1
	AND v.Vehicle_No = @vehicleNo
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllFLVStaffForMaster]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllFLVStaffForMaster]
(
	@vehicleNo varchar(100) = ''
)
AS
BEGIN
	SELECT [Id], [name], [contact_no] FROM [dbo].[Staff_Info]
	WHERE [isdeleted] = 0 AND [Type] = 2
	EXCEPT
	SELECT DISTINCT si.[Id], si.[name], si.[contact_no] FROM [dbo].[Staff_Info] si
	INNER JOIN Vehicle_Staff_Mapping vsm on vsm.StaffId = si.Id
	WHERE si.[isdeleted] = 0 AND si.[Type] = 2
	UNION
	SELECT DISTINCT si.[Id], si.[name], si.[contact_no] FROM [dbo].[Staff_Info] si
	INNER JOIN Vehicle_Staff_Mapping vsm on vsm.StaffId = si.Id
	INNER JOIN vehicalDetail v ON v.vehicalId = vsm.VehicleId
	WHERE si.[isdeleted] = 0 AND si.[Type] = 2
	AND v.Vehicle_No = @vehicleNo
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllLiveCount]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllLiveCount]  
(    
 @lastseen datetime, -- one hour ago    
 @lastseendefault datetime, -- ten hour ago    
 @UserID INT = 0,    
 @cameratype varchar(255) = '',    
 @Ispink int = -1    
)    
AS      
BEGIN      
 DECLARE @AssemblyAccessIDs VARCHAR(MAX) = ''    
 SELECT TOP 1 @AssemblyAccessIDs = AssemblyAccesIds FROM Users WHERE id = @UserID    
 --SELECT * FROM (  
 select      
 COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',    
 MAX(b.district) as district,    
 b.district as DATA,    
 Cast(COUNT(b.acname) as nvarchar(MAX)) as ac,    
 Cast(COUNT(b.acname) as nvarchar(MAX)) as acname,    
 COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) then 1 ELSE NULL END) as 'Live',    
 --COUNT(CASE WHEN lastseen >= @lastseendefault OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive',    
 COUNT(CASE WHEN lastseen >= @lastseendefault OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive',    
 (count(DISTINCT b.id)-COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) then 1 ELSE NULL END)) as 'stop',    
 count(DISTINCT b.id) as TotalBooth,
 (count(DISTINCT b.id) /2) as TotalCheckPost      
 --distinct*      
 from booth b      
 inner join streamlist s on b.streamid=s.id      
 inner join district d on d.district = b.district and d.acname = b.acname    
 where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=1 and ISNULL(b.isdelete,'')=0       
 AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))    
 AND (@cameratype = '' OR @cameratype = b.cameralocationtype)    
 AND (@Ispink = -1 OR @Ispink =b.IsPink)  and ISNULL(isdelete,'')=0  
  
 group by b.district  
 --UNION  
 --select      
 --COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',    
 --'24-DEFAULT' as district,    
 --'24-DEFAULT' as DATA,    
 --Cast(COUNT('000-DEFAULT Assembly') as nvarchar(MAX)) as ac,    
 --Cast(COUNT('000-DEFAULT Assembly') as nvarchar(MAX)) as acname,    
 --COUNT(s.id) as 'Live',    
 --COUNT(s.id) as 'lastLive',    
 --(0) as 'stop',    
 --count(s.id) as TotalBooth    
 ----distinct*      
 --from streamlist s  
 --LEFT JOIN booth b on b.streamid = s.id  
 --WHERE b.id is null and s.status = 'RUNNING' AND ISNULL(s.isdeleted,0)=0  
 --group by district  
 --) tbl  
 --ORDER BY district  
  
END  
GO
/****** Object:  StoredProcedure [dbo].[GetAllLiveCount_04042023]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --exec GetAllLiveCount_04042023 '4/4/2023 12:52:40 PM','4/4/2023 12:52:40 PM',2,'',-1
CREATE PROCEDURE [dbo].[GetAllLiveCount_04042023]  
(    
 @lastseen datetime, -- one hour ago    
 @lastseendefault datetime, -- ten hour ago    
 @UserID INT = 0,    
 @cameratype varchar(255) = '',    
 @Ispink int = -1    
)    
AS      
BEGIN      
 DECLARE @AssemblyAccessIDs VARCHAR(MAX) = ''    
 SELECT TOP 1 @AssemblyAccessIDs = AssemblyAccesIds FROM Users WHERE id = @UserID    
 SELECT  
    b.district,
	b.district AS district,
    'Total' as acname,
    (COUNT(DISTINCT b.id) / 2) as 'Total CheckPost',
    COUNT(DISTINCT b.id) as 'Total Camera',
    COUNT(CASE WHEN lastseen >= @lastseen OR statusFlag=2 THEN 1 ELSE NULL END) as 'Last One Hour',
    COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) THEN 1 ELSE NULL END) as 'Online', 
	CAST((COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) THEN 1 ELSE NULL END)*100.00)/COUNT(DISTINCT b.id) AS DECIMAL(10,2)) AS 'Online %',
   (COUNT(DISTINCT b.id) - COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) THEN 1 ELSE NULL END)) as 'Offline',    
	CAST(((COUNT(DISTINCT b.id) - COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) THEN 1 ELSE NULL END))*100.00)/COUNT(DISTINCT b.id) AS DECIMAL(10,2)) AS 'Offline %'
FROM booth b      
INNER JOIN streamlist s ON b.streamid = s.id      
INNER JOIN district d ON d.district = b.district AND d.acname = b.acname 
AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))   
GROUP BY b.district WITH ROLLUP 
UNION 
SELECT
b.district,
     CASE WHEN b.acname = 'Total' THEN b.district ELSE '' END AS district,
    b.acname,  
    (COUNT(DISTINCT b.id) / 2) as 'Total CheckPost',
    COUNT(DISTINCT b.id) as 'Total Camera',
    COUNT(CASE WHEN lastseen >= @lastseen OR statusFlag=2 THEN 1 ELSE NULL END) as 'Last One Hour',
    COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) THEN 1 ELSE NULL END) as 'Online',  
	CAST((COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) THEN 1 ELSE NULL END)*100.00)/COUNT(DISTINCT b.id) AS DECIMAL(10,2)) AS 'Online %',
    (COUNT(DISTINCT b.id) - COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) THEN 1 ELSE NULL END)) as 'Offline',  
CAST(((COUNT(DISTINCT b.id) - COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) THEN 1 ELSE NULL END))*100.00)/COUNT(DISTINCT b.id) AS DECIMAL(10,2)) AS 'Offline %'
FROM booth b      
INNER JOIN streamlist s ON b.streamid = s.id      
INNER JOIN district d ON d.district = b.district AND d.acname = b.acname 
 where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=1 and ISNULL(b.isdelete,'')=0       
 AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))    
 AND (@cameratype = '' OR @cameratype = b.cameralocationtype)    
 AND (@Ispink = -1 OR @Ispink =b.IsPink)  and ISNULL(isdelete,'')=0  
GROUP BY b.district, b.acname WITH ROLLUP

HAVING b.acname IS NOT NULL
order by b.district,[Total CheckPost] desc


DECLARE @datetime DATETIME = [dbo].[GETIST]();
DECLARE @fileName NVARCHAR(50); 
SET @fileName = 'Dashboard_' + CONVERT(NVARCHAR(50), @datetime, 105) + ' ' + CONVERT(NVARCHAR(50), @datetime, 108) + ' ' + RIGHT(CONVERT(NVARCHAR(50), @datetime, 109), 2);

SELECT @fileName as filename;
 
END   
GO
/****** Object:  StoredProcedure [dbo].[GetAllLiveCountDetails]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllLiveCountDetails] 
(
	@lastseen datetime,
	@lastseendefault datetime,
	@district varchar(100) = '',
	@UserID INT = 0,
	@cameratype varchar(255) = '',
	@Ispink int = -1
)
AS  
BEGIN  
DECLARE @AssemblyAccessIDs VARCHAR(MAX) = ''
	SELECT TOP 1 @AssemblyAccessIDs = AssemblyAccesIds FROM Users WHERE id = @UserID
 select  
 COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',
 MAX(b.acname) as district,
 b.acname as DATA,
 @cameratype as cameratype,
 Cast(COUNT(b.acname) as nvarchar(MAX)) as ac, 
 Cast(COUNT(b.acname) as nvarchar(MAX)) as acname, 
 COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) then 1 ELSE NULL END) as 'Live',
 COUNT(CASE WHEN lastseen >= @lastseendefault OR statusFlag=2 then 1 ELSE NULL END) as 'lastLive',
 (count(DISTINCT b.id)-COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) then 1 ELSE NULL END)) as 'stop',
 count(DISTINCT b.PSNum) as Total,
 count(DISTINCT b.id) as TotalBooth,
 (count(DISTINCT b.id) /2) as TotalCheckPost   
 --distinct*  
 from booth b  
 inner join streamlist s on b.streamid=s.id  
 inner join district d on d.district = b.district and d.acname = b.acname
 --inner join vehicalDetail vd on vd.streamid = s.id AND vd.isdeleted=0  
 --inner join Vehicle_Staff_Mapping vsm on vsm.VehicleId = vd.vehicalId AND vsm.isdeleted=0  
 --AND vsm.AssignDate = CAST([dbo].[GETIST]() AS DATE)  
 --INNER JOIN Staff_Info si on si.Id = vsm.StaffId AND si.Type=1  
 --inner join vehicleshift vs on vs.id = vsm.ShiftId AND vs.id = [dbo].[GetCurrentShift]()  
 where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=1  and ISNULL(b.isdelete,'')=0 
AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))
 AND ((@district = '') OR (b.district = @district))
 AND (@cameratype = '' OR @cameratype =b.cameralocationtype)
 AND (@Ispink = -1 OR @Ispink =b.IsPink)  and ISNULL(isdelete,'')=0

 group by b.acname  
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllPinkAssemblyByStateIdAndDistirict]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPinkAssemblyByStateIdAndDistirict]
(
@stateid int,
@district varchar(255)
)
AS
BEGIN
	SELECT DISTINCT
	b.acname 
	FROM [dbo].[district] d
	INNER JOIN [DBO].[booth] b ON d.district = b.district WHERE b.IsPink = 1 AND b.district = @district
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllPinkDistrictByStateId]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPinkDistrictByStateId]
(
@stateid int
)
AS
BEGIN
	SELECT DISTINCT
	d.district 
	FROM [dbo].[district] d
	INNER JOIN [DBO].[booth] b ON d.district = b.district WHERE b.IsPink = 1
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllPinkSchoolByStateIdAndaccode]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPinkSchoolByStateIdAndaccode]
(
@stateid int,
@acname varchar(255)
)
AS
BEGIN
	SELECT DISTINCT
	b.location 
	FROM [DBO].[booth] b WHERE b.IsPink = 1 AND b.acname = @acname
END
GO
/****** Object:  StoredProcedure [dbo].[GetAnalyticsNotification]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec GetAnalyticsNotification '','','2023-07-19 00:00:00.000','2023-07-19 11:51:21.000 ','','',0
CREATE procedure [dbo].[GetAnalyticsNotification] --'','','',''  
(  
    @district varchar(50)='',  
    @assembly varchar(50)='',  
 @dt datetime,  
 @todt datetime,
 @DID varchar(20)='',  
 @ImageURL varchar(50)='',  
 @Type int=0
  
)  
AS  
BEGIN  
 DECLARE @searchdate date  
 IF (@dt = '')  
 BEGIN  
  SET @searchdate = CAST([dbo].GETIST() AS DATE)  
 END  
 ELSE  
 BEGIN  
  SET @searchdate = convert(date, @dt, 103)  
 END  
 Select   district,acname,location,streamname,cameradid as cameradid, sendtime as sendtime,msg as msg,(LTRIM(imgurl)) as imgurl,n.ImgCount, location  from notification n  
 INNER JOIN streamlist  ON streamlist.deviceid =n.cameradid  
 INNER JOIN booth b ON b.streamid =streamlist.id   
 WHERE ((@DID = '') OR (n.cameradid like '%' + @DID + '%'))   
 AND  ((@district='') OR (b.district = @district))    
    AND ((@assembly='') OR (b.acname = @assembly))  
 AND ((@Type=0) OR (n.an_id = @Type))  
 and (n.sendtime BETWEEN @dt AND @todt)
 or(@dt='' and @todt='') 
 ORDER BY sendtime DESC  

END  

--Select  
-- district,acname,location,streamname,cameradid as cameradid, sendtime as sendtime,msg as msg,(LTRIM(imgurl)) as imgurl,n.ImgCount from notification n  
-- INNER JOIN streamlist  ON streamlist.deviceid =n.cameradid  
-- INNER JOIN booth b ON b.streamid =streamlist.id    
-- ORDER BY sendtime DESC 
GO
/****** Object:  StoredProcedure [dbo].[GetAssemblyWiseGoGreenList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAssemblyWiseGoGreenList]
(
    @district varchar(100) = '',
	@acname varchar(100) = '',
	@Status VARCHAR(50) = ''
)
AS
BEGIN
    select
        b.district,
        b.acname,
        count(distinct b.location) AS locationCount,
        count(sl.id) AS Total,
        SUM(CASE WHEN sl.status='RUNNING' THEN 1 ELSE 0 END) AS Online,
        SUM(CASE WHEN sl.status='RUNNING' AND statusFlag=2 THEN 1 ELSE 0 END) AS ManualOnline,
        SUM(CASE WHEN sl.status='STOPPED' THEN 1 ELSE 0 END) AS Offline,
        SUM(CASE WHEN sl.status='RUNNING' AND statusFlag=1 THEN 1 ELSE 0 END) AS ManualOffline
    from streamlist sl
	INNER JOIN booth b ON b.streamid = sl.id
    INNER JOIN district d on d.district = b.district AND d.acname = b.acname
	WHERE ISNULL(sl.isdeleted,0)=0 AND b.isdisplay=1 --AND ISNULL(isLive,0) = 0
	AND ((@district = '') OR (b.district = @district))
	AND ((@acname = '') OR (b.acname = @acname))
	AND ((@Status = '') OR (@Status = 'BOTH') OR (sl.status = @Status))
	and  ISNULL(b.isdelete,0)=0
    GROUP BY b.district, b.acname
	ORDER BY b.district,b.acname
END
GO
/****** Object:  StoredProcedure [dbo].[GetAssemblyWiseLocation]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAssemblyWiseLocation] --'DemoDistrict','DemoAssembly','','stremid'
(
	@district varchar(200),
	@assembly varchar(200),
	@boothID int=NULL,
	@flag char(20)
)
AS
BEGIN
if(@flag='Location')
BEGIN
	SELECT DISTINCT id, PSNum + ' - ' + location AS location
	FROM booth WHERE district = @district AND acname = @assembly AND isdisplay = 1 AND ISNULL(isdelete,'')=0
	ORDER BY location
END
if(@flag='stremid')
BEGIN
		select b.streamid as streamid,s.deviceid as CameraName  from booth b
		Inner Join streamlist s ON s.id=b.streamid
		WHERE district = @district AND acname = @assembly AND isdisplay = 1 and b.id=@boothID
END
END
GO
/****** Object:  StoredProcedure [dbo].[GetAssemblyWiseLocationType]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	 PROCEDURE [dbo].[GetAssemblyWiseLocationType] --'DemoDistrict','DemoAssembly','','stremid'
(
	--@district varchar(200),
	--@assembly varchar(200),
---	@boothID int=NULL,
@Location nvarchar(500), 
@flag varchar(200),
@flag2 varchar(200)

)
AS
BEGIN
if(@flag='2')
BEGIN
select b.location from booth b inner join streamlist s on b.streamid=s.id where statusflag in(@flag,@flag2) and b.location=@Location
END
ELSE
BEGIN
select b.location from booth b inner join streamlist s on b.streamid=s.id where statusflag=@flag and b.location=@Location

END
END
GO
/****** Object:  StoredProcedure [dbo].[GetAssemblyWizeTotleVehicalData]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetAssemblyWizeTotleVehicalData]
AS
BEGIN

	DECLARE @oneHourBeforeTime DATETIME;

	SET @oneHourBeforeTime = DATEADD(minute, -60, [DBO].[GETIST]())

	SELECT 
	[id] AS StreamId,
	[streamname] AS Streamname, 
	[status] AS Status,
	[lastseen] AS LastSeen,
	[statusFlag] AS StatusFlag
	INTO #StreamStatus
	FROM [DBO].[streamlist]
	WHERE [IsEnable] = 1 AND [isdeleted] = 0
 	

	SELECT
		gps.[Streamname],
		gps.[StreamId],
		gps.[status] AS Status,
		gps.[lastseen] AS LastSeen,
		gps.[statusFlag] AS StatusFlag,
		d.[district] AS district, --DISTRICT,
		d.[acname] AS acname,
		d.[accode],
		d.id AS DISETRICTID
		INTO #VEHICAL_DATA_AC_WISE
	FROM #StreamStatus gps
	INNER JOIN [DBO].[booth] b ON gps.StreamId = b.[streamid] AND b.isdisplay = 1 AND  b.IsAro = 1
	INNER JOIN [DBO].[district] d ON b.[district] = d.[district] AND b.[acname] = d.acname
	
	SELECT *,(TBL.INSTALLED - TBL.ONLINE) AS OFFLINE
	FROM
	(
		SELECT
			v.DISETRICTID,
			SUM(CASE WHEN v.Status = 'RUNNING' AND (v.LastSeen >= @oneHourBeforeTime OR v.StatusFlag=2) THEN 1 ELSE 0 END) AS ONLINE,
			COUNT(1) AS INSTALLED,
			v.district,
			v.acname
		FROM #VEHICAL_DATA_AC_WISE v
		GROUP BY v.DISTRICT, v.acname, v.DISETRICTID, v.accode
	) AS TBL
END
GO
/****** Object:  StoredProcedure [dbo].[GETBoothData]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETBoothData]
(
	@district varchar(255) = '',
	@accode varchar(255) = '',
	@psno varchar(255) = '',
	@type varchar(255) = '',
	@isPink int = -1
)
AS
BEGIN
	SELECT
	s.[prourl],
	s.[streamname],
	s.[servername],
	b.[district],
	b.[acname],
	b.[PSNum],
	b.[location],
	b.[cameralocationtype],
	b.[IsPink],
	op.[operatorName],
	op.[operatorNumber],
	op.[Designation]
	FROM
		[dbo].[booth] b 
		INNER JOIN [dbo].[streamlist] s on s.[id] = b.[id] AND s.[isdeleted] = 0 AND b.isdisplay = 1
		INNER JOIN [dbo].[operator_info] op ON b.operatorid = op.id
	WHERE
		(@district = '' OR b.district = @district) AND
		(@accode = '' OR b.accode = @accode) AND
		(@psno = '' OR b.PSNum = @psno) AND
		(@type = '' OR b.IsPink = @type) AND
		(@isPink = -1 OR b.IsPink = @isPink)
END
GO
/****** Object:  StoredProcedure [dbo].[GetBoothList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec GetBoothList '','','',''

CREATE PROCEDURE [dbo].[GetBoothList]
(
	@district varchar(200)='',
	@acname varchar(200)='',
	@search varchar(200)='',
	@cameratype varchar(200)=''
)
AS
BEGIN
	SELECT
	b.isdelete,
		b.id
		,b.streamid
		,b.operatorid
		,b.district
		,b.accode
		,b.acname
		,b.PSNum
		,b.location
		,b.boothstateid
		,b.isdisplay
		,b.updatedBy
		,b.updatedDate
		,b.updatedFrom
		,b.longitude
		,b.latitude
		,b.bkpstreamid
		,b.selbooth
		,b.cameralocationtype
		,b.IsPink
		,b.IsOutsideBooth
		,b.AddDatetime
		,b.addedBy
		,b.IsAro
		,b.Trial1
		,b.Trial2
		,s.deviceid
		,s.prourl
		,s.servername
		,s.streamname,
		S.status
		,ISNULL(o.operatorName,'') AS operatorName
		,ISNULL(o.operatorNumber,0) AS operatorNumber
		,ISNULL(o.Designation,'') AS Designation
		,ISNULL(o.operatorAltNumber,0) AS operatorAltNumber
	FROM booth b WITH (NOLOCK)
	INNER JOIN streamlist s WITH (NOLOCK) ON s.id = b.streamid
	LEFT JOIN operator_info o WITH (NOLOCK) ON o.id = b.operatorid
	WHERE  ISNULL(isdelete, '')=0     AND 
		((@district = '') OR (b.district = @district))
		and ((@acname = '') OR (b.acname = @acname))
		and ((@search = '') OR (b.PSNum like '%' + @search + '%')
			OR (b.location like '%' + @search + '%') OR (s.deviceid like '%' + @search + '%')
			OR (o.operatorName like '%' + @search + '%') OR (o.operatorNumber like '%' + @search + '%')
			OR (o.Designation like '%' + @search + '%'))
			
		AND ((@cameratype = '') OR (b.cameralocationtype = @cameratype))
		
	ORDER BY b.district, b.acname, b.PSNum, b.location

END
GO
/****** Object:  StoredProcedure [dbo].[GetBoothListByID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBoothListByID]
(
	@ID INT = 0
)
AS
BEGIN
	SELECT
		b.id
		,b.streamid
		,b.operatorid
		,b.district
		,b.accode
		,b.acname
		,b.PSNum
		,b.location
		,b.boothstateid
		,b.isdisplay
		,b.updatedBy
		,b.updatedDate
		,b.updatedFrom
		,b.longitude
		,b.latitude
		,b.bkpstreamid
		,b.selbooth
		,b.cameralocationtype
		,b.IsPink
		,b.IsOutsideBooth
		,b.AddDatetime
		,b.addedBy
		,b.IsAro
		,b.Trial1
		,b.Trial2
		,s.deviceid
		,s.prourl
		,s.servername
		,s.streamname
		,ISNULL(o.operatorName,'') AS operatorName
		,ISNULL(o.operatorNumber,0) AS operatorNumber
		,ISNULL(o.Designation,'') AS Designation
	FROM booth b WITH (NOLOCK)
	INNER JOIN streamlist s WITH (NOLOCK) ON s.id = b.streamid
	LEFT JOIN operator_info o WITH (NOLOCK) ON o.id = b.operatorid
	WHERE
		b.id = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetBoothListNew]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBoothListNew] --'','','',-1,-1,'','',''               
(                    
 @district varchar(100)='',                    
 @assembly varchar(100)='',                  
 @status varchar(50)='',              
 @isPink int = -1  ,                
 @isARO int = -1  ,                
 @booth varchar(511) = '',              
 @streamname varchar(255) = '',   
 
 @OrderBY varchar(255) = 'status'  
)                    
                  
AS                    
BEGIN              
 IF @OrderBY = 'dist' --OR @OrderBY = 'status'              
 BEGIN              
  SELECT *,FORMAT((SD.Kbps/(SD.CreateTime/10000.00)),'N2') as kbpsp,  
  ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b                    
   inner join streamlist s on b.streamid = s.id                    
   --inner join operator_info oi on b.operatorid = oi.id                    
   INNER JOIN operator_info op on b.operatorid = op.id                    
   inner join district d on d.district = b.district and d.acname = b.acname     
   LEFT join ServerDetails SD ON SD.Cameraid=s.deviceid   
  where b.isdisplay = 1 AND s.IsEnable = 1 and ISNULL(isdelete,'')=0  
AND ((@district='') OR (b.district = @district))                    
   AND ((@assembly='') OR (b.acname = @assembly))                   
   AND ((@status='') OR (status = @status))                    
   --AND ((@isPink = -1) OR (b.IsPink = @isPink))              
   AND ((@booth = '') OR (b.location = @booth))              
   --AND ((@isARO = -1) OR (b.IsAro = @isARO))              
   AND ((@streamname = '') OR (s.streamname like '%' + LTRIM(RTRIM(@streamname)) + '%'))     
   
    and ISNULL(isdelete, '')=0   
  ORDER BY s.statusFlag desc,s.lastseen,s.status, b.district, b.acname, b.location, b.cameralocationtype,s.deviceid              
 END              
 ELSE              
 BEGIN              
  SELECT *,FORMAT((SD.Kbps/(SD.CreateTime/10000.00)),'N2') as kbpsp,  
  ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b                    
   inner join streamlist s on b.streamid = s.id                    
   --inner join operator_info oi on b.operatorid = oi.id                    
   INNER JOIN operator_info op on b.operatorid = op.id                    
   inner join district d on d.district = b.district and d.acname = b.acname   
   Left join ServerDetails SD ON SD.Cameraid=s.deviceid   
  where b.isdisplay = 1 AND s.IsEnable = 1 and ISNULL(b.isdelete,'')=0  
  
   AND ((@district='') OR (b.district = @district))                    
   AND ((@assembly='') OR (b.acname = @assembly))                   
   AND ((@status='') OR (status = @status))                    
   --AND ((@isPink = -1) OR (b.IsPink = @isPink))                  
   AND ((@booth = '') OR (b.location = @booth))                  
   --AND ((@isARO = -1) OR (b.IsAro = @isARO))                  
   AND ((@streamname = '') OR (s.deviceid like '%' + LTRIM(RTRIM(@streamname)) + '%'))   
   
     
     
  ORDER BY s.statusFlag desc,s.lastseen,s.status,b.district, b.acname, b.location, b.cameralocationtype ,s.deviceid desc      
 END              
END  
GO
/****** Object:  StoredProcedure [dbo].[GetBoothListNew_2]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBoothListNew_2] --'','','',-1,-1,'','',''               
(                    
 @district varchar(100)='',                    
 @assembly varchar(100)='',                  
 @status varchar(50)='',              
 @isPink int = -1  ,                
 @isARO int = -1  ,                
 @booth varchar(511) = '',              
 @streamname varchar(255) = '',   
 @psnum varchar(255)='',

 @OrderBY varchar(255) = 'status'  
)                    
                  
AS                    
BEGIN              
 IF @OrderBY = 'dist' --OR @OrderBY = 'status'              
 BEGIN              
  SELECT *,FORMAT((SD.Kbps/(SD.CreateTime/10000.00)),'N2') as kbpsp,  
  ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b                    
   inner join streamlist s on b.streamid = s.id                    
   --inner join operator_info oi on b.operatorid = oi.id                    
   INNER JOIN operator_info op on b.operatorid = op.id                    
   inner join district d on d.district = b.district and d.acname = b.acname     
   LEFT join ServerDetails SD ON SD.Cameraid=s.deviceid   
  where b.isdisplay = 1 AND s.IsEnable = 1 and ISNULL(isdelete,'')=0  
AND ((@district='') OR (b.district = @district))                    
   AND ((@assembly='') OR (b.acname = @assembly))                   
   AND ((@status='') OR (status = @status))                    
   --AND ((@isPink = -1) OR (b.IsPink = @isPink))              
   AND ((@booth = '') OR (b.location = @booth))              
   --AND ((@isARO = -1) OR (b.IsAro = @isARO))              
   AND ((@streamname = '') OR (s.deviceid like '%' + LTRIM(RTRIM(@streamname)) + '%'))     
    OR ((@psnum = '') OR (b.PSNum = @psnum))
    and ISNULL(isdelete, '')=0   
  ORDER BY s.statusFlag desc,s.lastseen,s.status, b.district, b.acname, b.location, b.cameralocationtype,s.deviceid              
 END              
 ELSE              
 BEGIN              
  SELECT *,FORMAT((SD.Kbps/(SD.CreateTime/10000.00)),'N2') as kbpsp,  
  ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b                    
   inner join streamlist s on b.streamid = s.id                    
   --inner join operator_info oi on b.operatorid = oi.id                    
   INNER JOIN operator_info op on b.operatorid = op.id                    
   inner join district d on d.district = b.district and d.acname = b.acname   
   Left join ServerDetails SD ON SD.Cameraid=s.deviceid   
  where b.isdisplay = 1 AND s.IsEnable = 1 and ISNULL(b.isdelete,'')=0  
  
   AND ((@district='') OR (b.district = @district))                    
   AND ((@assembly='') OR (b.acname = @assembly))                   
   AND ((@status='') OR (status = @status))                    
   --AND ((@isPink = -1) OR (b.IsPink = @isPink))                  
   AND ((@booth = '') OR (b.location = @booth))                  
   --AND ((@isARO = -1) OR (b.IsAro = @isARO))                  
   AND ((@streamname = '') OR (s.deviceid like '%' + LTRIM(RTRIM(@streamname)) + '%'))   
    OR ((@psnum = '') OR (b.PSNum = @psnum))
     and ISNULL(isdelete, '')=0   
     
  ORDER BY s.statusFlag desc,s.lastseen,s.status,b.district, b.acname, b.location, b.cameralocationtype ,s.deviceid desc      
 END              
END  
GO
/****** Object:  StoredProcedure [dbo].[GetBoothListNew_download]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec GetBoothListNew_download '','','',-1,-1,'','','status','23/06/2022'    
CREATE PROCEDURE [dbo].[GetBoothListNew_download]                    
(                    
 @district varchar(100)='',                    
 @assembly varchar(100)='',                  
 @status varchar(50)='',              
 @isPink int = -1  ,                
 @isARO int = -1  ,                
 @booth varchar(511) = '',              
 @streamname varchar(255) = '',              
 @OrderBY varchar(255) = 'status',    
 @date varchar(30)    
)                    
                  
AS                    
BEGIN              
 IF @OrderBY = 'dist' --OR @OrderBY = 'status'              
 BEGIN              
  SELECT IsNull(v.Size,'') as Size,ISNULL(v.Duration,'') AS Duration ,ISNULL(V.Link,'')AS Link ,b.*,s.*,op.*,ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b                                      
   inner join streamlist s on b.streamid = s.id                    
   --inner join operator_info oi on b.operatorid = oi.id                    
   INNER JOIN operator_info op on b.operatorid = op.id                    
   inner join district d on d.district = b.district and d.acname = b.acname        
    left join DownloadRecordings v on v.DID=s.deviceid AND v.recordingdate = @date    
  where b.isdisplay = 1 AND s.IsEnable = 1  and  s.isdeleted=0               
   AND ((@district='') OR (b.district = @district))                    
   AND ((@assembly='') OR (b.acname = @assembly))                   
   AND ((@status='') OR (status = @status))                    
   --AND ((@isPink = -1) OR (b.IsPink = @isPink))              
   AND ((@booth = '') OR (b.location = @booth))              
   --AND ((@isARO = -1) OR (b.IsAro = @isARO))              
   AND ((@streamname = '') OR (s.streamname like '%' + LTRIM(RTRIM(@streamname)) + '%'))      
   --AND v.date = @date    
  ORDER BY s.status,s.statusFlag desc, b.district, b.acname, b.location, b.cameralocationtype              
 END              
 ELSE              
 BEGIN              
  SELECT IsNull(v.Size,'') as Size,ISNULL(v.Duration,'') AS Duration ,ISNULL(V.Link,'')AS Link ,b.*,s.*,op.*,ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b                    
   inner join streamlist s on b.streamid = s.id                    
   --inner join operator_info oi on b.operatorid = oi.id                    
   INNER JOIN operator_info op on b.operatorid = op.id                    
   inner join district d on d.district = b.district and d.acname = b.acname     
  LEFT join DownloadRecordings v on v.DID=s.deviceid AND v.recordingdate = @date   
     
  where b.isdisplay = 1 AND s.IsEnable = 1                    
   AND ((@district='') OR (b.district = @district))                    
   AND ((@assembly='') OR (b.acname = @assembly))                   
   AND ((@status='') OR (status = @status))                    
   --AND ((@isPink = -1) OR (b.IsPink = @isPink))                  
   AND ((@booth = '') OR (b.location = @booth))                  
   --AND ((@isARO = -1) OR (b.IsAro = @isARO))                  
   AND ((@streamname = '') OR (s.streamname like '%' + LTRIM(RTRIM(@streamname)) + '%'))       
        
  ORDER BY b.district, b.acname, b.location, b.cameralocationtype,s.status,s.statusFlag desc      
 END              
END
GO
/****** Object:  StoredProcedure [dbo].[GetBoothListNew_Indoor]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GetBoothListNew_Indoor]              
(              
 @district varchar(100)='',              
 @assembly varchar(100)='',            
 @status varchar(50)='',        
 @isPink int = -1  ,    
 @isOutdoor int = -1  ,  
 @isARO int = -1  ,          
 @booth varchar(511) = '',        
 @streamname varchar(255) = '',        
 @OrderBY varchar(255) = 'status'        
)              
            
AS              
BEGIN        
 IF @OrderBY = 'dist' --OR @OrderBY = 'status'        
 BEGIN        
  SELECT *,ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b              
   inner join streamlist s on b.streamid = s.id              
   --inner join operator_info oi on b.operatorid = oi.id              
   INNER JOIN operator_info op on b.operatorid = op.id              
   inner join district d on d.district = b.district and d.acname = b.acname          
  where b.isdisplay = 1 AND s.IsEnable = 1              
   AND ((@district='') OR (b.district = @district))              
   AND ((@assembly='') OR (b.acname = @assembly))             
   AND ((@status='') OR (status = @status))              
   AND ((@isPink = -1) OR (b.IsPink = @isPink))  
   AND ((@isOutdoor = -1) OR (b.IsOutsideBooth = @isOutdoor)) 
   AND ((@booth = '') OR (b.location = @booth))        
   AND ((@isARO = -1) OR (b.IsAro = @isARO))        
   AND ((@streamname = '') OR (s.streamname like '%' + LTRIM(RTRIM(@streamname)) + '%'))        
  ORDER BY s.status,s.statusFlag desc, b.district, b.acname,b.PSNum, b.location, b.cameralocationtype        
 END        
 ELSE        
 BEGIN        
  SELECT *,ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b              
   inner join streamlist s on b.streamid = s.id              
   --inner join operator_info oi on b.operatorid = oi.id              
   INNER JOIN operator_info op on b.operatorid = op.id              
   inner join district d on d.district = b.district and d.acname = b.acname          
  where b.isdisplay = 1 AND s.IsEnable = 1              
   AND ((@district='') OR (b.district = @district))              
   AND ((@assembly='') OR (b.acname = @assembly))             
   AND ((@status='') OR (status = @status))              
   AND ((@isPink = -1) OR (b.IsPink = @isPink))        
    AND ((@isOutdoor = -1) OR (b.IsOutsideBooth = @isOutdoor)) 
   AND ((@booth = '') OR (b.location = @booth))            
   AND ((@isARO = -1) OR (b.IsAro = @isARO))            
   AND ((@streamname = '') OR (s.streamname like '%' + LTRIM(RTRIM(@streamname)) + '%'))            
  ORDER BY b.district, b.acname,b.PSNum, b.location, b.cameralocationtype,s.status,s.statusFlag desc
 END        
END
GO
/****** Object:  StoredProcedure [dbo].[GetBoothListNew_OutDoor]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GetBoothListNew_OutDoor]              
(              
 @district varchar(100)='',              
 @assembly varchar(100)='',            
 @status varchar(50)='',        
 @isPink int = -1  ,    
 @isOutdoor int = -1  ,  
 @isARO int = -1  ,          
 @booth varchar(511) = '',        
 @streamname varchar(255) = '',        
 @OrderBY varchar(255) = 'status'        
)              
            
AS              
BEGIN        
 IF @OrderBY = 'dist' --OR @OrderBY = 'status'        
 BEGIN        
  SELECT *,ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b              
   inner join streamlist s on b.streamid = s.id              
   --inner join operator_info oi on b.operatorid = oi.id              
   INNER JOIN operator_info op on b.operatorid = op.id              
   inner join district d on d.district = b.district and d.acname = b.acname          
  where b.isdisplay = 1 AND s.IsEnable = 1              
   AND ((@district='') OR (b.district = @district))              
   AND ((@assembly='') OR (b.acname = @assembly))             
   AND ((@status='') OR (status = @status))              
   AND ((@isPink = -1) OR (b.IsPink = @isPink))  
   AND ((@isOutdoor = -1) OR (b.IsOutsideBooth = @isOutdoor)) 
   AND ((@booth = '') OR (b.location = @booth))        
   AND ((@isARO = -1) OR (b.IsAro = @isARO))        
   AND ((@streamname = '') OR (s.streamname like '%' + LTRIM(RTRIM(@streamname)) + '%'))        
  ORDER BY s.status,s.statusFlag desc, b.district, b.acname,b.PSNum, b.location, b.cameralocationtype        
 END        
 ELSE        
 BEGIN        
  SELECT *,ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b              
   inner join streamlist s on b.streamid = s.id              
   --inner join operator_info oi on b.operatorid = oi.id              
   INNER JOIN operator_info op on b.operatorid = op.id              
   inner join district d on d.district = b.district and d.acname = b.acname          
  where b.isdisplay = 1 AND s.IsEnable = 1              
   AND ((@district='') OR (b.district = @district))              
   AND ((@assembly='') OR (b.acname = @assembly))             
   AND ((@status='') OR (status = @status))              
   AND ((@isPink = -1) OR (b.IsPink = @isPink))        
    AND ((@isOutdoor = -1) OR (b.IsOutsideBooth = @isOutdoor)) 
   AND ((@booth = '') OR (b.location = @booth))            
   AND ((@isARO = -1) OR (b.IsAro = @isARO))            
   AND ((@streamname = '') OR (s.streamname like '%' + LTRIM(RTRIM(@streamname)) + '%'))            
  ORDER BY b.district, b.acname,b.PSNum, b.location, b.cameralocationtype,s.status,s.statusFlag desc
 END        
END
GO
/****** Object:  StoredProcedure [dbo].[GetBoothListNewAutoView]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
CREATE PROCEDURE [dbo].[GetBoothListNewAutoView]  
(  
 @district varchar(100)='',  
 @assembly varchar(100)=''
 --,@status varchar(50)=''  
)  

AS  
BEGIN  

  
SELECT *,ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b  
 inner join streamlist s on b.streamid = s.id  
 --inner join operator_info oi on b.operatorid = oi.id  
 INNER JOIN operator_info op on b.operatorid = op.id  

 where b.isdisplay = 1 AND s.IsEnable = 1  
 AND ((@district='') OR (b.district = @district))  
 AND ((@assembly='') OR (b.acname = @assembly)) 
 --AND ((@status='') OR (status = @status))  
 AND status = 'RUNNING'
 ORDER BY b.district, b.acname, b.location, b.cameralocationtype, b.IsPink
END
GO
/****** Object:  StoredProcedure [dbo].[GetBoothListNewGridView]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBoothListNewGridView]        
(        
 @district varchar(100)='',        
 @assembly varchar(100)='',      
 @status varchar(50)='',  
 @isPink int = -1  ,    
 @isARO int = -1  ,    
 @booth varchar(511) = '',  
 @streamname varchar(255) = '',  
 @OrderBY varchar(255) = 'status',
 @PageIndex INT = 0,
 @PageSize INT = 6,
 @UserID INT = 0
)        
      
AS        
BEGIN  
 DECLARE @Total INT = 0
 DECLARE @AssemblyAccessIDs VARCHAR(MAX) = ''  
 SELECT TOP 1 @AssemblyAccessIDs = AssemblyAccesIds FROM Users WHERE id = @UserID

 IF @OrderBY = 'dist'  
 BEGIN  
  SELECT * from booth b        
   inner join streamlist s on b.streamid = s.id        
   --inner join operator_info oi on b.operatorid = oi.id        
   INNER JOIN operator_info op on b.operatorid = op.id        
   inner join district d on d.district = b.district and d.acname = b.acname    
  where b.isdisplay = 1 AND s.IsEnable = 1        
   AND ((@district='') OR (b.district = @district))        
   AND ((@assembly='') OR (b.acname = @assembly))       
   AND ((@status='') OR (status = @status))        
   AND ((@isPink = -1) OR (b.IsPink = @isPink))  
   AND ((@booth = '') OR (b.location = @booth))  
   AND ((@isARO = -1) OR (b.IsAro = @isARO))  
   AND ((@streamname = '') OR (s.streamname = @streamname))
   AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))
  ORDER BY s.status, b.district, b.acname, b.location, b.cameralocationtype
  OFFSET (@PageIndex*@PageSize) ROWS FETCH NEXT @PageSize ROWS ONLY

  SELECT @Total = COUNT(b.id) from booth b        
   inner join streamlist s on b.streamid = s.id        
   --inner join operator_info oi on b.operatorid = oi.id        
   INNER JOIN operator_info op on b.operatorid = op.id        
   inner join district d on d.district = b.district and d.acname = b.acname    
  where b.isdisplay = 1 AND s.IsEnable = 1        
   AND ((@district='') OR (b.district = @district))        
   AND ((@assembly='') OR (b.acname = @assembly))       
   AND ((@status='') OR (status = @status))        
   AND ((@isPink = -1) OR (b.IsPink = @isPink))  
   AND ((@booth = '') OR (b.location = @booth))  
   AND ((@isARO = -1) OR (b.IsAro = @isARO))  
   AND ((@streamname = '') OR (s.streamname = @streamname))
   AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))
  --ORDER BY s.status, b.district, b.acname, b.location, b.cameralocationtype

  SELECT @PageIndex AS PageIndex,@Total AS TotalCount

 END  
 ELSE  
 BEGIN  
  SELECT * from booth b        
   inner join streamlist s on b.streamid = s.id        
   --inner join operator_info oi on b.operatorid = oi.id        
   INNER JOIN operator_info op on b.operatorid = op.id        
   inner join district d on d.district = b.district and d.acname = b.acname    
  where b.isdisplay = 1 AND s.IsEnable = 1        
   AND ((@district='') OR (b.district = @district))        
   AND ((@assembly='') OR (b.acname = @assembly))       
   AND ((@status='') OR (status = @status))        
   AND ((@isPink = -1) OR (b.IsPink = @isPink))      
   AND ((@booth = '') OR (b.location = @booth))      
   AND ((@isARO = -1) OR (b.IsAro = @isARO))      
   AND ((@streamname = '') OR (s.streamname = @streamname))
   AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))
  ORDER BY b.district, b.acname, b.location, b.cameralocationtype,s.status
  OFFSET (@PageIndex*@PageSize) ROWS FETCH NEXT @PageSize ROWS ONLY

  SELECT @Total = COUNT(b.id) from booth b        
   inner join streamlist s on b.streamid = s.id        
   --inner join operator_info oi on b.operatorid = oi.id        
   INNER JOIN operator_info op on b.operatorid = op.id        
   inner join district d on d.district = b.district and d.acname = b.acname    
  where b.isdisplay = 1 AND s.IsEnable = 1        
   AND ((@district='') OR (b.district = @district))        
   AND ((@assembly='') OR (b.acname = @assembly))       
   AND ((@status='') OR (status = @status))        
   AND ((@isPink = -1) OR (b.IsPink = @isPink))      
   AND ((@booth = '') OR (b.location = @booth))      
   AND ((@isARO = -1) OR (b.IsAro = @isARO))      
   AND ((@streamname = '') OR (s.streamname = @streamname))
   AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))
  --ORDER BY b.district, b.acname, b.location, b.cameralocationtype,s.status
  
  SELECT @PageIndex AS PageIndex,@Total AS TotalCount

 END  
END
GO
/****** Object:  StoredProcedure [dbo].[GetBoothListNewPinkView]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
CREATE PROCEDURE [dbo].[GetBoothListNewPinkView]  
(  
 @district varchar(100)='',  
 @assembly varchar(100)=''
 --,@status varchar(50)=''  
)  

AS  
BEGIN  

  
SELECT *,ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b  
 inner join streamlist s on b.streamid = s.id  
 --inner join operator_info oi on b.operatorid = oi.id  
 INNER JOIN operator_info op on b.operatorid = op.id  

 where b.isdisplay = 1 AND s.IsEnable = 1  
 AND ((@district='') OR (b.district = @district))  
 AND ((@assembly='') OR (b.acname = @assembly)) 
 --AND ((@status='') OR (status = @status))  
 AND ISNULL(b.IsPink,0) = 1
 ORDER BY b.district, b.acname, b.location, b.cameralocationtype
END
GO
/****** Object:  StoredProcedure [dbo].[GetBoothListNewPSView]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


  
CREATE PROCEDURE [dbo].[GetBoothListNewPSView]  
(  
 @district varchar(100)='',  
 @assembly varchar(100)=''
 ,@location varchar(100)=''  
)  

AS  
BEGIN  

  
SELECT *,ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b  
 inner join streamlist s on b.streamid = s.id  
 --inner join operator_info oi on b.operatorid = oi.id  
 INNER JOIN operator_info op on b.operatorid = op.id  

 where b.isdisplay = 1 AND s.IsEnable = 1  
 AND ((@district='') OR (b.district = @district))  
 AND ((@assembly='') OR (b.acname = @assembly)) 
 AND ((@location='') OR (b.location = @location))  
 ORDER BY b.district, b.acname, b.location, b.cameralocationtype
END
GO
/****** Object:  StoredProcedure [dbo].[GetBoothListTrailRunRpt]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec GetBoothListTrailRunRpt '','','Both'
CREATE PROCEDURE [dbo].[GetBoothListTrailRunRpt]              
(              
 @district varchar(100)='',              
 @assembly varchar(100)='',            
 @status varchar(50)=''
)              
            
AS              
BEGIN        
	SELECT *, CASE WHEN b.Trial1=1 THEN 'Connected' ELSE 'Not Connected' END as Trial 
	,ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b              
	inner join streamlist s on b.streamid = s.id              
	INNER JOIN operator_info op on b.operatorid = op.id              
	inner join district d on d.district = b.district and d.acname = b.acname          
	where b.isdisplay = 1 AND s.IsEnable = 1 AND b.Trial1 = 1
	AND ((@district='') OR (b.district = @district))              
	AND ((@assembly='') OR (b.acname = @assembly))             
	AND ((@status='') OR (@status='Both') OR (s.status = @status))   
	ORDER BY s.status,s.statusFlag desc, b.district, b.acname,b.PSNum, b.location, b.cameralocationtype
END
GO
/****** Object:  StoredProcedure [dbo].[GetBoothWiseCamOperator]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GetBoothWiseCamOperator 'Haridwar-1',99
CREATE PROCEDURE [dbo].[GetBoothWiseCamOperator]  
(  
 @district varchar(100) = ''  
 ,@accode varchar(100) = ''
 ,@designation varchar(100) = ''
)  
AS  
BEGIN  

select * from booth b
inner join operator_info o on b.operatorid=o.id
 where ((@district='') OR (b.district=@district))
and  ((@accode='') OR (b.accode=@accode))
and  ((@designation='') OR (o.Designation=@designation))
order by o.id desc
END
GO
/****** Object:  StoredProcedure [dbo].[Getbulkdeletehistory]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec Getbulkdeletehistory 'DELETE','DemoDistrict','DemoAssembly'
CREATE Procedure [dbo].[Getbulkdeletehistory]  
(  
 @Action varchar(50)=''  ,
 @District varchar(50)='',
 @Assembly varchar(50)=''
)  
AS  
BEGIN  
--Select top 2 bh.*,s.deviceid from boothhistory bh inner join streamlist s on s.id=bh.streamid where boothid in(@BoothId,@BoothId1) and  isdelete=1 and Action='SWAPCAMERA' order by bh.id desc  
  
--Select bh.*,s.deviceid from boothhistory  bh inner join streamlist s on s.id=bh.streamid where  boothid in(@BoothId,@BoothId1) and  isdelete=0 and Action='SWAPCAMERA'  
 IF (@Action = 'DELETE')  
 BEGIN  
  --select  'DELETE' AS Status,bh.*,s.deviceid from boothhistory bh  
  --inner join streamlist s on s.id = bh.streamid  
  --where isdelete=1 and district=@District and acname=@Assembly and bh.updatedFrom='BULKDELETE' order by bh.id desc   
  Select 'Bulk Assembly Remove' as Status,s.deviceid,h.Action,h.IPAddress , * from booth b
 inner join streamlist s on s.id = b.streamid 
 inner Join boothhistory h on b.id=h.boothid
where b.district=@District AND b.acname=@Assembly AND isnull(b.isdelete,0)=0
END
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraHourList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetCameraHourList]
(
	@district varchar(100) = ''
	,@accode varchar(100) = ''
	,@school varchar(100) = ''
	,@FromDt VARCHAR(30) = ''
)
AS
BEGIN
	DECLARE @StartDt DATETIME, @StopDt DATETIME, @Internaldistrict VARCHAR(100)='', @Internalaccode VARCHAR(100)='', @Internalschool VARCHAR(100)='', @toDay varchar(255)='';
	SET @Internaldistrict = @district
	SET @Internalaccode = @accode
	SET @Internalschool = @school
	SET @toDay = CONVERT(varchar(10), GETDATE(), 120)

	IF (@FromDt = '')
	BEGIN
		SET @StartDt = null
		SET @StopDt = null
	END
	ELSE
	BEGIN
		SET @StartDt = convert(datetime, @FromDt + ' 07:00:00.000', 103)
		SET @StopDt = convert(datetime, @FromDt + ' 20:00:00.000', 103)
	END
	
	DECLARE @TableName VARCHAR(50)=''
	SET @TableName = 'CameraStatus_Hr_' + REPLACE(CONVERT(VARCHAR, @StartDt, 111),'/','')

	DECLARE @SQL VARCHAR(MAX)=''
	SET @SQL = N'
		SELECT 
			s.id, --
			s.[streamname], 
			b.[district],
			b.[accode], 
			b.[acname], 
			b.[PSNum],
			b.[location],
			[dbo].[GETIST]() AS DayDate, --
			--DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,
			--DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin,
			op.[operatorName],
			op.[operatorNumber],
			hr.T_0
			,hr.T_1
			,hr.T_2
			,hr.T_3
			,hr.T_4
			,hr.T_5
			,hr.T_6
			,hr.T_7
			,hr.T_8
			,hr.T_9
			,hr.T_10
			,hr.T_11
			,hr.T_12
			,hr.T_13
			,hr.T_14
			,hr.T_15
			,hr.T_16
			,hr.T_17
			,hr.T_18
			,hr.T_19
			,hr.T_20
			,hr.T_21
			,hr.T_22
			,hr.T_23
			,(hr.T_0+hr.T_1+hr.T_2+hr.T_3+hr.T_4+hr.T_5+hr.T_6+hr.T_7+hr.T_8+hr.T_9+hr.T_10+hr.T_11+hr.T_12+hr.T_13+hr.T_14+hr.T_15+hr.T_16+hr.T_17+hr.T_18+hr.T_19+hr.T_20+hr.T_21+hr.T_22+hr.T_23) AS Total
		FROM
			[dbo].[streamlist] s
			INNER JOIN [dbo].[booth] b ON s.id = b.streamid
			Left JOIN [dbo].[operator_info] op ON op.id = b.operatorid
			INNER JOIN [dbo].[' + @TableName + '] hr ON hr.streamname = s.streamname
		WHERE 
		--(('''+@FromDt+''' = '''') OR (csd.OffLineStartTime BETWEEN '''+convert(varchar(30), @StartDt, 20)+''' AND '''+convert(varchar(30), @StartDt, 20)+''')) and
			 (('''+@Internaldistrict+'''='''') OR (b.district='''+@Internaldistrict+'''))
			and (('''+@Internalaccode+'''='''') OR (b.accode='''+@Internalaccode+'''))
			and (('''+@Internalschool+'''='''') OR (b.location='''+@Internalschool+''')) 
	ORDER BY district,acname,streamname,DayDate
	OPTION (RECOMPILE);'
--	PRINT @SQL
	EXEC(@SQL)
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraOfflineList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  --exec GetCameraOfflineList '','','','2022-05-23 08:00:00','2022-05-23 18:00:00'    
CREATE PROCEDURE [dbo].[GetCameraOfflineList]      
(      
 @district varchar(100) = ''      
 ,@accode varchar(100) = ''      
 ,@psnum varchar(100) = ''      
 ,@FromDt VARCHAR(30) = ''      
 ,@ToDt VARCHAR(30) = ''      
)      
AS      
BEGIN      
 DECLARE @StartDt DATETIME, @StopDt DATETIME, @Internaldistrict VARCHAR(100), @Internalaccode VARCHAR(100), @Internalpsno VARCHAR(100), @toDay varchar(255);      
 SET @Internaldistrict = @district      
 SET @Internalaccode = @accode      
 SET @Internalpsno = @psnum      
 SET @toDay = CONVERT(varchar(10), GETDATE(), 120)      
      
 IF (@FromDt = '')      
 BEGIN      
  SET @StartDt = null      
 END      
 ELSE      
 BEGIN      
    SET @StartDt = CAST(@FromDt AS datetime)      
  --SET @StartDt = convert(datetime, @FromDt + ' 07:00:00.000', 103)      
 END      
 IF (@ToDt = '')      
 BEGIN      
  SET @StopDt = null      
 END      
 ELSE      
 BEGIN      
    SET @StopDt = CAST(@ToDt AS datetime)    
  --SET @StopDt = convert(datetime, @ToDt + ' 20:00:00.000', 103)      
 END      
      
 SELECT *, DATEDIFF(MINUTE, TBL.StartTime, TBL.StopTime ) AS DiffMin FROM (      
  --SELECT       
  --   s.id,       
  --   s.streamname,       
  --   b.district,       
  --   b.accode,       
  --   b.acname,      
  --   CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,    
  --   --csd.OffLineStopTime as StopTime,      
  --   --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,      
  --   CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END as StopTime,      
  --   '' as ShiftName,      
  --   @StartDt as ShiftStartTime,      
  --   @StopDt as ShiftEndTime,      
  --   b.[location] as VehicleNo,      
  --   @StartDt AS DayDate,      
  --   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,      
  --   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin,   
    
  --csd.Reason,    
  --   op.operatorName AS DriverName,      
  --   op.operatorNumber AS DriverContactNo,      
  --   ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59       
  --  FROM      
  --   [dbo].[streamlist] s      
  --   INNER JOIN [dbo].[booth] b ON s.id = b.streamid AND b.isdisplay = 0      
  --   INNER JOIN [dbo].[operator_info] op ON op.id = b.operatorid      
  --   INNER JOIN [dbo].[CameraStopDuration] csd ON csd.streamname = s.streamname      
  --  WHERE ((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt)    
  --   OR (CASE WHEN csd.OffLineStopTime IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END BETWEEN @StartDt AND @StopDt))    
  --   and ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
  --   and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
  --   and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))      
  --  UNION    
  

    SELECT    
     s.id,       
     s.streamname,       
     b.district,       
     b.accode,       
     b.acname,      
     CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,      
     CASE WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt
		WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() <= @StopDt THEN [dbo].[GETIST]()
		WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt
		ELSE csd.[OffLineStopTime] END as StopTime,      
     '' as ShiftName,      
     @StartDt as ShiftStartTime,      
     @StopDt as ShiftEndTime,  
	  b.PSNum,
     b.[location] as VehicleNo,      
     @StartDt AS DayDate,      
	csd.Reason,    
     op.operatorName AS DriverName,      
     op.operatorNumber AS DriverContactNo,      
  ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59 


  --    SELECT    
  --   s.id,      
	 --  b.district,       
  --   b.acname,   
	 --  b.[location] as VehicleNo,      
  --   s.streamname,       
  --       @StartDt AS DayDate,   
		 
  --   CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,      
  --   CASE WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt
		--WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() <= @StopDt THEN [dbo].[GETIST]()
		--WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt
		--ELSE csd.[OffLineStopTime] END as StopTime,      
  --   '' as ShiftName,      
	     
  --ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total,--THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59 
  --     @StartDt as ShiftStartTime,      
  --   @StopDt as ShiftEndTime,  
	 --b.accode,
  --csd.Reason,    
  --   op.operatorName AS DriverName,      
  --   op.operatorNumber AS DriverContactNo

    FROM      
     [dbo].[streamlist] s      
     INNER JOIN [dbo].[booth] b ON s.id = b.streamid --AND ISNULL(b.isdelete,'') = ''
     INNER JOIN [dbo].[operator_info] op ON op.id = b.operatorid AND b.isdisplay = 1      
     INNER JOIN [dbo].[CameraStopDuration] csd ON csd.streamname = s.streamname      
    WHERE 


	 --((@FromDt = '' AND @ToDt = '') 
		--OR (OffLineStartTime >= @StartDt) OR (OffLineStartTime <@StartDt AND OffLineStopTime >=@StartDt)
		--OR (ISNULL(OffLineStopTime,[dbo].[GETIST]()) <= @StopDt)
		--OR (ISNULL(OffLineStopTime,[dbo].[GETIST]()) > @StopDt AND OffLineStartTime < @StopDt)
	--((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime >= @StartDt OR cast(OffLineStartTime as date) = cast(@StartDt as date))    
  -- OR (CASE WHEN csd.OffLineStopTime IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt
		--WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() <= @StopDt THEN [dbo].[GETIST]()
		--WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt
		--ELSE csd.[OffLineStopTime] END <= @StopDt)
   --) and
	 ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
     and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
     and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))   and ISNULL(isdelete,'')=0
 
 ) AS TBL
 WHERE((@FromDt = '' AND @ToDt = '') 
		OR (StartTime >= ShiftStartTime AND StopTime <=ShiftEndTime AND StopTime > StartTime))
 ORDER BY district,acname,streamname,DayDate,ShiftName,StartTime      
 OPTION (RECOMPILE);      
 --select distinct      
 -- s.id,      
 -- s.deviceid as streamname,      
 -- b.district,      
 -- b.accode,      
 -- b.acname,      
 -- csd.OffLineStartTime as StartTime,      
 -- csd.OffLineStopTime as StopTime,      
 -- vs.name as ShiftName,      
 -- vd.Vehicle_No as VehicleNo,      
 -- csd.Reason,      
 -- CONVERT(varchar, csd.OffLineStartTime, 103) AS DayDate,      
 -- DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,      
 -- staff.name AS DriverName,      
 -- staff.contact_no AS DriverContactNo      
 --FROM vehicalDetail vd WITH(NOLOCK)       
 -- INNER JOIN streamlist s WITH(NOLOCK) ON s.id = vd.streamid      
 -- INNER JOIN booth b WITH (NOLOCK) ON s.id = b.streamid      
 -- INNER JOIN Vehicle_Staff_Mapping map WITH(NOLOCK) ON map.VehicleId = vd.vehicalId AND vd.isdeleted = 0 AND map.isdeleted=0      
 -- INNER JOIN Staff_Info staff WITH(NOLOCK) ON  map.StaffId = staff.id AND vd.isdeleted = 0 AND Type = 1       
 -- INNER JOIN vehicleshift vs WITH(NOLOCK) ON vs.id = map.ShiftId      
 -- LEFT JOIN [CameraStopDuration] csd WITH (NOLOCK) on csd.[streamname] = s.[streamname] AND csd.ShiftID = vs.id      
 --WHERE       
 --((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))      
 --and ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
 --and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
 --and ((@Internalvehicleno='') OR (vd.Vehicle_No=@Internalvehicleno))      
 --and ((@InternalShift='') OR (vs.name=@InternalShift))      
 --OPTION (RECOMPILE);       
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraOfflineList2]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
  
  
  
  
CREATE PROCEDURE [dbo].[GetCameraOfflineList2]  
(  
 @district varchar(100) = ''  
 ,@accode varchar(100) = ''  
 ,@vehicleno varchar(100) = ''  
 ,@FromDt VARCHAR(30) = ''  
 ,@ToDt VARCHAR(30) = ''  
 ,@Shift VARCHAR(30) = ''  
)  
AS  
BEGIN  
 DECLARE @StartDt DATETIME, @StopDt DATETIME, @Internaldistrict VARCHAR(100), @Internalaccode VARCHAR(100), @Internalvehicleno VARCHAR(100), @InternalShift VARCHAR(100);  
 SET @Internaldistrict = @district  
 SET @Internalaccode = @accode  
 SET @Internalvehicleno = @vehicleno  
 SET @InternalShift = @Shift  
  
 IF (@FromDt = '')  
 BEGIN  
  SET @StartDt = null  
 END  
 ELSE  
 BEGIN  
  SET @StartDt = convert(datetime, @FromDt + ' 00:00:00', 103)  
 END  
 IF (@ToDt = '')  
 BEGIN  
  SET @StopDt = null  
 END  
 ELSE  
 BEGIN  
  SET @StopDt = convert(datetime, @ToDt + ' 23:59:59', 103)  
 END  
  
 SELECT *, DATEDIFF(MINUTE, TBL.StartTime, TBL.StopTime ) AS DiffMin FROM (  
  SELECT DISTINCT   
   s.id,   
   s.streamname,   
   b.district,   
   b.accode,   
   b.acname,   
   csd.OffLineStartTime as StartTime,  
   --csd.OffLineStopTime as StopTime,  
   --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,  
   CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN (CASE WHEN map.LastEditedOn < csd.[OffLineStopTime] THEN map.LastEditedOn ELSE csd.[OffLineStopTime] END) ELSE csd.[OffLineStopTime] END END as StopTime,  
   vs.name as ShiftName,  
   vd.Vehicle_No as VehicleNo,  
   csd.Reason,  
   map.AssignDate,  
   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,  
   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin,  
   staff.name AS DriverName,  
   staff.contact_no AS DriverContactNo  
  FROM   
   [dbo].[vehicalDetail] vd WITH (NOLOCK)  
   INNER JOIN [dbo].[Vehicle_Staff_Mapping] map WITH (NOLOCK) ON vd.vehicalId = map.VehicleId  
   INNER JOIN [dbo].[streamlist] s WITH (NOLOCK) ON vd.streamid = s.id  
   INNER JOIN [dbo].[booth] b WITH (NOLOCK) ON b.streamid = vd.streamid  
   INNER JOIN [dbo].[CameraStopDuration] csd WITH (NOLOCK) ON s.streamname = csd.streamname AND map.AssignDate = CAST(csd.OffLineStartTime AS date)  
   INNER JOIN [dbo].[vehicleshift] vs WITH (NOLOCK) ON map.ShiftId = vs.id  
   INNER JOIN [dbo].[Staff_Info] staff WITH(NOLOCK) ON  map.StaffId = staff.id AND Type = 1   
  WHERE (map.AddedOn = map.LastEditedOn OR (csd.OffLineStartTime > map.AddedOn AND csd.OffLineStartTime < map.LastEditedOn)) AND  
   ((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))  
   and ((@Internaldistrict='') OR (b.district=@Internaldistrict))  
   and ((@Internalaccode='') OR (b.accode=@Internalaccode))  
   and ((@Internalvehicleno='') OR (vd.Vehicle_No=@Internalvehicleno))  
   and ((@InternalShift='') OR (vs.name=@InternalShift))  
 ) AS TBL  
 OPTION (RECOMPILE);  
 --select distinct  
 -- s.id,  
 -- s.deviceid as streamname,  
 -- b.district,  
 -- b.accode,  
 -- b.acname,  
 -- csd.OffLineStartTime as StartTime,  
 -- csd.OffLineStopTime as StopTime,  
 -- vs.name as ShiftName,  
 -- vd.Vehicle_No as VehicleNo,  
 -- csd.Reason,  
 -- CONVERT(varchar, csd.OffLineStartTime, 103) AS DayDate,  
 -- DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,  
 -- staff.name AS DriverName,  
 -- staff.contact_no AS DriverContactNo  
 --FROM vehicalDetail vd WITH(NOLOCK)   
 -- INNER JOIN streamlist s WITH(NOLOCK) ON s.id = vd.streamid  
 -- INNER JOIN booth b WITH (NOLOCK) ON s.id = b.streamid  
 -- INNER JOIN Vehicle_Staff_Mapping map WITH(NOLOCK) ON map.VehicleId = vd.vehicalId AND vd.isdeleted = 0 AND map.isdeleted=0  
 -- INNER JOIN Staff_Info staff WITH(NOLOCK) ON  map.StaffId = staff.id AND vd.isdeleted = 0 AND Type = 1   
 -- INNER JOIN vehicleshift vs WITH(NOLOCK) ON vs.id = map.ShiftId  
 -- LEFT JOIN [CameraStopDuration] csd WITH (NOLOCK) on csd.[streamname] = s.[streamname] AND csd.ShiftID = vs.id  
 --WHERE   
 --((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))  
 --and ((@Internaldistrict='') OR (b.district=@Internaldistrict))  
 --and ((@Internalaccode='') OR (b.accode=@Internalaccode))  
 --and ((@Internalvehicleno='') OR (vd.Vehicle_No=@Internalvehicleno))  
 --and ((@InternalShift='') OR (vs.name=@InternalShift))  
 --OPTION (RECOMPILE);   
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraOfflineList593]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  --exec GetCameraOfflineList593 '','','','2022-02-20 08:00:00','2022-02-20 18:00:00'    
CREATE PROCEDURE [dbo].[GetCameraOfflineList593]      
(      
 @district varchar(100) = ''      
 ,@accode varchar(100) = ''      
 ,@psnum varchar(100) = ''      
 ,@FromDt VARCHAR(30) = ''      
 ,@ToDt VARCHAR(30) = ''      
)      
AS      
BEGIN      
 DECLARE @StartDt DATETIME, @StopDt DATETIME, @Internaldistrict VARCHAR(100), @Internalaccode VARCHAR(100), @Internalpsno VARCHAR(100), @toDay varchar(255);      
 SET @Internaldistrict = @district      
 SET @Internalaccode = @accode      
 SET @Internalpsno = @psnum      
 SET @toDay = CONVERT(varchar(10), GETDATE(), 120)      
      
 IF (@FromDt = '')      
 BEGIN      
  SET @StartDt = null      
 END      
 ELSE      
 BEGIN      
    SET @StartDt = CAST(@FromDt AS datetime)      
  --SET @StartDt = convert(datetime, @FromDt + ' 07:00:00.000', 103)      
 END      
 IF (@ToDt = '')      
 BEGIN      
  SET @StopDt = null      
 END      
 ELSE      
 BEGIN      
    SET @StopDt = CAST(@ToDt AS datetime)    
  --SET @StopDt = convert(datetime, @ToDt + ' 20:00:00.000', 103)      
 END      
      
 SELECT *, DATEDIFF(MINUTE, TBL.StartTime, TBL.StopTime ) AS DiffMin FROM (      
  --SELECT       
  --   s.id,       
  --   s.streamname,       
  --   b.district,       
  --   b.accode,       
  --   b.acname,      
  --   CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,    
  --   --csd.OffLineStopTime as StopTime,      
  --   --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,      
  --   CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END as StopTime,      
  --   '' as ShiftName,      
  --   @StartDt as ShiftStartTime,      
  --   @StopDt as ShiftEndTime,      
  --   b.[location] as VehicleNo,      
  --   @StartDt AS DayDate,      
  --   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,      
  --   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin,   
    
  --csd.Reason,    
  --   op.operatorName AS DriverName,      
  --   op.operatorNumber AS DriverContactNo,      
  --   ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59       
  --  FROM      
  --   [dbo].[streamlist] s      
  --   INNER JOIN [dbo].[booth] b ON s.id = b.streamid AND b.isdisplay = 0      
  --   INNER JOIN [dbo].[operator_info] op ON op.id = b.operatorid      
  --   INNER JOIN [dbo].[CSD] csd ON csd.streamname = s.streamname      
  --  WHERE ((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt)    
  --   OR (CASE WHEN csd.OffLineStopTime IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END BETWEEN @StartDt AND @StopDt))    
  --   and ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
  --   and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
  --   and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))      
  --  UNION      
    SELECT       
     s.id,       
     s.streamname,       
     b.district,       
     b.accode,       
     b.acname,      
     CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,      
     CASE WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt
		WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() <= @StopDt THEN [dbo].[GETIST]()
		WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt
		ELSE csd.[OffLineStopTime] END as StopTime,      
     '' as ShiftName,      
     @StartDt as ShiftStartTime,      
     @StopDt as ShiftEndTime,      
     b.[location] as VehicleNo,      
     @StartDt AS DayDate,      
	csd.Reason,    
     op.operatorName AS DriverName,      
     op.operatorNumber AS DriverContactNo,      
  ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59       
    FROM      
     [dbo].[streamlist] s      
     INNER JOIN [dbo].[booth] b ON s.id = b.streamid      
     INNER JOIN [dbo].[operator_info] op ON op.id = b.operatorid AND b.isdisplay = 1      
     INNER JOIN [dbo].[CSD] csd ON csd.streamname = s.streamname      
	 INNER JOIN ##test t on t.did = csd.streamname
    WHERE 
	 --((@FromDt = '' AND @ToDt = '') 
		--OR (OffLineStartTime >= @StartDt) OR (OffLineStartTime <@StartDt AND OffLineStopTime >=@StartDt)
		--OR (ISNULL(OffLineStopTime,[dbo].[GETIST]()) <= @StopDt)
		--OR (ISNULL(OffLineStopTime,[dbo].[GETIST]()) > @StopDt AND OffLineStartTime < @StopDt)
	--((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime >= @StartDt OR cast(OffLineStartTime as date) = cast(@StartDt as date))    
  -- OR (CASE WHEN csd.OffLineStopTime IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt
		--WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() <= @StopDt THEN [dbo].[GETIST]()
		--WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt
		--ELSE csd.[OffLineStopTime] END <= @StopDt)
   --) and
	 ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
     and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
     and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))    
 ) AS TBL
 WHERE((@FromDt = '' AND @ToDt = '') 
		OR (StartTime >= ShiftStartTime AND StopTime <=ShiftEndTime AND StopTime > StartTime))
 ORDER BY district,acname,streamname,DayDate,ShiftName,StartTime      
 OPTION (RECOMPILE);      
 --select distinct      
 -- s.id,      
 -- s.deviceid as streamname,      
 -- b.district,      
 -- b.accode,      
 -- b.acname,      
 -- csd.OffLineStartTime as StartTime,      
 -- csd.OffLineStopTime as StopTime,      
 -- vs.name as ShiftName,      
 -- vd.Vehicle_No as VehicleNo,      
 -- csd.Reason,      
 -- CONVERT(varchar, csd.OffLineStartTime, 103) AS DayDate,      
 -- DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,      
 -- staff.name AS DriverName,      
 -- staff.contact_no AS DriverContactNo      
 --FROM vehicalDetail vd WITH(NOLOCK)       
 -- INNER JOIN streamlist s WITH(NOLOCK) ON s.id = vd.streamid      
 -- INNER JOIN booth b WITH (NOLOCK) ON s.id = b.streamid      
 -- INNER JOIN Vehicle_Staff_Mapping map WITH(NOLOCK) ON map.VehicleId = vd.vehicalId AND vd.isdeleted = 0 AND map.isdeleted=0      
 -- INNER JOIN Staff_Info staff WITH(NOLOCK) ON  map.StaffId = staff.id AND vd.isdeleted = 0 AND Type = 1       
 -- INNER JOIN vehicleshift vs WITH(NOLOCK) ON vs.id = map.ShiftId      
 -- LEFT JOIN [CSD] csd WITH (NOLOCK) on csd.[streamname] = s.[streamname] AND csd.ShiftID = vs.id      
 --WHERE       
 --((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))      
 --and ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
 --and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
 --and ((@Internalvehicleno='') OR (vd.Vehicle_No=@Internalvehicleno))      
 --and ((@InternalShift='') OR (vs.name=@InternalShift))      
 --OPTION (RECOMPILE);       
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraOfflineListFinal]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  --exec GetCameraOfflineList '','','','2022-02-20 08:00:00','2022-02-20 18:00:00'    
CREATE PROCEDURE [dbo].[GetCameraOfflineListFinal]      
(      
 @district varchar(100) = ''      
 ,@accode varchar(100) = ''      
 ,@psnum varchar(100) = ''      
 ,@FromDt VARCHAR(30) = ''      
 ,@ToDt VARCHAR(30) = ''      
)      
AS      
BEGIN      
 DECLARE @StartDt DATETIME, @StopDt DATETIME, @Internaldistrict VARCHAR(100), @Internalaccode VARCHAR(100), @Internalpsno VARCHAR(100), @toDay varchar(255);      
 SET @Internaldistrict = @district      
 SET @Internalaccode = @accode      
 SET @Internalpsno = @psnum      
 SET @toDay = CONVERT(varchar(10), GETDATE(), 120)      
      
 IF (@FromDt = '')      
 BEGIN      
  SET @StartDt = null      
 END      
 ELSE      
 BEGIN      
    SET @StartDt = CAST(@FromDt AS datetime)      
  --SET @StartDt = convert(datetime, @FromDt + ' 07:00:00.000', 103)      
 END      
 IF (@ToDt = '')      
 BEGIN      
  SET @StopDt = null      
 END      
 ELSE      
 BEGIN      
    SET @StopDt = CAST(@ToDt AS datetime)    
  --SET @StopDt = convert(datetime, @ToDt + ' 20:00:00.000', 103)      
 END      
      
 SELECT *, DATEDIFF(MINUTE, TBL.StartTime, TBL.StopTime ) AS DiffMin FROM (      
  --SELECT       
  --   s.id,       
  --   s.streamname,       
  --   b.district,       
  --   b.accode,       
  --   b.acname,      
  --   CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,    
  --   --csd.OffLineStopTime as StopTime,      
  --   --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,      
  --   CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END as StopTime,      
  --   '' as ShiftName,      
  --   @StartDt as ShiftStartTime,      
  --   @StopDt as ShiftEndTime,      
  --   b.[location] as VehicleNo,      
  --   @StartDt AS DayDate,      
  --   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,      
  --   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin,   
    
  --csd.Reason,    
  --   op.operatorName AS DriverName,      
  --   op.operatorNumber AS DriverContactNo,      
  --   ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59       
  --  FROM      
  --   [dbo].[streamlist] s      
  --   INNER JOIN [dbo].[booth] b ON s.id = b.streamid AND b.isdisplay = 0      
  --   INNER JOIN [dbo].[operator_info] op ON op.id = b.operatorid      
  --   INNER JOIN [dbo].[CameraStopDuration] csd ON csd.streamname = s.streamname      
  --  WHERE ((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt)    
  --   OR (CASE WHEN csd.OffLineStopTime IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END BETWEEN @StartDt AND @StopDt))    
  --   and ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
  --   and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
  --   and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))      
  --  UNION      
    SELECT       
     s.id,       
     s.streamname,       
     b.district,       
     b.accode,       
     b.acname,      
     CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,      
     CASE WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt
		WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() <= @StopDt THEN [dbo].[GETIST]()
		WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt
		ELSE csd.[OffLineStopTime] END as StopTime,      
     '' as ShiftName,      
     @StartDt as ShiftStartTime,      
     @StopDt as ShiftEndTime,      
     b.[location] as VehicleNo,      
     @StartDt AS DayDate,      
	csd.Reason,    
     op.operatorName AS DriverName,      
     op.operatorNumber AS DriverContactNo,      
  ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59       
    FROM      
     [dbo].[streamlist] s      
     INNER JOIN [dbo].[booth] b ON s.id = b.streamid      
     INNER JOIN [dbo].[operator_info] op ON op.id = b.operatorid AND b.isdisplay = 1      
     INNER JOIN [dbo].[CameraStopDuration] csd ON csd.streamname = s.streamname      
    WHERE 
	 --((@FromDt = '' AND @ToDt = '') 
		--OR (OffLineStartTime >= @StartDt) OR (OffLineStartTime <@StartDt AND OffLineStopTime >=@StartDt)
		--OR (ISNULL(OffLineStopTime,[dbo].[GETIST]()) <= @StopDt)
		--OR (ISNULL(OffLineStopTime,[dbo].[GETIST]()) > @StopDt AND OffLineStartTime < @StopDt)
	--((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime >= @StartDt OR cast(OffLineStartTime as date) = cast(@StartDt as date))    
  -- OR (CASE WHEN csd.OffLineStopTime IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt
		--WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() <= @StopDt THEN [dbo].[GETIST]()
		--WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt
		--ELSE csd.[OffLineStopTime] END <= @StopDt)
   --) and
	 ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
     and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
     and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))    
 ) AS TBL
 WHERE((@FromDt = '' AND @ToDt = '') 
		OR (StartTime >= ShiftStartTime AND StopTime <=ShiftEndTime AND StopTime > StartTime))
 ORDER BY district,acname,streamname,DayDate,ShiftName,StartTime      
 OPTION (RECOMPILE);      
 --select distinct      
 -- s.id,      
 -- s.deviceid as streamname,      
 -- b.district,      
 -- b.accode,      
 -- b.acname,      
 -- csd.OffLineStartTime as StartTime,      
 -- csd.OffLineStopTime as StopTime,      
 -- vs.name as ShiftName,      
 -- vd.Vehicle_No as VehicleNo,      
 -- csd.Reason,      
 -- CONVERT(varchar, csd.OffLineStartTime, 103) AS DayDate,      
 -- DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,      
 -- staff.name AS DriverName,      
 -- staff.contact_no AS DriverContactNo      
 --FROM vehicalDetail vd WITH(NOLOCK)       
 -- INNER JOIN streamlist s WITH(NOLOCK) ON s.id = vd.streamid      
 -- INNER JOIN booth b WITH (NOLOCK) ON s.id = b.streamid      
 -- INNER JOIN Vehicle_Staff_Mapping map WITH(NOLOCK) ON map.VehicleId = vd.vehicalId AND vd.isdeleted = 0 AND map.isdeleted=0      
 -- INNER JOIN Staff_Info staff WITH(NOLOCK) ON  map.StaffId = staff.id AND vd.isdeleted = 0 AND Type = 1       
 -- INNER JOIN vehicleshift vs WITH(NOLOCK) ON vs.id = map.ShiftId      
 -- LEFT JOIN [CameraStopDuration] csd WITH (NOLOCK) on csd.[streamname] = s.[streamname] AND csd.ShiftID = vs.id      
 --WHERE       
 --((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))      
 --and ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
 --and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
 --and ((@Internalvehicleno='') OR (vd.Vehicle_No=@Internalvehicleno))      
 --and ((@InternalShift='') OR (vs.name=@InternalShift))      
 --OPTION (RECOMPILE);       
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraOfflineListForPopup]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  --[GetCameraOfflineListForPopup] '','','','',''
CREATE PROCEDURE [dbo].[GetCameraOfflineListForPopup]  
(  
 @district varchar(100) = ''  
 ,@accode varchar(100) = ''  
 ,@vehicleno varchar(100) = ''  
 ,@FromDt VARCHAR(30) = ''  
 ,@ToDt VARCHAR(30) = ''
 ,@UserID INT = 0
)  
AS  
BEGIN  
 DECLARE @StartDt DATETIME, @StopDt DATETIME  
 DECLARE @AssemblyAccessIDs VARCHAR(MAX) = ''
 SELECT TOP 1 @AssemblyAccessIDs = AssemblyAccesIds FROM Users WHERE id = @UserID
	
 IF (@FromDt = '')  
 BEGIN  
  SET @StartDt = null  
 END  
 ELSE  
 BEGIN  
  SET @StartDt = convert(datetime, @FromDt + ' 00:00:00', 103)  
 END  
 IF (@ToDt = '')  
 BEGIN  
  SET @StopDt = null  
 END  
 ELSE  
 BEGIN  
  SET @StopDt = convert(datetime, @ToDt + ' 23:59:59', 103)  
 END  
 select distinct  top(20)
 reason,
  csd.id,  
  s.deviceid as streamname,  
  b.district,  
  b.accode,  
  b.acname,  
  csd.OffLineStartTime as StartTime,  
  csd.OffLineStopTime as StopTime,  
  vs.name as ShiftName,  
  vs.starttime as ShiftStartTime,  
  vs.endtime as ShiftEndTime,  
  vd.Vehicle_No as VehicleNo,  
  CONVERT(varchar, csd.OffLineStartTime, 103) AS DayDate,  
  DATEDIFF(MINUTE, csd.OffLineStartTime, csd.OffLineStopTime) AS DiffMin,  
  ISNULL(MAX(CASE WHEN staff.Type = 1 THEN staff.name ELSE Null END),'') AS DriverName,  
  ISNULL(MAX(CASE WHEN staff.Type = 1 THEN staff.contact_no ELSE Null END),'') AS DriverContactNo,  
  ISNULL(MAX(CASE WHEN staff.Type = 2 THEN staff.name ELSE Null END),'') AS FSVStaffName,  
  ISNULL(MAX(CASE WHEN staff.Type = 2 THEN staff.contact_no ELSE Null END),'') AS FSVStaffContactNo  
 from booth b  
 inner join district d on d.district = b.district and d.acname= b.acname
 inner join streamlist s on s.id=b.streamid  
 inner join CameraStopDuration csd on csd.streamname = s.deviceid  
 inner join vehicleshift vs on vs.id = csd.ShiftID   
 inner join vehicalDetail vd on vd.streamid = s.id   and vd.isdeleted=0
 inner join Vehicle_Staff_Mapping mapping on mapping.VehicleId = vd.vehicalId AND mapping.AssignDate = CONVERT(DATE, SWITCHOFFSET(csd.OffLineStartTime, '+05:30'))   
 inner join Staff_Info staff on mapping.StaffId = staff.Id  
 WHERE ((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))  
 and ((@district='') OR (b.district=@district))  
 and ((@accode='') OR (b.accode=@accode))  
 and ((@vehicleno='') OR (vd.Vehicle_No=@vehicleno))  
  and (reason is null or reason='')
	AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))
 GROUP BY reason,csd.id, vs.starttime, vs.endtime, s.deviceid, b.district, b.accode, b.acname, csd.OffLineStartTime, csd.OffLineStopTime, vs.name, vd.Vehicle_No  
  order by starttime desc  
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraOfflineListPdf]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   
    --exec GetCameraOfflineListPdf '','','','2022-05-23 08:00:00','2022-05-23 18:00:00'    
CREATE PROCEDURE [dbo].[GetCameraOfflineListPdf]      
(      
 @district varchar(100) = ''      
 ,@accode varchar(100) = ''      
 ,@psnum varchar(100) = ''      
 ,@FromDt VARCHAR(30) = ''      
 ,@ToDt VARCHAR(30) = ''      
)      
AS      
BEGIN      
 DECLARE @StartDt DATETIME, @StopDt DATETIME, @Internaldistrict VARCHAR(100), @Internalaccode VARCHAR(100), @Internalpsno VARCHAR(100), @toDay varchar(255);      
 SET @Internaldistrict = @district      
 SET @Internalaccode = @accode      
 SET @Internalpsno = @psnum      
 SET @toDay = CONVERT(varchar(10), GETDATE(), 120)      
      
 IF (@FromDt = '')      
 BEGIN      
  SET @StartDt = null      
 END      
 ELSE      
 BEGIN      
    SET @StartDt = CAST(@FromDt AS datetime)      
 END      
 IF (@ToDt = '')      
 BEGIN      
  SET @StopDt = null      
 END      
 ELSE      
 BEGIN      
    SET @StopDt = CAST(@ToDt AS datetime)    
 END      
      
 SELECT *, DATEDIFF(MINUTE, TBL.StartTime, TBL.StopTime ) AS DiffMin FROM (      
  SELECT b.district,b.acname,b.[location] as VehicleNo,s.streamname,
  CONVERT(varchar(10), @StartDt, 103)
   AS DayDate,   
     CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,      
     CASE WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt
		WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() <= @StopDt THEN [dbo].[GETIST]()
		WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt
		ELSE csd.[OffLineStopTime] END as StopTime,      
     
	     
  ABS(DATEDIFF(HH,@StartDt,@StopDt)) AS Total,--THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59 
       @StartDt as ShiftStartTime,      
     @StopDt as ShiftEndTime,  
	 b.accode,
  csd.Reason,    
     op.operatorName AS DriverName,      
     op.operatorNumber AS DriverContactNo,
	  '' as ShiftName




	  --   SELECT    
 --    s.id,       
 --    s.streamname,       
 --    b.district,       
 --    b.accode,       
 --    b.acname,      
 --    CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,      
 --    CASE WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt
	--	WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() <= @StopDt THEN [dbo].[GETIST]()
	--	WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt
	--	ELSE csd.[OffLineStopTime] END as StopTime,      
 --    '' as ShiftName,      
 --    @StartDt as ShiftStartTime,      
 --    @StopDt as ShiftEndTime,      
 --    b.[location] as VehicleNo,      
 --    @StartDt AS DayDate,      
	--csd.Reason,    
 --    op.operatorName AS DriverName,      
 --    op.operatorNumber AS DriverContactNo,      
 -- ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59 


    FROM      
     [dbo].[streamlist] s      
     INNER JOIN [dbo].[booth] b ON s.id = b.streamid      
     INNER JOIN [dbo].[operator_info] op ON op.id = b.operatorid AND b.isdisplay = 1      
     INNER JOIN [dbo].[CameraStopDuration] csd ON csd.streamname = s.streamname      
    WHERE 

	 ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
     and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
     and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))    
 ) AS TBL
 WHERE((@FromDt = '' AND @ToDt = '') 
		OR (StartTime >= ShiftStartTime AND StopTime <=ShiftEndTime AND StopTime > StartTime))
 ORDER BY district,acname,streamname,DayDate,ShiftName,StartTime      
 OPTION (RECOMPILE);      
        
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraOfflineReportStatic]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC GetCameraOfflineReportStatic '',''           
CREATE PROCEDURE [dbo].[GetCameraOfflineReportStatic]             
(            
 @district varchar(100) = ''            
 ,@AcName varchar(100) = ''    
 ,@Date varchar(50)=''    
)            
AS            
BEGIN     
 --SELECT  ID as ID,District as District,Assembly  as acname,PsNo as PSNum,Location as VehicleNo,    
 --Operator as DriverName,CameraDID as streamname,date as DayDate, StartTime as StartTime,    
 --EndTime as StopTime, CONVERT(VARCHAR(5),CONVERT(DATETIME, Time, 0), 108) as DiffMin, Remark as Reason    
  SELECT  ID as ID,District as District,Assembly  as acname,PsNo as PSNum,Location as VehicleNo,    
 Operator as DriverName,CameraDID as streamname,date as DayDate, StartTime as StartTime,    
 EndTime as StopTime, Time as DiffMin, Remark as Reason,ShiftName    
 FROM           
 CameraOfflineStaticRpt       
  where  ((@district='') OR (District=@district))            
     and ((@AcName='') OR (Assembly=@AcName))     
  and Date=@Date     
 ORDER BY ID,District,Acname       
END    
    
GO
/****** Object:  StoredProcedure [dbo].[GetCamerasByAcCode]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCamerasByAcCode]
(
	@accode VARCHAR(255) = ''
)
AS
BEGIN
	SELECT 
		s.streamname
	FROM
	[dbo].[streamlist] s
		INNER JOIN [dbo].[booth] b ON s.id = b.streamid
	WHERE	(@accode = '' OR @accode = b.accode)
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraStatusReport]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC GetCameraStatusReport '','','','2022-03-31 08:00:00','2022-03-31 17:00:00'        
CREATE PROCEDURE [dbo].[GetCameraStatusReport]         
(        
 @district varchar(100) = ''        
 ,@accode varchar(100) = ''        
 ,@psnum varchar(100) = ''        
 ,@FromDt VARCHAR(30) = ''        
 ,@ToDt VARCHAR(30) = ''        
)        
AS        
BEGIN        
 DECLARE @StartDt DATETIME, @StopDt DATETIME, @Internaldistrict VARCHAR(100), @Internalaccode VARCHAR(100), @Internalpsno VARCHAR(100);        
 SET @Internaldistrict = @district        
 SET @Internalaccode = @accode        
 SET @Internalpsno = @psnum        
        
 --SET @ToDt = @FromDt        
 IF (@FromDt = '')        
 BEGIN        
  SET @StartDt = null        
 END        
 ELSE        
 BEGIN        
  SET @StartDt = CAST(@FromDt AS datetime)        
  --SET @StartDt = convert(datetime, @FromDt + ' 07:00:00.000', 103)        
 END        
 IF (@ToDt = '')        
 BEGIN        
  SET @StopDt = null--- (select convert(varchar, [dbo].[GETIST](), 8))        
 END        
 ELSE        
 BEGIN        
  SET @StopDt = CAST(@ToDt AS datetime)        
  --SET @StopDt = convert(datetime, @ToDt + ' 20:00:00.000', 103)        
 END        
        
 --  SELECT *,(finTbl.Total - finTbl.Offline) AS online FROM (        
 --   select distinct        
 --id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total,SUM(stopMin) AS Offline        
 --from (        
 --   SELECT DISTINCT        
 --  s.id,        
 --  s.deviceid as streamname,        
 --  b.district,        
 --  b.accode,        
 --  b.acname,        
 --  vs.name as ShiftName,        
 --  staff.name AS DriverName,        
 --  staff.contact_no AS DriverContactNo,        
 --  vs.starttime as ShiftStartTime,        
 --  vs.endtime as ShiftEndTime,        
 --  vd.Vehicle_No as VehicleNo,        
 --  CAST([csd].[OffLineStartTime] AS date) AS Dt,        
 --  --SUM(ISNULL(DATEDIFF(mi, [csd].[OffLineStartTime],csd.[OffLineStopTime]),0)) AS Offline        
 --  DATEDIFF(mi, [csd].[OffLineStartTime],CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) as stopMin        
 --  ,ABS(DATEDIFF(mi,vs.starttime,vs.endtime)) AS Total,        
 --  csd.OffLineStartTime as StartTime        
 --  --,[csd].[OffLineStartTime],CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END as OffLineStopTime        
 --   FROM vehicalDetail vd WITH(NOLOCK)         
 --  INNER JOIN streamlist s WITH(NOLOCK) ON s.id = vd.streamid        
 --  INNER JOIN booth b WITH (NOLOCK) ON s.id = b.streamid        
 --  INNER JOIN Vehicle_Staff_Mapping map WITH(NOLOCK) ON map.VehicleId = vd.vehicalId AND vd.isdeleted = 0 AND map.isdeleted=0        
 --  INNER JOIN Staff_Info staff WITH(NOLOCK) ON  map.StaffId = staff.id AND vd.isdeleted = 0 AND Type = 1         
 --  INNER JOIN vehicleshift vs WITH(NOLOCK) ON vs.id = map.ShiftId        
 --  LEFT JOIN [CameraStopDuration] csd WITH (NOLOCK) on csd.[streamname] = s.[streamname] AND csd.ShiftID = vs.id        
 --   WHERE        
 --  ((@FromDt = '' AND @ToDt = '') OR (csd.[OffLineStartTime] BETWEEN @StartDt AND @StopDt))        
 --  and ((@Internaldistrict='') OR (b.district=@Internaldistrict))        
 --  and ((@Internalaccode='') OR (b.accode=@Internalaccode))        
 --  and ((@Internalvehicleno='') OR (vd.Vehicle_No=@Internalvehicleno))        
 --  and ((@InternalShift='') OR (vs.name=@InternalShift))        
 -- ) tbl        
 --group by id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total) as finTbl        
 ----   GROUP BY [csd].[streamname], CAST([csd].[OffLineStartTime] AS date), vs.starttime,vs.endtime,s.deviceid,         
 ----   s.id,b.district, b.accode, b.acname, vs.name, staff.name, staff.contact_no, vd.Vehicle_No        
 ----) as TBL   
--OPTION (RECOMPILE)        
  IF OBJECT_ID(N'tempdb..#CameraStatus') IS NOT NULL        
    BEGIN        
    DROP TABLE #CameraStatus        
    END     
 CREATE TABLE #CameraStatus (id int,streamname varchar(200),district varchar(200),accode varchar(200),acname varchar(200),ShiftName varchar(200),DriverName varchar(200),DriverContactNo varchar(200),      
 ShiftStartTime varchar(200),ShiftEndTime varchar(200),PSNum nvarchar(200),VehicleNo nvarchar(200),Dt date,Total int,Offline int,online int)        
 insert into #CameraStatus      
 SELECT *, (FTBL.Total - FTBL.Offline) AS online FROM (        
  SELECT id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,PSNum,VehicleNo,Dt,Total,ISNULL(SUM(DiffMin),0) AS Offline FROM (        
   SELECT *, DATEDIFF(MINUTE, TBL.StartTime, TBL.StopTime ) AS DiffMin FROM (        
  --  SELECT         
  --   s.id,         
  --   s.streamname,         
  --   b.district,         
  --   b.accode,         
  --   b.acname,        
  --csd.OffLineStartTime as StartTime,        
  --   --csd.OffLineStopTime as StopTime,        
  --   --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,        
  --   csd.[OffLineStopTime] as StopTime,        
  --   '' as ShiftName,        
  --   @StartDt as ShiftStartTime,        
  --   @StopDt as ShiftEndTime,        
  --   b.[location] as VehicleNo,        
  --   @StartDt AS Dt,        
  --   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,        
  --   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin,     
      
      
       
  --   ISNULL(op.operatorName,'') AS DriverName,        
  --   ISNULL(op.operatorNumber,0) AS DriverContactNo,        
  --   ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59         
  --  FROM        
  --   [dbo].[streamlist] s        
  --   INNER JOIN [dbo].[booth] b ON s.id = b.streamid AND b.isdisplay = 0        
  --   LEFT JOIN [dbo].[operator_info] op ON op.id = b.operatorid        
  --   INNER JOIN [dbo].[CameraStopDuration] csd ON csd.streamname = s.streamname        
  --  WHERE ((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))        
  --   and ((@Internaldistrict='') OR (b.district=@Internaldistrict))        
  --   and ((@Internalaccode='') OR (b.accode=@Internalaccode))        
  --   and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))        
  --  UNION        
    SELECT         
     s.id,         
     s.streamname,         
     b.district,         
     b.accode,         
     b.acname,        
     --CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,        
     --csd.OffLineStopTime as StopTime,        
     --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,        
     --CASE WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt ELSE csd.[OffLineStopTime] END as StopTime,        
  CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,      
     CASE WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt
		WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() <= @StopDt THEN [dbo].[GETIST]()
		WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt
		ELSE csd.[OffLineStopTime] END as StopTime,  
     '' as ShiftName,        
     @StartDt as ShiftStartTime,        
     @StopDt as ShiftEndTime,        
   b.[PSNum] as [PSNum],        
   b.[location] as VehicleNo,        
     @StartDt AS Dt,        
     --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,        
     --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin, 




   ISNULL(op.operatorName,'') AS DriverName,        
     ISNULL(op.operatorNumber,0) AS DriverContactNo,        
     ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59         
    FROM        
     [dbo].[streamlist] s        
     INNER JOIN [dbo].[booth] b ON s.id = b.streamid        
     LEFT JOIN [dbo].[operator_info] op ON op.id = b.operatorid AND b.isdisplay = 1     
     INNER JOIN [dbo].[CameraStopDuration] csd ON csd.streamname = s.streamname        
    WHERE 
	--((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt)      
 --    OR (CASE WHEN csd.OffLineStopTime IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END BETWEEN @StartDt AND @StopDt))  
     --and 
	 ((@Internaldistrict='') OR (b.district=@Internaldistrict))        
     and ((@Internalaccode='') OR (b.accode=@Internalaccode))        
     and ((@Internalpsno='') OR (b.PSNum=@Internalpsno)) and ISNULL(isdelete,'')=0    
   ) AS TBL
   WHERE((@FromDt = '' AND @ToDt = '') 
		OR (StartTime >= ShiftStartTime AND StopTime <=ShiftEndTime AND StopTime > StartTime))
  ) AS TBL2        
  GROUP BY id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,PSNum,VehicleNo,Dt,Total        
 ) AS FTBL        
 ORDER BY  district,acname,streamname,Dt,ShiftName,ShiftStartTime       
      
 SELECT * FROM #CameraStatus      
 UNION      
 SELECT DISTINCT       
  s.id,         
   s.streamname,         
   b.district,         
   b.accode,         
   b.acname,        
   '' as ShiftName,        
   ISNULL(op.operatorName,'') AS DriverName,        
   ISNULL(op.operatorNumber,0) AS DriverContactNo,        
   --csd.OffLineStopTime as StopTime,        
   --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,        
   @StartDt as ShiftStartTime,        
   @StopDt as ShiftEndTime,        
   b.[PSNum] as [PSNum],        
   b.[location] as VehicleNo,        
   @StartDt AS Dt,        
   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,        
   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin,   




 
     
   ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total, --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59      
  0 AS Offline,      
  ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Online      
 FROM       
  [dbo].[streamlist] s        
     INNER JOIN [dbo].[booth] b ON s.id = b.streamid        
     LEFT JOIN [dbo].[operator_info] op ON op.id = b.operatorid AND b.isdisplay = 1      
  LEFT JOIN #CameraStatus cs WITH (NOLOCK) ON s.streamname = cs.streamname      
 WHERE       
 cs.streamname IS NULL AND      
 --((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))  and      
      ((@Internaldistrict='') OR (b.district=@Internaldistrict))        
     and ((@Internalaccode='') OR (b.accode=@Internalaccode))        
     and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))  and ISNULL(isdelete,'')=0    
 ORDER BY district,acname,streamname,Dt,ShiftName,ShiftStartTime       
 OPTION (RECOMPILE);  
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraStatusReport_20220219_1130AM]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC GetCameraStatusReport_20220219_1130AM '','','','2022-02-11 08:00:00','2022-02-11 20:00:00'      
CREATE PROCEDURE [dbo].[GetCameraStatusReport_20220219_1130AM]       
(      
 @district varchar(100) = ''      
 ,@accode varchar(100) = ''      
 ,@psnum varchar(100) = ''      
 ,@FromDt VARCHAR(30) = ''      
 ,@ToDt VARCHAR(30) = ''      
)      
AS      
BEGIN      
 DECLARE @StartDt DATETIME, @StopDt DATETIME, @Internaldistrict VARCHAR(100), @Internalaccode VARCHAR(100), @Internalpsno VARCHAR(100);      
 SET @Internaldistrict = @district      
 SET @Internalaccode = @accode      
 SET @Internalpsno = @psnum      
      
 --SET @ToDt = @FromDt      
 IF (@FromDt = '')      
 BEGIN      
  SET @StartDt = null      
 END      
 ELSE      
 BEGIN      
  SET @StartDt = CAST(@FromDt AS datetime)      
  --SET @StartDt = convert(datetime, @FromDt + ' 07:00:00.000', 103)      
 END      
 IF (@ToDt = '')      
 BEGIN      
  SET @StopDt = null      
 END      
 ELSE      
 BEGIN      
  SET @StopDt = CAST(@ToDt AS datetime)      
  --SET @StopDt = convert(datetime, @ToDt + ' 20:00:00.000', 103)      
 END      
      
 --  SELECT *,(finTbl.Total - finTbl.Offline) AS online FROM (      
 --   select distinct      
 --id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total,SUM(stopMin) AS Offline      
 --from (      
 --   SELECT DISTINCT      
 --  s.id,      
 --  s.deviceid as streamname,      
 --  b.district,      
 --  b.accode,      
 --  b.acname,      
 --  vs.name as ShiftName,      
 --  staff.name AS DriverName,      
 --  staff.contact_no AS DriverContactNo,      
 --  vs.starttime as ShiftStartTime,      
 --  vs.endtime as ShiftEndTime,      
 --  vd.Vehicle_No as VehicleNo,      
 --  CAST([csd].[OffLineStartTime] AS date) AS Dt,      
 --  --SUM(ISNULL(DATEDIFF(mi, [csd].[OffLineStartTime],csd.[OffLineStopTime]),0)) AS Offline      
 --  DATEDIFF(mi, [csd].[OffLineStartTime],CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) as stopMin      
 --  ,ABS(DATEDIFF(mi,vs.starttime,vs.endtime)) AS Total,      
 --  csd.OffLineStartTime as StartTime      
 --  --,[csd].[OffLineStartTime],CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END as OffLineStopTime      
 --   FROM vehicalDetail vd WITH(NOLOCK)       
 --  INNER JOIN streamlist s WITH(NOLOCK) ON s.id = vd.streamid      
 --  INNER JOIN booth b WITH (NOLOCK) ON s.id = b.streamid      
 --  INNER JOIN Vehicle_Staff_Mapping map WITH(NOLOCK) ON map.VehicleId = vd.vehicalId AND vd.isdeleted = 0 AND map.isdeleted=0      
 --  INNER JOIN Staff_Info staff WITH(NOLOCK) ON  map.StaffId = staff.id AND vd.isdeleted = 0 AND Type = 1       
 --  INNER JOIN vehicleshift vs WITH(NOLOCK) ON vs.id = map.ShiftId      
 --  LEFT JOIN [CameraStopDuration_20220219_1130AM] csd WITH (NOLOCK) on csd.[streamname] = s.[streamname] AND csd.ShiftID = vs.id      
 --   WHERE      
 --  ((@FromDt = '' AND @ToDt = '') OR (csd.[OffLineStartTime] BETWEEN @StartDt AND @StopDt))      
 --  and ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
 --  and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
 --  and ((@Internalvehicleno='') OR (vd.Vehicle_No=@Internalvehicleno))      
 --  and ((@InternalShift='') OR (vs.name=@InternalShift))      
 -- ) tbl      
 --group by id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total) as finTbl      
 ----   GROUP BY [csd].[streamname], CAST([csd].[OffLineStartTime] AS date), vs.starttime,vs.endtime,s.deviceid,       
 ----   s.id,b.district, b.accode, b.acname, vs.name, staff.name, staff.contact_no, vd.Vehicle_No      
 ----) as TBL      
 --OPTION (RECOMPILE)      
  IF OBJECT_ID(N'tempdb..#CameraStatus') IS NOT NULL      
    BEGIN      
    DROP TABLE #CameraStatus      
    END      
 CREATE TABLE #CameraStatus (id int,streamname varchar(200),district varchar(200),accode varchar(200),acname varchar(200),ShiftName varchar(200),DriverName varchar(200),DriverContactNo varchar(200),    
 ShiftStartTime varchar(200),ShiftEndTime varchar(200),VehicleNo varchar(200),Dt date,Total int,Offline int,online int)      
 insert into #CameraStatus    
 SELECT *, (FTBL.Total - FTBL.Offline) AS online FROM (      
  SELECT id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total,ISNULL(SUM(DiffMin),0) AS Offline FROM (      
   SELECT *, DATEDIFF(MINUTE, TBL.StartTime, TBL.StopTime ) AS DiffMin FROM (      
  --  SELECT       
  --   s.id,       
  --   s.streamname,       
  --   b.district,       
  --   b.accode,       
  --   b.acname,      
  --csd.OffLineStartTime as StartTime,      
  --   --csd.OffLineStopTime as StopTime,      
  --   --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,      
  --   csd.[OffLineStopTime] as StopTime,      
  --   '' as ShiftName,      
  --   @StartDt as ShiftStartTime,      
  --   @StopDt as ShiftEndTime,      
  --   b.[location] as VehicleNo,      
  --   @StartDt AS Dt,      
  --   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,      
  --   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin,   
  --   ISNULL(op.operatorName,'') AS DriverName,      
  --   ISNULL(op.operatorNumber,0) AS DriverContactNo,      
  --   ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59       
  --  FROM      
  --   [dbo].[streamlist] s      
  --   INNER JOIN [dbo].[booth] b ON s.id = b.streamid AND b.isdisplay = 0      
  --   LEFT JOIN [dbo].[operator_info] op ON op.id = b.operatorid      
  --   INNER JOIN [dbo].[CameraStopDuration_20220219_1130AM] csd ON csd.streamname = s.streamname      
  --  WHERE ((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))      
  --   and ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
  --   and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
  --   and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))      
  --  UNION      
    SELECT       
     s.id,       
     s.streamname,       
     b.district,       
     b.accode,       
     b.acname,      
     CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,      
     --csd.OffLineStopTime as StopTime,      
     --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,      
     CASE WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt ELSE csd.[OffLineStopTime] END as StopTime,      
     '' as ShiftName,      
     @StartDt as ShiftStartTime,      
     @StopDt as ShiftEndTime,      
     b.[location] as VehicleNo,      
     @StartDt AS Dt,      
     --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,      
     --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin, 
     ISNULL(op.operatorName,'') AS DriverName,      
     ISNULL(op.operatorNumber,0) AS DriverContactNo,      
     ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59       
    FROM      
     [dbo].[streamlist] s      
     INNER JOIN [dbo].[booth] b ON s.id = b.streamid      
     LEFT JOIN [dbo].[operator_info] op ON op.id = b.operatorid AND b.isdisplay = 1   
     INNER JOIN [dbo].[CameraStopDuration_20220219_1130AM] csd ON csd.streamname = s.streamname      
    WHERE ((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt)  
   OR (csd.OffLineStartTime < @StartDt AND csd.OffLineStopTime > @StartDt)  
   OR (csd.OffLineStartTime < @StopDt AND csd.OffLineStopTime > @StopDt))      
     and ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
     and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
     and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))      
   ) AS TBL      
  ) AS TBL2      
  GROUP BY id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total      
 ) AS FTBL      
 ORDER BY district,acname,streamname,Dt,ShiftName,ShiftStartTime    
    
 SELECT * FROM #CameraStatus    
 UNION    
 SELECT DISTINCT     
  s.id,       
   s.streamname,       
   b.district,       
   b.accode,       
   b.acname,      
   '' as ShiftName,      
   ISNULL(op.operatorName,'') AS DriverName,      
   ISNULL(op.operatorNumber,0) AS DriverContactNo,      
   --csd.OffLineStopTime as StopTime,      
   --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,      
   @StartDt as ShiftStartTime,      
   @StopDt as ShiftEndTime,      
   b.[location] as VehicleNo,      
   @StartDt AS Dt,      
   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,      
   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin,  
   
   ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total, --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59    
  0 AS Offline,    
  ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Online    
 FROM     
  [dbo].[streamlist] s      
     INNER JOIN [dbo].[booth] b ON s.id = b.streamid      
     LEFT JOIN [dbo].[operator_info] op ON op.id = b.operatorid AND b.isdisplay = 1    
  LEFT JOIN #CameraStatus cs WITH (NOLOCK) ON s.streamname = cs.streamname    
 WHERE     
 cs.streamname IS NULL AND    
 --((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))  and    
      ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
     and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
     and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))    
 ORDER BY district,acname,streamname,Dt,ShiftName,ShiftStartTime    
 OPTION (RECOMPILE);      
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraStatusReport2]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
  
  
  
  
CREATE PROCEDURE [dbo].[GetCameraStatusReport2]   
(  
 @district varchar(100) = ''  
 ,@accode varchar(100) = ''  
 ,@vehicleno varchar(100) = ''  
 ,@FromDt VARCHAR(30) = ''  
 ,@ToDt VARCHAR(30) = ''  
 ,@Shift VARCHAR(30) = ''  
)  
AS  
BEGIN  
 DECLARE @StartDt DATETIME, @StopDt DATETIME, @Internaldistrict VARCHAR(100), @Internalaccode VARCHAR(100), @Internalvehicleno VARCHAR(100), @InternalShift VARCHAR(100);  
 SET @Internaldistrict = @district  
 SET @Internalaccode = @accode  
 SET @Internalvehicleno = @vehicleno  
 SET @InternalShift = @Shift  
  
 IF (@FromDt = '')  
 BEGIN  
  SET @StartDt = null  
 END  
 ELSE  
 BEGIN  
  SET @StartDt = convert(datetime, @FromDt + ' 00:00:00', 103)  
 END  
 IF (@ToDt = '')  
 BEGIN  
  SET @StopDt = null  
 END  
 ELSE  
 BEGIN  
  SET @StopDt = convert(datetime, @ToDt + ' 23:59:59', 103)  
 END  
  
 --  SELECT *,(finTbl.Total - finTbl.Offline) AS online FROM (  
 --   select distinct  
 --id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total,SUM(stopMin) AS Offline  
 --from (  
 --   SELECT DISTINCT  
 --  s.id,  
 --  s.deviceid as streamname,  
 --  b.district,  
 --  b.accode,  
 --  b.acname,  
 --  vs.name as ShiftName,  
 --  staff.name AS DriverName,  
 --  staff.contact_no AS DriverContactNo,  
 --  vs.starttime as ShiftStartTime,  
 --  vs.endtime as ShiftEndTime,  
 --  vd.Vehicle_No as VehicleNo,  
 --  CAST([csd].[OffLineStartTime] AS date) AS Dt,  
 --  --SUM(ISNULL(DATEDIFF(mi, [csd].[OffLineStartTime],csd.[OffLineStopTime]),0)) AS Offline  
 --  DATEDIFF(mi, [csd].[OffLineStartTime],CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) as stopMin  
 --  ,ABS(DATEDIFF(mi,vs.starttime,vs.endtime)) AS Total,  
 --  csd.OffLineStartTime as StartTime  
 --  --,[csd].[OffLineStartTime],CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END as OffLineStopTime  
 --   FROM vehicalDetail vd WITH(NOLOCK)   
 --  INNER JOIN streamlist s WITH(NOLOCK) ON s.id = vd.streamid  
 --  INNER JOIN booth b WITH (NOLOCK) ON s.id = b.streamid  
 --  INNER JOIN Vehicle_Staff_Mapping map WITH(NOLOCK) ON map.VehicleId = vd.vehicalId AND vd.isdeleted = 0 AND map.isdeleted=0  
 --  INNER JOIN Staff_Info staff WITH(NOLOCK) ON  map.StaffId = staff.id AND vd.isdeleted = 0 AND Type = 1   
 --  INNER JOIN vehicleshift vs WITH(NOLOCK) ON vs.id = map.ShiftId  
 --  LEFT JOIN [CameraStopDuration] csd WITH (NOLOCK) on csd.[streamname] = s.[streamname] AND csd.ShiftID = vs.id  
 --   WHERE  
 --  ((@FromDt = '' AND @ToDt = '') OR (csd.[OffLineStartTime] BETWEEN @StartDt AND @StopDt))  
 --  and ((@Internaldistrict='') OR (b.district=@Internaldistrict))  
 --  and ((@Internalaccode='') OR (b.accode=@Internalaccode))  
 --  and ((@Internalvehicleno='') OR (vd.Vehicle_No=@Internalvehicleno))  
 --  and ((@InternalShift='') OR (vs.name=@InternalShift))  
 -- ) tbl  
 --group by id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total) as finTbl  
 ----   GROUP BY [csd].[streamname], CAST([csd].[OffLineStartTime] AS date), vs.starttime,vs.endtime,s.deviceid,   
 ----   s.id,b.district, b.accode, b.acname, vs.name, staff.name, staff.contact_no, vd.Vehicle_No  
 ----) as TBL  
 --OPTION (RECOMPILE)  
  
 SELECT *, (FTBL.Total - FTBL.Offline) AS online FROM (  
  SELECT id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total,SUM(DiffMin) AS Offline FROM (  
   SELECT *, DATEDIFF(MINUTE, TBL.StartTime, TBL.StopTime ) AS DiffMin FROM (  
    SELECT DISTINCT   
     s.id,   
     s.streamname,   
     b.district,   
     b.accode,   
     b.acname,  
     csd.OffLineStartTime as StartTime,  
     --csd.OffLineStopTime as StopTime,  
     --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,  
     CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN(CASE WHEN map.LastEditedOn < csd.[OffLineStopTime] THEN map.LastEditedOn ELSE csd.[OffLineStopTime] END) ELSE csd.[OffLineStopTime] END END as StopTime,  
     vs.name as ShiftName,  
     vs.starttime as ShiftStartTime,  
     vs.endtime as ShiftEndTime,  
     vd.Vehicle_No as VehicleNo,  
     map.AssignDate AS Dt,  
     --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,  
     --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin,
  
     staff.name AS DriverName,  
     staff.contact_no AS DriverContactNo,  
     ABS(DATEDIFF(mi,vs.starttime,vs.endtime)) AS Total  
    FROM   
     [dbo].[vehicalDetail] vd WITH (NOLOCK)  
     INNER JOIN [dbo].[Vehicle_Staff_Mapping] map WITH (NOLOCK) ON vd.vehicalId = map.VehicleId  
     INNER JOIN [dbo].[streamlist] s WITH (NOLOCK) ON vd.streamid = s.id  
     INNER JOIN [dbo].[booth] b WITH (NOLOCK) ON b.streamid = vd.streamid  
     INNER JOIN [dbo].[CameraStopDuration] csd WITH (NOLOCK) ON s.streamname = csd.streamname AND map.AssignDate = CAST(csd.OffLineStartTime AS date)  
     INNER JOIN [dbo].[vehicleshift] vs WITH (NOLOCK) ON map.ShiftId = vs.id  
     INNER JOIN [dbo].[Staff_Info] staff WITH(NOLOCK) ON  map.StaffId = staff.id AND Type = 1   
    WHERE (map.AddedOn = map.LastEditedOn OR (csd.OffLineStartTime > map.AddedOn AND csd.OffLineStartTime < map.LastEditedOn)) AND  
     ((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))  
     and ((@Internaldistrict='') OR (b.district=@Internaldistrict))  
     and ((@Internalaccode='') OR (b.accode=@Internalaccode))  
     and ((@Internalvehicleno='') OR (vd.Vehicle_No=@Internalvehicleno))  
     and ((@InternalShift='') OR (vs.name=@InternalShift))  
   ) AS TBL  
  ) AS TBL2  
  GROUP BY id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total  
 ) AS FTBL  
 OPTION (RECOMPILE);  
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraStatusReport593]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC GetCameraStatusReport593 '','','','2022-02-20 08:00:00','2022-02-20 20:00:00'        
CREATE PROCEDURE [dbo].[GetCameraStatusReport593]         
(        
 @district varchar(100) = ''        
 ,@accode varchar(100) = ''        
 ,@psnum varchar(100) = ''        
 ,@FromDt VARCHAR(30) = ''        
 ,@ToDt VARCHAR(30) = ''        
)        
AS        
BEGIN        
 DECLARE @StartDt DATETIME, @StopDt DATETIME, @Internaldistrict VARCHAR(100), @Internalaccode VARCHAR(100), @Internalpsno VARCHAR(100);        
 SET @Internaldistrict = @district        
 SET @Internalaccode = @accode        
 SET @Internalpsno = @psnum        
        
 --SET @ToDt = @FromDt        
 IF (@FromDt = '')        
 BEGIN        
  SET @StartDt = null        
 END        
 ELSE        
 BEGIN        
  SET @StartDt = CAST(@FromDt AS datetime)        
  --SET @StartDt = convert(datetime, @FromDt + ' 07:00:00.000', 103)        
 END        
 IF (@ToDt = '')        
 BEGIN        
  SET @StopDt = null        
 END        
 ELSE        
 BEGIN        
  SET @StopDt = CAST(@ToDt AS datetime)        
  --SET @StopDt = convert(datetime, @ToDt + ' 20:00:00.000', 103)        
 END        
        
 --  SELECT *,(finTbl.Total - finTbl.Offline) AS online FROM (        
 --   select distinct        
 --id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total,SUM(stopMin) AS Offline        
 --from (        
 --   SELECT DISTINCT        
 --  s.id,        
 --  s.deviceid as streamname,        
 --  b.district,        
 --  b.accode,        
 --  b.acname,        
 --  vs.name as ShiftName,        
 --  staff.name AS DriverName,        
 --  staff.contact_no AS DriverContactNo,        
 --  vs.starttime as ShiftStartTime,        
 --  vs.endtime as ShiftEndTime,        
 --  vd.Vehicle_No as VehicleNo,        
 --  CAST([csd].[OffLineStartTime] AS date) AS Dt,        
 --  --SUM(ISNULL(DATEDIFF(mi, [csd].[OffLineStartTime],csd.[OffLineStopTime]),0)) AS Offline        
 --  DATEDIFF(mi, [csd].[OffLineStartTime],CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) as stopMin        
 --  ,ABS(DATEDIFF(mi,vs.starttime,vs.endtime)) AS Total,        
 --  csd.OffLineStartTime as StartTime        
 --  --,[csd].[OffLineStartTime],CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END as OffLineStopTime        
 --   FROM vehicalDetail vd WITH(NOLOCK)         
 --  INNER JOIN streamlist s WITH(NOLOCK) ON s.id = vd.streamid        
 --  INNER JOIN booth b WITH (NOLOCK) ON s.id = b.streamid        
 --  INNER JOIN Vehicle_Staff_Mapping map WITH(NOLOCK) ON map.VehicleId = vd.vehicalId AND vd.isdeleted = 0 AND map.isdeleted=0        
 --  INNER JOIN Staff_Info staff WITH(NOLOCK) ON  map.StaffId = staff.id AND vd.isdeleted = 0 AND Type = 1         
 --  INNER JOIN vehicleshift vs WITH(NOLOCK) ON vs.id = map.ShiftId        
 --  LEFT JOIN [CSD] csd WITH (NOLOCK) on csd.[streamname] = s.[streamname] AND csd.ShiftID = vs.id        
 --   WHERE        
 --  ((@FromDt = '' AND @ToDt = '') OR (csd.[OffLineStartTime] BETWEEN @StartDt AND @StopDt))        
 --  and ((@Internaldistrict='') OR (b.district=@Internaldistrict))        
 --  and ((@Internalaccode='') OR (b.accode=@Internalaccode))        
 --  and ((@Internalvehicleno='') OR (vd.Vehicle_No=@Internalvehicleno))        
 --  and ((@InternalShift='') OR (vs.name=@InternalShift))        
 -- ) tbl        
 --group by id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total) as finTbl        
 ----   GROUP BY [csd].[streamname], CAST([csd].[OffLineStartTime] AS date), vs.starttime,vs.endtime,s.deviceid,         
 ----   s.id,b.district, b.accode, b.acname, vs.name, staff.name, staff.contact_no, vd.Vehicle_No        
 ----) as TBL   
--OPTION (RECOMPILE)        
  IF OBJECT_ID(N'tempdb..#CameraStatus') IS NOT NULL        
    BEGIN        
    DROP TABLE #CameraStatus        
    END     
 CREATE TABLE #CameraStatus (id int,streamname varchar(200),district varchar(200),accode varchar(200),acname varchar(200),ShiftName varchar(200),DriverName varchar(200),DriverContactNo varchar(200),      
 ShiftStartTime varchar(200),ShiftEndTime varchar(200),VehicleNo varchar(200),Dt date,Total int,Offline int,online int)        
 insert into #CameraStatus      
 SELECT *, (FTBL.Total - FTBL.Offline) AS online FROM (        
  SELECT id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total,ISNULL(SUM(DiffMin),0) AS Offline FROM (        
   SELECT *, DATEDIFF(MINUTE, TBL.StartTime, TBL.StopTime ) AS DiffMin FROM (        
  --  SELECT         
  --   s.id,         
  --   s.streamname,         
  --   b.district,         
  --   b.accode,         
  --   b.acname,        
  --csd.OffLineStartTime as StartTime,        
  --   --csd.OffLineStopTime as StopTime,        
  --   --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,        
  --   csd.[OffLineStopTime] as StopTime,        
  --   '' as ShiftName,        
  --   @StartDt as ShiftStartTime,        
  --   @StopDt as ShiftEndTime,        
  --   b.[location] as VehicleNo,        
  --   @StartDt AS Dt,        
  --   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,        
  --   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin,     
      
      
       
  --   ISNULL(op.operatorName,'') AS DriverName,        
  --   ISNULL(op.operatorNumber,0) AS DriverContactNo,        
  --   ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59         
  --  FROM        
  --   [dbo].[streamlist] s        
  --   INNER JOIN [dbo].[booth] b ON s.id = b.streamid AND b.isdisplay = 0        
  --   LEFT JOIN [dbo].[operator_info] op ON op.id = b.operatorid        
  --   INNER JOIN [dbo].[CSD] csd ON csd.streamname = s.streamname        
  --  WHERE ((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))        
  --   and ((@Internaldistrict='') OR (b.district=@Internaldistrict))        
  --   and ((@Internalaccode='') OR (b.accode=@Internalaccode))        
  --   and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))        
  --  UNION        
    SELECT         
     s.id,         
     s.streamname,         
     b.district,         
     b.accode,         
     b.acname,        
     --CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,        
     --csd.OffLineStopTime as StopTime,        
     --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,        
     --CASE WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt ELSE csd.[OffLineStopTime] END as StopTime,        
  CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,      
     CASE WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt
		WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() <= @StopDt THEN [dbo].[GETIST]()
		WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt
		ELSE csd.[OffLineStopTime] END as StopTime,  
     '' as ShiftName,        
     @StartDt as ShiftStartTime,        
     @StopDt as ShiftEndTime,        
   b.[location] as VehicleNo,        
     @StartDt AS Dt,        
     --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,        
     --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin, 



   ISNULL(op.operatorName,'') AS DriverName,        
     ISNULL(op.operatorNumber,0) AS DriverContactNo,        
     ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59         
    FROM        
     [dbo].[streamlist] s        
     INNER JOIN [dbo].[booth] b ON s.id = b.streamid        
     LEFT JOIN [dbo].[operator_info] op ON op.id = b.operatorid AND b.isdisplay = 1     
     INNER JOIN [dbo].[CSD] csd ON csd.streamname = s.streamname
	 INNER JOIN ##test t on t.did = csd.streamname
    WHERE 
	--((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt)      
 --    OR (CASE WHEN csd.OffLineStopTime IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END BETWEEN @StartDt AND @StopDt))  
     --and 
	 ((@Internaldistrict='') OR (b.district=@Internaldistrict))        
     and ((@Internalaccode='') OR (b.accode=@Internalaccode))        
     and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))        
   ) AS TBL
   WHERE((@FromDt = '' AND @ToDt = '') 
		OR (StartTime >= ShiftStartTime AND StopTime <=ShiftEndTime AND StopTime > StartTime))
  ) AS TBL2        
  GROUP BY id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total        
 ) AS FTBL        
 ORDER BY district,acname,streamname,Dt,ShiftName,ShiftStartTime      
      
 SELECT * FROM #CameraStatus      
 --UNION      
 --SELECT DISTINCT       
 -- s.id,         
 --  s.streamname,         
 --  b.district,         
 --  b.accode,         
 --  b.acname,        
 --  '' as ShiftName,        
 --  ISNULL(op.operatorName,'') AS DriverName,        
 --  ISNULL(op.operatorNumber,0) AS DriverContactNo,        
 --  --csd.OffLineStopTime as StopTime,        
 --  --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,        
 --  @StartDt as ShiftStartTime,        
 --  @StopDt as ShiftEndTime,        
 --  b.[location] as VehicleNo,        
 --  @StartDt AS Dt,        
 --  --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,        
 --  --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin,   



 
     
 --  ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total, --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59      
 -- 0 AS Offline,      
 -- ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Online      
 --FROM       
 -- [dbo].[streamlist] s        
 --    INNER JOIN [dbo].[booth] b ON s.id = b.streamid        
 --    LEFT JOIN [dbo].[operator_info] op ON op.id = b.operatorid AND b.isdisplay = 1      
 -- LEFT JOIN #CameraStatus cs WITH (NOLOCK) ON s.streamname = cs.streamname      
 --WHERE       
 --cs.streamname IS NULL AND      
 ----((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))  and      
 --     ((@Internaldistrict='') OR (b.district=@Internaldistrict))        
 --    and ((@Internalaccode='') OR (b.accode=@Internalaccode))        
 --    and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))      
 ORDER BY district,acname,streamname,Dt,ShiftName,ShiftStartTime      
 OPTION (RECOMPILE);  
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraStatusReportFinal]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC GetCameraStatusReport '','','','2022-02-11 08:00:00','2022-02-11 20:00:00'        
CREATE PROCEDURE [dbo].[GetCameraStatusReportFinal]         
(        
 @district varchar(100) = ''        
 ,@accode varchar(100) = ''        
 ,@psnum varchar(100) = ''        
 ,@FromDt VARCHAR(30) = ''        
 ,@ToDt VARCHAR(30) = ''        
)        
AS        
BEGIN        
 DECLARE @StartDt DATETIME, @StopDt DATETIME, @Internaldistrict VARCHAR(100), @Internalaccode VARCHAR(100), @Internalpsno VARCHAR(100);        
 SET @Internaldistrict = @district        
 SET @Internalaccode = @accode        
 SET @Internalpsno = @psnum        
        
 --SET @ToDt = @FromDt        
 IF (@FromDt = '')        
 BEGIN        
  SET @StartDt = null        
 END        
 ELSE        
 BEGIN        
  SET @StartDt = CAST(@FromDt AS datetime)        
  --SET @StartDt = convert(datetime, @FromDt + ' 07:00:00.000', 103)        
 END        
 IF (@ToDt = '')        
 BEGIN        
  SET @StopDt = null        
 END        
 ELSE        
 BEGIN        
  SET @StopDt = CAST(@ToDt AS datetime)        
  --SET @StopDt = convert(datetime, @ToDt + ' 20:00:00.000', 103)        
 END        
        
 --  SELECT *,(finTbl.Total - finTbl.Offline) AS online FROM (        
 --   select distinct        
 --id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total,SUM(stopMin) AS Offline        
 --from (        
 --   SELECT DISTINCT        
 --  s.id,        
 --  s.deviceid as streamname,        
 --  b.district,        
 --  b.accode,        
 --  b.acname,        
 --  vs.name as ShiftName,        
 --  staff.name AS DriverName,        
 --  staff.contact_no AS DriverContactNo,        
 --  vs.starttime as ShiftStartTime,        
 --  vs.endtime as ShiftEndTime,        
 --  vd.Vehicle_No as VehicleNo,        
 --  CAST([csd].[OffLineStartTime] AS date) AS Dt,        
 --  --SUM(ISNULL(DATEDIFF(mi, [csd].[OffLineStartTime],csd.[OffLineStopTime]),0)) AS Offline        
 --  DATEDIFF(mi, [csd].[OffLineStartTime],CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) as stopMin        
 --  ,ABS(DATEDIFF(mi,vs.starttime,vs.endtime)) AS Total,        
 --  csd.OffLineStartTime as StartTime        
 --  --,[csd].[OffLineStartTime],CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END as OffLineStopTime        
 --   FROM vehicalDetail vd WITH(NOLOCK)         
 --  INNER JOIN streamlist s WITH(NOLOCK) ON s.id = vd.streamid        
 --  INNER JOIN booth b WITH (NOLOCK) ON s.id = b.streamid        
 --  INNER JOIN Vehicle_Staff_Mapping map WITH(NOLOCK) ON map.VehicleId = vd.vehicalId AND vd.isdeleted = 0 AND map.isdeleted=0        
 --  INNER JOIN Staff_Info staff WITH(NOLOCK) ON  map.StaffId = staff.id AND vd.isdeleted = 0 AND Type = 1         
 --  INNER JOIN vehicleshift vs WITH(NOLOCK) ON vs.id = map.ShiftId        
 --  LEFT JOIN [CameraStopDuration] csd WITH (NOLOCK) on csd.[streamname] = s.[streamname] AND csd.ShiftID = vs.id        
 --   WHERE        
 --  ((@FromDt = '' AND @ToDt = '') OR (csd.[OffLineStartTime] BETWEEN @StartDt AND @StopDt))        
 --  and ((@Internaldistrict='') OR (b.district=@Internaldistrict))        
 --  and ((@Internalaccode='') OR (b.accode=@Internalaccode))        
 --  and ((@Internalvehicleno='') OR (vd.Vehicle_No=@Internalvehicleno))        
 --  and ((@InternalShift='') OR (vs.name=@InternalShift))        
 -- ) tbl        
 --group by id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total) as finTbl        
 ----   GROUP BY [csd].[streamname], CAST([csd].[OffLineStartTime] AS date), vs.starttime,vs.endtime,s.deviceid,         
 ----   s.id,b.district, b.accode, b.acname, vs.name, staff.name, staff.contact_no, vd.Vehicle_No        
 ----) as TBL        
--OPTION (RECOMPILE)        
  IF OBJECT_ID(N'tempdb..#CameraStatus') IS NOT NULL        
    BEGIN        
    DROP TABLE #CameraStatus        
    END     
 CREATE TABLE #CameraStatus (id int,streamname varchar(200),district varchar(200),accode varchar(200),acname varchar(200),ShiftName varchar(200),DriverName varchar(200),DriverContactNo varchar(200),      
 ShiftStartTime varchar(200),ShiftEndTime varchar(200),VehicleNo varchar(200),Dt date,Total int,Offline int,online int)        
 insert into #CameraStatus      
 SELECT *, (FTBL.Total - FTBL.Offline) AS online FROM (        
  SELECT id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total,ISNULL(SUM(DiffMin),0) AS Offline FROM (        
   SELECT *, DATEDIFF(MINUTE, TBL.StartTime, TBL.StopTime ) AS DiffMin FROM (        
  --  SELECT         
  --   s.id,         
  --   s.streamname,         
  --   b.district,         
  --   b.accode,         
  --   b.acname,        
  --csd.OffLineStartTime as StartTime,        
  --   --csd.OffLineStopTime as StopTime,        
  --   --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,        
  --   csd.[OffLineStopTime] as StopTime,        
  --   '' as ShiftName,        
  --   @StartDt as ShiftStartTime,        
  --   @StopDt as ShiftEndTime,        
  --   b.[location] as VehicleNo,        
  --   @StartDt AS Dt,        
  --   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,        
  --   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin,     
      
      
       
  --   ISNULL(op.operatorName,'') AS DriverName,        
  --   ISNULL(op.operatorNumber,0) AS DriverContactNo,        
  --   ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59         
  --  FROM        
  --   [dbo].[streamlist] s        
  --   INNER JOIN [dbo].[booth] b ON s.id = b.streamid AND b.isdisplay = 0        
  --   LEFT JOIN [dbo].[operator_info] op ON op.id = b.operatorid        
  --   INNER JOIN [dbo].[CameraStopDuration] csd ON csd.streamname = s.streamname        
  --  WHERE ((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))        
  --   and ((@Internaldistrict='') OR (b.district=@Internaldistrict))        
  --   and ((@Internalaccode='') OR (b.accode=@Internalaccode))        
  --   and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))        
  --  UNION        
    SELECT         
     s.id,         
     s.streamname,         
     b.district,         
     b.accode,         
     b.acname,        
     --CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,        
     --csd.OffLineStopTime as StopTime,        
     --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,        
     --CASE WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt ELSE csd.[OffLineStopTime] END as StopTime,        
  CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt ELSE csd.OffLineStartTime END as StartTime,      
     CASE WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt
		WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() <= @StopDt THEN [dbo].[GETIST]()
		WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt
		ELSE csd.[OffLineStopTime] END as StopTime,  
     '' as ShiftName,        
     @StartDt as ShiftStartTime,        
     @StopDt as ShiftEndTime,        
     b.[location] as VehicleNo,        
     @StartDt AS Dt,        
     --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,        
     --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin, 


   ISNULL(op.operatorName,'') AS DriverName,        
     ISNULL(op.operatorNumber,0) AS DriverContactNo,        
     ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59         
    FROM        
     [dbo].[streamlist] s        
     INNER JOIN [dbo].[booth] b ON s.id = b.streamid        
     LEFT JOIN [dbo].[operator_info] op ON op.id = b.operatorid AND b.isdisplay = 1     
     INNER JOIN [dbo].[CameraStopDuration] csd ON csd.streamname = s.streamname        
    WHERE 
	--((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt)      
 --    OR (CASE WHEN csd.OffLineStopTime IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END BETWEEN @StartDt AND @StopDt))  
     --and 
	 ((@Internaldistrict='') OR (b.district=@Internaldistrict))        
     and ((@Internalaccode='') OR (b.accode=@Internalaccode))        
     and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))        
   ) AS TBL
   WHERE((@FromDt = '' AND @ToDt = '') 
		OR (StartTime >= ShiftStartTime AND StopTime <=ShiftEndTime AND StopTime > StartTime))
  ) AS TBL2        
  GROUP BY id,streamname,district,accode,acname,ShiftName,DriverName,DriverContactNo,ShiftStartTime,ShiftEndTime,VehicleNo,Dt,Total        
 ) AS FTBL        
 ORDER BY district,acname,streamname,Dt,ShiftName,ShiftStartTime      
      
 SELECT * FROM #CameraStatus      
 UNION      
 SELECT DISTINCT       
  s.id,         
   s.streamname,         
   b.district,         
   b.accode,         
   b.acname,        
   '' as ShiftName,        
   ISNULL(op.operatorName,'') AS DriverName,        
   ISNULL(op.operatorNumber,0) AS DriverContactNo,        
   --csd.OffLineStopTime as StopTime,        
   --CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END as StopTime,        
   @StartDt as ShiftStartTime,        
   @StopDt as ShiftEndTime,        
   b.[location] as VehicleNo,        
   @StartDt AS Dt,        
   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE csd.[OffLineStopTime] END) AS DiffMin,        
   --DATEDIFF(MINUTE, csd.OffLineStartTime, CASE WHEN csd.[OffLineStopTime] IS NULL THEN [dbo].[GETIST]() ELSE CASE WHEN map.AddedOn != map.LastEditedOn THEN LEAST(map.LastEditedOn ,csd.[OffLineStopTime]) ELSE csd.[OffLineStopTime] END END) AS DiffMin,   


 
     
   ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Total, --THIS RESULTS IN TO -1 WHEN CAMERA IS OFFLINE FOR 24 HRS DUE TO SHIFT TIMIMGS OF 0:00 TO 23:59      
  0 AS Offline,      
  ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Online      
 FROM       
  [dbo].[streamlist] s        
     INNER JOIN [dbo].[booth] b ON s.id = b.streamid        
     LEFT JOIN [dbo].[operator_info] op ON op.id = b.operatorid AND b.isdisplay = 1      
  LEFT JOIN #CameraStatus cs WITH (NOLOCK) ON s.streamname = cs.streamname      
 WHERE       
 cs.streamname IS NULL AND      
 --((@FromDt = '' AND @ToDt = '') OR (csd.OffLineStartTime BETWEEN @StartDt AND @StopDt))  and      
      ((@Internaldistrict='') OR (b.district=@Internaldistrict))        
     and ((@Internalaccode='') OR (b.accode=@Internalaccode))        
     and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))      
 ORDER BY district,acname,streamname,Dt,ShiftName,ShiftStartTime      
 OPTION (RECOMPILE);        
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraStatusReportOLD]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXEC [dbo].[GetCameraStatusReport] '','','','',''
CREATE PROCEDURE [dbo].[GetCameraStatusReportOLD] 
(
	@district varchar(100) = ''
	,@accode varchar(100) = ''
	,@vehicleno varchar(100) = ''
	,@FromDt VARCHAR(30) = ''
	,@ToDt VARCHAR(30) = ''
)
AS
BEGIN

	DECLARE @today DATE
	SET @today = CONVERT(DATE, SWITCHOFFSET(GETDATE(), '+05:30'))

	DECLARE @StartDt DATETIME, @StopDt DATETIME

	IF (@FromDt = '')
	BEGIN
		SET @StartDt = null
	END
	ELSE
	BEGIN
		SET @StartDt = convert(datetime, @FromDt + ' 00:00:00', 103)
	END
	IF (@ToDt = '')
	BEGIN
		SET @StopDt = null
	END
	ELSE
	BEGIN
		SET @StopDt = convert(datetime, @ToDt + ' 23:59:59', 103)
	END

	select
	s.id,
	s.deviceid as streamname,
	b.district,
	b.accode,
	b.acname,
	vs.name as ShiftName,
	staff.name AS DriverName,
	staff.contact_no AS DriverContactNo,
	vs.starttime as ShiftStartTime,
	vs.endtime as ShiftEndTime,
	vd.Vehicle_No as VehicleNo,
	CAST(SWITCHOFFSET(cs.lastupdated, '+05:30') AS date) AS Dt,
	COUNT(cs.Status) AS Total,
	SUM(CASE WHEN cs.Status = 'RUNNING' THEN 1 ELSE 0 END) AS Online,
	SUM(CASE WHEN cs.Status = 'STOPPED' THEN 1 ELSE 0 END) AS Offline
	from booth b WITH (NOLOCK)
	inner join streamlist s WITH (NOLOCK) on s.id=b.streamid
	inner join CameraStatus cs WITH (NOLOCK) on cs.CameraID = s.deviceid
	inner join vehicleshift vs WITH (NOLOCK) on vs.id = cs.ShiftID
	inner join vehicalDetail vd WITH (NOLOCK) on vd.streamid = s.id
	inner join Vehicle_Staff_Mapping mapping WITH (NOLOCK) on mapping.VehicleId = vd.vehicalId AND mapping.AssignDate = CONVERT(DATE, SWITCHOFFSET(cs.lastupdated, '+05:30')) 
	inner join Staff_Info staff WITH (NOLOCK) on mapping.StaffId = staff.Id AND staff.Type = 1
	WHERE
	((@FromDt = '' AND @ToDt = '') OR (cs.lastupdated BETWEEN @StartDt AND @StopDt))
	and ((@district='') OR (b.district=@district))
	and ((@accode='') OR (b.accode=@accode))
	and ((@vehicleno='') OR (vd.Vehicle_No=@vehicleno))
	group by s.id,s.deviceid,b.district,b.accode,b.acname,vs.name, staff.name, staff.contact_no, vs.starttime, vs.endtime, vd.Vehicle_No, CAST(SWITCHOFFSET(cs.lastupdated, '+05:30') AS date)
	--OPTION (OPTIMIZE FOR (@vehicleno = 'PB01AV0001',@accode = '1', @district = '01-PATHANKOT', @FromDt = '10/02/2022', @ToDt = '10/02/2022'))
	ORDER BY vd.Vehicle_No
END
GO
/****** Object:  StoredProcedure [dbo].[GetCameraStatusReportStatic]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCameraStatusReportStatic]           
(          
 @district varchar(100) = ''          
 ,@AcName varchar(100) = ''  
 ,@Date varchar(50)=''  
)          
AS          
BEGIN   
 --SELECT  ID as ID,District as District,Assembly  as acname,PsNo as PSNum,Location as VehicleNo,  
 --OperatorName as DriverName,CameraDID as streamname,Date as Dt,  CONVERT(VARCHAR(5),CONVERT(DATETIME, Total, 0), 108) as Total,  
 --CONVERT(VARCHAR(5),CONVERT(DATETIME, Online, 0), 108) as Online,  CONVERT(VARCHAR(5),CONVERT(DATETIME, Offline, 0), 108) as Offline  

 SELECT  ID as ID,District as District,Assembly  as acname,PsNo as PSNum,Location as VehicleNo,  
 OperatorName as DriverName,CameraDID as streamname,Date as Dt,   Total,  
Online, Offline 
 FROM CameraStatusStaticRpt     
  where  ((@district='') OR (District=@district))          
     and ((@AcName='') OR (Assembly=@AcName))   
  and Date=@Date  
 ORDER BY ID,District,Acname     
END
GO
/****** Object:  StoredProcedure [dbo].[GetColumnName]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetColumnName]  -- Offline  
(    
@flag char(20),  
@UpdatedBy varchar(100)='',  
@ColumnName varchar(100)='',  
@IsActive bit='', 
@IsStatusActive bit='' 
)    
AS    
BEGIN    
Declare @Msg varchar(200)  
IF(@flag='Offline')    
BEGIN    
SELECT  ID, ColumnName, IsActive 
FROM   OfflineColumnName   
END    
IF(@flag='OfflineUpdate')  
BEGIN  
UPDATE OfflineColumnName SET IsActive =@IsActive,UpdatedBy=@UpdatedBy,UpdatedDate=[dbo].[GETIST]()  
WHERE ColumnName=@ColumnName  
SET @Msg='Updated'  
SELECT @Msg  
END  
IF(@flag='Status')  
BEGIN  
SELECT  ID, ColumnName, IsStatusActive 
FROM   OfflineColumnName 
END  
IF(@flag='StatusUpdate')
BEGIN
UPDATE OfflineColumnName SET IsStatusActive =@IsStatusActive,UpdatedBy=@UpdatedBy,UpdatedDate=[dbo].[GETIST]()
WHERE ColumnName=@ColumnName
SET @Msg='Updated'
SELECT @Msg
END    
END

  
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardAroList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetDashboardAroList]
(
	@district varchar(max) = '',
	@accode varchar(max) = '',
	@UserID INT = 0
)
AS
BEGIN
	DECLARE @AssemblyAccessIDs VARCHAR(MAX) = '', @oneHourBeforeTime DATETIME;
	SET @oneHourBeforeTime = DATEADD(minute, -60, [DBO].[GETIST]())

	SELECT TOP 1 @AssemblyAccessIDs = AssemblyAccesIds FROM Users WHERE id = @UserID
	
	SELECT
		tbl.acname,
		CASE WHEN status = 'RUNNING' AND (lastseen >= @oneHourBeforeTime OR statusFlag=2) THEN 'ONLINE' ELSE 'OFFLINE' END AS status,
		streamname,
		servername,
		statusFlag,
		location,
		bkpstreamid
	FROM(
	select distinct
		b.id,
		b.acname,
		b.PSNum,
		sl.id as streamid,
		b.id as boothid,
		sl.status,
		sl.streamname,
		sl.servername,
		sl.statusFlag,
		b.location,
		sl.id AS bkpstreamid,
		sl.lastseen
	from streamlist sl
	inner join booth b on b.streamid = sl.id AND b.isdisplay = 1
	inner join district d on d.district = b.district and d.acname = b.acname
	where sl.IsEnable = 1 AND ISNULL(b.IsAro,0) = 1 AND b.isdisplay = 1 AND ISNULL(b.isdelete,'')=0
	AND ((@district = '') OR (b.district = @district))
	AND ((@accode = '') OR (b.accode = @accode))
	AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))
	) as tbl
	ORDER BY tbl.acname
END
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardDetailCountList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[GetDashboardDetailCountList]
(
	@district VARCHAR(max) = '',
	@status varchar(20) = ''
)
AS
BEGIN
	SELECT
		acname,
		COUNT(DISTINCT PSNum) AS BoothCount,
		COUNT(status) AS Total,
		SUM(CASE WHEN status = 'RUNNING' THEN 1 ELSE 0 END) AS online,
		SUM(CASE WHEN status = 'STOPPED' THEN 1 ELSE 0 END) AS offline
	FROM(
	SELECT DISTINCT
		b.district,
		b.accode,
		b.acname,
		b.PSNum,
		b.location,
		sl.id,
		sl.streamname,
		sl.prourl,
		sl.servername,
		sl.status,
		op.operatorName AS drivername,
		op.operatorNumber AS drivercontactno,
		op.designation AS operatordesignation
	FROM streamlist sl
	INNER JOIN booth b ON b.streamid = sl.id AND b.isdisplay = 1
	INNER JOIN Operator_Info op ON op.id = b.operatorid
	WHERE ((@district = '') OR (b.district = @district))
	AND ((@status = '') OR (sl.status = @status))
	AND sl.IsEnable = 1
	) tbl
	GROUP BY acname
END
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardDetailInsideCountList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetDashboardDetailInsideCountList]
(
	@district VARCHAR(max) = '',
	@status varchar(20) = ''
)
AS
BEGIN
	SELECT
		acname,
		COUNT(DISTINCT PSNum) AS BoothCount,
		COUNT(status) AS Total,
		SUM(CASE WHEN status = 'RUNNING' THEN 1 ELSE 0 END) AS online,
		SUM(CASE WHEN status = 'STOPPED' THEN 1 ELSE 0 END) AS offline
	FROM(
	SELECT DISTINCT
		b.district,
		b.accode,
		b.acname,
		b.PSNum,
		b.location,
		sl.id,
		sl.streamname,
		sl.prourl,
		sl.servername,
		sl.status,
		op.operatorName AS drivername,
		op.operatorNumber AS drivercontactno,
		op.designation AS operatordesignation
	FROM streamlist sl
	INNER JOIN booth b ON b.streamid = sl.id AND b.isdisplay = 1
	INNER JOIN Operator_Info op ON op.id = b.operatorid
	WHERE ((@district = '') OR (b.district = @district))
	AND ((@status = '') OR (sl.status = @status))
	AND sl.IsEnable = 1 AND ISNULL(b.cameralocationtype,'') = 'Inside'
	) tbl
	GROUP BY acname
END
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardDetailList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDashboardDetailList]
(
	
	@district VARCHAR(max) = '',
	@status varchar(20) = '',
	@CameraType VARCHAR(100) = '',
	@IsPink INT = -1
)
AS
BEGIN

	DECLARE @oneHourBeforeTime DATETIME;
	SET @oneHourBeforeTime = DATEADD(minute, -60, [DBO].[GETIST]())

	SELECT DISTINCT
		b.district,
		b.accode,
		b.acname,
		b.PSNum,
		b.location,
		sl.id,
		sl.streamname,
		sl.prourl,
		sl.servername,
		sl.status,
		op.operatorName AS drivername,
		op.operatorNumber AS drivercontactno,
		op.designation AS operatordesignation
	FROM streamlist sl
	INNER JOIN booth b ON b.streamid = sl.id AND b.isdisplay = 1
	INNER JOIN Operator_Info op ON op.id = b.operatorid
	WHERE ((@district = '') OR (b.district = @district))
	AND ((@status = '') OR (@status='RUNNING' AND ((sl.status = @status AND lastseen >= @oneHourBeforeTime) OR statusFlag=2)) OR (@status = 'STOPPED' AND (sl.status = @status OR lastseen < @oneHourBeforeTime)))
	AND ((@CameraType = '') OR (b.cameralocationtype = @CameraType))
	AND ((@IsPink = -1) OR (b.IsPink = @IsPink))
	AND sl.IsEnable = 1 and 
ISNULL(isdelete,'')=0
	ORDER BY b.district, b.accode, b.acname, b.location,sl.status
END
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardDetailListByAcName]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDashboardDetailListByAcName]
(
	@acname VARCHAR(max) = '',
	@status varchar(20) = '',
	@CameraType VARCHAR(100) = '',
	@IsPink INT = -1
)
AS
BEGIN
	SELECT DISTINCT
		b.district,
		b.accode,
		b.acname,
		b.PSNum,
		b.location,
		sl.id,
		sl.streamname,
		sl.prourl,
		sl.servername,
		sl.status,
		op.operatorName AS drivername,
		op.operatorNumber AS drivercontactno,
		op.designation AS operatordesignation
	FROM streamlist sl
	INNER JOIN booth b ON b.streamid = sl.id AND b.isdisplay = 1
	INNER JOIN Operator_Info op ON op.id = b.operatorid
	WHERE ((@acname = '') OR (b.acname = @acname))
	AND ((@status = '') OR (sl.status = @status))
	AND ((@CameraType = '') OR (b.cameralocationtype = @CameraType))
	AND ((@IsPink = -1) OR (b.IsPink = @IsPink))
	AND sl.IsEnable = 1
	ORDER BY b.district, b.accode, b.acname, b.location,sl.status
END
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardDetailListfsv]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDashboardDetailListfsv]
(  
 @district VARCHAR(max) = '',  
 @status varchar(20) = ''  
)  
AS  
BEGIN  
 SELECT DISTINCT  
  b.district,  
  b.accode,  
  b.acname,  
  b.location,
  sl.id,  
  sl.deviceid,  
  sl.prourl,  
  sl.servername,  
  sl.status,    
  '' AS drivername,  
 '' AS drivercontactno,  
  '',
  '' 
 FROM streamlist sl  
 INNER JOIN booth b ON b.streamid = sl.id AND b.isdisplay = 1  
 WHERE ((@district = '') OR (b.district = @district))  
 AND ((@status = '') OR (sl.status = @status))  
 AND sl.IsEnable = 1   
END  
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardDetailOutsideCountList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetDashboardDetailOutsideCountList]
(
	@district VARCHAR(max) = '',
	@status varchar(20) = ''
)
AS
BEGIN
	SELECT
		acname,
		COUNT(DISTINCT PSNum) AS BoothCount,
		COUNT(status) AS Total,
		SUM(CASE WHEN status = 'RUNNING' THEN 1 ELSE 0 END) AS online,
		SUM(CASE WHEN status = 'STOPPED' THEN 1 ELSE 0 END) AS offline
	FROM(
	SELECT DISTINCT
		b.district,
		b.accode,
		b.acname,
		b.PSNum,
		b.location,
		sl.id,
		sl.streamname,
		sl.prourl,
		sl.servername,
		sl.status,
		op.operatorName AS drivername,
		op.operatorNumber AS drivercontactno,
		op.designation AS operatordesignation
	FROM streamlist sl
	INNER JOIN booth b ON b.streamid = sl.id AND b.isdisplay = 1
	INNER JOIN Operator_Info op ON op.id = b.operatorid
	WHERE ((@district = '') OR (b.district = @district))
	AND ((@status = '') OR (sl.status = @status))
	AND sl.IsEnable = 1 AND ISNULL(b.cameralocationtype,'') = 'Outside'
	) tbl
	GROUP BY acname
END
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardInsideList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetDashboardInsideList]
(
	@lastseen datetime,
	@district varchar(max) = '',
	@accode varchar(max) = '',
	@UserID INT = 0
)
AS
BEGIN
	DECLARE @AssemblyAccessIDs VARCHAR(MAX) = ''
	SELECT TOP 1 @AssemblyAccessIDs = AssemblyAccesIds FROM Users WHERE id = @UserID
	
	SELECT
		tbl.district,
		COUNT(DISTINCT tbl.PSNum) AS TotalBooth,
		COUNT(status) AS Total,
		SUM(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) then 1 ELSE 0 END) AS online,
		SUM(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) THEN 0 ELSE 1 END) AS offline
	FROM(
	select distinct
		b.id,
		b.district,
		b.PSNum,
		sl.id as streamid,
		b.id as boothid,
		sl.status,
		sl.lastseen,
		sl.statusFlag
	from streamlist sl
	inner join booth b on b.streamid = sl.id AND b.isdisplay = 1
	inner join district d on d.district = b.district and d.acname = b.acname
	where sl.IsEnable = 1 AND ISNULL(b.isdelete,'')=0 AND ISNULL(b.cameralocationtype,'') = 'Inside'
	AND ((@district = '') OR (b.district = @district))
	AND ((@accode = '') OR (b.accode = @accode))
	AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))
	) as tbl
	group by tbl.district
	order by [online] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
CREATE PROCEDURE [dbo].[GetDashboardList]  
(  
 @lastseen datetime,  
 @district varchar(max) = '',  
 @accode varchar(max) = '',  
 @UserID INT = 0  
)  
AS  
BEGIN  
 DECLARE @AssemblyAccessIDs VARCHAR(MAX) = ''  
 SELECT TOP 1 @AssemblyAccessIDs = AssemblyAccesIds FROM Users WHERE id = @UserID  
 --select  
 -- b.district,  
 -- SUM(CASE WHEN status = 'RUNNING' THEN 1 ELSE 0 END) AS online,  
 -- SUM(CASE WHEN status = 'STOPPED' THEN 1 ELSE 0 END) AS offline  
 --from streamlist sl  
 --inner join booth b on b.streamid = sl.id  
 --inner join vehicalDetail vd on vd.streamid = sl.id  
 --inner join Vehicle_Staff_Mapping vsm on vsm.VehicleId = vd.vehicalId  
 --inner join vehicleshift vs on vs.id = vsm.ShiftId  
 --where IsEnable = 1  
 --AND ((@district = '') OR (b.district = @district))  
 --AND ((@accode = '') OR (b.accode = @accode))  
 --AND (CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) BETWEEN CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'), 112) + ' ' + CONVERT(CHAR(8), starttime, 108))  
 --  AND CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(CASE WHEN endtime > starttime THEN SYSDATETIMEOFFSET() ELSE DATEADD(DAY,1,SYSDATETIMEOFFSET()) END, '+05:30'), 112) + ' ' + CONVERT(CHAR(8), endtime, 108)))  
 -- OR (CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) BETWEEN CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(CASE WHEN endtime > starttime THEN SYSDATETIMEOFFSET() ELSE DATEADD(DAY,-1,SYSDATETIMEOFFSET()) END, '+05:30'), 112) + ' ' + CONVERT(CHAR(8), endtime, 108))  
 --  AND CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'), 112) + ' ' + CONVERT(CHAR(8), starttime, 108)))  
 --group by b.district  
 SELECT  
  tbl.district,  
  COUNT(DISTINCT tbl.PSNum) AS TotalBooth,  
  COUNT(status) AS Total,  
  COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) then 1 ELSE NULL END) as online,  
  count(DISTINCT id)-COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) then 1 ELSE NULL END) AS offline,  
  SUM(CASE isLive WHEN 'True' then 1 ELSE 0 END) AS connectedonce,  
  --SUM(CASE WHEN lastseen >= DATEADD(MINUTE,-60,[dbo].[GETIST]()) OR statusFlag=2 then 1 ELSE 0 END) as lastLive  
  SUM(CASE WHEN lastseen >= @lastseen OR statusFlag=2 then 1 ELSE 0 END) as lastLive  
 FROM(  
 select distinct  
  b.id,  
  b.district,  
  b.PSNum,  
  sl.id as streamid,  
  b.id as boothid,  
  sl.status,  
  sl.isLive,  
  sl.lastseen,  
  sl.statusFlag  
 from streamlist sl  
 inner join booth b on b.streamid = sl.id AND b.isdisplay = 1  
 inner join district d on d.district = b.district and d.acname = b.acname  
 where sl.IsEnable = 1 and ISNULL(b.isdelete,'')=0
 AND ((@district = '') OR (b.district = @district))  
 AND ((@accode = '') OR (b.accode = @accode))  
 AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))  
 --AND ((CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) BETWEEN CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'), 112) + ' ' + CONVERT(CHAR(8), starttime, 108))  
 -- AND CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(CASE WHEN endtime > starttime THEN SYSDATETIMEOFFSET() ELSE DATEADD(DAY,1,SYSDATETIMEOFFSET()) END, '+05:30'), 112) + ' ' + CONVERT(CHAR(8), endtime, 108)))  
 ----OR (CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) BETWEEN CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(CASE WHEN endtime > starttime THEN SYSDATETIMEOFFSET() ELSE DATEADD(DAY,-1,SYSDATETIMEOFFSET()) END, '+05:30'), 112) + ' ' + CONVERT(CHAR(8), endtime, 108))  
 ----  AND CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'), 112) + ' ' + CONVERT(CHAR(8), starttime, 108))  
 ----  )  
 --  )  
 ) as tbl  
 group by tbl.district  
 order by [online] DESC  
END
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardListfsv]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE PROCEDURE [dbo].[GetDashboardListfsv]  
(  
 @district varchar(max) = '',  
 @accode varchar(max) = '',  
 @UserID INT = 0  
)  
AS  
BEGIN  
 DECLARE @AssemblyAccessIDs VARCHAR(MAX) = ''  
 SELECT TOP 1 @AssemblyAccessIDs = AssemblyAccesIds FROM Users WHERE id = @UserID  
 --select  
 -- b.district,  
 -- SUM(CASE WHEN status = 'RUNNING' THEN 1 ELSE 0 END) AS online,  
 -- SUM(CASE WHEN status = 'STOPPED' THEN 1 ELSE 0 END) AS offline  
 --from streamlist sl  
 --inner join booth b on b.streamid = sl.id  
 --inner join vehicalDetail vd on vd.streamid = sl.id  
 --inner join Vehicle_Staff_Mapping vsm on vsm.VehicleId = vd.vehicalId  
 --inner join vehicleshift vs on vs.id = vsm.ShiftId  
 --where IsEnable = 1  
 --AND ((@district = '') OR (b.district = @district))  
 --AND ((@accode = '') OR (b.accode = @accode))  
 --AND (CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) BETWEEN CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'), 112) + ' ' + CONVERT(CHAR(8), starttime, 108))  
 --  AND CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(CASE WHEN endtime > starttime THEN SYSDATETIMEOFFSET() ELSE DATEADD(DAY,1,SYSDATETIMEOFFSET()) END, '+05:30'), 112) + ' ' + CONVERT(CHAR(8), endtime, 108)))  
 -- OR (CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) BETWEEN CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(CASE WHEN endtime > starttime THEN SYSDATETIMEOFFSET() ELSE DATEADD(DAY,-1,SYSDATETIMEOFFSET()) END, '+05:30'), 112) + ' ' + CONVERT(CHAR(8), endtime, 108))  
 --  AND CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'), 112) + ' ' + CONVERT(CHAR(8), starttime, 108)))  
 --group by b.district  
 SELECT  
  tbl.district,  
  SUM(CASE WHEN status = 'RUNNING' THEN 1 ELSE 0 END) AS online,  
  SUM(CASE WHEN status = 'STOPPED' THEN 1 ELSE 0 END) AS offline  
 FROM(  
 select distinct  
 -- d.id,  
  b.district,  
  sl.id as streamid,  
  b.id as boothid,  
  '' as vehicleid,  
  sl.status  ,
  sl.deviceid
 from streamlist sl  
 inner join booth b on b.streamid = sl.id AND b.isdisplay = 1  
 inner join district d on d.district = b.district and d.acname = b.acname  
 --inner join vehicalDetail vd on vd.streamid = sl.id AND vd.isdeleted=0  
 --inner join Vehicle_Staff_Mapping vsm on vsm.VehicleId = vd.vehicalId --AND vsm.isdeleted=0  
 -- AND vsm.AssignDate = CAST([dbo].[GETIST]() AS DATE)  
 --INNER JOIN Staff_Info si on si.Id = vsm.StaffId AND si.Type=1  
-- inner join vehicleshift vs on vs.id = vsm.ShiftId AND vs.id = [dbo].[GetCurrentShift]()  
 where sl.IsEnable = 1  
 AND ((@district = '') OR (b.district = @district))  
 AND ((@accode = '') OR (b.accode = @accode))  
 AND ((@UserID = 1)OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))  
 --AND ((CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) BETWEEN CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'), 112) + ' ' + CONVERT(CHAR(8), starttime, 108))  
 -- AND CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(CASE WHEN endtime > starttime THEN SYSDATETIMEOFFSET() ELSE DATEADD(DAY,1,SYSDATETIMEOFFSET()) END, '+05:30'), 112) + ' ' + CONVERT(CHAR(8), endtime, 108)))  
 ----OR (CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) BETWEEN CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(CASE WHEN endtime > starttime THEN SYSDATETIMEOFFSET() ELSE DATEADD(DAY,-1,SYSDATETIMEOFFSET()) END, '+05:30'), 112) + ' ' + CONVERT(CHAR(8), endtime, 108))  
 ----  AND CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'), 112) + ' ' + CONVERT(CHAR(8), starttime, 108))  
 ----  )  
 --  )  
 ) as tbl  
 group by tbl.district  
END  
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardOutsideList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetDashboardOutsideList]
(
	@lastseen datetime,
	@district varchar(max) = '',
	@accode varchar(max) = '',
	@UserID INT = 0
)
AS
BEGIN
	DECLARE @AssemblyAccessIDs VARCHAR(MAX) = ''
	SELECT TOP 1 @AssemblyAccessIDs = AssemblyAccesIds FROM Users WHERE id = @UserID
	
	SELECT
		tbl.district,
		COUNT(DISTINCT tbl.PSNum) AS TotalBooth,
		COUNT(status) AS Total,
		SUM(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) then 1 ELSE 0 END) AS online,
		SUM(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) THEN 0 ELSE 1 END) AS offline
	FROM(
	select distinct
		b.id,
		b.district,
		b.PSNum,
		sl.id as streamid,
		b.id as boothid,
		sl.status,
		sl.lastseen,
		sl.statusFlag
	from streamlist sl
	inner join booth b on b.streamid = sl.id AND b.isdisplay = 1
	inner join district d on d.district = b.district and d.acname = b.acname
	where sl.IsEnable = 1 AND ISNULL(b.isdelete,'')=0 AND ISNULL(b.cameralocationtype,'') = 'Outside'
	AND ((@district = '') OR (b.district = @district))
	AND ((@accode = '') OR (b.accode = @accode))
	AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))
	) as tbl
	group by tbl.district
	order by [online] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetDashboardPinkList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetDashboardPinkList]
(
	@lastseen datetime,
	@district varchar(max) = '',
	@accode varchar(max) = '',
	@UserID INT = 0
)
AS
BEGIN
	DECLARE @AssemblyAccessIDs VARCHAR(MAX) = ''
	SELECT TOP 1 @AssemblyAccessIDs = AssemblyAccesIds FROM Users WHERE id = @UserID
	
	SELECT
		tbl.district,
		COUNT(DISTINCT tbl.PSNum) AS TotalBooth,
		COUNT(status) AS Total,
		SUM(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) then 1 ELSE 0 END) AS online,
		SUM(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) THEN 0 ELSE 1 END) AS offline
	FROM(
	select distinct
		b.id,
		b.district,
		b.PSNum,
		sl.id as streamid,
		b.id as boothid,
		sl.status,
		sl.lastseen,
		sl.statusFlag
	from streamlist sl
	inner join booth b on b.streamid = sl.id AND b.isdisplay = 1
	inner join district d on d.district = b.district and d.acname = b.acname
	where sl.IsEnable = 1 AND ISNULL(b.IsPink,0) = 1 AND ISNULL(b.isdelete,'')=0
	AND ((@district = '') OR (b.district = @district))
	AND ((@accode = '') OR (b.accode = @accode))
	AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))
	) as tbl
	group by tbl.district
	order by [online] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetDashbordAllLiveCount]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec GetDashbordAllLiveCount '3/2/2023 7:58:57 AM' ,0
CREATE PROCEDURE [dbo].[GetDashbordAllLiveCount]  
(    
 @lastseen datetime,
 @UserID int=0
)    
AS      
BEGIN      
 DECLARE @AssemblyAccessIDs VARCHAR(MAX) = ''    
 SELECT TOP 1 @AssemblyAccessIDs = AssemblyAccesIds FROM Users WHERE id = @UserID    
 --SELECT * FROM (  
 select      
 COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce',    
 MAX(b.district) as district,    
 b.district as DATA,    
 Cast(COUNT(b.acname) as nvarchar(MAX)) as ac,    
 Cast(COUNT(b.acname) as nvarchar(MAX)) as acname,    
 COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) then 1 ELSE NULL END) as 'Live',   
 COUNT(CASE WHEN lastseen >= @lastseen OR statusFlag=2 then 1 ELSE NULL END) as 'lastonehrLive', 
 COUNT(CASE WHEN lastseen >= (dateadd(HOUR, -1, @lastseen)) OR statusFlag=2 then 1 ELSE NULL END) as 'lasttwohrLive', 
 
 (count(DISTINCT b.id)-COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) then 1 ELSE NULL END)) as 'stop',    
 count(DISTINCT b.id) as TotalBooth     
 from booth b      
 inner join streamlist s on b.streamid=s.id      
 inner join district d on d.district = b.district and d.acname = b.acname    
 where b.isdisplay='True' and s.IsEnable=1 and b.boothstateid=1 and ISNULL(b.isdelete,'')=0       
 AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))     
 AND   ISNULL(isdelete,'')=0   
 group by b.district   
END  

 
GO
/****** Object:  StoredProcedure [dbo].[GetDefaultStopReasons]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDefaultStopReasons]
AS
BEGIN
	SELECT id,name, 1 as type FROM reason
	WHERE active = 1
	UNION
	SELECT -1 AS id, 'Others' AS name, 2 AS type
	ORDER BY type,name
END
GO
/****** Object:  StoredProcedure [dbo].[GetDeleteBoothHistoryByID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetDeleteBoothHistoryByID]
@BoothId nvarchar(max)
AS
BEGIN
--Select top 2 bh.*,s.deviceid from boothhistory bh inner join streamlist s on s.id=bh.streamid where boothid in(@BoothId,@BoothId1) and  isdelete=1 and Action='SWAPCAMERA' order by bh.id desc

--Select bh.*,s.deviceid from boothhistory  bh inner join streamlist s on s.id=bh.streamid where  boothid in(@BoothId,@BoothId1) and  isdelete=0 and Action='SWAPCAMERA'

select * from (
select top 1 'Previous Entry' AS Status,bh.*,s.deviceid from boothhistory bh
inner join streamlist s on s.id = bh.streamid
where boothid = @BoothId and isdelete=1 order by bh.id desc
) tbl
union
select 'Updated Entry' AS Status,bh.*,s.deviceid from boothhistory bh
inner join streamlist s on s.id = bh.streamid
where boothid = @BoothId and isdelete=1

END
GO
/****** Object:  StoredProcedure [dbo].[GetDistrictAssemblyList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--getdistrict, assembly for access list
CREATE procedure [dbo].[GetDistrictAssemblyList]  
as  
select distinct convert(varchar,id) id, '#' parent, district as text from district where acname ='' or acname is null --and district ='Chandigarh'  
union all  
select  distinct convert(varchar,id)id, (select convert(varchar,id) from district where district=d.district and (acname ='' or acname is null))  parent, acname as text from district d    
where acname !='' and acname is not  null   --and district ='Chandigarh'  
order by parent,text
--select
--	id,parent,text
--from (
--select
--ROW_NUMBER() over(partition by district order by id) as rn,
--id,
--'#' as parent,
--district as text
--from district
--) tbl where rn=1
----where acname ='' or acname is null --and district ='Chandigarh'  
--union all  
--select
--distinct convert(varchar,id) as id,
--district as parent,
--acname as text
--from district d
GO
/****** Object:  StoredProcedure [dbo].[getDistrictData]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[getDistrictData]
AS
BEGIN
select statename,district,accode,acname from district d inner join state st on st.id=d.stateid
END
GO
/****** Object:  StoredProcedure [dbo].[GetDistrictManagerList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetDistrictManagerList]
@district varchar(255)
AS
BEGIN
	SELECT *  FROM DistrictManager
	WHERE district = @district or @district=''
END
GO
/****** Object:  StoredProcedure [dbo].[GetDistrictWiseDownloadlist]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDistrictWiseDownloadlist]
(
	@district varchar(100) = ''
)
AS
BEGIN
	SELECT * FROM booth b
	INNER JOIN streamlist s ON s.id = b.streamid
	WHERE ISNULL(b.isdisplay,0) = 1 AND ISNULL(s.IsEnable,0) = 1
		AND ((@district = '') OR (b.district = @district))
END
GO
/****** Object:  StoredProcedure [dbo].[GetDownloadLink]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDownloadLink]
(
	@district VARCHAR(255) = '',
	@accode VARCHAR(255) = '',
	@location VARCHAR(1023) = '',
	@streamname VARCHAR(255) = ''
)
AS
BEGIN
	SELECT 
		b.district,
		b.acname,
		b.location,
		s.streamname,
		dl.url
	FROM
	[dbo].[streamlist] s
		INNER JOIN [dbo].[booth] b ON s.id = b.streamid
		INNER JOIN [dbo].[downloads] dl ON s.[streamname] = dl.[camera]
	WHERE dl.[date] = '2022-02-20'
		AND (@district = '' OR @district = b.district)
		AND (@accode = '' OR @accode = b.accode)
		AND (@location = '' OR @location = b.location)
		AND (@streamname = '' OR @streamname = s.streamname)
END
GO
/****** Object:  StoredProcedure [dbo].[GetExeclBoothReport]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetExeclBoothReport]
AS
BEGIN
select b.district,accode as [District Code], acname as AssemblyName,psnum as PSNumber,location,s.streamname as Camera, s.status,
islive,FORMAT(LastSeen,'dd/MM/yyyy hh:mm:ss tt') AS LastSeen ,o.operatorName,o.operatorNumber,s.servername,0
as CameraSimNumber,FORMAT((SD.Kbps/(SD.CreateTime/1000.00)),'N2') as kbps from booth  b 
inner join streamlist  s on b.streamid = s.id 
inner join operator_info  o on o.id = b.operatorid 
--left join CamSimList c   on c.streamName =s.streamname 
left join ServerDetails sd   on s.streamname=sd.Cameraid 
where b.isdisplay='True' and  ISNULL(b.isdelete,0)=0 
and s.IsEnable=1 and b.boothstateID=1 and  ISNULL(b.isdelete,0)=0 
order by district,accode,acname
END


Select * from booth where isdisplay is null 
GO
/****** Object:  StoredProcedure [dbo].[GetExeclBoothReportbyhr]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[GetExeclBoothReportbyhr]
(
@lasthr int=0
)
AS
BEGIN
Declare @Lastseentime varchar(50)
SET @Lastseentime=(SELECT DATEADD(hour, -@lasthr, [dbo].[GETIST]()))
select b.district,accode as [District Code], acname as AssemblyName,psnum as PSNumber,location,s.streamname as Camera, s.status,
islive,FORMAT(LastSeen,'dd/MM/yyyy hh:mm:ss tt') AS LastSeen ,o.operatorName,o.operatorNumber,s.servername,0
as CameraSimNumber,FORMAT((SD.Kbps/(SD.CreateTime/1000.00)),'N2') as kbps from booth  b 
inner join streamlist  s on b.streamid = s.id 
inner join operator_info  o on o.id = b.operatorid 
--left join CamSimList c   on c.streamName =s.streamname 
left join ServerDetails sd   on s.streamname=sd.Cameraid 
where b.isdisplay='True' and  ISNULL(b.isdelete,0)=0 
and s.IsEnable=1 and b.boothstateID=1 and  ISNULL(b.isdelete,0)=0 and lastseen >= @Lastseentime
order by lastseen desc
END


--Declare @Lastseentime varchar(50),@lasthr int=5
--SET @Lastseentime=(SELECT DATEADD(hour, -@lasthr, [dbo].[GETIST]()))
--Print @Lastseentime
--print @lasthr
GO
/****** Object:  StoredProcedure [dbo].[GetGoGreenList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGoGreenList]
(
	@district varchar(100) = '',
	@acname varchar(100) = '',
	@CameraID nvarchar(50) = '',
	@Status VARCHAR(50) = ''
)
AS
BEGIN
	select * from streamlist sl
	INNER JOIN booth b ON b.streamid = sl.id
    INNER JOIN district d on d.district = b.district AND d.acname = b.acname
	WHERE ISNULL(sl.isdeleted,0)=0 --AND ISNULL(isLive,0) = 0
	AND ((@district = '') OR (b.district = @district))
	AND ((@acname = '') OR (b.acname = @acname))
	AND ((@CameraID = '') OR (sl.deviceid LIKE '%' + @CameraID + '%'))
	AND ((@Status = '') OR (@Status = 'BOTH') OR (sl.status = @Status))
	ORDER BY b.district,b.acname,b.location,sl.deviceid
END
GO
/****** Object:  StoredProcedure [dbo].[GetGPSStopReasonsByID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGPSStopReasonsByID]
(
	@ID INT
)
AS
BEGIN
	SELECT
		d.Id,
		d.deviceid,
		d.StartTime,
		d.StopTime,
		ISNULL(r.Reason,'') AS Reason
	FROM GPSStopDuration d
	LEFT JOIN GPSStopReasons r ON d.Id = r.GPSStopDurationID
	WHERE d.Id = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GETHLSURL]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETHLSURL]
@District VARCHAR(255),
@Accode VARCHAR(255)
AS
	BEGIN
		SELECT 
			CONCAT('wss://', st.servername,'/live-record/', st.streamname, '.flv') AS HLSURL
		FROM 
		[dbo].[streamlist] st
		INNER JOIN [dbo].[booth] bo ON bo.streamid = st.id
		WHERE 
		bo.district = @District AND bo.accode = @Accode
	END
GO
/****** Object:  StoredProcedure [dbo].[GetImageCount]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetImageCount]
(
@flag char(20)=''
)
AS
BEGIN
--SELECT Time, SUM(HeadCount) AS HeadCount
--FROM (
--    SELECT CONVERT(varchar(5), sendtime, 108) AS Time, SUM(ImgCount) AS HeadCount,
--           ROW_NUMBER() OVER (PARTITION BY CONVERT(varchar(5), sendtime, 108) ORDER BY sendtime) AS RowNum
--    FROM notification
--    WHERE sendtime BETWEEN CONVERT(DATETIME, CONVERT(VARCHAR(10), [dbo].[GETIST](), 23) + ' 06:00:00.000') 
--        AND CONVERT(DATETIME, CONVERT(VARCHAR(10), [dbo].[GETIST](), 23) + ' 23:59:59.000')
--        AND an_id = 1 
--    GROUP BY CONVERT(varchar(5), sendtime, 108), sendtime
--) AS T
--WHERE RowNum = 1
--GROUP BY Time;


--SELECT Time, HeadCount
--FROM (
--    SELECT DISTINCT CONVERT(varchar(5), sendtime, 108) AS Time, ImgCount AS HeadCount,
--          ROW_NUMBER() OVER (PARTITION BY CONVERT(varchar(5), sendtime, 108) ORDER BY sendtime) AS RowNum
--    FROM notification
--    WHERE sendtime BETWEEN CONVERT(DATETIME, CONVERT(VARCHAR(10), [dbo].[GETIST](), 23) + ' 06:00:00.000') 
--        AND CONVERT(DATETIME, CONVERT(VARCHAR(10), [dbo].[GETIST](), 23) + ' 23:59:59.000')
--        AND an_id = 1 
--) AS T
--WHERE RowNum = 1;

SELECT Time, MAX([PQRS-230928-ABCDE]) AS 'Ahmedabad'
FROM (
    SELECT DISTINCT CONVERT(varchar(5), sendtime, 108) AS Time, ImgCount AS HeadCount, cameradid,
          ROW_NUMBER() OVER (PARTITION BY CONVERT(varchar(5), sendtime, 108) ORDER BY sendtime) AS RowNum
    FROM notification
    WHERE sendtime BETWEEN CONVERT(DATETIME, CONVERT(VARCHAR(10), [dbo].[GETIST](), 23) + ' 06:00:00.000') 
        AND CONVERT(DATETIME, CONVERT(VARCHAR(10), [dbo].[GETIST](), 23) + ' 23:59:59.000')
        AND an_id = 1 
) AS T
PIVOT (
    SUM(HeadCount)
    FOR cameradid IN ([PQRS-230928-ABCDE])
) AS P
GROUP BY Time
ORDER BY Time;
END


--Select * from notification where cameradid='PQRS-230928-ABCDE'
GO
/****** Object:  StoredProcedure [dbo].[GetImagenotification]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetImagenotification]
 (
 @flag char(20)=''
 )
 AS
 BEGIN
 if(@flag='GetData')
 BEGIN
 Select Top(200) district,accode,acname,(accode+'-'+acname+'-'+PSNum) as bootinfo,PSNum,sendtime,deviceid,imgurl  from notification n
 inner join streamlist s on n.cameradid=s.deviceid
 inner join booth b on b.streamid=s.id   
 where an_id=2
 order by n.id desc
 END
 END
GO
/****** Object:  StoredProcedure [dbo].[GetIncidenceDetails]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetIncidenceDetails]
@incidenceid int=0
,@districtName Varchar(255) = ''
,@accode int = 0
,@FromDt VARCHAR(30) = ''
,@ToDt VARCHAR(30) = ''
AS  
 BEGIN  
 if @incidenceid=0 
 begin

	DECLARE @StartDt DATETIME, @StopDt DATETIME, @InternaldistrictName VARCHAR(100), @Internalaccode int
	SET @InternaldistrictName = @districtName
	SET @Internalaccode = @accode

	IF (@FromDt = '')
	BEGIN
		SET @StartDt = null
	END
	ELSE
	BEGIN
		SET @StartDt = convert(datetime, @FromDt + ' 00:00:00', 103)
	END
	IF (@ToDt = '')
	BEGIN
		SET @StopDt = null
	END
	ELSE
	BEGIN
		SET @StopDt = convert(datetime, @ToDt + ' 23:59:59', 103)
	END

   SELECT
   incd.*, '' VehicleNo,
   dis.district As District,  
   dis.acname AS acname    
    FROM [dbo].IncidenceDetails incd  
    INNER JOIN [dbo].[district] dis ON dis.id = incd.DistrictID AND dis.isdeleted = 0  
	--inner join vehicalDetail vd on incd.vehicalid=vd.vehicalId
    WHERE incd.isDeleted=0 
	and ((@FromDt = '' AND @ToDt = '') OR (incd.[IncidentDateTime] BETWEEN @StartDt AND @StopDt))
	and ((@InternaldistrictName= '') OR (dis.district=@InternaldistrictName))
	and ((@Internalaccode=0) OR (incd.accode=@Internalaccode))
    ORDER BY incd.id desc
end
else
begin
	SELECT
   incd.*, vd.Vehicle_No VehicleNo,
   dis.district As District,  
   dis.acname AS acname    
    FROM [dbo].IncidenceDetails incd  
    INNER JOIN [dbo].[district] dis ON dis.id = incd.DistrictID AND dis.isdeleted = 0  
	inner join vehicalDetail vd on incd.vehicalid=vd.vehicalId
    WHERE   incd.id=@incidenceid and
    incd.isDeleted=0    
    ORDER BY incd.id desc

end
 END
GO
/****** Object:  StoredProcedure [dbo].[GetIndoorOutDoorForGraph]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetIndoorOutDoorForGraph]
(
	@lastseen datetime,
	@district varchar(max) = '',
	@accode varchar(max) = '',
	@UserID INT = 0
)
AS
BEGIN
	DECLARE @AssemblyAccessIDs VARCHAR(MAX) = ''
	SELECT TOP 1 @AssemblyAccessIDs = AssemblyAccesIds FROM Users WHERE id = @UserID
	--select
	--	b.district,
	--	SUM(CASE WHEN status = 'RUNNING' THEN 1 ELSE 0 END) AS online,
	--	SUM(CASE WHEN status = 'STOPPED' THEN 1 ELSE 0 END) AS offline
	--from streamlist sl
	--inner join booth b on b.streamid = sl.id
	--inner join vehicalDetail vd on vd.streamid = sl.id
	--inner join Vehicle_Staff_Mapping vsm on vsm.VehicleId = vd.vehicalId
	--inner join vehicleshift vs on vs.id = vsm.ShiftId
	--where IsEnable = 1
	--AND ((@district = '') OR (b.district = @district))
	--AND ((@accode = '') OR (b.accode = @accode))
	--AND (CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) BETWEEN CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'), 112) + ' ' + CONVERT(CHAR(8), starttime, 108))
	--		AND CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(CASE WHEN endtime > starttime THEN SYSDATETIMEOFFSET() ELSE DATEADD(DAY,1,SYSDATETIMEOFFSET()) END, '+05:30'), 112) + ' ' + CONVERT(CHAR(8), endtime, 108)))
	--	OR (CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) BETWEEN CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(CASE WHEN endtime > starttime THEN SYSDATETIMEOFFSET() ELSE DATEADD(DAY,-1,SYSDATETIMEOFFSET()) END, '+05:30'), 112) + ' ' + CONVERT(CHAR(8), endtime, 108))
	--		AND CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'), 112) + ' ' + CONVERT(CHAR(8), starttime, 108)))
	--group by b.district
	SELECT
		tbl.district,
		COUNT(DISTINCT tbl.PSNum) AS TotalBooth,
		COUNT(status) AS Total,
		COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) then 1 ELSE NULL END) as online,
		count(DISTINCT id)-COUNT(CASE WHEN Status = 'RUNNING' AND (lastseen >= @lastseen OR statusFlag=2) then 1 ELSE NULL END) AS offline,
		SUM(CASE isLive WHEN 'True' then 1 ELSE 0 END) AS connectedonce,
		SUM(CASE WHEN lastseen >= DATEADD(MINUTE,-60,[dbo].[GETIST]()) OR statusFlag=2 then 1 ELSE 0 END) as lastLive
	FROM(
	select distinct
		b.id,
		b.district,
		b.PSNum,
		sl.id as streamid,
		b.id as boothid,
		sl.status,
		sl.isLive,
		sl.lastseen,
		sl.statusFlag,
		b.cameralocationtype
	from streamlist sl
	inner join booth b on b.streamid = sl.id AND b.isdisplay = 1
	inner join district d on d.district = b.district and d.acname = b.acname
	where sl.IsEnable = 1  and ISNULL(b.isdelete,'')=0
	AND ((@district = '') OR (b.district = @district))
	AND ((@accode = '') OR (b.accode = @accode))
	AND (@UserID = 0 OR (d.id IN (SELECT value FROM string_split(@AssemblyAccessIDs, ','))))
	--AND ((CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) BETWEEN CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'), 112) + ' ' + CONVERT(CHAR(8), starttime, 108))
	--	AND CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(CASE WHEN endtime > starttime THEN SYSDATETIMEOFFSET() ELSE DATEADD(DAY,1,SYSDATETIMEOFFSET()) END, '+05:30'), 112) + ' ' + CONVERT(CHAR(8), endtime, 108)))
	----OR (CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) BETWEEN CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(CASE WHEN endtime > starttime THEN SYSDATETIMEOFFSET() ELSE DATEADD(DAY,-1,SYSDATETIMEOFFSET()) END, '+05:30'), 112) + ' ' + CONVERT(CHAR(8), endtime, 108))
	----		AND CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'), 112) + ' ' + CONVERT(CHAR(8), starttime, 108))
	----		)
	--		)
	) as tbl
	group by tbl.district,tbl.cameralocationtype
END
GO
/****** Object:  StoredProcedure [dbo].[GetInventoryUpdationReport]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetInventoryUpdationReport]
(
	@FromDt VARCHAR(30) = '',
	@ToDt VARCHAR(30) = '',
	@districtid varchar(max) = '',
	@accode varchar(max) = '',
	@vehicleId varchar(max) = '',
	@ShiftID INT = 0
)
AS
BEGIN
	DECLARE @StartDt DATETIME, @StopDt DATETIME
	IF (@FromDt = '')
	BEGIN
		SET @StartDt = null
	END
	ELSE
	BEGIN
		SET @StartDt = convert(datetime, @FromDt + ' 00:00:00', 103)
	END
	IF (@ToDt = '')
	BEGIN
		SET @StopDt = null
	END
	ELSE
	BEGIN
		SET @StopDt = convert(datetime, @ToDt + ' 23:59:59', 103)
	END

	SELECT
		[id],[districtname] ,[districtname] AS district,[acname] ,[accode] ,[vehicleNo] ,[material] ,[oldsnno] ,[newsnno] ,[repaired/replaced], [startdate], [enddate]
	FROM [dbo].[inventoryupdatation]
	WHERE ((@FromDt = '' AND @ToDt = '') OR ([startdate] BETWEEN @StartDt AND @StopDt))
		AND ((@districtid = '') OR ([districtname] = @districtid))
		AND ((@accode = '') OR ([accode] = @accode))
		AND ((@vehicleId = '') OR (vehicleNo = @vehicleId))
		--AND ((@ShiftID = 0) OR (vs.id = @ShiftID))
	--ORDER BY v.vehicalId, v.DeviceId, v.DistrictId, v.Accode, d.StartTime, d.StopTime, dr.name, fsv.name, vs.name
	ORDER BY [startdate] DESC,[districtname] ,[accode] ,[vehicleNo] ,[material] ,[oldsnno] ,[newsnno]
END
GO
/****** Object:  StoredProcedure [dbo].[GetLatestBoothHistoryByID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetLatestBoothHistoryByID]  
(  
 @BoothId int,  
 @Action varchar(50)=''  
)  
AS  
BEGIN  
--Select top 2 bh.*,s.deviceid from boothhistory bh inner join streamlist s on s.id=bh.streamid where boothid in(@BoothId,@BoothId1) and  isdelete=1 and Action='SWAPCAMERA' order by bh.id desc  
  
--Select bh.*,s.deviceid from boothhistory  bh inner join streamlist s on s.id=bh.streamid where  boothid in(@BoothId,@BoothId1) and  isdelete=0 and Action='SWAPCAMERA'  
 IF (@Action = 'DELETE')  
 BEGIN  
  select top 1 'Deleted Entry' AS Status,bh.*,s.deviceid from boothhistory bh  
  inner join streamlist s on s.id = bh.streamid  
  where boothid = @BoothId and isdelete=1 order by bh.id desc   
 END  
 ELSE IF(@Action='BULKDELETE')
 BEGIN
 select top 1 'Bulk Delete Entry' AS Status,bh.*,s.deviceid from boothhistory bh  
  inner join streamlist s on s.id = bh.streamid  
  where boothid = @BoothId and isdelete=1 order by bh.id desc   
 END
 ELSE IF (@Action = 'INSERT')  
 BEGIN  
 select 'Inserted Entry' AS Status,bh.*,s.deviceid from boothhistory bh  
  inner join streamlist s on s.id = bh.streamid  
  where boothid = @BoothId and isdelete=0  
 END  
 ELSE  
 BEGIN  
  select * from (  
  select top 1 'Previous Entry' AS Status,bh.*,s.deviceid from boothhistory bh  
  inner join streamlist s on s.id = bh.streamid  
  where boothid = @BoothId and isdelete=1 order by bh.id desc  
  ) tbl  
  union  
  select 'Updated Entry' AS Status,bh.*,s.deviceid from boothhistory bh  
  inner join streamlist s on s.id = bh.streamid  
  where boothid = @BoothId and isdelete=0  
 END  
END  
GO
/****** Object:  StoredProcedure [dbo].[getlocationwisedeviceid]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getlocationwisedeviceid]
(
@district varchar(100),
@acname varchar(100),
@location varchar(500)
)
AS
BEGIN
Select deviceid,servername,streamname  from booth b 
inner join streamlist s on b.streamid =s.id
where district=@district and accode=@acname and b.location=@location 
END
GO
/****** Object:  StoredProcedure [dbo].[GetLogHistory]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLogHistory]
(
  @district varchar(100) = ''        
 ,@accode varchar(100) = ''        
 ,@FromDt VARCHAR(30) = ''        
 ,@ToDt VARCHAR(30) = ''    
 ,@Action varchar(30)=''
)
AS
BEGIN
 DECLARE @StartDt DATETIME, @StopDt DATETIME, @Internaldistrict VARCHAR(100), @Internalaccode VARCHAR(100), @InternalAction VARCHAR(100);        
 SET @Internaldistrict = @district        
 SET @Internalaccode = @accode        
 SET @InternalAction = @Action 
	SELECT
		s.deviceid,bh.district ,bh.acname,bh.accode,bh.PSNum,bh.location,bh.updatedBy,bh.updatedDate,bh.updatedFrom,bh.Action
		from boothhistory bh inner join streamlist s on s.id=bh.streamid 
		where 
		((@Internaldistrict='') OR (bh.district=@Internaldistrict))        
     and ((@Internalaccode='') OR (bh.accode=@Internalaccode))        
     and((@InternalAction='')OR(bh.Action=@InternalAction))
	 and(UpdatedDate BETWEEN @FromDt AND @ToDt)
	
	 order by bh.boothid
END
GO
/****** Object:  StoredProcedure [dbo].[GetManagerList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetManagerList]
@district varchar(255)
AS
BEGIN
	SELECT *  FROM DistrictManager
	WHERE district = @district or @district=''
END
GO
/****** Object:  StoredProcedure [dbo].[GetManualStopVehicleReasonList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetManualStopVehicleReasonList]
(
	@FromDt VARCHAR(30) = '',
	@ToDt VARCHAR(30) = '',
	@district VARCHAR(100) = '',
	@acname varchar(max) = '',
	@vehicleno INT = 0,
	@ShiftID INT = 0
)
AS
BEGIN
	DECLARE @StartDt DATETIME, @StopDt DATETIME
	IF (@FromDt = '')
	BEGIN
		SET @StartDt = null
	END
	ELSE
	BEGIN
		SET @StartDt = convert(datetime, @FromDt + ' 00:00:00', 103)
	END
	IF (@ToDt = '')
	BEGIN
		SET @StopDt = null
	END
	ELSE
	BEGIN
		SET @StopDt = convert(datetime, @ToDt + ' 23:59:59', 103)
	END
	SELECT DISTINCT
		s.vehicleNo,
		s.districtname,
		s.acname,
		s.startTime,
		s.stopTime,
		s.reason,
		s.addedOn
	FROM StopReasons s
	WHERE ((@FromDt = '' AND @ToDt = '') OR (s.StartTime BETWEEN @StartDt AND @StopDt))
		AND ((@district = 0) OR (s.districtname = @district))
		AND ((@acname = '') OR (s.acname = @acname))
		AND ((@vehicleno = '') OR (s.vehicleNo = @vehicleno))
		--AND ((@ShiftID = 0) OR (vs.id = @ShiftID))
	--ORDER BY v.vehicalId, v.DeviceId, v.DistrictId, v.Accode, d.StartTime, d.StopTime, dr.name, fsv.name, vs.name
	ORDER BY s.vehicleNo,s.districtname,s.acname,s.starttime

END
GO
/****** Object:  StoredProcedure [dbo].[GetMapBoothListViewNew]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
 -- exec GetMapBoothListViewNew '','','','','',''
CREATE PROCEDURE [dbo].[GetMapBoothListViewNew]               
(                    
 @district varchar(100)='',                    
 @assembly varchar(100)='',                  
 @status varchar(50)='',
 @LocationType varchar(50)='', 
 @booth varchar(511) = '',              
 @streamname varchar(255) = '',  
 
 @OrderBY varchar(255) = ''  
)                    
                  
AS                    
BEGIN              
             
  SELECT ROW_NUMBER() OVER(ORDER BY b.district) as rn,* 
   from booth b                    
   inner join streamlist s on b.streamid = s.id                     
   INNER JOIN operator_info op on b.operatorid = op.id                    
   inner join district d on d.district = b.district and d.accode = b.accode
  where b.isdisplay = 1 AND s.IsEnable = 1 
AND ((@district='') OR (b.district = @district))                    
   AND ((@assembly='') OR (b.accode =@assembly))             
   AND ((@status='') OR (status = @status))                    
   AND ((@booth = '') OR (b.location = @booth))              
   AND ((@streamname = '') OR (s.streamname like '%' + LTRIM(RTRIM(@streamname)) + '%'))    
  
  
    and ISNULL(b.isdelete, '')=0   
  --ORDER BY  CAST(SUBSTRING(psnum, 1, 2) AS int),b.district, b.acname, b.location, b.cameralocationtype              
 --ORDER BY  cast(psnum as int), b.district, b.acname, b.location
 oRDER BY  b.district, b.acname, b.location,s.deviceid
END  

--Select * from  booth  where PSNum='191A'
GO
/****** Object:  StoredProcedure [dbo].[GetMapBoothListViewNew_2]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
 -- exec GetMapBoothListViewNew '','','','','',''
CREATE PROCEDURE [dbo].[GetMapBoothListViewNew_2]               
(                    
 @district varchar(100)='',                    
 @assembly varchar(100)='',                  
 @status varchar(50)='',
 @LocationType varchar(50)='', 
 @booth varchar(511) = '',              
 @streamname varchar(255) = '',  
 @psnum varchar(255) = '',
 @location varchar(255) = '',
 
 @OrderBY varchar(255) = ''  
)                    
                  
AS                    
BEGIN              
             
  SELECT ROW_NUMBER() OVER(ORDER BY b.district) as rn,* 
   from booth b                    
   inner join streamlist s on b.streamid = s.id                     
   INNER JOIN operator_info op on b.operatorid = op.id                    
   inner join district d on d.district = b.district and d.accode = b.accode
  where b.isdisplay = 1 AND s.IsEnable = 1 
AND ((@district='') OR (b.district = @district))                    
   AND ((@assembly='') OR (b.accode =@assembly))             
   AND ((@status='') OR (status = @status))                    
   AND ((@booth = '') OR (b.location = @booth))              
   AND ((@streamname = '') OR (s.streamname like '%' + LTRIM(RTRIM(@streamname)) + '%'))    
  OR ((@psnum = '') OR (b.PSNum = @psnum))
  OR ((@location='')OR(b.location=@location))
  
    and ISNULL(b.isdelete, '')=0   
  --ORDER BY  CAST(SUBSTRING(psnum, 1, 2) AS int),b.district, b.acname, b.location, b.cameralocationtype              
 --ORDER BY  cast(psnum as int), b.district, b.acname, b.location
 oRDER BY  b.district, b.acname, b.location,s.deviceid
END  

--Select * from  booth  where PSNum='191A'
GO
/****** Object:  StoredProcedure [dbo].[GETMultimappedCamera]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETMultimappedCamera]  
AS  
BEGIN  
  
select b.district,b.acname,b.accode,b.PSNum,s.deviceid,location  from Booth b inner join streamlist s on s.id=b.streamid 
where  b.isdelete!=1 and streamid in(  
SELECT  streamid  
FROM booth  where isdelete!=1
GROUP BY streamid  
HAVING COUNT(streamid) > 1)  
order by streamid   
  
END  
GO
/****** Object:  StoredProcedure [dbo].[GetNetworkDtlsRpt]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetNetworkDtlsRpt] --'','','','','',40,42            
(                  
 @district varchar(100)='',                  
 @assembly varchar(100)='',                
 @status varchar(50)='',            
 @booth varchar(511) = '',            
 @streamname varchar(255) = '',
 @MinKbps int =NULL,
 @MaxKbps int=NULL 
)                  
AS                  
BEGIN  
if (@MinKbps is NULL)
BEGIN
SET @MinKbps=0
END
if (@MaxKbps is NULL)
BEGIN
SET @MaxKbps=100000
END
  SELECT *,FORMAT((SD.Kbps/(SD.CreateTime/1000.00)),'N2') as kbpsp,
  ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b                  
   inner join streamlist s on b.streamid = s.id                  
   INNER JOIN operator_info op on b.operatorid = op.id                  
   inner join district d on d.district = b.district and d.acname = b.acname   
   Inner join ServerDetails SD ON SD.Cameraid=s.deviceid 
  where b.isdisplay = 1 AND s.IsEnable = 1 and ISNULL(isdelete,'')=0
   AND ((@district='') OR (b.district = @district))                  
   AND ((@assembly='') OR (b.acname = @assembly))                 
   AND ((@status='') OR (status = @status))                  
   AND ((@booth = '') OR (b.location = @booth))            
   AND ((@streamname = '') OR (s.streamname like '%' + LTRIM(RTRIM(@streamname)) + '%'))   
   AND ISNULL(convert (int,(SD.Kbps/(SD.CreateTime/1000.00))),0) between @MinKbps and @MaxKbps
   AND ISNULL(isdelete, '')=0 
  ORDER BY convert (int,(SD.Kbps/(SD.CreateTime/1000.00))) desc,s.statusFlag desc,s.lastseen,s.status, b.district, b.acname, b.location, b.cameralocationtype            
END
GO
/****** Object:  StoredProcedure [dbo].[GetOnlineBoothListNew]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOnlineBoothListNew]
(      
 @district varchar(100)='',      
 @assembly varchar(100)='',    
 @status varchar(50)='',
 @isPink int = -1  ,  
 @isARO int = -1  ,  
 @booth varchar(511) = '',
 @streamname varchar(255) = '',
 @OrderBY varchar(255) = ''
)      
    
AS      
BEGIN
	IF @OrderBY = 'dist'
	BEGIN
		SELECT *,FORMAT((SD.Kbps/(SD.CreateTime/1000.00)),'N2') as kbpsp, 
		ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b      
			inner join streamlist s on b.streamid = s.id      
			--inner join operator_info oi on b.operatorid = oi.id      
			INNER JOIN operator_info op on b.operatorid = op.id      
			inner join district d on d.district = b.district and d.acname = b.acname  
			LEFT join ServerDetails SD ON SD.Cameraid=s.deviceid   
		where b.isdisplay = 1 AND s.IsEnable = 1 AND s.status = 'RUNNING'   
			AND ((@district='') OR (b.district = @district))      
			AND ((@assembly='') OR (b.acname = @assembly))     
			AND ((@status='') OR (status = @status))      
			AND ((@isPink = -1) OR (b.IsPink = @isPink))
			AND ((@booth = '') OR (b.location = @booth))
			AND ((@isARO = -1) OR (b.IsAro = @isARO))
			AND ((@streamname = '') OR (s.streamname = @streamname))
		ORDER BY s.status, b.district, b.acname, b.location, b.cameralocationtype
	END
	ELSE
	BEGIN
		SELECT *,FORMAT((SD.Kbps/(SD.CreateTime/1000.00)),'N2') as kbpsp, 
		ROW_NUMBER() OVER(ORDER BY b.district) as rn from booth b      
			inner join streamlist s on b.streamid = s.id      
			--inner join operator_info oi on b.operatorid = oi.id      
			INNER JOIN operator_info op on b.operatorid = op.id      
			inner join district d on d.district = b.district and d.acname = b.acname  
			 LEFT join ServerDetails SD ON SD.Cameraid=s.deviceid   
		where b.isdisplay = 1 AND s.IsEnable = 1 AND s.status = 'RUNNING'   
			AND ((@district='') OR (b.district = @district))      
			AND ((@assembly='') OR (b.acname = @assembly))     
			AND ((@status='') OR (status = @status))      
			AND ((@isPink = -1) OR (b.IsPink = @isPink))    
			AND ((@booth = '') OR (b.location = @booth))    
			AND ((@isARO = -1) OR (b.IsAro = @isARO))    
			AND ((@streamname = '') OR (s.streamname = @streamname))    
		ORDER BY b.district, b.acname, b.location, b.cameralocationtype,s.status
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetOnlineofflineSummary]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec GetOnlineofflineSummary 1
CREATE Proc [dbo].[GetOnlineofflineSummary]
(
@UserID int=0
)
AS
BEGIN
Declare @AssemblyAccesIds varchar(500)=''
Select @AssemblyAccesIds= AssemblyAccesIds from users where id=@UserID  
--SELECT UpdatedTime, CONVERT(varchar(5), UpdatedTime, 108) AS Time, SUM(Online) AS Online, SUM(Offline) AS Offline  
--FROM OnlineOfflineSummary where Acname in(Select acname from district where id in(SELECT CAST(value AS INT) FROM STRING_SPLIT(@AssemblyAccesIds, ',')))
--and UpdatedTime between CONVERT(varchar, [dbo].[GETIST](), 23) +' '+'09:00:00.000' and [dbo].[GETIST]()
--GROUP BY CONVERT(varchar(5), UpdatedTime, 108),UpdatedTime 
--order by UpdatedTime Asc

SELECT UpdatedTime, CONVERT(varchar(5), UpdatedTime, 108) AS Time, SUM(Online) AS Online, SUM(Offline) AS Offline,SUM(Connecectonce) AS Connecectonce
FROM (
    SELECT ROW_NUMBER() OVER(ORDER BY UpdatedTime) AS rn, UpdatedTime, CONVERT(varchar(5), UpdatedTime, 108) AS Time, SUM(Online) AS Online, 
	SUM(Offline) AS Offline,
	SUM(Connecectonce) AS Connecectonce
    FROM OnlineOfflineSummary
    WHERE Acname IN (SELECT acname FROM district WHERE id IN (SELECT CAST(value AS INT) FROM STRING_SPLIT(@AssemblyAccesIds, ',')))
        AND UpdatedTime BETWEEN CONVERT(DATETIME, CONVERT(VARCHAR(10), [dbo].[GETIST](), 23) + ' 05:51:00.000') AND [dbo].[GETIST]()
		--AND UpdatedTime BETWEEN DATEADD(hour, -12, [dbo].[GETIST]()) AND [dbo].[GETIST]()
		GROUP BY CONVERT(varchar(5), UpdatedTime, 108), UpdatedTime
) t
WHERE t.rn % 10= 0
GROUP BY CONVERT(varchar(5), UpdatedTime, 108), UpdatedTime
ORDER BY UpdatedTime ASC;
END
 

 --Update streamlist set status='STOPPED',isLive=0,lastseen='1970-01-01 00:00:00.000',statusFlag=0

 --Select  [dbo].[GETIST]()  
GO
/****** Object:  StoredProcedure [dbo].[GetPollingStationList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPollingStationList]  
(  
 @district varchar(100) = ''  
 ,@accode varchar(100) = ''
)  
AS  
BEGIN  

select * from booth where ((@district='') OR (district=@district))
and  ((@accode='') OR (accode=@accode))
order by id desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetPTZViewData]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPTZViewData]
(
	@vehicalno varchar(100)
)
AS
BEGIN
	SELECT DISTINCT
		vd.vehicalId,
		vd.Vehicle_No,
		vd.VehicleType,
		sl.id AS streamid,
		sl.deviceid,
		sl.servername,
		sl.prourl,
		si.name AS DriverName,
		si.contact_no AS DriverContactNo
	FROM vehicalDetail vd
	INNER JOIN streamlist sl ON sl.id = vd.streamid
	INNER JOIN Vehicle_Staff_Mapping vsm ON vsm.VehicleId = vd.vehicalId AND vsm.AssignDate = CONVERT(DATE, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'))
	INNER JOIN Staff_Info si ON si.Id = vsm.StaffId AND si.Type = 1
	WHERE Vehicle_No = @vehicalno
END
GO
/****** Object:  StoredProcedure [dbo].[GetReasonListForCameraPopup]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROCEDURE [dbo].[GetReasonListForCameraPopup]  
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON  
  
    -- Insert statements for procedure here  
    select * from cameraofflinereasonmaster 
END
GO
/****** Object:  StoredProcedure [dbo].[GetReasonListForPopup]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetReasonListForPopup]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    select * from reason
END
GO
/****** Object:  StoredProcedure [dbo].[GetRecordingSizeData]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetRecordingSizeData]                    
(                    
 @district varchar(100)='',                    
 @assembly varchar(100)='',             
 @streamname varchar(255) = '',        
 @date varchar(30)    
)                    
                  
AS                    
BEGIN              
              
   SELECT b.district,b.accode,b.acname,PSNum,deviceid,AssignDate,Size from booth b                                      
   inner join streamlist s on b.streamid = s.id                  
   inner join district d on d.district = b.district and d.acname = b.acname        
    inner join RunTimeDownloadURL R on R.DID=s.deviceid  
  where b.isdisplay = 1 AND s.IsEnable = 1  and  s.isdeleted=0               
   AND ((@district='') OR (b.district = @district))                    
   AND ((@assembly='') OR (b.acname = @assembly))   
   AND ((@date='') OR (R.AssignDate = @date))   
   AND ((@streamname = '') OR (s.streamname like '%' + LTRIM(RTRIM(@streamname)) + '%'))       
  	order by AssignDate desc,size desc           
 END   
GO
/****** Object:  StoredProcedure [dbo].[GetServerName]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetServerName]
AS
BEGIN
	SELECT DISTINCT servername FROM streamlist
	ORDER BY servername
END
GO
/****** Object:  StoredProcedure [dbo].[GetShiftWizeVehicleByAcCode]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetShiftWizeVehicleByAcCode]
@accode INT
AS
BEGIN
	DECLARE @ID INT;

	SELECT @ID = [id] FROM [DBO].[vehicleshift] 
	WHERE 
	CONVERT(TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'))
		BETWEEN CONVERT(TIME, starttime) AND CONVERT(TIME, endtime)

	IF (@ID IS NULL)
	BEGIN
		SELECT @ID = [id] FROM [DBO].[vehicleshift] 
		WHERE 
		starttime > endtime
	END

	SELECT * FROM vehicalDetail v 
	INNER JOIN Vehicle_Staff_Mapping m ON m.VehicleId = v.vehicalId 
			AND m.AssignDate = CONVERT(DATE, SWITCHOFFSET(GETDATE(), '+05:30'))
			AND m.ShiftId = @ID
	INNER JOIN Staff_Info staff ON m.StaffId = staff.Id 
			AND staff.Type = 1
	WHERE
	v.Accode = @accode

END
GO
/****** Object:  StoredProcedure [dbo].[GetStopVehicleDetails]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetStopVehicleDetails]
(
	@districtID INT = 0,
	@ACCode nvarchar(MAX) = '',
	@vehicleID INT = 0,
	@FromDt VARCHAR(30) = '',
	@ToDt VARCHAR(30) = ''
)
AS
BEGIN
	DECLARE @StartDt DATETIME, @StopDt DATETIME
	IF (@FromDt = '')
	BEGIN
		SET @StartDt = null
	END
	ELSE
	BEGIN
		SET @StartDt = convert(datetime, @FromDt + ' 00:00:00', 103)
	END
	IF (@ToDt = '')
	BEGIN
		SET @StopDt = null
	END
	ELSE
	BEGIN
		SET @StopDt = convert(datetime, @ToDt + ' 23:59:59', 103)
	END
	SELECT
		d.Id,
		v.vehicalId,
		v.Vehicle_No,
		v.DeviceId,
		dst.district,
		v.Accode,
		s.servername,
		s.streamname,
		d.StartTime,
		d.StopTime,
		d.CreateDate,
		d.ModifyDate,
		ISNULL(r.Reason,'') AS Reason,
		r.CreateDate AS ReasonDate
	FROM vehicalDetail v WITH (NOLOCK)
	INNER JOIN GPSStopDuration d WITH (NOLOCK) ON d.deviceid = v.DeviceId
	INNER JOIN streamlist s WITH (NOLOCK) ON s.id = v.streamid
	INNER JOIN district dst WITH (NOLOCK) ON dst.id = v.DistrictId
	LEFT JOIN GPSStopReasons r WITH (NOLOCK) ON r.GPSStopDurationID = d.Id
	WHERE ((@FromDt = '' AND @ToDt = '') OR (d.StartTime BETWEEN @StartDt AND @StopDt))
		--AND ((@districtID = 0) OR (dst.id = @districtID))
		AND ((@ACCode = '') OR (dst.accode = @ACCode))
		AND ((@vehicleID = 0) OR (v.vehicalId = @vehicleID))
	ORDER BY v.vehicalId, v.DeviceId, v.DistrictId, v.Accode, d.StartTime, d.StopTime

END
GO
/****** Object:  StoredProcedure [dbo].[GetStopVehicleList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetStopVehicleList]
(
	@FromDt VARCHAR(30) = '',
	@ToDt VARCHAR(30) = '',
	@districtid int = 0,
	@accode varchar(max) = '',
	@vehicleId INT = 0,
	@ShiftID INT = 0
)
AS
BEGIN
	DECLARE @StartDt DATETIME, @StopDt DATETIME, @District VARCHAR(MAX)

	IF (@FromDt = '')
	BEGIN
		SET @StartDt = null
	END
	ELSE
	BEGIN
		SET @StartDt = convert(datetime, @FromDt + ' 00:00:00', 103)
	END
	IF (@ToDt = '')
	BEGIN
		SET @StopDt = null
	END
	ELSE
	BEGIN
		SET @StopDt = convert(datetime, @ToDt + ' 23:59:59', 103)
	END

	SELECT @District = district FROM district WHERE id = @districtid

	SELECT DISTINCT
		d.Id,
		v.vehicalId,
		v.Vehicle_No,
		v.Vehicle_No as VehicleNo,
		v.DeviceId,
		dst.district,
		v.Accode,
		dst.acname,
		s.servername,
		s.streamname,
		CONVERT(varchar, d.StartTime, 103) AS DayDate,
		d.StartTime,
		d.StopTime,
		DATEDIFF(MINUTE, d.StartTime, d.StopTime) AS DiffMin,
		d.CreateDate,
		d.ModifyDate,
		dr.name AS DriverName,
		dr.contact_no AS DriverContactNo,
		fsv.name AS FSVName,
		fsv.contact_no AS FSVContactNo,
		vs.name AS ShiftName,
		vs.starttime AS ShiftStartTime,
		vs.endtime AS ShiftEndTime,
		ISNULL(sr.Reason,'') AS Reason
	FROM vehicalDetail v
	INNER JOIN GPSStopDuration d ON d.VehicleID = v.vehicalId
	INNER JOIN streamlist s ON s.id = v.streamid
	INNER JOIN district dst ON dst.id = v.DistrictId
	--INNER JOIN district dst ON dst.district = (SELECT district FROM [dbo].[district] WHERE DistrictId = v.DistrictId)
	INNER JOIN Staff_Info dr ON dr.Id = d.DriverID AND dr.Type = 1
	LEFT JOIN Staff_Info fsv ON fsv.Id = d.FSVID AND fsv.Type = 2
	INNER JOIN vehicleshift vs ON vs.id = d.ShiftID
	LEFT JOIN GPSStopReasons sr ON sr.GPSStopDurationID = D.Id
	WHERE ((@FromDt = '' AND @ToDt = '') OR (d.StartTime BETWEEN @StartDt AND @StopDt))
		AND ((@districtid = 0) OR (dst.district = @District))
		AND ((@accode = '') OR (dst.accode = @accode))
		AND ((@vehicleId = 0) OR (v.vehicalId = @vehicleId))
		AND ((@ShiftID = 0) OR (vs.id = @ShiftID))
	--ORDER BY v.vehicalId, v.DeviceId, v.DistrictId, v.Accode, d.StartTime, d.StopTime, dr.name, fsv.name, vs.name
	ORDER BY v.Vehicle_No,dst.district,v.Accode,dst.acname,s.servername,s.streamname,vs.name,vs.starttime,d.StartTime,d.StopTime,d.CreateDate,d.ModifyDate,dr.name,dr.contact_no,fsv.name,fsv.contact_no

END
GO
/****** Object:  StoredProcedure [dbo].[GetStopVehicleListForPopup]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[GetStopVehicleListForPopup] '','',0,'',0,0  
  
CREATE PROCEDURE [dbo].[GetStopVehicleListForPopup]    
(    
 @FromDt VARCHAR(30) = '',    
 @ToDt VARCHAR(30) = '',    
 @districtid int = 0,    
 @accode varchar(max) = '',    
 @vehicleId INT = 0,    
 @ShiftID INT = 0    
)    
AS    
BEGIN    
 DECLARE @StartDt DATETIME, @StopDt DATETIME    
 IF (@FromDt = '')    
 BEGIN    
  SET @StartDt = null    
 END    
 ELSE    
 BEGIN    
  SET @StartDt = convert(datetime, @FromDt + ' 00:00:00', 103)    
 END    
 IF (@ToDt = '')    
 BEGIN    
  SET @StopDt = null    
 END    
 ELSE    
 BEGIN    
  SET @StopDt = convert(datetime, @ToDt + ' 23:59:59', 103)    
 END    
 SELECT DISTINCT top(20)  
  d.Id,    
  v.vehicalId,    
  v.Vehicle_No,    
  v.DeviceId,    
  dst.district,    
  v.Accode,    
  dst.acname,    
  s.servername,    
  s.streamname,    
  CONVERT(varchar, d.StartTime, 103) AS DayDate,    
   CONVERT(varchar, d.StartTime, 22) AS StartTime,
 -- d.StartTime,    
 CONVERT(varchar, d.StopTime, 22) AS StopTime,    
  --d.StopTime,    
  DATEDIFF(MINUTE, d.StartTime, d.StopTime) AS DiffMin,    
  d.CreateDate,    
  d.ModifyDate,    
  dr.name AS DriverName,    
  dr.contact_no AS DriverContactNo    
  ,fsv.name AS FSVName,    
  fsv.contact_no AS FSVContactNo,    
  vs.name AS ShiftName,    
vs.starttime AS ShiftStartTime,    
vs.endtime AS ShiftEndTime,    
  
  ISNULL(sr.Reason,'') AS Reason    
 FROM vehicalDetail v    
 INNER JOIN GPSStopDuration d ON d.deviceid = v.DeviceId    
 INNER JOIN streamlist s ON s.id = v.streamid    
 INNER JOIN district dst ON dst.id = v.DistrictId and dst.isdeleted=0
 INNER JOIN Staff_Info dr ON dr.Id = d.DriverID AND dr.Type = 1 and dr.isdeleted=0
 INNER JOIN Staff_Info fsv ON fsv.Id = d.FSVID AND fsv.Type = 2 and dr.isdeleted=0
 INNER JOIN vehicleshift vs ON vs.id = d.ShiftID    
 LEFT JOIN GPSStopReasons sr ON sr.GPSStopDurationID = D.Id    
 WHERE v.isdeleted=0 AND ((@FromDt = '' AND @ToDt = '') OR (d.StartTime BETWEEN @StartDt AND @StopDt))    
  AND ((@districtid = 0) OR (dst.id = @districtid))    
  AND ((@accode = '') OR (dst.accode = @accode))    
  AND ((@vehicleId = 0) OR (v.vehicalId = @vehicleId))    
  AND ((@ShiftID = 0) OR (vs.id = @ShiftID))    
 AND (reason is null or reason ='')  
  --and  d.Id=4116
 --ORDER BY v.vehicalId, v.DeviceId, v.DistrictId, v.Accode, d.StartTime, d.StopTime, dr.name, fsv.name, vs.name    
 --ORDER BY v.Vehicle_No,dst.district,v.Accode,dst.acname,s.servername,s.streamname,vs.name,vs.starttime,d.StartTime,d.StopTime,d.CreateDate,d.ModifyDate,dr.name,dr.contact_no,fsv.name,fsv.contact_no    
 order by starttime desc  
    
 -- select * from Reason  
END
GO
/****** Object:  StoredProcedure [dbo].[GetStopVehicleTotalList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStopVehicleTotalList]
(
	@FromDt VARCHAR(30) = '',
	@ToDt VARCHAR(30) = '',
	@districtid int = 0,
	@accode varchar(max) = '',
	@vehicleId INT = 0,
	@ShiftID INT = 0
)
AS
BEGIN
	DECLARE @StartDt DATETIME, @StopDt DATETIME
	IF (@FromDt = '')
	BEGIN
		SET @StartDt = null
	END
	ELSE
	BEGIN
		SET @StartDt = convert(datetime, @FromDt + ' 00:00:00', 103)
	END
	IF (@ToDt = '')
	BEGIN
		SET @StopDt = null
	END
	ELSE
	BEGIN
		SET @StopDt = convert(datetime, @ToDt + ' 23:59:59', 103)
	END
	SELECT
		TBL.vehicalId,TBL.Vehicle_No,TBL.DeviceId,TBL.district,TBL.Accode,TBL.acname,TBL.servername,TBL.streamname,TBL.Dt,
		tbl.DriverName,tbl.DriverContactNo, tbl.FSVName, tbl.FSVContactNo, tbl.ShiftName, tbl.ShiftStartTime, tbl.ShiftEndTime,
		SUM(mnt) AS mnt
	FROM (
	SELECT
		--d.Id,
		v.vehicalId,
		v.Vehicle_No,
		v.DeviceId,
		dst.district,
		v.Accode,
		dst.acname,
		s.servername,
		s.streamname,
		CAST(d.StartTime AS DATE) AS Dt
		--,SUM(DATEDIFF(SECOND,d.StartTime,d.StopTime)) AS Seconds
		,ISNULL(DATEDIFF(MINUTE,d.StartTime,d.StopTime),0) AS mnt,
		dr.name AS DriverName,
		dr.contact_no AS DriverContactNo
		,fsv.name AS FSVName,
		fsv.contact_no AS FSVContactNo,
		vs.name AS ShiftName,
		vs.starttime AS ShiftStartTime,
		vs.endtime AS ShiftEndTime
	FROM vehicalDetail v
	INNER JOIN GPSStopDuration d ON d.VehicleID = v.vehicalId
	INNER JOIN streamlist s ON s.id = v.streamid
	INNER JOIN district dst ON dst.id = v.DistrictId
	INNER JOIN Staff_Info dr ON dr.Id = d.DriverID AND dr.Type = 1
	LEFT JOIN Staff_Info fsv ON fsv.Id = d.FSVID AND fsv.Type = 2
	INNER JOIN vehicleshift vs ON vs.id = d.ShiftID
	--GROUP BY v.vehicalId,v.Vehicle_No,v.DeviceId,dst.district,v.Accode,dst.acname,s.servername,s.streamname,d.StartTime
	WHERE ((@FromDt = '' AND @ToDt = '') OR (d.StartTime BETWEEN @StartDt AND @StopDt))
		AND ((@districtid = 0) OR (dst.id = @districtid))
		AND ((@accode = '') OR (dst.accode = @accode))
		AND ((@vehicleId = 0) OR (v.vehicalId = @vehicleId))
		AND ((@ShiftID = 0) OR (dst.id = @districtid))
	) AS TBL
	GROUP BY TBL.vehicalId,TBL.Vehicle_No,TBL.DeviceId,TBL.district,TBL.Accode,TBL.acname,TBL.servername,TBL.streamname,TBL.Dt,
	tbl.DriverName,tbl.DriverContactNo, tbl.FSVName, tbl.FSVContactNo, tbl.ShiftName, tbl.ShiftStartTime, tbl.ShiftEndTime
	ORDER BY TBL.vehicalId, TBL.DeviceId, TBL.Accode, TBL.Dt
END
GO
/****** Object:  StoredProcedure [dbo].[GetStreamDetailsByDID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStreamDetailsByDID]  
(  
 @DID varchar(50)  
)  
AS  
BEGIN  
 SELECT * FROM streamlist where deviceid = @DID  and ISNULL(isdeleted,'')=0   
END  
GO
/****** Object:  StoredProcedure [dbo].[GetStreamList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStreamList]  
(  
   
 @search varchar(200)=''  
	
)  
AS  
BEGIN  
 SELECT  
 id,deviceid,prourl,servername from streamlist s  
 WHERE  
 ((@search = '') OR (s.deviceid like '%' + @search + '%')  
   OR (s.prourl like '%' + @search + '%') OR (s.servername like '%' + @search + '%'))  
  and ISNULL(isdeleted,'')=0  
   
  
END

--Update  streamlist set isdeleted=0 where isdeleted is null
GO
/****** Object:  StoredProcedure [dbo].[GetStreamlistByID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStreamlistByID]
(
	@ID INT = 0
)
AS
BEGIN
	SELECT
		s.id,s.deviceid,s.prourl,s.servername,s.IsAICamera
	FROM streamlist s
	WHERE
		s.id = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetStreamNameListAutoComplete]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetStreamNameListAutoComplete]
(
	@search VARCHAR(50)
)
AS
BEGIN
	SELECT TOP 50
		deviceid
	FROM streamlist
	WHERE deviceid LIKE '%' + @search + '%'
	ORDER BY deviceid
END
GO
/****** Object:  StoredProcedure [dbo].[GetUnmappedCameraList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUnmappedCameraList]  
(  
 @CameraID nvarchar(50) = ''  
 ,@Status varchar(50) = ''  
)  
AS  
BEGIN  
 SELECT sl.* FROM streamlist sl  
 LEFT JOIN booth b on b.streamid = sl.id and isnull(b.isdelete,0)='' 
 WHERE sl.isdeleted=0 AND b.id IS NULL 
 AND (@CameraID = '' OR sl.deviceid like '%' + @CameraID + '%')  
 AND (@Status = '' OR @Status = 'BOTH' OR sl.status = @Status)  
 DECLARE @msg nvarchar(200)=''  
 set @msg='Camera Mapped SuccessFully'  
 Select @msg as msg, CAST(1 AS bit) AS Status  
END  
GO
/****** Object:  StoredProcedure [dbo].[GetUserDetails]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--getusers
CREATE PROCEDURE [dbo].[GetUserDetails]  
AS  
BEGIN  
    -- SET NOCOUNT ON added to prevent extra result sets from  
    -- interfering with SELECT statements.  
    SET NOCOUNT ON  
  
    -- Insert statements for procedure here  
    select * from users  
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserLoginHistoryList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserLoginHistoryList]
(
    @search varchar(100) = ''
)
AS
BEGIN
    SELECT
        u.id,
        u.usercode,
        u.username,
        ISNULL(l.IPAddress,'') AS IPAddress,
        l.LoginDateTime,
        u.IsEnable,
        u.logincount,
        u.logincountenable
    FROM users u
    INNER JOIN LoginUserHistory l ON u.id=l.UserID
    WHERE @search = '' OR u.username like '%' + @search + '%' OR l.IPAddress like '%' + @search + '%'
    ORDER BY u.logincount DESC,u.username,l.LoginDateTime
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserLoginHistoryReport]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserLoginHistoryReport]
(
	@dt VARCHAR(20) = ''
)
AS
BEGIN
	DECLARE @logindt DATE
	IF (@dt = '')
	BEGIN
		SET @logindt = NULL
	END
	ELSE
	BEGIN
		SET @logindt = CAST(@dt AS DATE)
	END
	SELECT
		u.username,
		REPLACE(u.usercode,'_',' ') AS usercode,
		l.IPAddress,
		l.LoginDateTime
	FROM LoginUserHistory l
	INNER JOIN users u ON u.id = l.UserID
	WHERE
		((@dt = '') OR CAST(l.LoginDateTime AS DATE) = @logindt)
	ORDER BY
		l.LoginDateTime, u.username
END
GO
/****** Object:  StoredProcedure [dbo].[GetVehicleData]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetVehicleData]
(  
 @district varchar(255) = '',  
 @accode varchar(255) = '',  
 @psnum varchar(255) = ''  
)  
AS  
BEGIN  
 DECLARE @Internaldistrict VARCHAR(100)='', @Internalaccode VARCHAR(100)='',@Internalpsnum VARCHAR(100)='';  
 SET @Internaldistrict = @district  
 SET @Internalaccode = @accode  
 SET @Internalpsnum = @psnum  
 SELECT  
  dis.district,  
  b.location AS VehicleNo,  
  ISNULL(op.operatorName,'') AS Staff_Name,  
  CONVERT(varchar(20), ISNULL(op.operatorNumber,0)) AS Staff_Mobile_No,  
  st.streamname AS CamaraId,  
  CONCAT('https://', st.servername, '/live-record/', st.streamname, '.m3u8') AS HlsUrl,  
  dis.acname AS acname, -- AssemblyName,  
  dis.id AS DistrictId  
 FROM   
  [dbo].[booth] b  
  INNER JOIN streamlist st ON b.streamid = st.id AND st.isdeleted = 0 AND st.isenable = 1 AND st.status = 'RUNNING' --AND (st.lastseen >= DATEADD(SECOND,-60,[DBO].[GETIST]()) OR st.statusFlag=2)  
  INNER JOIN district dis ON dis.acname = b.acname   
  LEFT JOIN operator_info op ON op.id = b.operatorid  
 WHERE b.IsAro = 1  
  AND ((@Internaldistrict='') OR (b.district=@Internaldistrict))  
  AND ((@Internalaccode='') OR (b.accode=@Internalaccode))  
  AND ((@psnum = '') OR (b.PSNum=@Internalpsnum))  
 ORDER BY b.district  
END
GO
/****** Object:  StoredProcedure [dbo].[GetVehicleDetail]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[GetVehicleDetail]
@vehicleNo Varchar(255) = '',
@ShiftName VARCHAR(255) = ''
AS
	BEGIN
		  SELECT 
			vh.vehicalId AS id,
			dis.district As District,
			dis.acname AS acname,
			vh.Vehicle_No AS VehicleNo,
			vh.VehicleType AS VehicleType,
			sft.name AS ShiftName,
			ISNULL(MAX(CASE WHEN staff.Type = 1 THEN staff.name ELSE Null END),'') AS DriverName,
			ISNULL(MAX(CASE WHEN staff.Type = 1 THEN staff.contact_no ELSE Null END),'') AS DriverContactNo,
			ISNULL(MAX(CASE WHEN staff.Type = 2 THEN staff.name ELSE Null END),'') AS FSVStaffName,
			ISNULL(MAX(CASE WHEN staff.Type = 2 THEN staff.contact_no ELSE Null END),'') AS FSVStaffContactNo,
			strm.streamname AS CameraDID,
			ISNULL(vh.DeviceId,'') AS GPSDeviceId
		  FROM [dbo].[vehicalDetail] vh
		  INNER JOIN [dbo].[district] dis ON dis.id = vh.DistrictId AND dis.isdeleted = 0
		  INNER JOIN [dbo].[Vehicle_Staff_Mapping] mapping ON mapping.VehicleId = vh.vehicalId AND mapping.isdeleted = 0
		  INNER JOIN [dbo].[vehicleshift] sft on sft.id = mapping.ShiftId AND sft.isdeleted = 0
		  INNER JOIN [dbo].[Staff_Info] staff ON mapping.StaffId = staff.Id AND staff.isdeleted = 0
		  INNER JOIN [dbo].[streamlist] strm ON strm.id = vh.streamid AND strm.isdeleted = 0
		  WHERE 
		  (@vehicleNo = '' AND @ShiftName = '' AND mapping.AssignDate = CONVERT(DATE, SWITCHOFFSET(GETDATE(), '+05:30'))) OR 
		  (@ShiftName = sft.name AND @vehicleNo = vh.Vehicle_No AND mapping.AssignDate = CONVERT(DATE, SWITCHOFFSET(GETDATE(), '+05:30')))
		  GROUP BY vh.Vehicle_No, dis.district, dis.acname, vh.VehicleType, vh.DeviceId, sft.name, strm.streamname, vh.vehicalId
		  ORDER BY vh.Vehicle_No
	END
GO
/****** Object:  StoredProcedure [dbo].[GetVehicleInstallation]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[GetVehicleInstallation]
(
	@district varchar(255) = '',
	@accode varchar(255) = '',
	@vehicleno varchar(255) = '',
	@fromdt varchar(255) = '',
	@todt varchar(255) = '',
	@status int = -1
)
AS
BEGIN
	DECLARE @StartDt DATETIME, @StopDt DATETIME, @toDay DATETIME

	SET @toDay = CAST(SWITCHOFFSET(GETDATE(), '+05:30') AS DATE);
	IF (@FromDt = '')
	BEGIN
		SET @StartDt = null
	END
	ELSE
	BEGIN
		SET @StartDt = convert(datetime, @FromDt + ' 00:00:00', 103)
	END
	IF (@ToDt = '')
	BEGIN
		SET @StopDt = null
	END
	ELSE
	BEGIN
		SET @StopDt = convert(datetime, @ToDt + ' 23:59:59', 103)
	END

	SELECT DISTINCT
		ins.id,
		ins.district,
		ins.Accode,
		district.acname,
		vd.Vehicle_No AS VehicleNo,
		ins.VehicleType,
		ins.SchduledDate,
		ins.ActualDateOfArrival,
		ins.InstallationDate,
		ins.status,
		ins.CreateDate,
		ins.ModifyDate,
		ins.Zone,
		s.streamname,
		driver.name as DriverName,
		driver.contact_no as DriverNo,
		fsv.name as StaffName,
		fsv.contact_no as StaffNo
	FROM VehicleInstallation ins
	INNER JOIN district ON district.district = ins.District AND district.accode = ins.Accode
	INNER JOIN vehicalDetail vd ON vd.Vehicle_No = ins.VehicleNo
	INNER JOIN streamlist s ON s.id = vd.streamid
	INNER JOIN Vehicle_Staff_Mapping mapping ON mapping.VehicleId = vd.vehicalId AND mapping.AssignDate = @toDay
	LEFT JOIN Staff_Info driver ON mapping.StaffId = driver.Id AND driver.TYPE = 1
	LEFT JOIN Staff_Info fsv ON mapping.StaffId = fsv.Id AND fsv.TYPE = 2
	WHERE
		((@district = '') OR (ins.District = @district))
		AND ((@accode = '') OR (ins.Accode = @accode))
		AND ((@vehicleno = '') OR (ins.VehicleNo = @vehicleno))
		AND ((@FromDt = '' AND @ToDt = '') OR (InstallationDate BETWEEN @StartDt AND @StopDt) OR (SchduledDate BETWEEN @StartDt AND @StopDt) OR (ActualDateOfArrival BETWEEN @StartDt AND @StopDt))
		AND ((@status = -1) OR (ins.status = @status))
END
GO
/****** Object:  StoredProcedure [dbo].[GETVehicleInstallationByID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GETVehicleInstallationByID]
(
	@ID INT
)
AS
BEGIN
		DECLARE @toDay DATETIME

		SET @toDay = CAST(SWITCHOFFSET(GETDATE(), '+05:30') AS DATE);

		SELECT DISTINCT
		ins.id,
		ins.district,
		ins.Accode,
		district.acname,
		ins.VehicleNo,
		ins.VehicleType,
		ins.SchduledDate,
		ins.ActualDateOfArrival,
		ins.InstallationDate,
		ins.status,
		ins.CreateDate,
		ins.ModifyDate,
		ins.Zone,
		s.streamname,
		driver.name as DriverName,
		driver.contact_no as DriverNo,
		fsv.name as StaffName,
		fsv.contact_no as StaffNo
	FROM VehicleInstallation ins
	INNER JOIN district ON district.district = ins.District AND district.accode = ins.Accode
	INNER JOIN vehicalDetail vd ON vd.Vehicle_No = ins.VehicleNo
	INNER JOIN streamlist s ON s.id = vd.streamid
	INNER JOIN Vehicle_Staff_Mapping mapping ON mapping.VehicleId = vd.vehicalId AND mapping.AssignDate = @toDay
	LEFT JOIN Staff_Info driver ON mapping.StaffId = driver.Id AND driver.TYPE = 1
	LEFT JOIN Staff_Info fsv ON mapping.StaffId = fsv.Id AND fsv.TYPE = 2
	WHERE ins.Id = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCameraOfflineStatic]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Drop table #Temp   
CREATE Procedure [dbo].[InsertCameraOfflineStatic]    
(    
@tblData as dbo.UT_UploadCameraOffline READONLY    
)    
AS    
BEGIN    
 Declare @msg varchar(200)    
 CREATE TABLE #Temp    
 (    
  District varchar(100),    
  acname varchar(100),    
  PSNum varchar(max),    
  VehicleNo varchar(100),    
  DriverName varchar(100),    
  streamname varchar(100),    
  DayDate varchar(100),    
  StartTime varchar(100),    
  StopTime varchar(100),    
  DiffMin varchar(100),    
  Reason varchar(100),    
 )    
   insert into #Temp   
   SELECT District,Assembly,PSNum,Location,OperatorName,CameraID,Date,StartTime,EndTime,Total, Remarks FROM @tblData  
    
   Delete from CameraOfflineStaticRpt where Date=(Select distinct DayDate from #Temp)    
    
   INSERT INTO CameraOfflineStaticRpt (District,[Assembly],PsNo,Location,Operator,CameraDID,Date,StartTime,EndTime,Time,Remark)    
   SELECT District,Assembly,PSNum,Location,OperatorName,CameraID,Date,StartTime,EndTime,Total,Remarks FROM @tblData    
    
   Set @msg='Camera Offline Report Uploaded Successfully!!'    
   Select  @msg as Msg    
   --Select  District as District,acname  as acname,PSNum as PSNum,VehicleNo as VehicleNo,    
   --         DriverName as DriverName,streamname as streamname,DayDate as DayDate, StartTime as StartTime,    
   --         StopTime as StopTime, CONVERT(VARCHAR(5),CONVERT(DATETIME, DiffMin, 0), 108) as DiffMin, Reason as Reason from #Temp    
   Select  District as District,acname  as acname,PSNum as PSNum,VehicleNo as VehicleNo,    
            DriverName as DriverName,streamname as streamname,DayDate as DayDate, StartTime as StartTime,    
            StopTime as StopTime, DiffMin, Reason as Reason from #Temp  
END    
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateVehicleInstallation]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[InsertUpdateVehicleInstallation]
(
	@id int,
	@district varchar(255),
	@accode varchar(255),
	@Zone varchar(255),
	@Camera varchar(255),
	@DriverId INT,
	@StaffID INT,
	@status tinyint,
	@vehicletype varchar(255),
	@vehicleno varchar(255),
	@SchduledDate varchar(255),
	@ActualDateOfArrival varchar(255),
	@InstallationDate varchar(255),
	@UserName VARCHAR(255)
)
AS
BEGIN
	DECLARE @SchduledDt DATETIME, @ActualDt DATETIME, @InstallationDt DATETIME, @toDay DATETIME
	SET @toDay = SWITCHOFFSET(GETDATE(), '+05:30');
	
	IF (@SchduledDate = '')
	BEGIN
		SET @SchduledDt = null
	END
	ELSE
	BEGIN
		SET @SchduledDt = convert(datetime, @SchduledDate + ' 00:00:00', 103)
	END

	IF (@ActualDateOfArrival = '')
	BEGIN
		SET @ActualDt = null
	END
	ELSE
	BEGIN
		SET @ActualDt = convert(datetime, @ActualDateOfArrival + ' 00:00:00', 103)
	END

	IF (@InstallationDate = '')
	BEGIN
		SET @InstallationDt = null
	END
	ELSE
	BEGIN
		SET @InstallationDt = convert(datetime, @InstallationDate + ' 00:00:00', 103)
	END

		DECLARE @OldVehicleNo VARCHAR(255),@streamId INT, @districtId INT, @OldstreamId INT, @acname VARCHAR(255), @OldvehicleId INT, @vehicalId INT, 
				@OldStaffId INT, @OldDriverId INT;

		SELECT @OldVehicleNo = VehicleNo FROM VehicleInstallation WHERE Id = @id
		SELECT @OldstreamId = streamid, @OldvehicleId = vehicalId FROM vehicalDetail WHERE Vehicle_No = @OldVehicleNo
		SELECT @streamId = id from streamlist WHERE streamname = @Camera
		SELECT @districtId = id, @acname = acname from district WHERE district = @district AND accode = @accode
		
		SELECT DISTINCT 
			@OldDriverId = stf.Id 
		FROM 
		Staff_Info stf 
		INNER JOIN Vehicle_Staff_Mapping mapping on mapping.StaffId = stf.Id AND stf.type = 1
		WHERE mapping.VehicleId = @OldvehicleId AND mapping.AssignDate = CAST(@toDay AS DATE) AND mapping.isdeleted = 0  AND stf.isdeleted = 0 

		SELECT DISTINCT 
			@OldStaffId = stf.Id 
		FROM 
		Staff_Info stf 
		INNER JOIN Vehicle_Staff_Mapping mapping on mapping.StaffId = stf.Id AND stf.type = 2
		WHERE mapping.VehicleId = @OldvehicleId AND mapping.AssignDate = CAST(@toDay AS DATE) AND mapping.isdeleted = 0 AND stf.isdeleted = 0 

		BEGIN TRAN
			UPDATE VehicleInstallation
			SET
				District = @District,
				Accode = @Accode,
				VehicleNo = @VehicleNo,
				VehicleType = @VehicleType,
				SchduledDate = @SchduledDt,
				ActualDateOfArrival = @ActualDt,
				InstallationDate = @InstallationDt,
				Zone = @Zone,
				status = @status,
				ModifyDate = @toDay,
				LastEditedBy = @UserName
			WHERE Id=@id

			UPDATE vehicalDetail 
			SET
				Accode = @accode,
				streamid = @streamId,
				DistrictId = @districtId,
				Vehicle_No = @vehicleno,
				VehicleType = @vehicletype,
				LastEditedBy = @UserName
			WHERE 
			Vehicle_No = @OldVehicleNo AND isdeleted = 0

			SELECT @vehicalId = vehicalId FROM vehicalDetail WHERE Vehicle_No = @vehicleno

			UPDATE location_info
			SET
				VehicleNo = @vehicleno,
				UpdateDatetime = @toDay
			WHERE
			VehicleNo = @OldVehicleNo

			UPDATE booth
			SET 
				district = @district,
				accode = @accode,
				acname = @acname,
				location = @vehicleno,
				streamid = @streamId,
				updatedBy = @UserName,
				updatedDate = @toDay,
				updatedFrom = 'VehicleInstallationMaster'
			WHERE 
			streamid = @OldstreamId
			
			UPDATE Vehicle_Staff_Mapping
					SET
						VehicleId = @vehicalId,
						Streamid = @streamId,
						StaffId = @DriverId,
						LastEditedOn = @toDay,
						LastEditedBy = @UserName  
					WHERE
					VehicleId = @OldvehicleId AND AssignDate = CAST(@toDay AS DATE) AND isdeleted = 0 AND StaffId = @OldDriverId
			
			UPDATE Vehicle_Staff_Mapping
			SET
				VehicleId = @vehicalId,
				Streamid = @streamId,
				StaffId = @StaffID,
				LastEditedOn = @toDay,
				LastEditedBy = @UserName 
			WHERE
			VehicleId = @OldvehicleId AND AssignDate = CAST(@toDay AS DATE) AND isdeleted = 0 AND StaffId = @OldStaffId

		COMMIT TRAN
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateVehicleInstallationViaDataTable]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUpdateVehicleInstallationViaDataTable]
@table VehicleInstallationType READONLY
AS
	BEGIN
		INSERT INTO [dbo].[VehicleInstallation]
		SELECT * FROM @table
	END
GO
/****** Object:  StoredProcedure [dbo].[IsManagerExists]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[IsManagerExists]
@district varchar(255),
@number varchar(255)
AS
BEGIN
	SELECT *  FROM DistrictManager
	WHERE district = @district and [Manager_Number]=@number
END
GO
/****** Object:  StoredProcedure [dbo].[SaveAssemblyWiseGoGreenList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveAssemblyWiseGoGreenList]      
(      
    @acname varchar(100),      
    @count INT,      
    @status varchar(50)
  --  @isLive INT = 0  
)      
AS      
BEGIN      
          
    DECLARE @dt DATETIME      
    SET @dt = [dbo].[GETIST]()      
      
    IF (@status = 'RUNNING')      
    BEGIN      
  IF OBJECT_ID(N'tempdb..#streamlist') IS NOT NULL                                  
  BEGIN                                  
   DROP TABLE #streamlist                                  
  END                                  
  CREATE TABLE #streamlist      
  (                                      
   sid int,      
   deviceid varchar(100)      
  )      
  INSERT INTO #streamlist(sid,deviceid)      
  SELECT id,deviceid from (SELECT sl.id,sl.deviceid,      
   ROW_NUMBER() OVER(PARTITION BY b.district,b.acname order by b.district,b.acname,b.location,sl.status desc) rn,      
   ROW_NUMBER() OVER(PARTITION BY b.district,b.acname,b.location order by b.district,b.acname,b.location,sl.status desc) rn2      
  FROM streamlist sl      
  INNER JOIN booth b on b.streamid = sl.id  and ISNULL(b.isdelete,0)=0      
  INNER JOIN district d on d.district = b.district AND d.acname = b.acname      
  --WHERE d.acname = @acname AND sl.isLive=@isLive AND sl.status='STOPPED'      
  WHERE d.acname = @acname  AND sl.status='STOPPED'      
  ) tbl      
  order by rn2,rn    
  OFFSET 0 ROWS FETCH FIRST @count ROWS ONLY      
      
  UPDATE streamlist              
  SET              
  statusFlag=2,status='RUNNING',isLive=1,lastseen=@dt        
  WHERE ISNULL(streamlist.isdeleted,0)=0      
  AND streamlist.id IN (SELECT sid from #streamlist)      
        
 UPDATE b              
   SET              
  b.Trial1=1  
   from booth b  
   inner join streamlist s on s.id=b.streamid  and ISNULL(b.isdelete,0)=0 
   WHERE s.id IN (SELECT sid from #streamlist)  
  
  UPDATE csd              
  SET              
  OffLineStopTime = @dt,              
  ModifyDate = @dt        
  FROM CameraStopDuration csd              
  WHERE csd.OffLineStopTime IS NULL      
  AND csd.streamname IN (SELECT deviceid from #streamlist)      
    END      
    IF (@status = 'STOPPED')      
    BEGIN      
  IF OBJECT_ID(N'tempdb..#streamliststopped') IS NOT NULL                                  
  BEGIN                                  
   DROP TABLE #streamliststopped      
  END                                  
  CREATE TABLE #streamliststopped      
  (                                      
   sid int,      
   deviceid varchar(100)      
  )      
  INSERT INTO #streamliststopped(sid,deviceid)      
  SELECT id,deviceid from (SELECT sl.id,sl.deviceid,      
   ROW_NUMBER() OVER(PARTITION BY b.district,b.acname order by b.district,b.acname,b.location,sl.status) rn,      
   ROW_NUMBER() OVER(PARTITION BY b.district,b.acname,b.location order by b.district,b.acname,b.location,sl.status) rn2      
  FROM streamlist sl      
  INNER JOIN booth b on b.streamid = sl.id   and ISNULL(b.isdelete,0)=0    
  INNER JOIN district d on d.district = b.district AND d.acname = b.acname      
  WHERE d.acname = @acname AND sl.statusFlag=2      
  ) tbl      
  order by rn2,rn      
  OFFSET 0 ROWS FETCH FIRST @count ROWS ONLY      
    
  UPDATE sl              
  SET              
  status='STOPPED',statusFlag=1,lastseen=@dt        
  FROM streamlist sl        
  WHERE ISNULL(sl.isdeleted,0)=0      
  AND sl.id IN (SELECT sid from #streamliststopped)      
        
        INSERT INTO CameraStopDuration (streamname,OffLineStartTime,CreateDate,ModifyDate)        
        SELECT deviceid,@dt,@dt,@dt from #streamliststopped      
    END      
END 
GO
/****** Object:  StoredProcedure [dbo].[SaveBoothByID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveBoothByID]        
(        
 @id INT        
 ,@streamid INT        
 ,@district nvarchar(max)        
 ,@accode nvarchar(max)        
 ,@acname nvarchar(max)        
 ,@PSNum nvarchar(max)        
 ,@location nvarchar(max)        
 ,@OperatorName varchar(200) = ''        
 ,@OperatorNumber varchar(200) = ''        
 ,@OperatorDesignation varchar(200) = ''        
 ,@longitude decimal(12, 9)=0        
 ,@latitude decimal(12, 9)=0        
 ,@cameralocationtype nvarchar(100)        
 ,@IsPink BIT=0        
 ,@IsAro BIT=0        
 ,@UserName varchar(500) = ''      
 ,@IPAddress varchar(50)=''      
)        
AS        
BEGIN        
Declare  @Msg varchar(200) = '', @ErrorMsg VARCHAR(500)='', @operatorID INT = 0
Declare @Streamid1 int , @ID1 int
--AND district<>@district AND accode<>@accode AND acname<>@acname AND PSNum<>@PSNum        
 IF EXISTS(SELECT * FROM booth where streamid = @streamid  AND id <> @id  AND ISNULL(isdelete,0) = 0)        
 BEGIN       
 SELECT @ID1=id FROM booth where streamid = @streamid  AND id <> @id  AND ISNULL(isdelete,0) = 0
 IF (@id = 0 AND @ID1!=0)   
 begin
  SELECT @ErrorMsg = 'This camera is already mapped with District: ' + district + ' Assembly: ' + acname + ' PSNo: ' + PSNum + ' Location:' + location 
  FROM booth where streamid = @streamid
  Select @ErrorMsg as msg, CAST(0 AS bit) AS Status, @id as ID,@ID1 as ID1,'AddExist' as Error  
 END
 Else
 begin
  SELECT @ErrorMsg = 'This camera is already mapped with District: ' + district + ' Assembly: ' + acname + ' PSNo: ' + PSNum + ' Location:' + location +' '+
  'IF you want to swap Then Click on OK'
  FROM booth where streamid = @streamid        
  Select @ErrorMsg as msg, CAST(0 AS bit) AS Status, @id as ID,@ID1 as ID1,'DupDID' as Error   
  --RAISERROR(@ErrorMsg, 16,-1)        
  --RETURN        
  END
 END      
 ELSE IF EXISTS(SELECT * FROM booth where district = @district AND acname = @acname and PSNum = @PSNum AND id <> @id AND ISNULL(isdelete,0) = 0)        
 BEGIN        
  SELECT @ErrorMsg = 'This PS No is already exist in District: ' + district + ' Assembly: ' + acname + ' PSNo: ' + PSNum + ' Location:' + location        
  FROM booth where district = @district AND acname = @acname and PSNum = @PSNum AND id <> @id      
  Select @ErrorMsg as msg, CAST(0 AS bit) AS Status,'PS No' as Error     
  --RAISERROR(@ErrorMsg, 16,-1)        
  --RETURN        
 END      
 ELSE        
 BEGIN        
  IF(@OperatorName='') BEGIN SET @OperatorName='NA' END      
   IF(@OperatorNumber='') BEGIN SET @OperatorNumber='1234567890' END      
  SELECT @operatorID = id FROM operator_info WHERE operatorName = @OperatorName AND operatorNumber = @OperatorNumber AND Designation =@OperatorDesignation        
  IF (@operatorID = 0 AND @OperatorName!='')        
  BEGIN        
   INSERT INTO operator_info(operatorName,operatorNumber,Designation,district)        
   VALUES(@OperatorName,@OperatorNumber,@OperatorDesignation,@district)        
   SET @operatorID = @@IDENTITY        
  END        
        
        
  IF (@id = 0)        
  BEGIN        
   INSERT INTO booth(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,        
   longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,      
   AddedFromPage,AddedFrom,updatedBy,updatedFrom)        
   VALUES(@streamid,@operatorID,@district,@accode,@acname,@PSNum,@location,1,1,        
   0,0,@cameralocationtype,0,CASE WHEN @cameralocationtype = 'Outside' THEN 1 ELSE 0 END,        
   [dbo].[GETIST](),@UserName,0,      
   'BoothMaster.aspx','Add Booth',@UserName,'Add Booth')        
        
   DECLARE @boothid INT = 0        
   SET @boothid = @@IDENTITY        
        
   INSERT INTO boothhistory(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,        
   longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,updatedDate,updatedBy,updatedFrom,Action,      
   boothid,IPAddress,AddedFromPage,AddedFrom)        
   VALUES(@streamid,@operatorID,@district,@accode,@acname,@PSNum,@location,1,1,        
   0,0,@cameralocationtype,0,CASE WHEN @cameralocationtype = 'Outside' THEN 1 ELSE 0 END,        
   [dbo].[GETIST](),@UserName,0,[dbo].[GETIST](),@UserName,'Add Booth','INSERT',      
   @boothid,@IPAddress,'BoothMaster.aspx','Add Booth')        
        
   SET @Msg='Record Inserted Successfully!!'        
   Select @Msg as msg, CAST(1 AS bit) AS Status,@boothid as BoothID      
  END        
  ELSE        
  BEGIN        
   UPDATE booth        
   SET        
    streamid = @streamid,        
operatorid = @operatorID,        
    district = @district,        
    accode = @accode,        
    acname = @acname,        
    PSNum = @PSNum,        
    location = @location,        
    cameralocationtype = @cameralocationtype,        
    IsOutsideBooth = CASE WHEN @cameralocationtype = 'Outside' THEN 1 ELSE 0 END,        
    updatedDate = [dbo].[GETIST](),        
    updatedBy = @UserName,        
    updatedFrom = 'Edit Booth',      
 UpdatedFromPage = 'BoothMaster.aspx',      
   -- longitude = 0,        
  --  latitude = 0,        
    IsPink = 0        
    ,IsAro = 0        
 ,isupdated=1      
   WHERE        
    id = @id        
        
   UPDATE boothhistory        
   SET        
    isdelete = 1,        
    updatedDate=[dbo].[GETIST](),        
    updatedBy = @UserName,        
    updatedFrom = 'Edit Booth',      
    UpdatedFromPage = 'BoothMaster.aspx'      
   WHERE boothid = @id AND isnull(isdelete,0)=0        
        
   INSERT INTO boothhistory(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,        
   longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,updatedDate,updatedBy,      
   UpdatedFromPage,updatedFrom,Action,boothid,IPAddress)        
   VALUES(@streamid,@operatorID,@district,@accode,@acname,@PSNum,@location,1,1,        
   0,0,@cameralocationtype,0,CASE WHEN @cameralocationtype = 'Outside' THEN 1 ELSE 0 END,        
   [dbo].[GETIST](),@UserName,0,[dbo].[GETIST](),@UserName,'BoothMaster.aspx','Edit Booth','UPDATE',@id,@IPAddress)        
        
   SET @Msg='Record Updated Successfully!!'        
   Select @Msg as msg, CAST(1 AS bit) AS Status      
  END        
 END        
END
GO
/****** Object:  StoredProcedure [dbo].[SaveBoothByID_old]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveBoothByID_old]          
(          
 @id INT          
 ,@streamid INT          
 ,@district nvarchar(max)          
 ,@accode nvarchar(max)          
 ,@acname nvarchar(max)          
 ,@PSNum nvarchar(max)          
 ,@location nvarchar(max)          
 ,@OperatorName varchar(200) = ''          
 ,@OperatorNumber varchar(200) = ''          
 ,@OperatorDesignation varchar(200) = ''          
 ,@longitude decimal(12, 9)=0          
 ,@latitude decimal(12, 9)=0          
 ,@cameralocationtype nvarchar(100)          
 ,@IsPink BIT=0          
 ,@IsAro BIT=0          
 ,@UserName varchar(500) = ''        
 ,@IPAddress varchar(50)=''        
)          
AS          
BEGIN          
Declare  @Msg varchar(200) = '', @ErrorMsg VARCHAR(500)='', @operatorID INT = 0  
Declare @Streamid1 int , @ID1 int  
--AND district<>@district AND accode<>@accode AND acname<>@acname AND PSNum<>@PSNum          
 IF EXISTS(SELECT * FROM booth where streamid = @streamid  AND id <> @id AND ISNULL(isdelete,0) = 0)          
 BEGIN         
 SELECT @ID1=id FROM booth where streamid = @streamid  AND id <> @id AND ISNULL(isdelete,0) = 0  
  SELECT @ErrorMsg = 'This camera is already mapped with District: ' + district + ' Assembly: ' + acname + ' PSNo: ' + PSNum + ' Location:' + location +' '+  
  'IF you want to swap Then Click on OK'  
  FROM booth where streamid = @streamid          
  Select @ErrorMsg as msg, CAST(0 AS bit) AS Status, @id as ID,@ID1 as ID1,'DupDID' as Error     
  --RAISERROR(@ErrorMsg, 16,-1)          
  --RETURN          
 END        
 ELSE IF EXISTS(SELECT * FROM booth where district = @district AND acname = @acname and PSNum = @PSNum AND id <> @id AND ISNULL(isdelete,0) = 0)          
 BEGIN          
  SELECT @ErrorMsg = 'This PS No is already exist in District: ' + district + ' Assembly: ' + acname + ' PSNo: ' + PSNum + ' Location:' + location          
  FROM booth where district = @district AND acname = @acname and PSNum = @PSNum AND id <> @id        
  Select @ErrorMsg as msg, CAST(0 AS bit) AS Status,'PS No' as Error       
  --RAISERROR(@ErrorMsg, 16,-1)          
  --RETURN          
 END        
 ELSE          
 BEGIN          
  IF(@OperatorName='') BEGIN SET @OperatorName='NA' END        
   IF(@OperatorNumber='') BEGIN SET @OperatorNumber='1234567890' END        
  SELECT @operatorID = id FROM operator_info WHERE operatorName = @OperatorName AND operatorNumber = @OperatorNumber AND Designation =@OperatorDesignation          
  IF (@operatorID = 0 AND @OperatorName!='')          
  BEGIN          
   INSERT INTO operator_info(operatorName,operatorNumber,Designation,district)          
   VALUES(@OperatorName,@OperatorNumber,@OperatorDesignation,@district)          
   SET @operatorID = @@IDENTITY          
  END          
          
          
  IF (@id = 0)          
  BEGIN          
   INSERT INTO booth(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,          
   longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,        
   AddedFromPage,AddedFrom,updatedBy,updatedFrom)          
   VALUES(@streamid,@operatorID,@district,@accode,@acname,@PSNum,@location,1,1,          
   0,0,@cameralocationtype,0,CASE WHEN @cameralocationtype = 'Outside' THEN 1 ELSE 0 END,          
   [dbo].[GETIST](),@UserName,0,        
   'BoothMaster.aspx','Add Booth',@UserName,'Add Booth')          
          
   DECLARE @boothid INT = 0          
   SET @boothid = @@IDENTITY          
          
   INSERT INTO boothhistory(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,          
   longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,updatedDate,updatedBy,updatedFrom,Action,        
   boothid,IPAddress,AddedFromPage,AddedFrom)          
   VALUES(@streamid,@operatorID,@district,@accode,@acname,@PSNum,@location,1,1,          
   0,0,@cameralocationtype,0,CASE WHEN @cameralocationtype = 'Outside' THEN 1 ELSE 0 END,          
   [dbo].[GETIST](),@UserName,0,[dbo].[GETIST](),@UserName,'Add Booth','INSERT',        
   @boothid,@IPAddress,'BoothMaster.aspx','Add Booth')          
          
   SET @Msg='Record Inserted Successfully!!'          
   Select @Msg as msg, CAST(1 AS bit) AS Status,@boothid as BoothID        
  END          
  ELSE          
  BEGIN          
   UPDATE booth          
   SET          
    streamid = @streamid,          
operatorid = @operatorID,          
    district = @district,          
    accode = @accode,          
    acname = @acname,          
    PSNum = @PSNum,          
    location = @location,          
    cameralocationtype = @cameralocationtype,          
    IsOutsideBooth = CASE WHEN @cameralocationtype = 'Outside' THEN 1 ELSE 0 END,          
    updatedDate = [dbo].[GETIST](),          
    updatedBy = @UserName,          
    updatedFrom = 'Edit Booth',        
 UpdatedFromPage = 'BoothMaster.aspx',        
    longitude = 0,          
    latitude = 0,          
    IsPink = 0          
    ,IsAro = 0          
 ,isupdated=1        
   WHERE          
    id = @id          
          
   UPDATE boothhistory          
   SET          
    isdelete = 1,          
    updatedDate=[dbo].[GETIST](),          
    updatedBy = @UserName,          
    updatedFrom = 'Edit Booth',        
    UpdatedFromPage = 'BoothMaster.aspx'        
   WHERE boothid = @id AND isnull(isdelete,0)=0          
          
   INSERT INTO boothhistory(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,          
   longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,updatedDate,updatedBy,        
   UpdatedFromPage,updatedFrom,Action,boothid,IPAddress)          
   VALUES(@streamid,@operatorID,@district,@accode,@acname,@PSNum,@location,1,1,          
   0,0,@cameralocationtype,0,CASE WHEN @cameralocationtype = 'Outside' THEN 1 ELSE 0 END,          
   [dbo].[GETIST](),@UserName,0,[dbo].[GETIST](),@UserName,'BoothMaster.aspx','Edit Booth','UPDATE',@id,@IPAddress)          
          
   SET @Msg='Record Updated Successfully!!'          
   Select @Msg as msg, CAST(1 AS bit) AS Status        
  END          
 END          
END  
GO
/****** Object:  StoredProcedure [dbo].[SaveCameraStatus]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveCameraStatus]                                            
(                                                    
 @CameraStatus AS dbo.SaveCameraStatusType READONLY                                                    
)                                                    
AS                                                    
BEGIN                                                    
 DECLARE @SQL VARCHAR(MAX) = '', @SQL2 VARCHAR(MAX) = '', @hr VARCHAR(10)='0',@TableName VARCHAR(50) = '',@CSTableName VARCHAR(50) = ''                                                    
 SET @TableName = 'CameraStatus_Hr_' + REPLACE(CONVERT(VARCHAR, [dbo].[GETIST](), 111),'/','')                                                    
 SET @CSTableName = 'CameraStatus_' + REPLACE(CONVERT(VARCHAR, [dbo].[GETIST](), 111),'/','') + '_' + FORMAT(DATEPART(HOUR,[dbo].[GETIST]()),'00')                        
                        
    IF OBJECT_ID(N'tempdb..#CameraStatus') IS NOT NULL                                                
    BEGIN                                                
  DROP TABLE #CameraStatus                                                
    END                                                
  CREATE TABLE #CameraStatus                                                    
  (                                                    
   CameraID VARCHAR(100),                                                    
   Status VARCHAR(20),                                                    
   PrevStatus VARCHAR(20),                                                    
   lastupdated DATETIME,                                                    
   statusFlag INT                                        
  )                                                    
                                                   
 SET @hr = DATEPART(HOUR,[dbo].[GETIST]())                                                    
                                                   
 INSERT INTO #CameraStatus(CameraID, Status,PrevStatus,lastupdated,statusFlag)                                                    
 SELECT DISTINCT sl.deviceid, CASE WHEN cs.CameraID IS NULL  THEN 'STOPPED' ELSE 'RUNNING' END, sl.Status, [dbo].[GETIST](),ISNULL(sl.statusFlag,0) FROM streamlist sl                                                    
 LEFT JOIN @CameraStatus cs ON cs.CameraID = sl.deviceid                                            
 WHERE ISNULL(sl.isdeleted,0)=0                      
                                                   
                                        
 UPDATE #CameraStatus                                          
 SET Status = 'RUNNING'                                          
 WHERE Status = 'STOPPED' AND statusFlag=2                                        
                                        
 --INSERT INTO CameraStatus(CameraID, Status,lastupdated)                                                    
 --SELECT DISTINCT CameraID, Status, lastupdated FROM #CameraStatus                                                    
                         
                                                   
 UPDATE streamlist                                                    
 SET                                                    
  status=CASE WHEN lastseen >= DATEADD(MINUTE,-1,[dbo].[GETIST]()) THEN 'RUNNING' ELSE cs.Status END,                                                    
  lastseen= CASE WHEN cs.Status = 'RUNNING' THEN cs.lastupdated ELSE lastseen END,                                                    
  isLive = CASE WHEN cs.Status = 'RUNNING' THEN 1 ELSE isLive END,                                              
  statusFlag = CASE WHEN sl.statusFlag NOT IN (1,2,4) AND cs.Status = 'RUNNING' THEN 3                                              
                    WHEN sl.statusFlag NOT IN (1,2,4) AND cs.Status = 'STOPPED' THEN 0                                              
                    ELSE sl.statusFlag END                                          
 FROM streamlist sl                                                    
 INNER JOIN #CameraStatus cs ON cs.CameraID = sl.deviceid                                            
 WHERE ISNULL(sl.isdeleted,0)=0                                        
                                                   
 IF (DATEPART(HOUR, [dbo].[GETIST]()) = 0 AND DATEPART(MINUTE, [dbo].[GETIST]()) = 0)             
 BEGIN                                                    
  UPDATE csd              
  SET                                                    
   OffLineStopTime = CAST(CONVERT(VARCHAr(10),DATEADD(DAY,-1,cs.lastupdated),20) + ' 23:59:59.000' AS DATETIME),                                                    
   ModifyDate = [dbo].[GETIST]()                                                    
  FROM CameraStopDuration csd                                                    
  INNER JOIN #CameraStatus cs ON cs.CameraID = csd.streamname                                            
  WHERE csd.OffLineStopTime IS NULL AND CAST(OffLineStartTime AS DATE) = CAST(DATEADD(DAY,-1,[dbo].[GETIST]()) AS DATE)                      
                                                   
INSERT INTO CameraStopDuration (streamname,OffLineStartTime,OffLineStopTime,CreateDate,ModifyDate)                                                    
  SELECT DISTINCT CameraID,CAST(CONVERT(VARCHAr(10),cs.lastupdated,20) + ' 00:00:00.000' AS DATETIME),NULL, [dbo].[GETIST](), [dbo].[GETIST]() FROM #CameraStatus cs                                                    
  INNER JOIN CameraStopDuration csd ON cs.CameraID = csd.streamname                                            
  WHERE csd.OffLineStopTime = CAST(CONVERT(VARCHAr(10),DATEADD(DAY,-1,cs.lastupdated),20) + ' 23:59:59.000' AS DATETIME)                      
  AND CAST(OffLineStartTime AS DATE) = CAST(DATEADD(DAY,-1,[dbo].[GETIST]()) AS DATE)                      
 END                                
                                                   
 UPDATE csd                                                    
 SET                                                    
  OffLineStopTime = cs.lastupdated,                                               
  ModifyDate = [dbo].[GETIST]()                                                    
 FROM CameraStopDuration csd                                                 
 INNER JOIN #CameraStatus cs ON cs.CameraID = csd.streamname                                         
 WHERE cs.PrevStatus = 'STOPPED' AND cs.Status = 'RUNNING' AND csd.OffLineStopTime IS NULL                      
                                                 
 INSERT INTO CameraStopDuration (streamname,OffLineStartTime,OffLineStopTime,CreateDate,ModifyDate)                                                    
 SELECT DISTINCT CameraID,lastupdated,NULL, [dbo].[GETIST](), [dbo].[GETIST]() FROM #CameraStatus WHERE PrevStatus = 'RUNNING' AND Status = 'STOPPED' AND lastupdated < DATEADD(MINUTE,-1,[dbo].[GETIST]())                      
                       
 EXEC Create_CameraStatus_Hr                      
                                                   
 SET @SQL = N'                                                    
  UPDATE hr                                                    
  SET                                                    
   [T_' + @hr + '] = CASE WHEN cs.Status = ''RUNNING'' THEN 1 ELSE [T_' + @hr + '] END                                                    
  FROM ' + @TableName + ' hr                                                    
  INNER JOIN #CameraStatus cs ON cs.CameraID = hr.streamname                                            
 '                                                    
 EXEC(@SQL)                        
                        
 EXEC Create_CameraStatus                        
 SET @SQL2 = N'                        
  INSERT INTO [dbo].[' + @CSTableName + '](CameraID, Status,lastupdated)                                                    
  SELECT DISTINCT CameraID, Status, lastupdated FROM #CameraStatus        
 '        
 EXEC(@SQL2)                        
 INSERT INTO camerastopduration(streamname,OffLineStartTime)        
 select deviceid,CASE WHEN CAST(lastseen as date) = CAST([dbo].[GETIST]() as date) THEN lastseen ELSE CONVERT(varchar, [dbo].[GETIST](), 23) + ' 00:00:00' END from streamlist where status='STOPPED'        
 and deviceid not in (select distinct streamname from camerastopduration where CAST(OffLineStartTime as date) = CAST([dbo].[GETIST]() as date))        
        
 --INSERT INTO CameraStopDuration (streamname,OffLineStartTime)        
 --select distinct deviceid, CONVERT(varchar, [dbo].[GETIST](), 23) + ' 00:00:00' from streamlist s        
 --inner join booth b on b.streamid=s.id        
 --where status='STOPPED'and streamname not in        
 --(SELECT distinct streamname FROM CameraStopDuration where CAST(OffLineStartTime AS DATE) = CAST([dbo].[GETIST]() AS DATE))        
 --INSERT INTO CameraStopDuration (streamname,OffLineStartTime)                    
 --select distinct deviceid, CONVERT(varchar, [dbo].[GETIST](), 23) + ' 00:00:00' from streamlist s                    
 --inner join booth b on b.streamid=s.id                    
 --where status='STOPPED'and streamname not in                     
 --(SELECT distinct streamname FROM CameraStopDuration where CAST(OffLineStartTime AS DATE) = CAST([dbo].[GETIST]() AS DATE))                    
        
   -------------********BackUp Database table****-----------------  
 --DECLARE @bkptblName varchar(50) = ''  
 --SET @bkptblName = 'booth_' + REPLACE(CONVERT(VARCHAR, [dbo].[GETIST](), 111),'/','') + '_' + FORMAT(DATEPART(HOUR,[dbo].[GETIST]()),'00')  
  
 --IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = @bkptblName)  
 --BEGIN  
 -- EXEC BackupRequiredTables  
 --END  
 -------------********BackUp Database table****-----------------  
END  
GO
/****** Object:  StoredProcedure [dbo].[SaveCameraStatusByID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveCameraStatusByID]
(
	@CameraID VARCHAR(100),
	@Status VARCHAR(50),
	@lastupdated DATETIME
)
AS
BEGIN
	INSERT INTO CameraStatus(CameraID, Status,lastupdated)
	VALUES(@CameraID, @Status,@lastupdated)

	UPDATE streamlist
	SET
		status=@Status,
		lastseen= @lastupdated,
		isLive = CASE WHEN @Status = 'RUNNING' THEN 1 ELSE 0 END
	WHERE deviceid = @CameraID
END
GO
/****** Object:  StoredProcedure [dbo].[SaveCameraStatusInBytes]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveCameraStatusInBytes]                                              
(                                                      
 @CameraStatus AS dbo.SaveCameraStatusTypeInBytes READONLY                                                      
)                                                      
AS                                                      
BEGIN                                                      
 DECLARE @SQL VARCHAR(MAX) = '', @SQL2 VARCHAR(MAX) = '', @hr VARCHAR(10)='0',@TableName VARCHAR(50) = '',@CSTableName VARCHAR(50) = ''  
 DECLARE @currentTimeinMS bigint=0
 SET @currentTimeinMS=(SELECT DATEDIFF_BIG(MILLISECOND, '1970-01-01', [dbo].[GETIST]()))
 SET @TableName = 'CameraStatus_Hr_' + REPLACE(CONVERT(VARCHAR, [dbo].[GETIST](), 111),'/','')                                                      
 SET @CSTableName = 'CameraStatus_' + REPLACE(CONVERT(VARCHAR, [dbo].[GETIST](), 111),'/','') + '_' + FORMAT(DATEPART(HOUR,[dbo].[GETIST]()),'00')                          
                          
    IF OBJECT_ID(N'tempdb..#CameraStatus') IS NOT NULL                                                  
    BEGIN                                                  
  DROP TABLE #CameraStatus                                                  
    END                                                  
  CREATE TABLE #CameraStatus                                                      
  (                                                      
   CameraID VARCHAR(100),  
   InBytes BIGINT,  
   CreateTime BIGINT,
   Status VARCHAR(20),                                                      
   PrevStatus VARCHAR(20),                                                      
   lastupdated DATETIME,                                                      
   statusFlag INT                                          
  )                                                      
                                                     
 SET @hr = DATEPART(HOUR,[dbo].[GETIST]())                                                      
    
declare @lastupdated DATETIME    
SET @lastupdated = [dbo].[GETIST]()    
 INSERT INTO #CameraStatus(CameraID, Inbytes,CreateTime, Status,PrevStatus,lastupdated,statusFlag)                                                      
 SELECT DISTINCT sl.deviceid, Inbytes,cs.CreateTime, CASE WHEN cs.CameraID IS NULL  THEN 'STOPPED' ELSE 'RUNNING' END, sl.Status, @lastupdated,ISNULL(sl.statusFlag,0) FROM streamlist sl                                                      
 LEFT JOIN @CameraStatus cs ON cs.CameraID = sl.deviceid                                              
 WHERE ISNULL(sl.isdeleted,0)=0                        
                                                     
                                          
 UPDATE #CameraStatus                                            
 SET Status = 'RUNNING '                                            
 WHERE Status = 'STOPPED' AND statusFlag=2                                          
                                          
 --INSERT INTO CameraStatus(CameraID, Status,lastupdated)                                                      
 --SELECT DISTINCT CameraID, Status, lastupdated FROM #CameraStatus                                                      
                           
                                                     
 UPDATE streamlist                                                      
 SET                                                      
  status=CASE WHEN lastseen >= DATEADD(MINUTE,-1,[dbo].[GETIST]()) THEN 'RUNNING' ELSE cs.Status END,                                                      
  lastseen= CASE WHEN cs.Status = 'RUNNING' THEN cs.lastupdated ELSE lastseen END,                                                      
  isLive = CASE WHEN cs.Status = 'RUNNING' THEN 1 ELSE isLive END,                                                
  statusFlag = CASE WHEN sl.statusFlag NOT IN (1,2,4) AND cs.Status = 'RUNNING' THEN 3                                                
                    WHEN sl.statusFlag NOT IN (1,2,4) AND cs.Status = 'STOPPED' THEN 0        
                    ELSE sl.statusFlag END     
 FROM streamlist sl                                                      
 INNER JOIN #CameraStatus cs ON cs.CameraID = sl.deviceid                                              
 WHERE ISNULL(sl.isdeleted,0)=0                                  
                                                     
 IF (DATEPART(HOUR, [dbo].[GETIST]()) = 0 AND DATEPART(MINUTE, [dbo].[GETIST]()) = 0)               
 BEGIN                                                      
  UPDATE csd                
  SET                                                      
   OffLineStopTime = CAST(CONVERT(VARCHAr(10),DATEADD(DAY,-1,cs.lastupdated),20) + ' 23:59:59.000' AS DATETIME),                                                      
   ModifyDate = [dbo].[GETIST]()                                                      
  FROM CameraStopDuration csd                                                      
  INNER JOIN #CameraStatus cs ON cs.CameraID = csd.streamname                                              
  WHERE csd.OffLineStopTime IS NULL AND CAST(OffLineStartTime AS DATE) = CAST(DATEADD(DAY,-1,[dbo].[GETIST]()) AS DATE)                        
                                                     
INSERT INTO CameraStopDuration (streamname,OffLineStartTime,OffLineStopTime,CreateDate,ModifyDate)                                                      
  SELECT DISTINCT CameraID,CAST(CONVERT(VARCHAr(10),cs.lastupdated,20) + ' 00:00:00.000' AS DATETIME),NULL, [dbo].[GETIST](), [dbo].[GETIST]() FROM #CameraStatus cs                                                      
  INNER JOIN CameraStopDuration csd ON cs.CameraID = csd.streamname                                              
  WHERE csd.OffLineStopTime = CAST(CONVERT(VARCHAr(10),DATEADD(DAY,-1,cs.lastupdated),20) + ' 23:59:59.000' AS DATETIME)                        
  AND CAST(OffLineStartTime AS DATE) = CAST(DATEADD(DAY,-1,[dbo].[GETIST]()) AS DATE)        
          
    delete from CameraStopDuration where id in (        
    select id from (        
    select *,ROW_NUMBER() over(partition by streamname,offlinestarttime order by streamname,offlinestarttime) rn        
    from CameraStopDuration        
    where cast(offlinestarttime as date) = cast([dbo].[GETIST]() as date)        
    ) tbl where rn>1        
  )        
        
 END                                  
                                                     
 UPDATE csd                                                      
 SET                                                      
  OffLineStopTime = cs.lastupdated,                                                 
  ModifyDate = [dbo].[GETIST]()                                                      
 FROM CameraStopDuration csd                                                   
 INNER JOIN #CameraStatus cs ON cs.CameraID = csd.streamname                                           
 WHERE cs.PrevStatus = 'STOPPED' AND cs.Status = 'RUNNING' AND csd.OffLineStopTime IS NULL                        
                                                   
 INSERT INTO CameraStopDuration (streamname,OffLineStartTime,OffLineStopTime,CreateDate,ModifyDate)                                                      
 SELECT DISTINCT CameraID,lastupdated,NULL, [dbo].[GETIST](), [dbo].[GETIST]() FROM #CameraStatus WHERE PrevStatus = 'RUNNING' AND Status = 'STOPPED' AND lastupdated < DATEADD(MINUTE,-1,[dbo].[GETIST]())                        
                         
 EXEC Create_CameraStatus_Hr                        
                                                     
 SET @SQL = N'                                                      
  UPDATE hr                                                      
  SET                                                      
   [T_' + @hr + '] = CASE WHEN cs.Status = ''RUNNING'' THEN 1 ELSE [T_' + @hr + '] END                                                      
  FROM ' + @TableName + ' hr                                                      
  INNER JOIN #CameraStatus cs ON cs.CameraID = hr.streamname                                              
 '                                                      
 EXEC(@SQL)                          
                          
 EXEC Create_CameraStatus                          
 SET @SQL2 = N'                          
  INSERT INTO [dbo].[' + @CSTableName + '](CameraID,Inbytes,CreateTime,Status,lastupdated)                                                      
  SELECT DISTINCT CameraID, Inbytes,CreateTime, Status, lastupdated FROM #CameraStatus                            
 '               
 EXEC(@SQL2)                          
 --INSERT INTO CameraStopDuration (streamname,OffLineStartTime)                      
 --select distinct deviceid, CONVERT(varchar, [dbo].[GETIST](), 23) + ' 00:00:00' from streamlist s                      
 --inner join booth b on b.streamid=s.id                      
 --where status='STOPPED'and streamname not in                       
 --(SELECT distinct streamname FROM CameraStopDuration where CAST(OffLineStartTime AS DATE) = CAST([dbo].[GETIST]() AS DATE))                      
         
 INSERT INTO camerastopduration(streamname,OffLineStartTime)                  
 select deviceid,CASE WHEN CAST(lastseen as date) = CAST([dbo].[GETIST]() as date) THEN lastseen ELSE CONVERT(varchar, [dbo].[GETIST](), 23) + ' 00:00:00' END        
 from streamlist        
 where status='STOPPED'                  
 and deviceid not in (select distinct streamname from camerastopduration where CAST(OffLineStartTime as date) = CAST([dbo].[GETIST]() as date))                  
       
--INSERT INTO ServerDetails(Cameraid) 
--SELECT Distinct CameraID  FROM #CameraStatus
--Where Cameraid not in(Select Distinct Cameraid From ServerDetails)

--UPDATE SD  SET  Inbytes =cs.Inbytes, CreateTime =(@currentTimeinMS-cs.CreateTime),
--Kbps=cs.Inbytes*0.008
--FROM ServerDetails SD                                                   
--INNER JOIN #CameraStatus cs ON cs.CameraID = SD.Cameraid   

Exec SaveOnlineofflineSummary

 -------------********BackUp Database table****-----------------  
 --DECLARE @bkptblName varchar(50) = ''  
 --SET @bkptblName = 'booth_' + REPLACE(CONVERT(VARCHAR, [dbo].[GETIST](), 111),'/','') + '_' + FORMAT(DATEPART(HOUR,[dbo].[GETIST]()),'00')  
  
 --IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = @bkptblName)  
 --BEGIN  
 -- EXEC BackupRequiredTables  
 --END  
 -------------********BackUp Database table****-----------------  
END 
GO
/****** Object:  StoredProcedure [dbo].[SaveCameraStopReasonsByID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveCameraStopReasonsByID]    
(    
 @ID INT,    
 @Reason VARCHAR(MAX)    
)    
AS    
BEGIN    
 IF EXISTS(SELECT 1 FROM CameraStopDuration WHERE id = @ID)    
 BEGIN    
  UPDATE CameraStopDuration    
  SET Reason = @Reason WHERE id = @ID    
 END    
END
GO
/****** Object:  StoredProcedure [dbo].[SaveDistrict]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SaveDistrict]
@State varchar(100),
@District varchar(100),
@Accode varchar(100),
@Acname varchar(100)
AS
BEGIN
insert into state(statename,isdisplay,stcode,dashboard,mincount) values(@State,1,'',1,0)
insert into district(stateid,district,accode,acname,isenable,isdeleted) values(1,@District,@Accode,@Acname,1,0)
END
GO
/****** Object:  StoredProcedure [dbo].[SaveGoGreenCameraStatus]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveGoGreenCameraStatus]      
(      
 @CameraStatus AS dbo.SaveCameraStatusType READONLY,
 @Status varchar(50)
)      
AS      
BEGIN      

    IF OBJECT_ID(N'tempdb..#CameraStatus') IS NOT NULL  
    BEGIN  
    DROP TABLE #CameraStatus  
    END  
     CREATE TABLE #CameraStatus
     (      
      CameraID VARCHAR(100),
      dt datetime
     )      
      
 INSERT INTO #CameraStatus(CameraID,dt)      
 SELECT DISTINCT CameraID,[dbo].GETIST() FROM @CameraStatus
 
 IF (@Status = 'RUNNING')
 BEGIN
     UPDATE streamlist      
     SET      
      statusFlag=2,status='RUNNING',lastseen=cs.dt
     FROM streamlist sl      
     INNER JOIN #CameraStatus cs ON cs.CameraID = sl.deviceid      
     WHERE ISNULL(sl.isdeleted,0)=0 and isLive=1

     UPDATE csd      
      SET      
       OffLineStopTime = cs.dt,      
       ModifyDate = cs.dt
      FROM CameraStopDuration csd      
      INNER JOIN #CameraStatus cs ON cs.CameraID = csd.streamname
      WHERE csd.OffLineStopTime IS NULL
 END
 IF (@Status = 'STOPPED')
 BEGIN
     UPDATE streamlist      
     SET      
      status='STOPPED',statusFlag=1,lastseen=cs.dt
     FROM streamlist sl
     INNER JOIN #CameraStatus cs ON cs.CameraID = sl.deviceid
     WHERE ISNULL(sl.isdeleted,0)=0

     INSERT INTO CameraStopDuration (streamname,OffLineStartTime,CreateDate,ModifyDate)
     SELECT DISTINCT CameraID,dt,dt,dt FROM #CameraStatus
 END

END
GO
/****** Object:  StoredProcedure [dbo].[SaveGPSLocationDetails]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveGPSLocationDetails]
(
    @deviceId      BIGINT,
    @name          VARCHAR (100) ,
    @deviceImei    VARCHAR (50)  ,
    @status        VARCHAR (50)  ,
    @lastUpdate    VARCHAR (50)      ,
    @posId         BIGINT,
    @phone         VARCHAR (50)  ,
    @type          VARCHAR (50)  ,
    @latitude      VARCHAR (50)  ,
    @longitude     VARCHAR (50)  ,
    @deviceFixTime DATETIME      ,
    @speed         FLOAT    ,
    @course        VARCHAR (50)  ,
    @ignition      BIT   ,
    @totalDistance FLOAT    ,
    @alarm         VARCHAR (50)  
)
AS
BEGIN

	DECLARE @dt DATETIME, @prevStatus varchar(50), @ShiftID INT = 0, @VehicleID INT = 0, @DriverID INT = 0, @FSVID INT = 0
	DECLARE @isStopped BIT = 0, @prevStopped BIT = 0

	IF (@lastUpdate = '')
	BEGIN
		SET @dt = null
	END
	ELSE
	BEGIN
		SET @dt = CAST(@lastUpdate AS DATETIME)
	END

	SELECT top 1 @prevStatus = status, @prevStopped = ISNULL(IsStopped,0) FROM GPSLocationList with (nolock) WHERE name = @name ORDER BY id DESC

	IF (SELECT COUNT(1) FROM (SELECT TOP 8 id,latitude,longitude FROM GPSLocationList with (nolock) WHERE name = @name ORDER BY id DESC) tbl WHERE latitude = @latitude AND longitude = @longitude) = 8
	BEGIN
		SET @isStopped = 1
	END

	SET @ShiftID = [dbo].[GetCurrentShift]()
	--SELECT TOP 1 @ShiftID = id FROM [dbo].[vehicleshift]
	--WHERE 
	--	(CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) BETWEEN CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'), 112) + ' ' + CONVERT(CHAR(8), starttime, 108))
	--	AND CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(CASE WHEN endtime > starttime THEN SYSDATETIMEOFFSET() ELSE DATEADD(DAY,1,SYSDATETIMEOFFSET()) END, '+05:30'), 112) + ' ' + CONVERT(CHAR(8), endtime, 108)))
	--	OR (CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) BETWEEN CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(CASE WHEN endtime > starttime THEN SYSDATETIMEOFFSET() ELSE DATEADD(DAY,-1,SYSDATETIMEOFFSET()) END, '+05:30'), 112) + ' ' + CONVERT(CHAR(8), endtime, 108))
	--	AND CONVERT(DATETIME, CONVERT(CHAR(8), SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'), 112) + ' ' + CONVERT(CHAR(8), starttime, 108)))
	
	SELECT
		TOP 1 @VehicleID = vehicalId, @DriverID = vsm.StaffId
	FROM vehicalDetail vd WITH (NOLOCK)
	INNER JOIN Vehicle_Staff_Mapping vsm WITH (NOLOCK) ON vd.vehicalId = vsm.VehicleId AND vsm.AssignDate = CAST(CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) AS DATE)
	INNER JOIN Staff_Info si WITH (NOLOCK) ON si.Id = vsm.StaffId AND si.Type = 1
	WHERE vd.Vehicle_No = @name AND vsm.ShiftID = @ShiftID

	SELECT
		TOP 1 @FSVID = vsm.StaffId
	FROM vehicalDetail vd WITH (NOLOCK)
	INNER JOIN Vehicle_Staff_Mapping vsm WITH (NOLOCK) ON vd.vehicalId = vsm.VehicleId AND vsm.AssignDate = CAST(CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) AS DATE)
	INNER JOIN Staff_Info si WITH (NOLOCK) ON si.Id = vsm.StaffId AND si.Type = 2
	WHERE vd.Vehicle_No = @name AND vsm.ShiftID = @ShiftID

    INSERT INTO GPSLocationList(deviceId, name, deviceImei,status,lastUpdate,posId,phone,type,latitude,longitude,deviceFixTime,speed,course,ignition,totalDistance,alarm,VehicleID,ShiftID,DriverID,FSVID,createdate,IsStopped)
    VALUES(@deviceId, @name, @deviceImei,@status,@dt,@posId,@phone,@type,@latitude,@longitude,@deviceFixTime,@speed,@course,@ignition,@totalDistance,@alarm,@VehicleID,@ShiftID,@DriverID,@FSVID,CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')),@isStopped)

	UPDATE location_info set longitude=@longitude,latitude=@latitude, UpdateDatetime=@dt where VehicleNo=@name

	IF (@lastUpdate != '')
	BEGIN
		DECLARE @streamid INT = 0
		SELECT DISTINCT TOP 1 @streamid = sl.id FROM VehicalDetail vd WITH (NOLOCK)
		--INNER JOIN district d WITH (NOLOCK) ON vd.DesctrictId = d.id
		--INNER JOIN booth b WITH (NOLOCK) ON b.district = d.district AND b.accode = vd.Accode
		INNER JOIN streamlist sl WITH (NOLOCK) ON sl.id = vd.streamid
		WHERE
			vd.Vehicle_No = @name

		--UPDATE streamlist SET lastseen = @dt, status = CASE WHEN @status = 'online' THEN 'RUNNING' ELSE 'STOPPED' END,
		--statusFlag = CASE WHEN @status = 'online' THEN 2 ELSE 0 END WHERE id = @streamid
	END
	
	IF ((@prevStatus = 'online' AND @status = 'offline') OR (@prevStopped = 0 AND @isStopped = 1)) --AND NOT EXISTS(SELECT 1 FROM GPSStopDuration with (nolock) WHERE deviceid = @deviceId AND CAST(CreateDate AS DATE) = CAST(GETDATE() AS DATE)))
	BEGIN
		INSERT INTO GPSStopDuration(deviceid, StartTime, VehicleID, ShiftID, DriverID, FSVID,createdate)
		VALUES(@deviceId, @dt, @VehicleID, @ShiftID, @DriverID, @FSVID,CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')))
	END
	IF ((@prevStatus = 'offline' AND @status = 'online') OR (@prevStopped = 1 AND @isStopped = 0)) --AND EXISTS(SELECT 1 FROM GPSStopDuration with (nolock) WHERE deviceid = @deviceId AND CAST(CreateDate AS DATE) = CAST(GETDATE() AS DATE)))
	BEGIN
		UPDATE GPSStopDuration SET StopTime = @dt, ModifyDate = CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'))
		WHERE deviceid = @deviceId AND CAST(CreateDate AS DATE) = CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS DATE) AND StopTime IS NULL
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SaveGPSStopReasonsByID]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveGPSStopReasonsByID]
(
	@ID INT,
	@Reason VARCHAR(MAX)
)
AS
BEGIN
	IF NOT EXISTS(SELECT 1 FROM GPSStopReasons WHERE GPSStopDurationID = @ID)
	BEGIN
		INSERT INTO GPSStopReasons(GPSStopDurationID,Reason)
		VALUES(@ID, @Reason)
	END
	ELSE
	BEGIN
		UPDATE GPSStopReasons
		SET Reason = @Reason WHERE GPSStopDurationID = @ID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SaveInventoryDetails]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SaveInventoryDetails]
(
@ID int=NULL,
@StreamID varchar(50)=NULL,
@CameraType varchar(50)=NULL,
@Router varchar(50)=NULL,
@SDCard bit=NULL,
@Extentionwire varchar(50)=NULL,
@SimCardID varchar(50)=NULL,
@PowerBank bit=NULL,
@Stand bit=NULL,
@AddDateTime datetime=NULL,
@flag char(20)=NULL
)
AS
BEGIN
Declare @Msg varchar(200)
IF(@flag='SAVE')
BEGIN
INSERT INTO InventoryDetails(Streamid,Type,Router,SdCard,Extensionwire,SimCardId,PowerBank,Stand,AddDateTime,Status)
VALUES (@StreamID,@CameraType,@Router,@SDCard,@Extentionwire,@SimCardID,@PowerBank,@Stand,[dbo].[GETIST](),'ACTIVE')

INSERT INTO InventoryTrn(District,[Assembly],Location,StreamID,OwnerFrom,OwnerName,OwnerMob,AddDate,AddTime,Status,ISConfirm) 
VALUES('AHMEDABAD','VMUKTI','WAREHOUSE',@StreamID,NULL,NULL,NULL,[dbo].[GETIST](),[dbo].[GETIST](),'Received',1) 
END
END
GO
/****** Object:  StoredProcedure [dbo].[SaveLoginUserHistory]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveLoginUserHistory]
(
    @UserID INT,
    @IPAddress VARCHAR(50)
)
AS
BEGIN
    INSERT INTO LoginUserHistory(IPAddress,UserID)
    VALUES(@IPAddress,@UserID)
END
GO
/****** Object:  StoredProcedure [dbo].[SaveOnlineofflineSummary]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Proc [dbo].[SaveOnlineofflineSummary]
AS BEGIN  
declare @update datetime =NULL
Select   @update=cast(CONVERT(VARCHAR(16),UpdatedTime, 120) as datetime) from  OnlineOfflineSummary 
where cast(CONVERT(VARCHAR(16),UpdatedTime, 120) as datetime)=cast(CONVERT(VARCHAR(16), [dbo].[GETIST](), 120) as datetime)  
if(@update is null)
begin
Declare @currentTime datetime
Set @currentTime= cast(CONVERT(VARCHAR(16), [dbo].[GETIST](), 120) as datetime) 
Insert into OnlineOfflineSummary (District,Acname,Total,Online,Offline,UpdatedTime,Connecectonce) 
  select
  MAX(b.district) as district,  
  MAX(b.acname) as acname,
  count(DISTINCT b.id) as TotalBooth ,
  COUNT(CASE WHEN Status = 'RUNNING' then 1 ELSE NULL END) as 'Live',
  (count(DISTINCT b.id)-COUNT(CASE WHEN Status = 'RUNNING' then 1 ELSE NULL END)) as 'stop', 
   
  --cast(CONVERT(VARCHAR(16), [dbo].[GETIST](), 120) as datetime) as Adddate
  @currentTime,
  COUNT(CASE s.isLive WHEN 'True' then 1 ELSE NULL END) as 'connectedonce'
  from booth b      
  inner join streamlist s on b.streamid=s.id   
  inner join district d on d.district = b.district and d.acname = b.acname 
  where b.isdisplay='True' and ISNULL(b.isdelete,'')=0 
  group by b.district,b.acname 


  DELETE FROM OnlineOfflineSummary 
WHERE UpdatedTime IN (
    SELECT UpdatedTime 
    FROM OnlineOfflineSummary 
    GROUP BY UpdatedTime 
    HAVING COUNT(id) >128
);
   END 
   END 
 

 --sELECT cast(CONVERT(VARCHAR(16), [dbo].[GETIST](), 120) as datetime) as Adddate
GO
/****** Object:  StoredProcedure [dbo].[SaverecordingSize]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
--CREATE TYPE [dbo].[UDT_SaveRecordingsize] AS TABLE(
--	[DID] [varchar](100) NULL,
--	[Date] [Date] NULL,
--	[Size] [float] NULL
--)
--GO

Create PROCEDURE [dbo].[SaverecordingSize]                                              
(                                                      
 @Recordingsize AS dbo.UDT_SaveRecordingsize READONLY                                                      
)                                                      
AS                                                      
BEGIN 
  IF OBJECT_ID(N'tempdb..#Recordingsize') IS NOT NULL                                                  
    BEGIN                                                  
  DROP TABLE #Recordingsize                                                  
    END  
	CREATE TABLE #Recordingsize                                                      
  (                                                      
   DID VARCHAR(100),                                                    
   filedate Date,                                                      
   size float                                          
  )    
  INSERT INTO #Recordingsize(DID, filedate,size) 
  SELECT DISTINCT sl.deviceid, r.filedate,r.size FROM streamlist sl                                                      
 LEFT JOIN #Recordingsize r ON r.DID = sl.deviceid                                              
 WHERE ISNULL(sl.isdeleted,0)=0 

 
 INSERT INTO RunTimeDownloadURL (DID,Date,Size)                                                      
  SELECT DISTINCT DID, filedate,size FROM #Recordingsize cs                                                      
  INNER JOIN streamlist s ON cs.DID = s.streamname    
   WHERE ISNULL(sl.isdeleted,0)=0 
END



GO
/****** Object:  StoredProcedure [dbo].[SaveStartStopViewCameraStatus]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveStartStopViewCameraStatus]      
(      
 @CameraStatus AS dbo.SaveCameraStatusType READONLY,
 @Status varchar(50)
)      
AS      
BEGIN      

    IF OBJECT_ID(N'tempdb..#CameraStatus') IS NOT NULL  
    BEGIN  
    DROP TABLE #CameraStatus  
    END  
     CREATE TABLE #CameraStatus
     (      
      CameraID VARCHAR(100),
      dt datetime
     )      
      
 INSERT INTO #CameraStatus(CameraID,dt)      
 SELECT DISTINCT CameraID,[dbo].GETIST() FROM @CameraStatus
 
 IF (@Status = 'RUNNING')
 BEGIN
     UPDATE streamlist      
     SET      
      statusFlag = CASE WHEN status='RUNNING' THEN 3 ELSE 0 END,
      isLive=CASE WHEN status='RUNNING' THEN 1 ELSE isLive END,
      lastseen=cs.dt
     FROM streamlist sl      
     INNER JOIN #CameraStatus cs ON cs.CameraID = sl.deviceid      
     WHERE ISNULL(sl.isdeleted,0)=0
 END
 IF (@Status = 'STOPPED')
 BEGIN
     UPDATE streamlist
     SET      
      statusFlag=4,lastseen=cs.dt
     FROM streamlist sl
     INNER JOIN #CameraStatus cs ON cs.CameraID = sl.deviceid
     WHERE ISNULL(sl.isdeleted,0)=0
 END

END
GO
/****** Object:  StoredProcedure [dbo].[SaveStreamList]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SaveStreamList]  
(  
 @deviceid varchar(100),  
 @servername varchar(100),  
 @prourl varchar(100),
 @UserName varchar(50)='',
 @PageName varchar(50)=''
)  
AS  
BEGIN  
 DECLARE @ID INT = 0  
 SELECT @ID = id FROM streamlist where deviceid=@deviceid AND servername = @servername AND prourl = @prourl AND ISNULL(isdeleted,0)=0  
   
 IF (@ID = 0)  
 BEGIN  
  INSERT INTO streamlist(stateID,prourl,deviceid,streamname,servername,schoolid,status,IsEnable,isLive,hasalarm,  
  lastseen,stop,isdownload,isvod,selected,statusFlag,streamnamebkp,jionum,isdeleted,
  AddDate,AddedBy,AddedFrom,UpdateDate,UpdatedBy,UpdatedFrom)  
  VALUES(1,@prourl,@deviceid,@deviceid,@servername,'9999','STOPPED',1,0,0,  
  '1970-01-01 00:00:00.000',0,0,0,0,0,null,null,0,
   [dbo].[GETIST](),@UserName,@PageName,[dbo].[GETIST](),@UserName,@PageName)  
    
  SELECT SCOPE_IDENTITY() AS ID  
 END  
 ELSE  
 BEGIN  
  SELECT @ID AS ID  
 END  
END
GO
/****** Object:  StoredProcedure [dbo].[SaveStreamMaster]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SaveStreamMaster]
(
	@id INT,
	@deviceid nvarchar(100),
	@servername nvarchar(100),
	@prourl nvarchar(100),
	@isAI bit=0,
	@username varchar(100)
)
AS
BEGIN
	Declare  @Msg varchar(200) = ''
	
	IF (@ID = 0)
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM streamlist where deviceid=@deviceid)
		BEGIN
			INSERT INTO streamlist(stateID,prourl,deviceid,streamname,servername,schoolid,status,IsEnable,isLive,hasalarm,
			lastseen,stop,isdownload,isvod,selected,statusFlag,streamnamebkp,jionum,isdeleted,IsAICamera,AddedBy,AddedFrom)
			VALUES(1,@prourl,@deviceid,@deviceid,@servername,'9999','STOPPED',1,0,0,
			'1970-01-01 00:00:00.000',0,0,0,0,0,null,null,0,@isAI,@username,'StreamlistMaster.aspx')
		
			SELECT @deviceid + ' inserted successfully.' AS msg, CAST(1 AS BIT) AS Status
		END
		ELSE
		BEGIN
			SELECT @deviceid + ' is already exist! Please enter another CameraID.' AS msg, CAST(0 AS BIT) AS Status
		END
	END
	ELSE
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM streamlist where deviceid=@deviceid AND id <> @id)
		BEGIN
			Update streamlist
			set 
				prourl=@prourl,
				servername=@servername,
				IsAICamera=@isAI,
				UpdateDate=[dbo].[GETIST](),
				UpdatedBy=@username,
				UpdatedFrom='StreamlistMaster.aspx'
			where id=@ID

			SELECT @deviceid + ' updated successfully.' AS msg, CAST(1 AS BIT) AS Status
		END
		ELSE
		BEGIN
			SELECT @deviceid + ' is already exist! Please enter another CameraID.' AS msg, CAST(0 AS BIT) AS Status
		END
	END
	SELECT @ID AS ID
END
GO
/****** Object:  StoredProcedure [dbo].[SendSwapMail]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SendSwapMail]
@BoothId nvarchar(max),
@BoothId1 nvarchar(max)
AS
BEGIN
--Select top 2 bh.*,s.deviceid from boothhistory bh inner join streamlist s on s.id=bh.streamid where boothid in(@BoothId,@BoothId1) and  isdelete=1 and Action='SWAPCAMERA' order by bh.id desc

--Select bh.*,s.deviceid from boothhistory  bh inner join streamlist s on s.id=bh.streamid where  boothid in(@BoothId,@BoothId1) and  isdelete=0 and Action='SWAPCAMERA'

select * from (
select top 1 'Previous Entry' AS Status,bh.*,s.deviceid from boothhistory bh
inner join streamlist s on s.id = bh.streamid
where boothid = @BoothId and isdelete=1 order by bh.id desc
) tbl
union
select 'Updated Entry' AS Status,bh.*,s.deviceid from boothhistory bh
inner join streamlist s on s.id = bh.streamid
where boothid = @BoothId and isdelete=0

select * from (
select top 1 'Previous Entry' AS Status,bh.*,s.deviceid from boothhistory bh
inner join streamlist s on s.id = bh.streamid
where boothid = @BoothId1 and isdelete=1 order by id desc
) tbl
union
select 'Updated Entry' AS Status,bh.*,s.deviceid from boothhistory bh
inner join streamlist s on s.id = bh.streamid
where boothid = @BoothId1 and isdelete=0

END
GO
/****** Object:  StoredProcedure [dbo].[Service_SP_hourwise]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Service_SP_hourwise] 
  @stateId nvarchar(max),
  @tbl_name nvarchar(max), 
  @col_name nvarchar(max),
  @StopTime int
AS   
	declare @q varchar(max)

	set @q = 'select b.id,b.streamid,s.streamname,s.deviceid,s.status,s.lastseen into #tempTable'
	set @q = @q + ' from booth b inner join streamlist s on b.streamid=s.id where b.isdisplay=''True'' and s.IsEnable=1 and b.boothstateid IN ('+@stateId+')'

	set @q = @q + ' select id as boothId,case when dateadd(MINUTE, -60,DATEADD(MINUTE, 330,GETDATE())) >= lastseen then case when status = ''RUNNING'' then 1 else 0 end else 1 end as Status'
	set @q = @q + ' into #tempUpdateTable'
	set @q = @q + ' from #tempTable where id in (SELECT boothid FROM '+@tbl_name+')'

	set @q = @q + ' select id as boothId,case when dateadd(MINUTE, -60,DATEADD(MINUTE, 330,GETDATE())) >= lastseen then case when status = ''RUNNING'' then 1 else 0 end else 1 end as Status'
	set @q = @q + ' into #tempInsertTable'
	set @q = @q + ' from #tempTable where id not in (SELECT boothid FROM '+@tbl_name+')'

	set @q = @q + ' update d'
	set @q = @q + ' set '+@col_name+' = tu.Status'
	set @q = @q + ' from '+@tbl_name+' d'
	set @q = @q + ' inner join #tempUpdateTable tu on tu.boothId = d.boothid'

	set @q = @q + ' insert dt_04042021 (boothid,'+@col_name+')'
	set @q = @q + ' Select d.boothid,tu.Status from '+@tbl_name+' d'
	set @q = @q + ' inner join #tempInsertTable tu on tu.boothId = d.boothid'

	set @q = @q + ' Drop table #tempUpdateTable'
	set @q = @q + ' Drop table #tempInsertTable'
	set @q = @q + ' Drop table #tempTable'

	exec(@q)
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateStatus]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_UpdateStatus] 	 
@execString nvarchar(max)
AS
BEGIN
	exec(@execString)
END
GO
/****** Object:  StoredProcedure [dbo].[SwapCamemainLocation]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec SwapCamemainLocation 2,6,2,5  
CREATE Proc [dbo].[SwapCamemainLocation]  
(  
@id int,  
@id1 int,  
@StremlistID int,  
@StremlistID1 int,  
@UserName varchar(50)='',  
@IPAddress varchar(50)=''  
)  
AS  
BEGIN  
 Declare @Msg varchar(200),@operatorID int=0,@district varchar(50)='',@accode int=0,@acname varchar(50)='',@PSNum varchar(50)='',  
 @location varchar(50)='',@cameralocationtype varchar(50)=''  
  
 UPDATE boothhistory SET isdelete = 1,updatedDate=[dbo].[GETIST](),updatedBy = @UserName,updatedFrom='SwapCamera',UpdatedFromPage='SwapCamera.aspx'
 WHERE boothid = @id AND isnull(isdelete,0)=0  
 UPDATE boothhistory SET isdelete = 1,updatedDate=[dbo].[GETIST](),updatedBy = @UserName,updatedFrom='SwapCamera'  ,UpdatedFromPage='SwapCamera.aspx'
 WHERE boothid = @id1 AND isnull(isdelete,0)=0  
  
     Update booth set streamid=@StremlistID1,isupdated=1,updatedDate=[dbo].[GETIST](),updatedBy=@UserName,updatedFrom='SwapCamera',UpdatedFromPage='SwapCamera.aspx' 
	 where id=@id  
     Update booth set streamid=@StremlistID,isupdated=1,updatedDate=[dbo].[GETIST](),updatedBy=@UserName,updatedFrom='SwapCamera' ,UpdatedFromPage='SwapCamera.aspx' 
	 where id=@id1  
     SET @Msg='Camera Swaped Successfully!!!'  
     Select @Msg   
     Select s.deviceid,district,acname,PSNum,location from booth b  
     inner join streamlist s on s.id=b.streamid where b.id in (@id,@id1)  
  
  Select @operatorID=operatorid,@district=district,@accode=accode,@acname=acname,@PSNum=PSNum,@location=location,@cameralocationtype=cameralocationtype   
 from booth where streamid=@StremlistID1  
  
 INSERT INTO boothhistory(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,  
 longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,  
 updatedDate,updatedBy,updatedFrom,Action,boothid,IPAddress,UpdatedFromPage)  
 SELECT streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,  
  longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,  
  [dbo].[GETIST](),@UserName,'SwapCamera','SWAPCAMERA',id,@IPAddress,'SwapCamera.aspx'
 FROM booth where id = @id  
  
 Select @operatorID=operatorid,@district=district,@accode=accode,@acname=acname,@PSNum=PSNum,@location=location,@cameralocationtype=cameralocationtype   
 from booth where streamid=@StremlistID  
 INSERT INTO boothhistory(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,  
 longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,updatedDate,updatedBy,updatedFrom,Action,boothid,IPAddress,UpdatedFromPage)  
 SELECT streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,  
  longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,  
  [dbo].[GETIST](),@UserName,'SwapCamera','SWAPCAMERA',id,@IPAddress,'SwapCamera.aspx'
 FROM booth where id = @id1  
     
END  
GO
/****** Object:  StoredProcedure [dbo].[swapCameraFromBooth]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[swapCameraFromBooth] --2,3  
@id1 int,  
@id2 int,  
@UserName varchar(500) = '',        
@IPAddress varchar(50)=''   
as  
begin  
Declare @Msg varchar(200),@operatorID int=0,@district varchar(50)='',@accode int=0,@acname varchar(50)='',@PSNum varchar(50)='',      
 @location varchar(50)='',@cameralocationtype varchar(50)=''  
declare @streamid1 int  
declare @streamid2 int  
  
select @streamid1= streamid from booth where id=@id1  
select @streamid2= streamid from booth where id=@id2  
 UPDATE boothhistory SET isdelete = 1,updatedDate=[dbo].[GETIST](),updatedBy = @UserName,updatedFrom='EDITCAMERA',UpdatedFromPage='BoothMaster.aspx'    
 WHERE boothid = @id1 AND isnull(isdelete,0)=0      
 UPDATE boothhistory SET isdelete = 1,updatedDate=[dbo].[GETIST](),updatedBy = @UserName,updatedFrom='EDITCAMERA'  ,UpdatedFromPage='BoothMaster.aspx'    
 WHERE boothid = @id2 AND isnull(isdelete,0)=0  
  
update booth set streamid=@streamid2,isupdated=1,updatedDate=[dbo].[GETIST](),updatedBy=@UserName,updatedFrom='EDITCAMERA',UpdatedFromPage='BoothMaster.aspx'   
where id=@id1  
update booth set streamid=@streamid1,isupdated=1,updatedDate=[dbo].[GETIST](),updatedBy=@UserName,updatedFrom='EDITCAMERA',UpdatedFromPage='BoothMaster.aspx'   
where id=@id2  
  
 Select @operatorID=operatorid,@district=district,@accode=accode,@acname=acname,@PSNum=PSNum,@location=location,@cameralocationtype=cameralocationtype       
 from booth where streamid=@streamid2  
 INSERT INTO boothhistory(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,      
 longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,      
 updatedDate,updatedBy,updatedFrom,Action,boothid,IPAddress,UpdatedFromPage)      
 SELECT streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,      
  longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,      
  [dbo].[GETIST](),@UserName,'EDITCAMERA','SWAP CAMERA',id,@IPAddress,'BoothMaster.aspx'    
 FROM booth where id = @id1      
      
 Select @operatorID=operatorid,@district=district,@accode=accode,@acname=acname,@PSNum=PSNum,@location=location,@cameralocationtype=cameralocationtype       
 from booth where streamid=@streamid1      
 INSERT INTO boothhistory(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,      
 longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,updatedDate,updatedBy,updatedFrom,Action,boothid,IPAddress,UpdatedFromPage)      
 SELECT streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,      
  longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,      
  [dbo].[GETIST](),@UserName,'EDITCAMERA','SWAP CAMERA',id,@IPAddress,'BoothMaster.aspx'    
 FROM booth where id = @id2      
end  
GO
/****** Object:  StoredProcedure [dbo].[swapCameraIDs]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[swapCameraIDs]
@id1 int, @id2 int
as
begin
declare @streamid1 int
declare @streamid2 int

select @streamid1= streamid from booth where id=@id1
select @streamid2= streamid from booth where id=@id2
update booth set streamid=@streamid2 where id=@id1
update booth set streamid=@streamid1 where id=@id2
end
GO
/****** Object:  StoredProcedure [dbo].[UnMapToMapCamera]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[UnMapToMapCamera]  
(  
@id int,  
@StremlistID int,  
@UserName varchar(50)='',  
@IPAddress varchar(50)=''  
)  
AS  
BEGIN  
 Declare @Msg varchar(100)  
 UPDATE boothhistory SET isdelete = 1
 WHERE boothid = @id AND isnull(isdelete,0)=0  
  
 Update booth set streamid=@StremlistID,isupdated=1,updatedDate=[dbo].[GETIST](),updatedBy = @UserName,
 updatedFrom='CameraMapping',UpdatedFromPage='UnmappedCameraList.aspx' where id=@id   
  
 INSERT INTO boothhistory(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,  
 longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,  
 updatedDate,updatedBy,updatedFrom,Action,boothid,IPAddress,UpdatedFromPage)  
 SELECT streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,  
  longitude,latitude,cameralocationtype,IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,  
  [dbo].[GETIST](),@UserName,'CameraMapping','Map Camera',id,@IPAddress,'UnmappedCameraList.aspx' 
 FROM booth where id = @id  
  
 SET  @Msg='Camera Maped Successfully'      
 SELECT @Msg  
END  
  
  
  
--Select * from booth  
  
--Select * from streamlist   
  
  
  
  
  
  
GO
/****** Object:  StoredProcedure [dbo].[UPDATECSDWithNull]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATECSDWithNull]
AS
BEGIN

	DECLARE @csvShiftId INT, @currentShift INT, @CSDDate DATETIME, @CurrentDate DATETIME
	
	--SELECT 
	--	@csvShiftId = csd.ShiftID, 
	--	@currentShift = [dbo].[GetCurrentShift](), 
	--	@CSDDate = cast(csd.OffLineStartTime as date), 
	--	@CurrentDate = cast(getdate() as date)
	--FROM CameraStopDuration csd WHERE OffLineStopTime is null
	
	--IF(@csvShiftId != @currentShift OR @CSDDate != @CurrentDate)
	--BEGIN
		SELECT 
			[Id]
			,[streamname]
			,[OffLineStartTime]
		INTO #CSD
			FROM [CameraStopDuration] csd
			WHERE [OffLineStopTime] is null
			AND (csd.ShiftID != [dbo].[GetCurrentShift]()
			OR cast(csd.OffLineStartTime as date) != cast([dbo].[GetIST]() AS DATE))
	
		UPDATE [CameraStopDuration]
		SET [OffLineStopTime] =  SWITCHOFFSET(GETDATE(), '+05:30'), [ModifyDate] =  SWITCHOFFSET(GETDATE(), '+05:30')
		WHERE [Id] IN
		(SELECT [Id] FROM #CSD)

		INSERT INTO [CameraStopDuration]([streamname], [OffLineStartTime], [OffLineStopTime])
		SELECT 
			[streamname], 
			SWITCHOFFSET(GETDATE(), '+05:30') AS [OffLineStartTime], 
			NULL AS [OffLineStopTime]
		FROM #CSD
	--END
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateMapping]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMapping]
AS
BEGIN
	INSERT INTO [DBO].[Vehicle_Staff_Mapping] ([StaffId], [VehicleId], [ShiftId], [AssignDate], [isdeleted], [Streamid], [GpsDeviceId], [AddedBy], [LastEditedBy])
	SELECT [StaffId], 
		[VehicleId], 
		[ShiftId], 
		DATEADD(day, 1, CAST(SWITCHOFFSET(GETDATE(), '+05:30') AS date)) AS [AssignDate], 
		[isdeleted],
		[Streamid],
		[GpsDeviceId],
		[AddedBy],
		[LastEditedBy]
		FROM [DBO].[Vehicle_Staff_Mapping] 
		WHERE 
		[AssignDate] = DATEADD(day, 0, CAST(SWITCHOFFSET(GETDATE(), '+05:30') AS date))
		AND isdeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserDetails]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--UpdateUserDetails
CREATE PROCEDURE [dbo].[UpdateUserDetails]  
@username varchar(100),  
@password varchar(100),   
@identifier int,  
@isenable bit,  
@stateid int,  
@userid int,  
@AssemblyAccesIds varchar(4000),  
@usercode varchar(100)  
AS  
BEGIN  
if( @userid=0)  
begin  
 --insert  
 insert into users (username,[password], identifier, IsEnable, stateid,AssemblyAccesIds,usercode) values (@username,@password, @identifier,@isenable, @stateid,@AssemblyAccesIds,@usercode)  
end  
else  
begin  
 --update  
 update users set username=@username, [password]=@password,identifier=@identifier,IsEnable=@isenable,stateid=@stateid, AssemblyAccesIds=@AssemblyAccesIds, usercode=@usercode where id=@userid  
end    
end
GO
/****** Object:  StoredProcedure [dbo].[UploadAssemblyWiseBooth]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UploadAssemblyWiseBooth]
(
	@District VARCHAR(500),
	@Assembly VARCHAR(500),
	@tbl AS dbo.UT_UploadAssemblyWiseBooth READONLY,
    @username varchar(200)='',
	@IpAddress varchar(100)=''

)
AS
BEGIN
	DECLARE @accode varchar(200) = ''
	CREATE TABLE #upBooth
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		CameraDID varchar(100),
		--ProURL varchar(100),
		--ServerName varchar(100),
		PSNo varchar(100),
		Location varchar(max),
		Operator_Name varchar(100),
		Operator_Designation varchar(100),
		Operator_Mobile_No varchar(100),
		IsOutside_booth BIT,
		IsPink_booth BIT,
		isARO BIT,
		IsAICamera BIT,
		boothid INT default(0),
		streamid INT default(0),
		operatorid INT default(0),
		ErrorMessage VARCHAR(MAX) default(''),
		Action varchar(50) default(''),
		rn INT
	)

	INSERT INTO #upBooth (CameraDID,PSNo,Location,Operator_Name,Operator_Mobile_No,Operator_Designation,
				IsOutside_booth,IsPink_booth,isARO,IsAICamera)
	SELECT CameraDID,LTRIM(RTRIM(Part_No+ '' + PSNo)),Location,Operator_Name,Operator_Mobile_No,Operator_Designation,
				IsOutside_booth,IsPink_booth,isARO,IsAICamera FROM @tbl

	SELECT @accode = accode FROM district WHERE district = @District AND acname = @Assembly

	UPDATE u
	SET streamid = s.id
	FROM #upBooth u
	INNER JOIN streamlist s ON s.deviceid = u.CameraDID

	--INSERT INTO streamlist (deviceid,streamname,prourl,servername,schoolid,status,lastseen,IsAICamera,AddedBy,AddedFrom)
	--SELECT CameraDID,CameraDID,ProURL,ServerName,'9999','STOPPED','1970-01-01 00:00:00.000',IsAICamera,@username,'EXCEL'
	--FROM #upBooth WHERE streamid = 0 AND CameraDID <> '' AND ProURL <> '' AND ServerName <> ''

	UPDATE u
	SET streamid = s.id
	FROM #upBooth u
	INNER JOIN streamlist s ON s.deviceid = u.CameraDID AND u.streamid = 0

	UPDATE u
	SET ErrorMessage = 'CameraDID does not exists.'
	FROM #upBooth u
	WHERE u.streamid = 0
	-------------------Add By Rahul-----------------------------
	--	 DECLARE @count int
 --        SET @count =(SELECT COUNT(b1.id) FROM (SELECT b1.id,COUNT(id) OVER (PARTITION BY streamid) as cnt 
	--		FROM #upBooth b1) b1 WHERE cnt > 1)
	--		IF (@count <=0)        
	--		BEGIN   
	--			SET @count = 0      
	--		END
	--		ELSE
	--		BEGIN
	--			SET @count=@count-1
	--		END
	
	--UPDATE u SET ErrorMessage = 'This CameraDID is duplicate in Excel'
	--FROM #upBooth u where id IN 
	--(SELECT Top(@count) b1.id FROM (SELECT b1.id,COUNT(id) OVER (PARTITION BY streamid) as cnt 	FROM #upBooth b1
 --    ) b1 WHERE cnt > 1 order by id desc) and u.streamid !=0 
	-- -----------------End-----------------------------

	UPDATE u
	SET ErrorMessage = 'This CameraDID is already assigned to District = ' + b.district + ' | Assembly = ' + b.acname + ' | PSNO = ' + b.PSNum + '.'
	FROM #upBooth u
	INNER JOIN booth b on b.streamid = u.streamid
	WHERE u.streamid != 0 AND (b.PSNum != u.PSNo OR b.location != u.Location OR b.district != @District OR b.acname != @Assembly)  
	AND ISNULL(isdelete,0) = 0
	

	UPDATE u
	SET operatorid = o.id
	FROM #upBooth u
	INNER JOIN operator_info o ON o.operatorName = u.Operator_Name AND o.operatorNumber = u.Operator_Mobile_No

	DECLARE @dummyOpID INT = 0
	SELECT @dummyOpID = id FROM operator_info WHERE operatorName = 'NA' AND operatorNumber='9876543210'

	IF (@dummyOpID = 0)
	BEGIN
		INSERT INTO operator_info(operatorName,operatorNumber,Designation)
		VALUES('NA','9876543210','NA')
		SET @dummyOpID = @@IDENTITY
	END

	UPDATE u
	SET operatorid = @dummyOpID
	FROM #upBooth u
	WHERE ISNULL(Operator_Name,'') = '' AND ISNULL(Operator_Mobile_No,'') = ''
		AND ISNULL(Operator_Designation,'') = ''

	INSERT INTO operator_info(operatorName,operatorNumber,Designation)
	SELECT Operator_Name,Operator_Mobile_No,Operator_Designation FROM #upBooth WHERE operatorid = 0
	AND ISNULL(Operator_Name,'') <> '' AND ISNULL(Operator_Mobile_No,'') <> '' AND ISNULL(Operator_Designation,'') <> ''

	UPDATE u
	SET operatorid = o.id
	FROM #upBooth u
	INNER JOIN operator_info o ON o.operatorName = u.Operator_Name AND o.operatorNumber = u.Operator_Mobile_No

	UPDATE u
	SET boothid = b.id,Action='UPDATE'
	FROM #upBooth u
	INNER JOIN booth b ON b.PSNum = u.PSNo and b.location = u.Location AND b.district = @District AND b.acname = @Assembly AND ISNULL(isdelete,0) = 0

	UPDATE b
	SET isdelete = 1,updatedBy = @username,updatedDate = [dbo].[GETIST](),
		updatedFrom = 'EXCEL',UpdatedFromPage='BoothMaster.aspx'
	FROM boothhistory b
	INNER JOIN #upBooth u ON u.boothid = b.boothid AND ISNULL(b.isdelete,0) = 0 and u.Action='UPDATE'

	UPDATE #upBooth
	SET rn = b.rn2
	FROM #upBooth u
	inner join (
		SELECT *
		,ROW_NUMBER() OVER(PARTITION BY CameraDID,@District,@accode,@Assembly,PSNo,location ORDER BY @District,@accode,@Assembly,PSNo,location) rn2
		FROM #upBooth u
		WHERE /*boothid = 0 AND*/ streamid != 0 AND ISNULL(ErrorMessage,'') = ''
	) b on u.id=b.id

	UPDATE u
	SET ErrorMessage = 'This record is duplicate in Excel.'
	FROM #upBooth u
	WHERE u.rn > 1

	UPDATE #upBooth
	SET rn = b.rn2
	FROM #upBooth u
	inner join (
		SELECT *
		,ROW_NUMBER() OVER(PARTITION BY CameraDID ORDER BY @District,@accode,@Assembly,PSNo,location) rn2
		FROM #upBooth u
		WHERE boothid = 0 AND streamid != 0 AND ISNULL(ErrorMessage,'') = '' and rn<=1
	) b on u.id=b.id

	UPDATE u
	SET ErrorMessage = 'This CameraDID is duplicate in Excel.'
	FROM #upBooth u
	WHERE u.rn > 1

	UPDATE #upBooth
	SET rn = b.rn2
	FROM #upBooth u
	inner join (
		SELECT *
		,ROW_NUMBER() OVER(PARTITION BY @District,@accode,@Assembly,PSNo,location ORDER BY @District,@accode,@Assembly,PSNo,location) rn2
		FROM #upBooth u
		WHERE boothid = 0 AND streamid != 0 AND ISNULL(ErrorMessage,'') = '' and rn<=1
	) b on u.id=b.id

	UPDATE u
	SET ErrorMessage = 'This record is duplicate in Excel.'
	FROM #upBooth u
	WHERE u.rn > 1

	INSERT INTO booth(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,
	updatedBy,updatedDate,updatedFrom,longitude,latitude,bkpstreamid,cameralocationtype,
	IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,Trial1,Trial2,isdelete,AddedFromPage,AddedFrom,isupdated)  --Add column isupdate by Rahul 
	SELECT streamid,operatorid,district,accode,acname,PSNo,location,boothstateid,isdisplay,
	updatedBy,updatedDate,updatedFrom,longitude,latitude,CameraDID,cameralocationtype,
	IsPink_booth,IsOutside_booth,AddDatetime,addedBy,IsAro,Trial1,Trial2,isdelete,AddedFromPage,AddedFrom,isupdated FROM (
		SELECT streamid,operatorid,@District AS district,@accode AS accode,@Assembly AS acname,PSNo,location,1 as boothstateid,1 as isdisplay,
		@username as updatedBy,[dbo].[GETIST]() as updatedDate,'EXCEL' AS updatedFrom,0 AS longitude,0 AS latitude,CameraDID,CASE WHEN IsOutside_booth = 1 THEN 'Outside' ELSE 'Inside' END AS cameralocationtype,
		IsPink_booth,IsOutside_booth,[dbo].[GETIST]() AS AddDatetime,@username AS addedBy,IsAro,0 AS Trial1,0 AS Trial2,0 AS isdelete,'BoothMaster.aspx' AS AddedFromPage,'EXCEL' AS AddedFrom,0 AS isupdated
		,ROW_NUMBER() OVER(PARTITION BY @District,@accode,@Assembly,PSNo,location ORDER BY @District,@accode,@Assembly,PSNo,location) rn
		FROM #upBooth
		WHERE boothid = 0 AND streamid != 0 AND ISNULL(ErrorMessage,'') = ''
	) tbl WHERE rn = 1

	UPDATE u
	SET boothid = b.id,Action='INSERT'
	FROM #upBooth u
	INNER JOIN booth b ON b.PSNum = u.PSNo and b.location = u.Location AND b.district = @District AND b.acname = @Assembly
		and u.boothid = 0 and ISNULL(b.isdelete,0)=0

	INSERT INTO boothhistory(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,
	updatedBy,updatedDate,updatedFrom,longitude,latitude,bkpstreamid,cameralocationtype,
	IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,Trial1,Trial2,isdelete,AddedFromPage,AddedFrom,Action,boothid,IPAddress)
	SELECT streamid,operatorid,@District,@accode,@Assembly,PSNo,location,1,1,
	@username,[dbo].[GETIST](),'EXCEL',0,0,CameraDID,CASE WHEN IsOutside_booth = 1 THEN 'Outside' ELSE 'Inside' END,
	IsPink_booth,IsOutside_booth,[dbo].[GETIST](),@username,IsAro,0,0,0,'BoothMaster.aspx','EXCEL','INSERT',boothid,@IpAddress  FROM #upBooth
	WHERE boothid != 0 AND streamid != 0 AND ISNULL(ErrorMessage,'') = '' AND Action = 'INSERT'

	UPDATE b
	SET
		location = u.Location,streamid = u.streamid, operatorid = u.operatorid,
		cameralocationtype = CASE WHEN IsOutside_booth = 1 THEN 'Outside' ELSE 'Inside' END,
		IsOutsideBooth = IsOutside_booth, IsPink = IsPink,IsAro = u.isARO,
		updatedBy = @username,updatedDate = [dbo].[GETIST](),updatedFrom = 'EXCEL'
		,isupdated = 1,UpdatedFromPage='BoothMaster.aspx'
	FROM booth b
	INNER JOIN #upBooth u ON b.PSNum = u.PSNo AND b.location = u.Location AND b.district = @District AND b.acname = @Assembly
		AND u.boothid = b.id AND Action = 'UPDATE' and ISNULL(b.isdelete,0)=0

	--UPDATE b
	--SET
	--	isdelete = 1,updatedBy = @username,updatedDate = [dbo].[GETIST](),
	--	updatedFrom = 'EXCEL',UpdatedFromPage='BoothMaster.aspx'
	--FROM boothhistory b
	--INNER JOIN #upBooth u ON u.boothid = b.id AND b.isdelete = 0
	--	AND ISNULL(u.ErrorMessage,'') = '' AND u.Action = 'UPDATE'

	INSERT INTO boothhistory(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,isdisplay,
	updatedBy,updatedDate,updatedFrom,longitude,latitude,bkpstreamid,cameralocationtype,
	IsPink,IsOutsideBooth,AddDatetime,addedBy,IsAro,Trial1,Trial2,isdelete,AddedFromPage,AddedFrom,Action,boothid,IPAddress)
	SELECT DISTINCT streamid,operatorid,@District,@accode,@Assembly,PSNo,location,1,1,
	@username,[dbo].[GETIST](),'EXCEL',0,0,CameraDID,CASE WHEN IsOutside_booth = 1 THEN 'Outside' ELSE 'Inside' END,
	IsPink_booth,IsOutside_booth,[dbo].[GETIST](),@username,IsAro,0,0,0,'BoothMaster.aspx','EXCEL','UPDATE',boothid,@IpAddress
	FROM #upBooth
	WHERE boothid != 0 AND streamid != 0 AND ISNULL(ErrorMessage,'') = '' AND Action = 'UPDATE'

	SELECT CameraDID, PSNo, Location, Operator_Name, Operator_Mobile_No, Operator_Designation, 
		IsOutside_booth,IsPink_booth,isARO,IsAICamera,ErrorMessage
	FROM #upBooth WHERE ISNULL(ErrorMessage,'') != ''
END

GO
/****** Object:  StoredProcedure [dbo].[UploadAssemblyWiseoperator]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UploadAssemblyWiseoperator]
(
	@District VARCHAR(500),
	@Assembly VARCHAR(500),
	@cameraId varchar(500),
	@Location varchar(500),
	@tbl AS dbo.UT_Uploadoperator_1 READONLY
 --   @username varchar(200)='',
	--@IpAddress varchar(100)=''

)
AS
BEGIN
	
	DECLARE @accode varchar(200) = ''
	CREATE TABLE #upBooth
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		CameraDID varchar(100),
		District varchar(100),
		Acname varchar(100),
		--ProURL varchar(100),
		--ServerName varchar(100),
		PSNo varchar(100),
		Location varchar(max),
		Operator_Name varchar(100),
		Operator_Designation varchar(100),
		Operator_Mobile_No varchar(100),
		
		streamid INT default(0),
		operatorid INT default(0)
	)
	if not exists(select 1 from streamlist where deviceid=@cameraId)
	BEGIN
		insert into operator_info(operatorName,operatorNumber,Designation,district)
	select Operator_Name,Operator_Mobile_No,Operator_Designation,@District  from  @tbl

	INSERT INTO #upBooth (CameraDID,District,Acname,PSNo,Location)
	SELECT CameraDID,@District,@Assembly,LTRIM(RTRIM(PSNo)),Location FROM @tbl  
	END
	
if(@cameraId='')
BEGIN
update booth set operatorid=o.id from booth inner join operator_info o on booth.operatorid=o.id where booth.district=o.district and booth.acname=o.acname and booth.PSNum=o.PSNum
END
else
BEGIN
update booth set operatorid=o.id from booth inner join operator_info o on booth.operatorid=o.id where booth.streamid=o.streamid
END

if(@Location!='')
BEGIN
update booth set operatorid=o.id from booth inner join operator_info o on booth.operatorid=o.id where booth.location=@Location
END
	SELECT @cameraId = deviceid,@Location=b.location FROM streamlist inner join booth b on b.streamid=streamlist.id WHERE deviceid = @cameraId or b.location=@Location


select deviceid,b.district,b.acname,b.PSNum,b.Location from booth b inner join streamlist s on s.id=b.streamid inner join operator_info o
on o.id=b.operatorid

END
GO
/****** Object:  StoredProcedure [dbo].[UploadInventoryTrn]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UploadInventoryTrn]
(
	
	@tbl AS dbo.UT_UploadInventoryTrn READONLY
)
AS
BEGIN
	CREATE TABLE #TempTable
	(
		id INT IDENTITY(1,1) PRIMARY KEY,
		District varchar(100),
		Assembly varchar(100),
		Location varchar(max),
		StreamID varchar(100),
		OwnerFrom varchar(100),
		OwnerName varchar(100),
		OwnerMob varchar(100),
		AddDate varchar(100),
		AddTime varchar(100),
		Status varchar(100),
		ISConfirm bit,
		ErrorMessage VARCHAR(MAX) default(''),
		Action varchar(50) default('')
	)

	INSERT INTO #TempTable (District,Assembly,Location,StreamID,OwnerFrom,OwnerName,OwnerMob,
	AddDate,AddTime,Status,ISConfirm)
	SELECT District,Assembly,Location,StreamID,OwnerFrom,OwnerName,OwnerMob,
	[dbo].[GETIST](),[dbo].[GETIST](),'Received',NULL FROM @tbl

	UPDATE I SET Status='Transfer' FROM InventoryTrn I INNER JOIN #TempTable t ON t.StreamID=I.StreamID
	AND Status='Received'


	INSERT INTO InventoryTrn(District,[Assembly],Location,StreamID,OwnerFrom,OwnerName,OwnerMob,
	AddDate,AddTime,Status,ISConfirm)  
	SELECT District,Assembly,Location,StreamID,OwnerFrom,OwnerName,OwnerMob,
	[dbo].[GETIST](),[dbo].[GETIST](),'Received',NULL FROM #TempTable
	END
GO
/****** Object:  StoredProcedure [dbo].[UploadMasterData]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UploadMasterData]
(
	@tbl [dbo].[UT_UploadData] READONLY
)
AS
BEGIN
	CREATE TABLE #UploadData
	(
		DistrictCode VARCHAR(100)
		,District VARCHAR(100)
		,AcCode VARCHAR(100)
		,AcName VARCHAR(100)
		,Zone VARCHAR(100)
		,VehicleNo VARCHAR(100)
		,VehicleType VARCHAR(100)
		,DriverName VARCHAR(500)
		,DriverNo VARCHAR(100)
		,FSVName VARCHAR(500)
		,FSVNo VARCHAR(100)
		,GPSDID VARCHAR(100)
		,CameraDID VARCHAR(100)
		,CameraServerName VARCHAR(500)
		,CameraProURL VARCHAR(500)
		,ShiftName VARCHAR(50)
		,DistrictID INT
		,VehicleID INT
		,ShiftID INT
		,DriverID INT
		,FSVID INT
		,StreamID INT
		,BoothID INT
	)

	INSERT INTO #UploadData(DistrictCode,District,AcCode,AcName,Zone,VehicleNo,VehicleType,
	DriverName,DriverNo,FSVName,FSVNo,GPSDID,CameraDID,CameraServerName,CameraProURL,ShiftName,
	DistrictID,VehicleID,ShiftID,DriverID,StreamID,BoothID,FSVID)
	SELECT DistrictCode,District,AcCode,AcName,Zone,VehicleNo,VehicleType,
	DriverName,DriverNo,FSVName,FSVNo,GPSDID,CameraDID,CameraServerName,CameraProURL,ShiftName,
	0,0,0,0,0,0,0 FROM @tbl WHERE ISNULL(District,'') != '' AND ISNULL(AcName,'') != '' AND ISNULL(CameraDID,'') != ''

	UPDATE ud
	SET ud.ShiftID = vs.id
	FROM #UploadData ud
	INNER JOIN vehicleshift vs on vs.name = LTRIM(RTRIM(ud.ShiftName))

	UPDATE #UploadData SET VehicleNo = REPLACE(REPLACE(VehicleNo,' ',''),'-','')

	INSERT INTO district(stateid,district,accode,acname,isenable,isdeleted)
	SELECT DISTINCT 1, District, AcCode, AcName,1,0 FROM #UploadData ud
	WHERE District IS NOT NULL
	ORDER BY District
	--LEFT JOIN district d on d.district = RIGHT('00'+ISNULL(DistrictCode,''),2) + '-' + ud.District
	--and d.accode = ud.accode and d.isenable = 1 and isdeleted=0
	--WHERE d.district IS NULL

	UPDATE ud
	SET DistrictID = d.id
	--,DistrictCode = CAST(LEFT(d.district,2) AS INT),
	--AcCode = CAST(LEFT(d.acname,3) AS INT)
	--,ud.District = d.district,
	--ud.AcName = d.acname
	FROM #UploadData ud
	INNER JOIN district d on d.district = ud.District
	and d.acname = ud.AcName and d.isenable = 1 and isdeleted=0
	--INNER JOIN district d on SUBSTRING(ISNULL(d.district,''),4,LEN(d.district)-2) = ud.District
	--and SUBSTRING(ISNULL(d.acname,''),5,LEN(d.acname)-3) = ud.AcName and d.isenable = 1 and isdeleted=0

	INSERT INTO district(district,accode,acname,isenable,isdeleted)
	SELECT DISTINCT District,NULL,NULL,NULL,NULL FROM #UploadData WHERE District IS NOT NULL
	
	--INSERT INTO district(district,accode,acname,isenable,isdeleted)
	--SELECT DISTINCT RIGHT('00'+ISNULL(DistrictCode,''),2) + '-' + District,NULL,NULL,NULL,NULL FROM #UploadData
	--LEFT JOIN district d on d.district = RIGHT('00'+ISNULL(DistrictCode,''),2) + '-' + ud.District
	--and d.accode = NULL
	--WHERE d.district IS NULL
	insert into streamlist(deviceid,streamname,servername,prourl,isdeleted)
	SELECT DISTINCT ISNULL(ud.CameraDID,''),ISNULL(ud.CameraDID,''),ud.CameraServerName,ud.CameraProURL,0 FROM #UploadData ud
	WHERE ISNULL(ud.CameraDID,'') != ''
	--LEFT JOIN streamlist s on s.deviceid = ud.CameraDID
	--WHERE s.deviceid IS NULL

	UPDATE ud
	SET 
		ud.StreamID=s.id
	FROM #UploadData ud
	INNER JOIN streamlist s on s.deviceid = ud.CameraDID

	insert into booth(streamid,operatorid,district,accode,acname,PSNum,location,boothstateid,
	isdisplay,longitude,latitude,updatedBy,updatedDate,updatedFrom)
	SELECT DISTINCT ud.StreamID,0,ud.District,
	ud.AcCode,ud.AcName,1,Zone,1,
	1,0,0,1,[dbo].[GETIST](),'EXCEL' FROM #UploadData ud
	--SELECT DISTINCT ud.StreamID,0,RIGHT('00'+ISNULL(ud.DistrictCode,''),2) + '-' + ud.District,
	--ud.AcCode,RIGHT('000'+ISNULL(ud.AcCode,''),3) + '-' + ud.AcName,1,Zone,1,
	--1,0,0,1,[dbo].[GETIST](),'EXCEL' FROM #UploadData ud
	--LEFT JOIN booth b on b.streamid = ud.StreamID
	--WHERE b.streamid IS NULL

	UPDATE ud
	SET 
		BoothID=b.id
	FROM #UploadData ud
	INNER JOIN booth b on b.streamid = ud.StreamID

	INSERT INTO Staff_Info(name,contact_no,Type,isdeleted)
	SELECT DISTINCT ud.DriverName, ud.DriverNo,1,0 FROM #UploadData ud
	LEFT JOIN Staff_Info si on si.Type = 1 AND si.name = ISNULL(ud.DriverName,'') and si.contact_no = ISNULL(ud.DriverNo,'') and si.isdeleted=0
	WHERE si.id IS NULL AND ISNULL(ud.DriverName,'') != ''

	UPDATE ud
	SET ud.DriverID = si.Id
	FROM #UploadData ud
	INNER JOIN Staff_Info si on si.Type = 1 AND si.name = ISNULL(ud.DriverName,'') and si.contact_no = ISNULL(ud.DriverNo,'') and si.isdeleted=0

	INSERT INTO Staff_Info(name,contact_no,Type,isdeleted)
	SELECT DISTINCT ud.FSVName, ud.FSVNo,1,0 FROM #UploadData ud
	LEFT JOIN Staff_Info si on si.Type = 2 AND si.name = ISNULL(ud.FSVName,'') and si.contact_no = ISNULL(ud.FSVNo,'') and si.isdeleted=0
	WHERE si.id IS NULL AND ISNULL(ud.FSVName,'') != ''

	UPDATE ud
	SET ud.FSVID = si.Id
	FROM #UploadData ud
	INNER JOIN Staff_Info si on si.Type = 2 AND si.name = ISNULL(ud.FSVName,'') and si.contact_no = ISNULL(ud.FSVNo,'') and si.isdeleted=0

	insert into vehicalDetail (deviceid,accode,streamid,districtid,vehicle_no,vehicletype,isdeleted)
	SELECT DISTINCT ud.GPSDID,ud.AcCode,ud.StreamID,ud.DistrictID,ud.VehicleNo,ud.VehicleType,0 FROM #UploadData ud
	LEFT JOIN vehicalDetail vd on vd.Vehicle_No = ud.VehicleNo and vd.isdeleted = 0
	WHERE vd.Vehicle_No IS NULL AND ISNULL(ud.VehicleNo,'') != ''

	UPDATE ud
	SET ud.VehicleID = vd.vehicalId
	FROM #UploadData ud
	INNER JOIN vehicalDetail vd on LTRIM(RTRIM(vd.Vehicle_No)) = LTRIM(RTRIM(ud.VehicleNo)) AND vd.isdeleted = 0

	INSERT INTO location_info(boothid,UpdateDatetime,gps_did,VehicleNo)
	SELECT DISTINCT ud.BoothID,[dbo].[GETIST](),ud.GPSDID,ud.VehicleNo FROM #UploadData ud
	WHERE ud.BoothID > 0
	--LEFT JOIN location_info li on li.boothid = ud.BoothID
	--WHERE li.boothid IS NULL

	insert into [VehicleInstallation](district,accode,vehicleNo,vehicletype,SchduledDate,
	ActualDateOfArrival,InstallationDate,status,Zone)
	--SELECT DISTINCT RIGHT('00'+ISNULL(ud.DistrictCode,''),2) + '-' + ud.District,AcCode,VehicleNo
	SELECT DISTINCT ud.District,AcCode,VehicleNo
	,ud.VehicleType,NULL,NULL,NULL,0,ud.Zone
	FROM #UploadData ud WHERE ISNULL(VehicleNo,'') != ''
	
	INSERT INTO Vehicle_Staff_Mapping(StaffId,VehicleId,ShiftId,AssignDate,isdeleted,Streamid,GpsDeviceId,AddedOn,LastEditedOn)
	SELECT DriverID,VehicleID,ISNULL(ShiftID,1),[dbo].[GETIST](),0,StreamID,GPSDID,[dbo].[GETIST](),[dbo].[GETIST]() FROM #UploadData ud

	INSERT INTO zoneInfo(zoneName,zoneDistrict,zoneSchoolname)
	SELECT DISTINCT Zone,District,AcName FROM #UploadData
END
GO
/****** Object:  StoredProcedure [dbo].[vmukti_CreateDynamicHrsTable]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec vmukti_CreateDynamicHrsTable '05/19/2022 00:00:00','05/20/2022 00:00:00'
CREATE PROCEDURE [dbo].[vmukti_CreateDynamicHrsTable]
    @startDate date, 
	@endDate date
AS
BEGIN
	WHILE ( @startDate < @endDate)
	BEGIN   
		SET @startDate = dateadd(Day, 1, @startDate)

		Declare @datestring nvarchar(max)
		set @datestring = 'dt_'+CONVERT(VARCHAR,RIGHT('00' + CONVERT(NVARCHAR(2), DATEPART(DAY, @startDate)), 2))+ CONVERT(VARCHAR,RIGHT('00' + CONVERT(NVARCHAR(2), DATEPART(MONTH, @startDate)), 2))+  CONVERT(VARCHAR,YEAR(@startDate))

		Declare @datestringpk nvarchar(max)
		set @datestringpk = 'PK_'+CONVERT(VARCHAR,RIGHT('00' + CONVERT(NVARCHAR(2), DATEPART(DAY, @startDate)), 2))+ CONVERT(VARCHAR,RIGHT('00' + CONVERT(NVARCHAR(2), DATEPART(MONTH, @startDate)), 2))+  CONVERT(VARCHAR,YEAR(@startDate))


		declare @querystring nvarchar(max)
	
		set @querystring =  'IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'''+@datestring+''')'
		set @querystring = @querystring + ' BEGIN'
		set @querystring = @querystring + ' PRINT ''Yes'''
		set @querystring = @querystring + ' END'	
		set @querystring = @querystring + ' ELSE'	
		set @querystring = @querystring + ' BEGIN'
		set @querystring = @querystring + ' CREATE TABLE [dbo].['+@datestring+'](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[boothid] [int] NULL,
		[remarks] [nvarchar](max) NULL,
		[T_0] [int] NULL,
		[T_1] [int] NULL,
		[T_2] [int] NULL,
		[T_3] [int] NULL,
		[T_4] [int] NULL,
		[T_5] [int] NULL,
		[T_6] [int] NULL,
		[T_7] [int] NULL,
		[T_8] [int] NULL,
		[T_9] [int] NULL,
		[T_10] [int] NULL,
		[T_11] [int] NULL,
		[T_12] [int] NULL,
		[T_13] [int] NULL,
		[T_14] [int] NULL,
		[T_15] [int] NULL,
		[T_16] [int] NULL,
		[T_17] [int] NULL,
		[T_18] [int] NULL,
		[T_19] [int] NULL,
		[T_20] [int] NULL,
		[T_21] [int] NULL,
		[T_22] [int] NULL,
		[T_23] [int] NULL,
		 CONSTRAINT ['+@datestringpk+'] PRIMARY KEY CLUSTERED
		(
		[id] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]  
		 ALTER TABLE dbo.'+@datestring+'
		 ADD CONSTRAINT set_'+@datestring+'
		 DEFAULT 2 FOR T_0,
		 DEFAULT 2 FOR T_1,
		 DEFAULT 2 FOR T_2,
		 DEFAULT 2 FOR T_3,
		 DEFAULT 2 FOR T_4,
		 DEFAULT 2 FOR T_5,
		 DEFAULT 2 FOR T_6,
		 DEFAULT 2 FOR T_7,
		 DEFAULT 2 FOR T_8,
		 DEFAULT 2 FOR T_9,
		 DEFAULT 2 FOR T_10,
		 DEFAULT 2 FOR T_11,
		 DEFAULT 2 FOR T_12,
		 DEFAULT 2 FOR T_13,
		 DEFAULT 2 FOR T_14,
		 DEFAULT 2 FOR T_15,
		 DEFAULT 2 FOR T_16,
		 DEFAULT 2 FOR T_17,
		 DEFAULT 2 FOR T_18,
		 DEFAULT 2 FOR T_19,
		 DEFAULT 2 FOR T_20,
		 DEFAULT 2 FOR T_21,
		 DEFAULT 2 FOR T_22,
		 DEFAULT 2 FOR T_23;'
		set @querystring = @querystring + ' End;'

		--Print @querystring
		exec (@querystring)

			
	END
END
GO
/****** Object:  StoredProcedure [dbo].[vmukti_GetUserData]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Login  
--[vmukti_GetUserData] 'MasterAdmin','M@ster@dmin@123'    
CREATE PROCEDURE [dbo].[vmukti_GetUserData]      
    @username Nvarchar(100),       
 @password Nvarchar(100)      
AS      
BEGIN      
   SELECT id, username, [password],usercode, identifier,isEnable, isDvr,       
   stateID, islogin,chklogin,logincount,logincountenable,AssemblyAccesIds    
    FROM users WHERE username=@username and password=@password and IsEnable=1       
 DECLARE @xml AS       XML,    
       @accssids varchar(max),    
       @delimiter AS VARCHAR(10);    
     
 select @accssids = AssemblyAccesIds FROM users WHERE username=@username and password=@password and IsEnable=1     
    
 SET @delimiter = ',';    
SET @xml = CAST('<X>' + REPLACE(@accssids, @delimiter, '</X><X>') + '</X>' AS XML);     
    
 select * from district where id in ( SELECT [N].value( '.', 'varchar(100)' ) AS value FROM @xml.nodes( 'X' ) AS [T]( [N] )  ) and acname is not null and acname !=''    
END
GO
/****** Object:  StoredProcedure [dbo].[vmukti_GetUserDataFromUsername]    Script Date: 7/19/2023 2:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[vmukti_GetUserDataFromUsername]
    @username Nvarchar(100)
AS
BEGIN
   SELECT id, username,usercode,stateID as stateid
    FROM users WHERE username=@username and IsEnable=1 
END
GO

/****** Object:  StoredProcedure [dbo].[GetCameraStatusReport13122023]    Script Date: 12/14/2023 11:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetCameraStatusReport19122023]  
(      
 @district varchar(100) = ''      
 ,@accode varchar(100) = ''      
 ,@psnum varchar(100) = ''      
 ,@FromDt VARCHAR(30) = ''      
 ,@ToDt VARCHAR(30) = ''      
)      
AS      
BEGIN      
 DECLARE @StartDt DATETIME, @StopDt DATETIME, @Internaldistrict VARCHAR(100), @Internalaccode VARCHAR(100), @Internalpsno VARCHAR(100), @toDay varchar(255);      
 SET @Internaldistrict = @district      
 SET @Internalaccode = @accode      
 SET @Internalpsno = @psnum      
 SET @toDay = CONVERT(varchar(10), GETDATE(), 120)      
      
 IF (@FromDt = '')      
 BEGIN      
  SET @StartDt = null      
 END      
 ELSE      
 BEGIN      
    SET @StartDt = CAST(@FromDt AS datetime)          
 END      
 IF (@ToDt = '')      
 BEGIN      
  SET @StopDt = null      
 END      
 ELSE      
 BEGIN      
    SET @StopDt = CAST(@ToDt AS datetime)     
 END      

 CREATE TABLE #TimeDifferenceTable ( 
       district VARCHAR(50),
	   acname VARCHAR(50),
	   psnum VARCHAR(50),
	   location VARCHAR(500), 
       starttime DATETIME,
	   stoptime DATETIME,
	   starttime1 DATETIME,
	   stoptime2 DATETIME,
	   Total INT ,
	   Offline INT,Online INT
    );

	Insert into #TimeDifferenceTable
  
        SELECT  TBL.district AS district,TBL.acname,NULL as PSNum,TBL.VehicleNo,
               TBL.StartTime,TBL.StopTime,TBL.StartTime1,TBL.StopTime2,'' as Total ,
			   SUM(DATEDIFF(MINUTE, TBL.StartTime, TBL.StopTime)) as Offline,
			   SUM(DATEDIFF(MINUTE, TBL.StartTime1, TBL.StopTime2)) as Online 
			   FROM
           (      
           SELECT distinct s.id,s.streamname , b.district,b.acname,b.PSNum,b.location as VehicleNo,    
		   CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt  
		       	ELSE csd.OffLineStartTime END as StartTime, 
		   CASE WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() < @StopDt THEN [dbo].[GETIST]()
				 WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt 
				 WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt
				 ELSE csd.[OffLineStopTime] END as StopTime,  
		COALESCE(
            LAG(
                CASE 
                    WHEN csd.[OffLineStopTime] >= @StopDt THEN @StopDt
                    WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt 
                    WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() <= @StopDt THEN [dbo].[GETIST]() 
                    ELSE csd.[OffLineStopTime]
                END
               ) OVER (PARTITION BY b.Location ORDER BY csd.[OffLineStopTime]),
             @StartDt   
            )as StartTime1,
		     CASE 
                 WHEN csd.OffLineStartTime < @StartDt THEN @StartDt 
		     	 WHEN csd.[OffLineStartTime] IS NULL AND [dbo].[GETIST]() > @StartDt THEN @StartDt 
                  WHEN csd.[OffLineStartTime] IS NULL AND [dbo].[GETIST]() <= @StartDt THEN [dbo].[GETIST]()
                 ELSE csd.OffLineStartTime 
             END as StopTime2, 
		        '' as ShiftName,@StartDt as ShiftStartTime,@StopDt as ShiftEndTime, 
		   @StartDt AS DayDate,csd.Reason,op.operatorName AS DriverName,op.operatorNumber AS DriverContactNo,      
		   ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Offline,  '' AS Online

    FROM [dbo].[streamlist] s 
		  INNER JOIN [dbo].[CameraStopDurationnew] csd ON csd.streamname = s.streamname  
          INNER JOIN [dbo].[booth] b ON  b.district=csd.District and b.acname=csd.acname and b.PSNum=csd.PSNUM 
	      and b.location=csd.Location AND ISNULL(b.isdelete,'') = ''
          INNER JOIN [dbo].[operator_info] op ON op.id = b.operatorid AND b.isdisplay = 1      
    WHERE  CONVERT(DATE, csd.OffLineStartTime) = CONVERT(DATE, @StartDt) and
	((@Internaldistrict='') OR (b.district=@Internaldistrict))      
          and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
          and ((@Internalpsno='') OR (b.PSNum=@Internalpsno)) and ISNULL(isdelete,'')=0 
		 
   ) AS TBL
   WHERE((@FromDt = '' AND @ToDt = '') OR (StartTime >= ShiftStartTime AND StopTime <= ShiftEndTime AND StopTime >= StartTime))
    GROUP BY  TBL.district,TBL.acname,TBL.PSNum,TBL.VehicleNo,TBL.StartTime,TBL.StopTime,TBL.StartTime1,TBL.StopTime2 
   UNION  
   SELECT 
		TBL.district,TBL.acname, TBl.PSNum, TBL.VehicleNo,  NULL AS StartTime, NULL AS StopTime,
		  NULL AS StartTime1, NULL AS StopTime2,TBL.Offline as Total,
        SUM(DATEDIFF(MINUTE, TBL.StartTime, TBL.StopTime)) as Offline, SUM(DATEDIFF(MINUTE, TBL.StartTime1, TBL.StopTime2)) as Online 
    FROM
    (      SELECT  distinct s.id, b.District,  b.acname,b.PSNum,b.Location as VehicleNo,      
		  CASE WHEN csd.OffLineStartTime < @StartDt THEN @StartDt  
		       	ELSE csd.OffLineStartTime END as StartTime, 
	     CASE WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() < @StopDt THEN [dbo].[GETIST]()
				 WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt 
				 WHEN csd.[OffLineStopTime] > @StopDt THEN @StopDt
				 ELSE csd.[OffLineStopTime] END as StopTime, 

				  COALESCE(
            LAG(
                CASE 
                    WHEN csd.[OffLineStopTime] >= @StopDt THEN @StopDt
                    WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() > @StopDt THEN @StopDt 
                    WHEN csd.[OffLineStopTime] IS NULL AND [dbo].[GETIST]() <= @StopDt THEN [dbo].[GETIST]() 
                    ELSE csd.[OffLineStopTime]
                END
            ) OVER (PARTITION BY b.Location ORDER BY csd.[OffLineStopTime]),
            @StartDt   
        )as StartTime1,

		CASE 
            WHEN csd.OffLineStartTime < @StartDt THEN @StartDt 
			 WHEN csd.[OffLineStartTime] IS NULL AND [dbo].[GETIST]() > @StartDt THEN @StartDt 
             WHEN csd.[OffLineStartTime] IS NULL AND [dbo].[GETIST]() <= @StartDt THEN [dbo].[GETIST]()
            ELSE csd.OffLineStartTime 
        END as StopTime2,


		        '' as ShiftName,@StartDt as ShiftStartTime,@StopDt as ShiftEndTime, 
		       @StartDt AS DayDate,      
			   csd.Reason,op.operatorName AS DriverName,op.operatorNumber AS DriverContactNo,      
			   ABS(DATEDIFF(mi,@StartDt,@StopDt)) AS Offline, '' AS Online

          FROM [dbo].[streamlist] s 
		   INNER JOIN [dbo].[CameraStopDurationnew] csd ON csd.streamname = s.streamname  
           INNER JOIN [dbo].[booth] b ON  b.district=csd.District and b.acname=csd.acname and b.PSNum=csd.PSNUM 
	       and b.location=csd.Location AND ISNULL(b.isdelete,'') = ''
           INNER JOIN [dbo].[operator_info] op ON op.id = b.operatorid AND b.isdisplay = 1  
          WHERE  CONVERT(DATE, csd.OffLineStartTime) = CONVERT(DATE, @StartDt) and
	      ((@Internaldistrict='') OR (b.district=@Internaldistrict))      
          and ((@Internalaccode='') OR (b.accode=@Internalaccode))      
          and ((@Internalpsno='') OR (b.PSNum=@Internalpsno))   and ISNULL(isdelete,'')=0    
 ) AS TBL
 WHERE ((@FromDt = '' AND @ToDt = '') OR (StartTime >= ShiftStartTime AND StopTime <= ShiftEndTime AND StopTime >= StartTime))
 GROUP BY  district,acname,PSNum,VehicleNo,Offline
 ORDER BY  district,acname, StartTime
  OPTION (RECOMPILE);  
    DECLARE @TotalTimeDifferenceMinutes INT;
    SET @TotalTimeDifferenceMinutes = 0;
	 


	CREATE TABLE #TempTable ( 
       district VARCHAR(50), 
	   acname VARCHAR(50),
	   psnum VARCHAR(50),
	   location VARCHAR(500), 
	   streamname VARCHAR(500),
	   starttime DATETIME,
	   stoptime DATETIME,
	   starttime1 DATETIME,
	   stoptime2 DATETIME,
	   Total INT ,
	   Offline INT,
	   Online INT
    );
	INSERT INTO #TempTable  Select   
    t.district,t.acname,t.psnum,t.location,b.streamname,starttime,stoptime,starttime1,stoptime2,Total,Offline as Offline
	, Online
    from #TimeDifferenceTable t 
	left join CameraStopDurationNew b on b.location=t.location and
	 (b.OffLineStartTime=t.starttime or b.OffLineStopTime=t.stoptime)
	--order by   district,location,starttime 
	Select district as District,acname as Acname,psnum,location as VehicleNo,
	streamname,starttime,stoptime,starttime1,stoptime2,Total,sum(Offline) as Offline,Online  
	from #TempTable 
	group by district,acname,psnum,location,streamname,starttime,stoptime,starttime1,stoptime2,Total,Online
	order by   district,acname,location,streamname

	  Drop table #TimeDifferenceTable
	 Drop table #TempTable
END
ALTER PROCEDURE [dbo].[AddInventoryUpdation]  
@districtName Varchar(255),  
@acName Varchar(255),  
--@UserName VARCHAR(255),
@vehicleId  VARCHAR(255),
@material varchar(255),
@oldsrno varchar(255),
@newserno varchar(255),
@acCode varchar(255),
@RepairReplaceId int,

@status int,
@startDate varchar(50),
@EndDate varchar(50),
@addedby varchar(50),
@updatedby varchar(50)
AS  
 BEGIN  
 -- DECLARE @acCode VARCHAR(255), @districtId INT, @toDay DATETIME, @driverName varchar(200), @driverContact varchar(200), @streamname VARCHAR(255), @streamId VARCHAR(255);
  
DECLARE @startDateStr VARCHAR(10) = CONVERT(VARCHAR(10), @startDate, 105)
DECLARE @endDateStr VARCHAR(10) = CONVERT(VARCHAR(10), @endDate, 105)
 -- SET @toDay = SWITCHOFFSET(GETDATE(), '+05:30');  
  	
  if @RepairReplaceId=0 
  begin
INSERT INTO [dbo].[inventoryupdatation]
	VALUES(@districtName,@acName,@vehicleId,@material,@oldsrno,@newserno,@acCode,@status,  CONVERT(DATE, @startDateStr, 105), CONVERT(DATE, @endDateStr, 105),@addedby,'')
	Declare @msg varchar(500)=''
	SET @msg ='New Data Added!..'
	Select @msg as msg
	end
  else
  begin
	update [inventoryupdatation] set  districtname=@districtName,[acname]= @acName,[vehicleNo]=@vehicleId,
	[material]=@material,oldsnno=@oldsrno,newsnno=@newserno,
	accode=@acCode,[repaired/replaced]=@status,
	startdate=CONVERT(DATE, @startDateStr, 105),enddate=CONVERT(DATE, @endDateStr, 105),AddedBy=@addedby,
	LastEditedBy=@updatedby
	where id=@RepairReplaceId
	Declare @msg1 varchar(500)=''
	SET @msg1 ='Updated Repair/Replacement!..'
	Select @msg1 as msg
  end

end 
ALTER PROCEDURE [dbo].[GetInventoryUpdationReport]
(
	@FromDt VARCHAR(30) = '',
	@ToDt VARCHAR(30) = '',
	@districtid varchar(max) = '',
	@accode varchar(max) = '',
	@vehicleId varchar(max) = '',
	@ShiftID INT = 0
)
AS
BEGIN
	DECLARE @StartDt DATETIME, @StopDt DATETIME
	IF (@FromDt = '')
	BEGIN
		SET @StartDt = null
	END
	ELSE
	BEGIN
		SET @StartDt = TRY_CONVERT(DATE, @FromDt);
	END
	IF (@ToDt = '')
	BEGIN
		SET @StopDt = null
	END
	ELSE
	BEGIN
	--SET @StopDt = CAST(@ToDt as date);
		SET @StartDt = TRY_CONVERT(DATE, @ToDt);
	END

	SELECT
		[id],[districtname] ,[districtname] AS district,[acname] ,[accode] ,[vehicleNo] ,[material] ,[oldsnno] ,[newsnno] ,[repaired/replaced], [startdate], [enddate]
	FROM [dbo].[inventoryupdatation]
	WHERE ((@FromDt = '' AND @ToDt = '') OR ([startdate] BETWEEN @StartDt AND @StartDt))

		AND ((@districtid = '') OR ([districtname] = @districtid))
		AND ((@accode = '') OR ([accode] = @accode))
		AND ((@vehicleId = '') OR (vehicleNo = @vehicleId))
		--AND ((@ShiftID = 0) OR (vs.id = @ShiftID))
	--ORDER BY v.vehicalId, v.DeviceId, v.DistrictId, v.Accode, d.StartTime, d.StopTime, dr.name, fsv.name, vs.name
	ORDER BY [startdate] DESC,[districtname] ,[accode] ,[vehicleNo] ,[material] ,[oldsnno] ,[newsnno]
END 

  Create PROCEDURE [dbo].[SaveGPSLocationDetailsNewDynamic]
(
    @deviceId      VARCHAR (100)='',
    @name          VARCHAR (100)='' ,
    @deviceImei    VARCHAR (50)  ='',
    @status        VARCHAR (50) ='' ,
    @lastUpdate     VARCHAR (50) ='' ,
   -- @posId         BIGINT,
    @phone         VARCHAR (50)=''  ,
    @type          VARCHAR (50)=''  ,
    @latitude      VARCHAR (50)=''  ,
    @longitude     VARCHAR (50)=''  ,
    @speed         VARCHAR (50)=''    ,
    @course        VARCHAR (50)=''  ,
    @ignition      VARCHAR (50)=''   ,
    @totalDistance VARCHAR (50)=''    ,
    @alarm         VARCHAR (50)=''  
)
AS
BEGIN

	DECLARE @dt DATETIME, @prevStatus varchar(50), @ShiftID INT = 0, @VehicleID INT = 0, @DriverID INT = 0, @FSVID INT = 0
	DECLARE @isStopped BIT = 0, @prevStopped BIT = 0,@TableName NVARCHAR(50)=''

	SET @TableName = 'GPSLocationList_' + REPLACE(CONVERT(VARCHAR, [dbo].[GETIST](), 111),'/','') 
 DECLARE @tblSQL NVARCHAR(MAX) = N'         
 IF NOT EXISTS(SELECT name FROM sys.tables WHERE name='''+@TableName+''' AND type=''U'')            
 BEGIN            
   CREATE TABLE [dbo].['+@TableName+']( 
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[deviceId] [varchar](100) NULL,
	[name] [varchar](100) NULL,
	[deviceImei] [varchar](100) NULL,
	[status] [varchar](100) NULL,
	[lastUpdate] [varchar](100) NULL,
	[posId] [varchar](100) NULL,
	[phone] [varchar](100) NULL,
	[type] [varchar](100) NULL,
	[latitude] [varchar](100) NULL,
	[longitude] [varchar](100) NULL,
	[deviceFixTime] [varchar](100) NULL,
	[speed] [varchar](100) NULL,
	[course] [varchar](100) NULL,
	[ignition] [varchar](100) NULL,
	[totalDistance] [varchar](100) NULL,
	[alarm] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[boothid] [varchar](100) NULL,
	[VehicleID] [varchar](100) NULL,
	[ShiftID] [varchar](100) NULL,
	[DriverID] [varchar](100) NULL,
	[FSVID] [varchar](100) NULL,
	[IsStopped] [varchar](100) NULL,
	CONSTRAINT [PK_' + @TableName + '] PRIMARY KEY CLUSTERED   
   (  
    [id] ASC  
   )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
  ) END';
EXEC sp_executesql @tblSQL;

	IF (@lastUpdate = '')
	BEGIN
		SET @dt = null
	END
	ELSE
	BEGIN
		--SET @dt = CAST(@lastUpdate AS DATETIME)
		DECLARE @datePart VARCHAR(23) = LEFT(@lastUpdate, 23);
		 
--SET @dt = CAST(@datePart AS DATETIME);
     SET @dt = DATEADD(MINUTE, 330, CAST(@datePart AS DATETIME));
		--SET @dt =  CAST(@lastUpdate AS DATETIME)--CONVERT(DATETIME, @lastUpdate, 121); -- Change format code to 121

	END

	SELECT top 1 @prevStatus = status, @prevStopped = ISNULL(IsStopped,0) FROM GPSLocationList with (nolock) WHERE name = @name ORDER BY id DESC

	IF (SELECT COUNT(1) FROM (SELECT TOP 8 id,latitude,longitude FROM GPSLocationList with (nolock) WHERE name = @name ORDER BY id DESC) tbl WHERE latitude = @latitude AND longitude = @longitude) = 8
	BEGIN
		SET @isStopped = 1
	END

	SET @ShiftID = [dbo].[GetCurrentShift]()
		
	--SELECT
	--	TOP 1 @VehicleID = vehicalId, @DriverID = vsm.StaffId
	--FROM vehicalDetail vd WITH (NOLOCK)
	--INNER JOIN Vehicle_Staff_Mapping vsm WITH (NOLOCK) ON vd.vehicalId = vsm.VehicleId AND vsm.AssignDate = CAST(CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) AS DATE)
	--INNER JOIN Staff_Info si WITH (NOLOCK) ON si.Id = vsm.StaffId AND si.Type = 1
	--WHERE vd.Vehicle_No = @name AND vsm.ShiftID = @ShiftID

	Select TOP 1 @VehicleID=id,@DriverID=operatorid from booth WITH (NOLOCK)
	Where location=@name


	--SELECT
	--	TOP 1 @FSVID = vsm.StaffId
	--FROM vehicalDetail vd WITH (NOLOCK)
	--INNER JOIN Vehicle_Staff_Mapping vsm WITH (NOLOCK) ON vd.vehicalId = vsm.VehicleId AND vsm.AssignDate = CAST(CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')) AS DATE)
	--INNER JOIN Staff_Info si WITH (NOLOCK) ON si.Id = vsm.StaffId AND si.Type = 2
	--WHERE vd.Vehicle_No = @name AND vsm.ShiftID = @ShiftID

    INSERT INTO GPSLocationList(deviceId, name, deviceImei,status,lastUpdate,phone,type,latitude,longitude,deviceFixTime,speed,course,ignition,totalDistance,alarm,VehicleID,ShiftID,DriverID,FSVID,createdate,IsStopped)
    VALUES(@deviceId, @name, @deviceImei,@status,@dt,@phone,@type,@latitude,@longitude,NULL,@speed,@course,@ignition,@totalDistance,@alarm,@VehicleID,@ShiftID,@DriverID,@FSVID,CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')),@isStopped)

	--UPDATE location_info set longitude=@longitude,latitude=@latitude, UpdateDatetime=@dt where VehicleNo=@name
	Update booth set longitude=@longitude,latitude=@latitude,updatedDate=@dt where location=@name

	IF (@lastUpdate != '')
	BEGIN
		DECLARE @streamid INT = 0
		SELECT DISTINCT TOP 1 @streamid = sl.id FROM booth b WITH (NOLOCK)
		INNER JOIN streamlist sl WITH (NOLOCK) ON sl.id = b.streamid
		WHERE
			b.location = @name

		END
	
	IF ((@prevStatus = 'online' AND @status = 'offline') OR (@prevStopped = 0 AND @isStopped = 1)) --AND NOT EXISTS(SELECT 1 FROM GPSStopDuration with (nolock) WHERE deviceid = @deviceId AND CAST(CreateDate AS DATE) = CAST(GETDATE() AS DATE)))
	BEGIN
		INSERT INTO GPSStopDuration(deviceid, StartTime, VehicleID, ShiftID, DriverID, FSVID,createdate)
		VALUES(@deviceId, @dt, @VehicleID, @ShiftID, @DriverID, @FSVID,CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30')))
	END
	IF ((@prevStatus = 'offline' AND @status = 'online') OR (@prevStopped = 1 AND @isStopped = 0)) --AND EXISTS(SELECT 1 FROM GPSStopDuration with (nolock) WHERE deviceid = @deviceId AND CAST(CreateDate AS DATE) = CAST(GETDATE() AS DATE)))
	BEGIN
		UPDATE GPSStopDuration SET StopTime = @dt, ModifyDate = CONVERT(DATETIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30'))
		WHERE deviceid = @deviceId AND CAST(CreateDate AS DATE) = CAST(SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS DATE) AND StopTime IS NULL
	END
END

