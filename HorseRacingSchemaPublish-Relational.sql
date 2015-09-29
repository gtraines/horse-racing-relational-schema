use [M8-HorseRacing]

GO
PRINT N'Creating [dbo].[Address]...';


GO
CREATE TABLE [dbo].[Address] (
    [AddressId]      INT              IDENTITY (1, 1) NOT NULL,
    [AddressGuid]    UNIQUEIDENTIFIER NOT NULL,
    [Address1]       VARCHAR (MAX)    NOT NULL,
    [Address2]       VARCHAR (MAX)    NULL,
    [City]           VARCHAR (50)     NOT NULL,
    [State]          NCHAR (2)        NOT NULL,
    [PostalCode]     NCHAR (10)       NOT NULL,
    [CreatedDate]    DATETIME         NOT NULL,
    [CreatedBy]      INT              NULL,
    [LastModified]   DATETIME         NULL,
    [LastModifiedBy] INT              NULL,
    [IsActive]       BIT              NOT NULL,
    PRIMARY KEY CLUSTERED ([AddressId] ASC)
);


GO
PRINT N'Creating [dbo].[AddressType]...';


GO
CREATE TABLE [dbo].[AddressType] (
    [AddressTypeId]  INT          IDENTITY (1, 1) NOT NULL,
    [Description]    VARCHAR (50) NOT NULL,
    [CreatedDate]    DATETIME     NOT NULL,
    [CreatedBy]      INT          NULL,
    [LastModified]   DATETIME     NULL,
    [LastModifiedBy] INT          NULL,
    [IsActive]       BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([AddressTypeId] ASC)
);


GO
PRINT N'Creating [dbo].[BreedType]...';


GO
CREATE TABLE [dbo].[BreedType] (
    [BreedTypeId]    INT           IDENTITY (1, 1) NOT NULL,
    [Description]    VARCHAR (MAX) NOT NULL,
    [CreatedDate]    DATETIME      NOT NULL,
    [CreatedBy]      INT           NULL,
    [LastModified]   DATETIME      NULL,
    [LastModifiedBy] INT           NULL,
    [IsActive]       BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([BreedTypeId] ASC)
);


GO
PRINT N'Creating [dbo].[ContactType]...';


GO
CREATE TABLE [dbo].[ContactType] (
    [ContactTypeId]  INT            IDENTITY (1, 1) NOT NULL,
    [Description]    NVARCHAR (MAX) NOT NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedBy]      INT            NULL,
    [LastModified]   DATETIME       NULL,
    [LastModifiedBy] INT            NULL,
    [IsActive]       BIT            NOT NULL,
    PRIMARY KEY CLUSTERED ([ContactTypeId] ASC)
);


GO
PRINT N'Creating [dbo].[Horse]...';


GO
CREATE TABLE [dbo].[Horse] (
    [HorseId]            INT              IDENTITY (1, 1) NOT NULL,
    [HorseGuid]          UNIQUEIDENTIFIER NOT NULL,
    [Name]               VARCHAR (MAX)    NOT NULL,
    [SireHorseId]        INT              NULL,
    [MareHorseId]        INT              NULL,
    [BreedTypeId]        INT              NOT NULL,
    [Gender]             VARCHAR (1)      NOT NULL,
    [RegistrationNumber] VARCHAR (MAX)    NULL,
    [Birthdate]          DATETIME         NULL,
    [CreatedDate]        DATETIME         NOT NULL,
    [CreatedBy]          INT              NULL,
    [LastModified]       DATETIME         NULL,
    [LastModifiedBy]     INT              NULL,
    [IsActive]           BIT              NOT NULL,
    PRIMARY KEY CLUSTERED ([HorseId] ASC)
);


GO
PRINT N'Creating [dbo].[HorseHeightWeight]...';


GO
CREATE TABLE [dbo].[HorseHeightWeight] (
    [HorseHeightWeightId] INT          IDENTITY (1, 1) NOT NULL,
    [HorseId]             INT          NOT NULL,
    [MeasurementDate]     DATETIME     NOT NULL,
    [HeightHands]         DECIMAL (18) NOT NULL,
    [WeightPounds]        DECIMAL (18) NOT NULL,
    [CreatedDate]         DATETIME     NOT NULL,
    [CreatedBy]           INT          NULL,
    [LastModified]        DATETIME     NULL,
    [LastModifiedBy]      INT          NULL,
    [IsActive]            BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([HorseHeightWeightId] ASC)
);


GO
PRINT N'Creating [dbo].[HorseOwner]...';


GO
CREATE TABLE [dbo].[HorseOwner] (
    [HorseOwnerId]      INT          IDENTITY (1, 1) NOT NULL,
    [HorseId]           INT          NOT NULL,
    [IndividualOwnerId] INT          NULL,
    [StableOwnerId]     INT          NULL,
    [Percentage]        DECIMAL (18) NULL,
    [BoughtPurchaseId]  INT          NULL,
    [SoldPurchaseId]    INT          NULL,
    [CreatedDate]       DATETIME     NOT NULL,
    [CreatedBy]         INT          NULL,
    [LastModified]      DATETIME     NULL,
    [LastModifiedBy]    INT          NULL,
    [IsActive]          BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([HorseOwnerId] ASC)
);


GO
PRINT N'Creating [dbo].[HorsePurchase]...';


GO
CREATE TABLE [dbo].[HorsePurchase] (
    [HorsePurchaseId] INT      IDENTITY (1, 1) NOT NULL,
    [HorseId]         INT      NOT NULL,
    [PurchasePrice]   MONEY    NULL,
    [PurchaseDate]    DATETIME NULL,
    [CreatedDate]     DATETIME NOT NULL,
    [CreatedBy]       INT      NULL,
    [LastModified]    DATETIME NULL,
    [LastModifiedBy]  INT      NULL,
    [IsActive]        BIT      NOT NULL,
    PRIMARY KEY CLUSTERED ([HorsePurchaseId] ASC)
);


GO
PRINT N'Creating [dbo].[HorseTrainer]...';


GO
CREATE TABLE [dbo].[HorseTrainer] (
    [HorseTrainerId] INT      IDENTITY (1, 1) NOT NULL,
    [HorseId]        INT      NOT NULL,
    [TrainerId]      INT      NOT NULL,
    [DateStart]      DATETIME NOT NULL,
    [DateEnd]        DATETIME NULL,
    [CreatedDate]    DATETIME NOT NULL,
    [CreatedBy]      INT      NULL,
    [LastModified]   DATETIME NULL,
    [LastModifiedBy] INT      NULL,
    [IsActive]       BIT      NOT NULL,
    PRIMARY KEY CLUSTERED ([HorseTrainerId] ASC)
);


GO
PRINT N'Creating [dbo].[JockeyHeightWeight]...';


GO
CREATE TABLE [dbo].[JockeyHeightWeight] (
    [JockeyHeightWeightId] INT          IDENTITY (1, 1) NOT NULL,
    [JockeyId]             INT          NOT NULL,
    [MeasurementDate]      DATETIME     NOT NULL,
	[HeightFeet] [decimal](18, 2) NOT NULL,
	[WeightPounds] [decimal](18, 2) NOT NULL,
    [CreatedDate]          DATETIME     NOT NULL,
    [CreatedBy]            INT          NULL,
    [LastModified]         DATETIME     NULL,
    [LastModifiedBy]       INT          NULL,
    [IsActive]             BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([JockeyHeightWeightId] ASC)
);


GO
PRINT N'Creating [dbo].[Person]...';


GO
CREATE TABLE [dbo].[Person] (
    [PersonId]       INT              IDENTITY (1, 1) NOT NULL,
    [PersonGuid]     UNIQUEIDENTIFIER NOT NULL,
    [LastName]       VARCHAR (50)     NOT NULL,
    [FirstName]      VARCHAR (50)     NOT NULL,
    [MiddleInitial]  VARCHAR (1)      NULL,
    [Birthdate]      DATETIME         NULL,
    [Gender]         NCHAR (10)       NULL,
    [CreatedDate]    DATETIME         NOT NULL,
    [CreatedBy]      INT              NULL,
    [LastModified]   DATETIME         NULL,
    [LastModifiedBy] INT              NULL,
    [IsActive]       BIT              NOT NULL,
    PRIMARY KEY CLUSTERED ([PersonId] ASC)
);


GO
PRINT N'Creating [dbo].[PersonAddress]...';


GO
CREATE TABLE [dbo].[PersonAddress] (
    [PersonAddressId] INT      IDENTITY (1, 1) NOT NULL,
    [PersonId]        INT      NOT NULL,
    [AddressId]       INT      NOT NULL,
    [AddressTypeId]   INT      NOT NULL,
    [CreatedDate]     DATETIME NOT NULL,
    [CreatedBy]       INT      NULL,
    [LastModified]    DATETIME NULL,
    [LastModifiedBy]  INT      NULL,
    [IsActive]        BIT      NOT NULL,
    PRIMARY KEY CLUSTERED ([PersonAddressId] ASC)
);


GO
PRINT N'Creating [dbo].[PersonPhoneNumber]...';


GO
CREATE TABLE [dbo].[PersonPhoneNumber] (
    [PersonPhoneNumberId] INT          IDENTITY (1, 1) NOT NULL,
    [PersonId]            INT          NOT NULL,
    [PhoneNumber]         VARCHAR (12) NOT NULL,
    [ContactTypeId]       INT          NOT NULL,
    [CreatedDate]         DATETIME     NOT NULL,
    [CreatedBy]           INT          NULL,
    [LastModified]        DATETIME     NULL,
    [LastModifiedBy]      INT          NULL,
    [IsActive]            BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([PersonPhoneNumberId] ASC)
);


GO
PRINT N'Creating [dbo].[PersonRole]...';


GO
CREATE TABLE [dbo].[PersonRole] (
    [PersonRoleId]   INT      IDENTITY (1, 1) NOT NULL,
    [PersonId]       INT      NOT NULL,
    [RoleTypeId]     INT      NOT NULL,
    [DateBegan]      DATETIME NOT NULL,
    [DateEnded]      DATETIME NULL,
    [CreatedDate]    DATETIME NOT NULL,
    [CreatedBy]      INT      NULL,
    [LastModified]   DATETIME NULL,
    [LastModifiedBy] INT      NULL,
    [IsActive]       BIT      NOT NULL,
    PRIMARY KEY CLUSTERED ([PersonRoleId] ASC)
);


GO
PRINT N'Creating [dbo].[Race]...';


GO
CREATE TABLE [dbo].[Race] (
    [RaceId]         INT              IDENTITY (1, 1) NOT NULL,
    [RaceGuid]       UNIQUEIDENTIFIER NOT NULL,
    [Name]           VARCHAR (MAX)    NOT NULL,
    [RaceTypeId]     INT              NOT NULL,
    [DistanceMeters] INT              NOT NULL,
    [Purse]          MONEY            NULL,
    [Date]           DATE             NOT NULL,
    [Time]           TIME (7)         NOT NULL,
    [TrackId]        INT              NOT NULL,
    [NumberGates]    INT              NOT NULL,
    [CreatedDate]    DATETIME         NOT NULL,
    [CreatedBy]      INT              NULL,
    [LastModified]   DATETIME         NULL,
    [LastModifiedBy] INT              NULL,
    [IsActive]       BIT              NOT NULL,
    PRIMARY KEY CLUSTERED ([RaceId] ASC)
);


GO
PRINT N'Creating [dbo].[RaceEntry]...';


GO
CREATE TABLE [dbo].[RaceEntry] (
    [RaceEntryId]    INT              IDENTITY (1, 1) NOT NULL,
    [RaceEntryGuid]  UNIQUEIDENTIFIER NOT NULL,
    [RaceId]         INT              NOT NULL,
    [HorseId]        INT              NOT NULL,
    [JockeyId]       INT              NOT NULL,
    [RacingNumber]   INT              NULL,
    [GateNumber]     INT              NULL,
    [FinishingPlace] INT              NULL,
    [Payout]         MONEY            NULL,
	[CreatedDate]    DATETIME       NOT NULL,
    [CreatedBy]      INT            NULL,
    [LastModified]   DATETIME       NULL,
    [LastModifiedBy] INT            NULL,
    [IsActive]       BIT            NOT NULL,
    PRIMARY KEY CLUSTERED ([RaceEntryId] ASC)
);


GO
PRINT N'Creating [dbo].[RaceType]...';


GO
CREATE TABLE [dbo].[RaceType] (
    [RaceTypeId]     INT            IDENTITY (1, 1) NOT NULL,
    [Description]    NVARCHAR (MAX) NOT NULL,
    [SurfaceTypeId]  INT            NOT NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedBy]      INT            NULL,
    [LastModified]   DATETIME       NULL,
    [LastModifiedBy] INT            NULL,
    [IsActive]       BIT            NOT NULL,
    PRIMARY KEY CLUSTERED ([RaceTypeId] ASC)
);


GO
PRINT N'Creating [dbo].[RoleType]...';


GO
CREATE TABLE [dbo].[RoleType] (
    [RoleTypeId]     INT          IDENTITY (1, 1) NOT NULL,
    [Description]    VARCHAR (50) NOT NULL,
    [CreatedDate]    DATETIME     NOT NULL,
    [CreatedBy]      INT          NULL,
    [LastModified]   DATETIME     NULL,
    [LastModifiedBy] INT          NULL,
    [IsActive]       BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([RoleTypeId] ASC)
);


GO
PRINT N'Creating [dbo].[Stable]...';


GO
CREATE TABLE [dbo].[Stable] (
    [StableId]       INT              IDENTITY (1, 1) NOT NULL,
    [StableGuid]     UNIQUEIDENTIFIER NOT NULL,
    [Name]           VARCHAR (MAX)    NOT NULL,
    [AddressId]      INT              NOT NULL,
    [WebsiteUrl]     VARCHAR (MAX)    NULL,
    [CreatedDate]    DATETIME         NOT NULL,
    [CreatedBy]      INT              NULL,
    [LastModified]   DATETIME         NULL,
    [LastModifiedBy] INT              NULL,
    [IsActive]       BIT              NOT NULL,
    PRIMARY KEY CLUSTERED ([StableId] ASC)
);


GO
PRINT N'Creating [dbo].[StableContact]...';


GO
CREATE TABLE [dbo].[StableContact] (
    [StableContactId] INT      IDENTITY (1, 1) NOT NULL,
    [StableId]        INT      NOT NULL,
    [ContactId]       INT      NOT NULL,
    [CreatedDate]     DATETIME NOT NULL,
    [CreatedBy]       INT      NULL,
    [LastModified]    DATETIME NULL,
    [LastModifiedBy]  INT      NULL,
    [IsActive]        BIT      NOT NULL,
    PRIMARY KEY CLUSTERED ([StableContactId] ASC)
);


GO
PRINT N'Creating [dbo].[StablePhoneNumber]...';


GO
CREATE TABLE [dbo].[StablePhoneNumber] (
    [StablePhoneNumberId] INT          IDENTITY (1, 1) NOT NULL,
    [StableId]            INT          NOT NULL,
    [PhoneNumber]         VARCHAR (12) NOT NULL,
    [ContactTypeId]       INT          NOT NULL,
    [CreatedDate]         DATETIME     NOT NULL,
    [CreatedBy]           INT          NULL,
    [LastModified]        DATETIME     NULL,
    [LastModifiedBy]      INT          NULL,
    [IsActive]            BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([StablePhoneNumberId] ASC)
);


GO
PRINT N'Creating [dbo].[SurfaceType]...';


GO
CREATE TABLE [dbo].[SurfaceType] (
    [SurfaceTypeId]  INT           IDENTITY (1, 1) NOT NULL,
    [Name]           VARCHAR (50)  NOT NULL,
    [Description]    VARCHAR (MAX) NULL,
    [CreatedDate]    DATETIME      NOT NULL,
    [CreatedBy]      INT           NULL,
    [LastModified]   DATETIME      NULL,
    [LastModifiedBy] INT           NULL,
    [IsActive]       BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([SurfaceTypeId] ASC)
);


GO
PRINT N'Creating [dbo].[Track]...';


GO
CREATE TABLE [dbo].[Track] (
    [TrackId]        INT              IDENTITY (1, 1) NOT NULL,
    [TrackGuid]      UNIQUEIDENTIFIER NOT NULL,
    [Name]           VARCHAR (MAX)    NOT NULL,
    [AddressId]      INT              NOT NULL,
    [WebsiteUrl]     VARCHAR (MAX)    NULL,
    [CreatedDate]    DATETIME         NOT NULL,
    [CreatedBy]      INT              NULL,
    [LastModified]   DATETIME         NULL,
    [LastModifiedBy] INT              NULL,
    [IsActive]       BIT              NOT NULL,
    PRIMARY KEY CLUSTERED ([TrackId] ASC)
);


GO
PRINT N'Creating [dbo].[TrackContact]...';


GO
CREATE TABLE [dbo].[TrackContact] (
    [TrackContactId] INT      IDENTITY (1, 1) NOT NULL,
    [TrackId]        INT      NOT NULL,
    [ContactId]      INT      NOT NULL,
    [CreatedDate]    DATETIME NOT NULL,
    [CreatedBy]      INT      NULL,
    [LastModified]   DATETIME NULL,
    [LastModifiedBy] INT      NULL,
    [IsActive]       BIT      NOT NULL,
    PRIMARY KEY CLUSTERED ([TrackContactId] ASC)
);


GO
PRINT N'Creating [dbo].[TrackPhoneNumber]...';


GO
CREATE TABLE [dbo].[TrackPhoneNumber] (
    [TrackPhoneNumberId] INT          IDENTITY (1, 1) NOT NULL,
    [TrackId]            INT          NOT NULL,
    [PhoneNumber]        VARCHAR (12) NOT NULL,
    [ContactTypeId]      INT          NOT NULL,
    [CreatedDate]        DATETIME     NOT NULL,
    [CreatedBy]          INT          NULL,
    [LastModified]       DATETIME     NULL,
    [LastModifiedBy]     INT          NULL,
    [IsActive]           BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([TrackPhoneNumberId] ASC)
);


GO
PRINT N'Creating [dbo].[TrainerStable]...';


GO
CREATE TABLE [dbo].[TrainerStable] (
    [TrainerStableId] INT      IDENTITY (1, 1) NOT NULL,
    [TrainerId]       INT      NOT NULL,
    [StableId]        INT      NOT NULL,
    [Salary]          MONEY    NULL,
    [CreatedDate]     DATETIME NOT NULL,
    [CreatedBy]       INT      NULL,
    [LastModified]    DATETIME NULL,
    [LastModifiedBy]  INT      NULL,
    [IsActive]        BIT      NOT NULL,
    PRIMARY KEY CLUSTERED ([TrainerStableId] ASC)
);


GO
PRINT N'Creating Default Constraint on [dbo].[Address]....';


GO
ALTER TABLE [dbo].[Address]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[AddressType]....';


GO
ALTER TABLE [dbo].[AddressType]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[BreedType]....';


GO
ALTER TABLE [dbo].[BreedType]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[ContactType]....';


GO
ALTER TABLE [dbo].[ContactType]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[Horse]....';


GO
ALTER TABLE [dbo].[Horse]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[HorseHeightWeight]....';


GO
ALTER TABLE [dbo].[HorseHeightWeight]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[HorseOwner]....';


GO
ALTER TABLE [dbo].[HorseOwner]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[HorsePurchase]....';


GO
ALTER TABLE [dbo].[HorsePurchase]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[HorseTrainer]....';


GO
ALTER TABLE [dbo].[HorseTrainer]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[JockeyHeightWeight]....';


GO
ALTER TABLE [dbo].[JockeyHeightWeight]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[Person]....';


GO
ALTER TABLE [dbo].[Person]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[PersonAddress]....';


GO
ALTER TABLE [dbo].[PersonAddress]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[PersonPhoneNumber]....';


GO
ALTER TABLE [dbo].[PersonPhoneNumber]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[PersonRole]....';


GO
ALTER TABLE [dbo].[PersonRole]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[Race]....';


GO
ALTER TABLE [dbo].[Race]
    ADD DEFAULT 1 FOR [IsActive];



GO
ALTER TABLE [dbo].[RaceEntry]
    ADD DEFAULT 1 FOR [IsActive];
GO
PRINT N'Creating Default Constraint on [dbo].[RaceType]....';


GO
ALTER TABLE [dbo].[RaceType]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[RoleType]....';


GO
ALTER TABLE [dbo].[RoleType]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[Stable]....';


GO
ALTER TABLE [dbo].[Stable]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[StableContact]....';


GO
ALTER TABLE [dbo].[StableContact]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[StablePhoneNumber]....';


GO
ALTER TABLE [dbo].[StablePhoneNumber]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[SurfaceType]....';


GO
ALTER TABLE [dbo].[SurfaceType]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[Track]....';


GO
ALTER TABLE [dbo].[Track]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[TrackContact]....';


GO
ALTER TABLE [dbo].[TrackContact]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[TrackPhoneNumber]....';


GO
ALTER TABLE [dbo].[TrackPhoneNumber]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating Default Constraint on [dbo].[TrainerStable]....';


GO
ALTER TABLE [dbo].[TrainerStable]
    ADD DEFAULT 1 FOR [IsActive];


GO
PRINT N'Creating FK_Horse_ToHorseSire...';


GO
ALTER TABLE [dbo].[Horse]
    ADD CONSTRAINT [FK_Horse_ToHorseSire] FOREIGN KEY ([SireHorseId]) REFERENCES [dbo].[Horse] ([HorseId]);


GO
PRINT N'Creating FK_Horse_ToHorseMare...';


GO
ALTER TABLE [dbo].[Horse]
    ADD CONSTRAINT [FK_Horse_ToHorseMare] FOREIGN KEY ([MareHorseId]) REFERENCES [dbo].[Horse] ([HorseId]);


GO
PRINT N'Creating FK_Horse_ToBreedType...';


GO
ALTER TABLE [dbo].[Horse]
    ADD CONSTRAINT [FK_Horse_ToBreedType] FOREIGN KEY ([BreedTypeId]) REFERENCES [dbo].[BreedType] ([BreedTypeId]);


GO
PRINT N'Creating FK_HorseHeightWeight_ToHorse...';


GO
ALTER TABLE [dbo].[HorseHeightWeight]
    ADD CONSTRAINT [FK_HorseHeightWeight_ToHorse] FOREIGN KEY ([HorseId]) REFERENCES [dbo].[Horse] ([HorseId]);


GO
PRINT N'Creating FK_HorseOwner_ToHorse...';


GO
ALTER TABLE [dbo].[HorseOwner]
    ADD CONSTRAINT [FK_HorseOwner_ToHorse] FOREIGN KEY ([HorseId]) REFERENCES [dbo].[Horse] ([HorseId]);


GO
PRINT N'Creating FK_HorseOwner_ToHorsePurchaseBought...';


GO
ALTER TABLE [dbo].[HorseOwner]
    ADD CONSTRAINT [FK_HorseOwner_ToHorsePurchaseBought] FOREIGN KEY ([BoughtPurchaseId]) REFERENCES [dbo].[HorsePurchase] ([HorsePurchaseId]);


GO
PRINT N'Creating FK_HorseOwner_ToHorsePurchaseSold...';


GO
ALTER TABLE [dbo].[HorseOwner]
    ADD CONSTRAINT [FK_HorseOwner_ToHorsePurchaseSold] FOREIGN KEY ([SoldPurchaseId]) REFERENCES [dbo].[HorsePurchase] ([HorsePurchaseId]);


GO
PRINT N'Creating FK_HorseOwner_ToPerson...';


GO
ALTER TABLE [dbo].[HorseOwner]
    ADD CONSTRAINT [FK_HorseOwner_ToPerson] FOREIGN KEY ([IndividualOwnerId]) REFERENCES [dbo].[Person] ([PersonId]);


GO
PRINT N'Creating FK_HorseOwner_ToStable...';


GO
ALTER TABLE [dbo].[HorseOwner]
    ADD CONSTRAINT [FK_HorseOwner_ToStable] FOREIGN KEY ([StableOwnerId]) REFERENCES [dbo].[Stable] ([StableId]);


GO
PRINT N'Creating FK_HorsePurchase_ToHorse...';


GO
ALTER TABLE [dbo].[HorsePurchase]
    ADD CONSTRAINT [FK_HorsePurchase_ToHorse] FOREIGN KEY ([HorseId]) REFERENCES [dbo].[Horse] ([HorseId]);


GO
PRINT N'Creating FK_HorseTrainer_ToHorse...';


GO
ALTER TABLE [dbo].[HorseTrainer]
    ADD CONSTRAINT [FK_HorseTrainer_ToHorse] FOREIGN KEY ([HorseId]) REFERENCES [dbo].[Horse] ([HorseId]);


GO
PRINT N'Creating FK_HorseTrainer_ToPerson...';


GO
ALTER TABLE [dbo].[HorseTrainer]
    ADD CONSTRAINT [FK_HorseTrainer_ToPerson] FOREIGN KEY ([TrainerId]) REFERENCES [dbo].[Person] ([PersonId]);


GO
PRINT N'Creating FK_JockeyHeightWeight_ToPerson...';


GO
ALTER TABLE [dbo].[JockeyHeightWeight]
    ADD CONSTRAINT [FK_JockeyHeightWeight_ToPerson] FOREIGN KEY ([JockeyId]) REFERENCES [dbo].[Person] ([PersonId]);


GO
PRINT N'Creating FK_PersonAddress_ToAddress...';


GO
ALTER TABLE [dbo].[PersonAddress]
    ADD CONSTRAINT [FK_PersonAddress_ToAddress] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[Address] ([AddressId]);


GO
PRINT N'Creating FK_PersonAddress_ToPerson...';


GO
ALTER TABLE [dbo].[PersonAddress]
    ADD CONSTRAINT [FK_PersonAddress_ToPerson] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[Person] ([PersonId]);


GO
PRINT N'Creating FK_PersonAddress_ToAddressType...';


GO
ALTER TABLE [dbo].[PersonAddress]
    ADD CONSTRAINT [FK_PersonAddress_ToAddressType] FOREIGN KEY ([AddressTypeId]) REFERENCES [dbo].[AddressType] ([AddressTypeId]);


GO
PRINT N'Creating FK_PersonPhoneNumber_ToPerson...';


GO
ALTER TABLE [dbo].[PersonPhoneNumber]
    ADD CONSTRAINT [FK_PersonPhoneNumber_ToPerson] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[Person] ([PersonId]);


GO
PRINT N'Creating FK_PersonPhoneNumber_ToContactType...';


GO
ALTER TABLE [dbo].[PersonPhoneNumber]
    ADD CONSTRAINT [FK_PersonPhoneNumber_ToContactType] FOREIGN KEY ([ContactTypeId]) REFERENCES [dbo].[ContactType] ([ContactTypeId]);


GO
PRINT N'Creating FK_PersonRole_ToPerson...';


GO
ALTER TABLE [dbo].[PersonRole]
    ADD CONSTRAINT [FK_PersonRole_ToPerson] FOREIGN KEY ([PersonId]) REFERENCES [dbo].[Person] ([PersonId]);


GO
PRINT N'Creating FK_PersonRole_ToRoleType...';


GO
ALTER TABLE [dbo].[PersonRole]
    ADD CONSTRAINT [FK_PersonRole_ToRoleType] FOREIGN KEY ([RoleTypeId]) REFERENCES [dbo].[RoleType] ([RoleTypeId]);


GO
PRINT N'Creating FK_Race_ToRaceType...';


GO
ALTER TABLE [dbo].[Race]
    ADD CONSTRAINT [FK_Race_ToRaceType] FOREIGN KEY ([RaceTypeId]) REFERENCES [dbo].[RaceType] ([RaceTypeId]);


GO
PRINT N'Creating FK_Race_ToTrack...';


GO
ALTER TABLE [dbo].[Race]
    ADD CONSTRAINT [FK_Race_ToTrack] FOREIGN KEY ([TrackId]) REFERENCES [dbo].[Track] ([TrackId]);


GO
PRINT N'Creating FK_RaceEntry_ToHorse...';


GO
ALTER TABLE [dbo].[RaceEntry]
    ADD CONSTRAINT [FK_RaceEntry_ToHorse] FOREIGN KEY ([HorseId]) REFERENCES [dbo].[Horse] ([HorseId]);


GO
PRINT N'Creating FK_RaceEntry_ToPerson...';


GO
ALTER TABLE [dbo].[RaceEntry]
    ADD CONSTRAINT [FK_RaceEntry_ToPerson] FOREIGN KEY ([JockeyId]) REFERENCES [dbo].[Person] ([PersonId]);

GO

PRINT N'Creating FK_RaceEntry_ToRace...';


GO
ALTER TABLE [dbo].[RaceEntry]
    ADD CONSTRAINT [FK_RaceEntry_ToRace] FOREIGN KEY ([RaceId]) REFERENCES [dbo].[Race] ([RaceId]);

GO
PRINT N'Creating FK_RaceType_ToSurfaceType...';


GO
ALTER TABLE [dbo].[RaceType]
    ADD CONSTRAINT [FK_RaceType_ToSurfaceType] FOREIGN KEY ([SurfaceTypeId]) REFERENCES [dbo].[SurfaceType] ([SurfaceTypeId]);


GO
PRINT N'Creating FK_Stable_ToAddress...';


GO
ALTER TABLE [dbo].[Stable]
    ADD CONSTRAINT [FK_Stable_ToAddress] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[Address] ([AddressId]);


GO
PRINT N'Creating FK_StableContact_ToPerson...';


GO
ALTER TABLE [dbo].[StableContact]
    ADD CONSTRAINT [FK_StableContact_ToPerson] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Person] ([PersonId]);


GO
PRINT N'Creating FK_StableContact_ToStable...';


GO
ALTER TABLE [dbo].[StableContact]
    ADD CONSTRAINT [FK_StableContact_ToStable] FOREIGN KEY ([StableId]) REFERENCES [dbo].[Stable] ([StableId]);


GO
PRINT N'Creating FK_StablePhoneNumber_ToStable...';


GO
ALTER TABLE [dbo].[StablePhoneNumber]
    ADD CONSTRAINT [FK_StablePhoneNumber_ToStable] FOREIGN KEY ([StableId]) REFERENCES [dbo].[Stable] ([StableId]);


GO
PRINT N'Creating FK_StablePhoneNumber_ToContactType...';


GO
ALTER TABLE [dbo].[StablePhoneNumber]
    ADD CONSTRAINT [FK_StablePhoneNumber_ToContactType] FOREIGN KEY ([ContactTypeId]) REFERENCES [dbo].[ContactType] ([ContactTypeId]);


GO
PRINT N'Creating FK_Track_ToAddress...';


GO
ALTER TABLE [dbo].[Track]
    ADD CONSTRAINT [FK_Track_ToAddress] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[Address] ([AddressId]);


GO
PRINT N'Creating FK_TrackContact_ToPerson...';


GO
ALTER TABLE [dbo].[TrackContact]
    ADD CONSTRAINT [FK_TrackContact_ToPerson] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Person] ([PersonId]);


GO
PRINT N'Creating FK_TrackContact_ToTrack...';


GO
ALTER TABLE [dbo].[TrackContact]
    ADD CONSTRAINT [FK_TrackContact_ToTrack] FOREIGN KEY ([TrackId]) REFERENCES [dbo].[Track] ([TrackId]);


GO
PRINT N'Creating FK_TrackPhoneNumber_ToContactType...';


GO
ALTER TABLE [dbo].[TrackPhoneNumber]
    ADD CONSTRAINT [FK_TrackPhoneNumber_ToContactType] FOREIGN KEY ([ContactTypeId]) REFERENCES [dbo].[ContactType] ([ContactTypeId]);


GO
PRINT N'Creating FK_TrackPhoneNumber_ToTrack...';


GO
ALTER TABLE [dbo].[TrackPhoneNumber]
    ADD CONSTRAINT [FK_TrackPhoneNumber_ToTrack] FOREIGN KEY ([TrackId]) REFERENCES [dbo].[Track] ([TrackId]);


GO
PRINT N'Creating FK_TrainerStable_ToPerson...';


GO
ALTER TABLE [dbo].[TrainerStable]
    ADD CONSTRAINT [FK_TrainerStable_ToPerson] FOREIGN KEY ([TrainerId]) REFERENCES [dbo].[Person] ([PersonId]);


GO
PRINT N'Creating FK_TrainerStable_ToStable...';


GO
ALTER TABLE [dbo].[TrainerStable]
    ADD CONSTRAINT [FK_TrainerStable_ToStable] FOREIGN KEY ([StableId]) REFERENCES [dbo].[Stable] ([StableId]);


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '20002eb8-3d96-4cb3-80a3-964b62300db2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('20002eb8-3d96-4cb3-80a3-964b62300db2')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c492bade-dbc6-4cef-9da4-d2e9a8848bae')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c492bade-dbc6-4cef-9da4-d2e9a8848bae')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '56993042-ace1-4e28-90b0-6fd5636a1c34')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('56993042-ace1-4e28-90b0-6fd5636a1c34')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'db8c60ae-803c-49d8-8bc2-d832d83129ac')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('db8c60ae-803c-49d8-8bc2-d832d83129ac')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'dd4a56a9-41fc-4ae2-b12d-b37028c4e702')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('dd4a56a9-41fc-4ae2-b12d-b37028c4e702')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b2020dfd-34af-43de-a560-a318f180ac8d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b2020dfd-34af-43de-a560-a318f180ac8d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6a0b281a-694f-4cb4-9f11-e81fdc3c3b9c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6a0b281a-694f-4cb4-9f11-e81fdc3c3b9c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '49784671-aa0d-4597-9b66-39348ce4737d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('49784671-aa0d-4597-9b66-39348ce4737d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c7b69b3e-e323-42a9-a5a4-bd1b2b7f7fb5')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c7b69b3e-e323-42a9-a5a4-bd1b2b7f7fb5')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '624206f0-40e6-48ec-806e-f34a420fcb86')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('624206f0-40e6-48ec-806e-f34a420fcb86')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5f8fef0a-9853-4cbe-889a-387bb2b1f7c5')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5f8fef0a-9853-4cbe-889a-387bb2b1f7c5')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '52fe7075-ea1a-405a-bd84-e49f528d35be')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('52fe7075-ea1a-405a-bd84-e49f528d35be')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a08297d0-1ee0-40b0-abd0-b07b944165b5')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a08297d0-1ee0-40b0-abd0-b07b944165b5')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '43b7bda0-e87c-4707-b255-901b952de47b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('43b7bda0-e87c-4707-b255-901b952de47b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4ff4d47d-f4bf-41c2-a3ae-9f7ff99cbcdf')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4ff4d47d-f4bf-41c2-a3ae-9f7ff99cbcdf')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4f743f8d-b4e1-4961-aef7-49925b930724')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4f743f8d-b4e1-4961-aef7-49925b930724')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '79a56903-6836-4969-8b85-a454b66fe5f9')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('79a56903-6836-4969-8b85-a454b66fe5f9')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5d9fc046-b34c-4348-8d2b-28cabd4a243b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5d9fc046-b34c-4348-8d2b-28cabd4a243b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '8ca112f8-4881-41ca-b956-da20c6649088')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('8ca112f8-4881-41ca-b956-da20c6649088')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '1933b09e-a5d0-469f-97b0-d93fa5ed54c8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('1933b09e-a5d0-469f-97b0-d93fa5ed54c8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '35da1a77-c5dc-4273-b858-7539aeae4dc3')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('35da1a77-c5dc-4273-b858-7539aeae4dc3')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '691997f5-1873-47e9-961c-90a20223022a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('691997f5-1873-47e9-961c-90a20223022a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '8f6e0417-feee-47dd-9e15-cd4bda96f828')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('8f6e0417-feee-47dd-9e15-cd4bda96f828')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'eac52e0a-f51a-4b20-9258-84f329eaa47f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('eac52e0a-f51a-4b20-9258-84f329eaa47f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b3d95005-6a35-4322-930d-e52b00af526c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b3d95005-6a35-4322-930d-e52b00af526c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c3341f9e-bddb-4ab5-b719-58812d8a341b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c3341f9e-bddb-4ab5-b719-58812d8a341b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '96000885-598b-4814-8873-3017bff59fc7')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('96000885-598b-4814-8873-3017bff59fc7')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '508d21e8-080e-45b5-a51f-204c65ac0979')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('508d21e8-080e-45b5-a51f-204c65ac0979')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a9711896-ef60-4abb-8e61-7624957c3125')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a9711896-ef60-4abb-8e61-7624957c3125')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '592887ee-988e-4873-a9e8-33ab5b70ece8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('592887ee-988e-4873-a9e8-33ab5b70ece8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0731593b-be5d-4a88-b513-a4f23e72f3a4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0731593b-be5d-4a88-b513-a4f23e72f3a4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '62519355-dab3-45a8-9b8f-2f9677a443b2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('62519355-dab3-45a8-9b8f-2f9677a443b2')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'eb76845a-a08e-4dcb-bf98-6c1326a2e5e5')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('eb76845a-a08e-4dcb-bf98-6c1326a2e5e5')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0814afb9-6431-4d3d-92f5-4e48f88ea988')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0814afb9-6431-4d3d-92f5-4e48f88ea988')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b4f6482a-19a5-4f20-bbab-ac535f422abe')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b4f6482a-19a5-4f20-bbab-ac535f422abe')

GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

--AddressValues
INSERT INTO [dbo].[Address]
           ([AddressGuid]
           ,[Address1]
           ,[City]
           ,[State]
           ,[PostalCode]
           ,[CreatedDate]
           )
     VALUES
           (NEWID()
           ,'1637 Pine Ave SW'
           ,'Birmingham'
           ,'AL'
           ,'35211'
           ,CURRENT_TIMESTAMP)
		   ,(NEWID()
           ,'1611 Fathom Dr'
           ,'Kenai'
           ,'AK'
           ,'99611'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'1110 W. Washington Street'
           ,'Phoenix'
           ,'AZ'
           ,'85007'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'14 Lafayette 266'
           ,'Stamps'
           ,'AR'
           ,'71860'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'750 Cedar St'
           ,'Denver'
           ,'CO'
           ,'80202'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'755 Main Street'
           ,'Hartford'
           ,'CT'
           ,'06103'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'99 Kings Highway'
           ,'Dover'
           ,'DE'
           ,'19903'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'4091 Conway Place Cir'
           ,'Orlando'
           ,'FL'
           ,'32812'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'75 Fifth Street N.W.'
           ,'Atlanta'
           ,'GA'
           ,'30308'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'302 Ohai Pl'
           ,'Wahiawa'
           ,'HI'
           ,'96786'
           ,CURRENT_TIMESTAMP)
			,(NEWID()
           ,'700 West State St.'
           ,'Boise'
           ,'ID'
           ,'83720'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'620 E. Adams'
           ,'Springfield'
           ,'IL'
           ,'62701'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'One North Capitol'
           ,'Indianapolis'
           ,'IN'
           ,'46204'
           ,CURRENT_TIMESTAMP)
		   		   	,(NEWID()
           ,'200 East Grand Ave.'
           ,'Des Moines'
           ,'IA'
           ,'50309'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'1000 S.W. Jackson Street'
           ,'Topeka'
           ,'KS'
           ,'66612'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'500 Mero St.'
           ,'Frankfurt'
           ,'KY'
           ,'40601'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'2101 Washington St. E.'
           ,'Charleston'
           ,'WY'
           ,'25305'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'3468 Plateau St'
           ,'Casper'
           ,'WY'
           ,'82601'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'906 Coumbia St. SW'
           ,'Olympia'
           ,'WA'
           ,'98504'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'901 E. Byrd St.'
           ,'Richmond'
           ,'VA'
           ,'23219'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'6 Baldwin St.'
           ,'Montpelier'
           ,'VT'
           ,'05603'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'430 Carver St'
           ,'Mesquite'
           ,'TX'
           ,'75149'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'320 Sixth Ave.'
           ,'Nashville'
           ,'TN'
           ,'37243'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'285 Saint Andrews Blvd'
           ,'La Place'
           ,'LA'
           ,'70068'
           ,CURRENT_TIMESTAMP)
			,(NEWID()
           ,'59 State House Station'
           ,'Augusta'
           ,'ME'
           ,'04333'
           ,CURRENT_TIMESTAMP)
			,(NEWID()
           ,'217 Redwood St'
           ,'Baltimore'
           ,'MD'
           ,'21202'
           ,CURRENT_TIMESTAMP)
			,(NEWID()
           ,'10 Park Plaza'
           ,'Boston'
           ,'MA'
           ,'02116'
           ,CURRENT_TIMESTAMP)
			,(NEWID()
           ,'300 N. Washington Sq.'
           ,'Lansing'
           ,'MI'
           ,'48913'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'500 Metro Square'
           ,'St. Paul'
           ,'MN'
           ,'55101'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'10100 Road 4304'
           ,'Union'
           ,'MS'
           ,'39365'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'3600 W Farm Road 112'
           ,'Springfield'
           ,'MO'
           ,'65803'
           ,CURRENT_TIMESTAMP)





GO

--AddressTypeValues
INSERT INTO [dbo].[AddressType]
           ([Description]
           ,[CreatedDate])
     VALUES
           ('Home'
           ,CURRENT_TIMESTAMP)
		   ,('Work'
           ,CURRENT_TIMESTAMP)

GO

--BreedTypeValues
INSERT INTO [dbo].[BreedType]
           ([Description]
           ,[CreatedDate])
     VALUES
		--1
           ('Arabian'
           ,CURRENT_TIMESTAMP)
		--2
			,('American Saddlebred'
           ,CURRENT_TIMESTAMP)
		--3
		   ,('American Warmblood'
           ,CURRENT_TIMESTAMP)
		--4
		   ,('Oldenburg'
           ,CURRENT_TIMESTAMP)
		--5
		   ,('Thoroughbred'
           ,CURRENT_TIMESTAMP)
		--6
		   	,('Trakehner'
           ,CURRENT_TIMESTAMP)
GO

--ContactTypeValues
INSERT INTO [dbo].[ContactType]
           ([Description]
           ,[CreatedDate])
     VALUES
           ('Home'
           ,CURRENT_TIMESTAMP)
		   	,('Work'
           ,CURRENT_TIMESTAMP)
		   ,('Mobile'
           ,CURRENT_TIMESTAMP)
		   ,('Management Office'
           ,CURRENT_TIMESTAMP)
			,('Maintenance Office'
           ,CURRENT_TIMESTAMP)
			,('Accounting Department'
           ,CURRENT_TIMESTAMP)
		   	,('Public Affairs'
           ,CURRENT_TIMESTAMP)
		   	,('Marketing'
           ,CURRENT_TIMESTAMP)
GO

-- RoleTypeValues
INSERT INTO [dbo].[RoleType]
           ([Description]
           ,[CreatedDate])
     VALUES
		--1
           ('Owner'
           ,CURRENT_TIMESTAMP)
		--2
		   ,('Trainer'
           ,CURRENT_TIMESTAMP)
		--3
		   ,('Jockey'
           ,CURRENT_TIMESTAMP)
		--4
			,('Manager'
           ,CURRENT_TIMESTAMP)
		--5
		   ,('Public Relations Representative'
           ,CURRENT_TIMESTAMP)
GO

--PersonValues
INSERT INTO [dbo].[Person]
           ([PersonGuid]
           ,[LastName]
           ,[FirstName]
           ,[Gender]
           ,[CreatedDate])
     VALUES
	 --1
           (NEWID()
           ,'Pletcher'
           ,'Todd'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --2
	      ,(NEWID()
           ,'Garcia'
           ,'Martin'
           ,'M'
		   ,CURRENT_TIMESTAMP)
			--3
			,(NEWID()
           ,'Baffert'
           ,'Bob'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --4
			,(NEWID()
           ,'Sherman'
           ,'Art'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --5
			,(NEWID()
           ,'Espinoza'
           ,'Victor'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --6
			,(NEWID()
           ,'Coburn'
           ,'Steven'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --7
			,(NEWID()
           ,'Martin'
           ,'Perry'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --8
			,(NEWID()
           ,'Velazquez'
           ,'John'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --9
			,(NEWID()
           ,'Motion'
           ,'H.'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --10
			,(NEWID()
           ,'Jerkens'
           ,'James'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --11
			,(NEWID()
           ,'Ramsey'
           ,'Sarah'
           ,'F'
		   ,CURRENT_TIMESTAMP)
		   --12
			,(NEWID()
           ,'Ramsey'
           ,'Kenneth'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --13
			,(NEWID()
           ,'Maker'
           ,'Michael'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --14
			,(NEWID()
           ,'Gyarmati'
           ,'Leah'
           ,'F'
		   ,CURRENT_TIMESTAMP)
		   --15
			,(NEWID()
           ,'Ortiz'
           ,'Irad'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --16
			,(NEWID()
           ,'Rasmussen'
           ,'Kirstin'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --17
			,(NEWID()
           ,'Ahrens'
           ,'Crystal'
           ,'F'
		   ,CURRENT_TIMESTAMP)
		   	--18
			,(NEWID()
           ,'McDouglas'
           ,'Susan'
           ,'F'
		   ,CURRENT_TIMESTAMP)
			--19
			,(NEWID()
           ,'Jacques'
           ,'Tiffany'
           ,'F'
		   ,CURRENT_TIMESTAMP)
		   --20
			,(NEWID()
           ,'Lukas'
           ,'D.'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --21
			,(NEWID()
           ,'Asmussen'
           ,'Steven'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --22
			,(NEWID()
           ,'Cassidy'
           ,'Jim'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --23
			,(NEWID()
           ,'Terranova'
           ,'John'
           ,'M'
		   ,CURRENT_TIMESTAMP)
		   --24
			,(NEWID()
           ,'Desormeaux'
           ,'Keith'
           ,'M'
		   ,CURRENT_TIMESTAMP)

		   INSERT INTO [dbo].[PersonAddress]
           ([PersonId]
           ,[AddressId]
           ,[AddressTypeId]
           ,[CreatedDate])
     VALUES
           (1
           ,1
           ,1
		   ,CURRENT_TIMESTAMP)
		   ,(1
           ,2
           ,2
		   ,CURRENT_TIMESTAMP)
		   	,(2
           ,3
           ,1
		   ,CURRENT_TIMESTAMP)
		   ,(3
           ,4
           ,1
		   ,CURRENT_TIMESTAMP)
		   ,(4
           ,5
           ,1
		   ,CURRENT_TIMESTAMP)
		   ,(5
           ,6
           ,1
		   ,CURRENT_TIMESTAMP)
		   ,(6
           ,7
           ,1
		   ,CURRENT_TIMESTAMP)
		   ,(7
           ,8
           ,1
		   ,CURRENT_TIMESTAMP)
		   ,(9
           ,10
           ,1
		   ,CURRENT_TIMESTAMP)
		   ,(10
           ,11
           ,1
		   ,CURRENT_TIMESTAMP)
		   ,(11
           ,12
           ,1
		   ,CURRENT_TIMESTAMP)
		   ,(12
           ,12
           ,1
		   ,CURRENT_TIMESTAMP)
		   ,(13
           ,13
           ,1
		   ,CURRENT_TIMESTAMP)
		   ,(14
           ,14
           ,1
		   ,CURRENT_TIMESTAMP)
		   ,(14
           ,15
           ,2
		   ,CURRENT_TIMESTAMP)
GO

INSERT INTO [dbo].[PersonPhoneNumber]
           ([PersonId]
           ,[PhoneNumber]
           ,[ContactTypeId]
           ,[CreatedDate])
     VALUES
           (1
           ,'3721459'
           ,1
		   ,CURRENT_TIMESTAMP)
           ,(2
           ,'3356121'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(3
           ,'6918071'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(4
           ,'4391113'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(4
           ,'1800143'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(4
           ,'3147128'
           ,2
		   ,CURRENT_TIMESTAMP)
		    ,(5
           ,'7786095'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(5
           ,'6699614'
           ,2
		   ,CURRENT_TIMESTAMP)
		    ,(6
           ,'8090079'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(7
           ,'2481467'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(8
           ,'2062539'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(9
           ,'7026650'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(10
           ,'1711387'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(11
           ,'2333345'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(11
           ,'5136016'
           ,2
		   ,CURRENT_TIMESTAMP)
		    ,(11
           ,'5850419'
           ,3
		   ,CURRENT_TIMESTAMP)
		    ,(12
           ,'6303588'
           ,3
		   ,CURRENT_TIMESTAMP)
		    ,(13
           ,'5332520'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(13
           ,'5696013'
           ,2
		   ,CURRENT_TIMESTAMP)
		    ,(13
           ,'3058085'
           ,3
		   ,CURRENT_TIMESTAMP)
		    ,(14
           ,'9719983'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(14
           ,'5846518'
           ,2
		   ,CURRENT_TIMESTAMP)
		    ,(14
           ,'8498260'
           ,3
		   ,CURRENT_TIMESTAMP)
		    ,(15
           ,'2333739'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(15
           ,'1590876'
           ,2
		   ,CURRENT_TIMESTAMP)
		    ,(15
           ,'6842549'
           ,3
		   ,CURRENT_TIMESTAMP)
		    ,(16
           ,'1441344'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(17
           ,'9385510'
           ,1
		   ,CURRENT_TIMESTAMP)
		    ,(18
           ,'4775398'
           ,1
		   ,CURRENT_TIMESTAMP)
		   		    ,(19
           ,'7557098'
           ,1
		   ,CURRENT_TIMESTAMP)
		   		    ,(20
           ,'1917954'
           ,1
		   ,CURRENT_TIMESTAMP)
		   		    ,(21
           ,'7089766'
           ,1
		   ,CURRENT_TIMESTAMP)
		   		    ,(22
           ,'1718354'
           ,1
		   ,CURRENT_TIMESTAMP)
		   		    ,(23
           ,'9757358'
           ,1
		   ,CURRENT_TIMESTAMP)
		   		    ,(24
           ,'9657588'
           ,1
		   ,CURRENT_TIMESTAMP)
GO

INSERT INTO [dbo].[Stable]
           ([StableGuid]
           ,[Name]
           ,[AddressId]
           ,[WebsiteUrl]
           ,[CreatedDate])
     VALUES
           (NEWID()
           ,'Kaleem Shah Inc'
           ,1
           ,'http://www.equibase.com/profiles/Results.cfm?type=People&searchType=O&eID=952262'
           ,CURRENT_TIMESTAMP)
		    ,(NEWID()
           ,'Flaxman Holdings, Ltd.'
           ,16
           ,'http://www.equibase.com/profiles/Results.cfm?type=People&searchType=O&eID=778778'
           ,CURRENT_TIMESTAMP)
		   ,(NEWID()
           ,'Treadway Racing Stable'
           ,15
           ,'http://www.equibase.com/profiles/Results.cfm?type=People&searchType=O&eID=778778'
           ,CURRENT_TIMESTAMP)
			 ,(NEWID()
           ,'Spendthrift Farm LLC'
           ,14
           ,'http://www.equibase.com/profiles/Results.cfm?type=People&searchType=O&eID=778778'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'Midwest Thoroughbreds, LLC'
           ,13
           ,'http://www.equibase.com/profiles/Results.cfm?type=People&searchType=O&eID=1372548'
           ,CURRENT_TIMESTAMP)
		   		   	,(NEWID()
           ,'Centennial Farms'
           ,12
           ,'http://www.equibase.com/profiles/Results.cfm?type=People&searchType=O&eID=1372548'
           ,CURRENT_TIMESTAMP)


--HorseValues
INSERT INTO [dbo].[Horse]
           ([HorseGuid]
           ,[Name]
           ,[SireHorseId]
           ,[MareHorseId]
           ,[BreedTypeId]
           ,[Gender]
           ,[RegistrationNumber]
           ,[Birthdate]
           ,[CreatedDate])
     VALUES
	 -- 1
           (NEWID()
           ,'Giant''s Causeway'
           ,null
           ,null
           ,1
           ,'M'
           ,'1234000'
           ,null
           ,CURRENT_TIMESTAMP)
		   --2
		    ,(NEWID()
           ,'Rebridled Dreams'
           ,null
           ,null
           ,2
           ,'F'
           ,'1234001'
           ,null
           ,CURRENT_TIMESTAMP)
		   -- 3
		    ,(NEWID()
           ,'CARPE DIEM'
           ,1
           ,2
           ,3
           ,'M'
           ,'1234002'
           ,null
           ,CURRENT_TIMESTAMP)
		   -- 4
		    ,(NEWID()
           ,'take charge brandi'
           ,1
           ,null
           ,1
           ,'F'
           ,'1234005'
           ,null
           ,CURRENT_TIMESTAMP)
		   -- 5
		    ,(NEWID()
           ,'J.B.''s THUNDER'
           ,null
           ,2
           ,1
           ,'M'
           ,'1234006'
           ,null
           ,CURRENT_TIMESTAMP)
		   -- 6
		    ,(NEWID()
           ,'Bayern'
           ,null
           ,null
           ,4
           ,'M'
           ,'1234007'
           ,null
           ,CURRENT_TIMESTAMP)
		   -- 7
		    ,(NEWID()
           ,'California Chrome'
           ,null
           ,null
           ,5
           ,'M'
           ,'1234008'
           ,null
           ,CURRENT_TIMESTAMP)
		   -- 8
		    ,(NEWID()
           ,'Main Sequence'
           ,null
           ,null
           ,6
           ,'M'
           ,'1234009'
           ,null
           ,CURRENT_TIMESTAMP)
		   -- 9
		    ,(NEWID()
           ,'Tonalist'
           ,null
           ,null
           ,6
           ,'M'
           ,'1234010'
           ,null
           ,CURRENT_TIMESTAMP)
		   -- 10
		    ,(NEWID()
           ,'Dayatthespa'
           ,null
           ,null
           ,5
           ,'M'
           ,'12340011'
           ,null
           ,CURRENT_TIMESTAMP)
		   	-- 11
		    ,(NEWID()
           ,'Shared Belief'
           ,null
           ,null
           ,2
           ,'M'
           ,'12340011'
           ,null
           ,CURRENT_TIMESTAMP)
GO

--HorseHeightWeightValues
INSERT INTO [dbo].[HorseHeightWeight]
           ([HorseId]
           ,[MeasurementDate]
           ,[HeightHands]
           ,[WeightPounds]
           ,[CreatedDate])
     VALUES
           (1
           ,CURRENT_TIMESTAMP
           ,18
           ,990
           ,CURRENT_TIMESTAMP)
			,(2
           ,CURRENT_TIMESTAMP
           ,18
           ,997
           ,CURRENT_TIMESTAMP)
		   			,(3
           ,CURRENT_TIMESTAMP
           ,17
           ,980
           ,CURRENT_TIMESTAMP)
		   	,(4
           ,CURRENT_TIMESTAMP
           ,16
           ,1000
           ,CURRENT_TIMESTAMP)
		   	,(5
           ,CURRENT_TIMESTAMP
           ,19
           ,1100
           ,CURRENT_TIMESTAMP)
		   	,(6
           ,CURRENT_TIMESTAMP
           ,16
           ,890
           ,CURRENT_TIMESTAMP)
		   		   	,(7
           ,CURRENT_TIMESTAMP
           ,16
           ,890
           ,CURRENT_TIMESTAMP)
		   		   		   	,(8
           ,CURRENT_TIMESTAMP
           ,19
           ,970
           ,CURRENT_TIMESTAMP)
		   		   		   	,(9
           ,CURRENT_TIMESTAMP
           ,17
           ,975
           ,CURRENT_TIMESTAMP)
		   		   		   	,(10
           ,CURRENT_TIMESTAMP
           ,16
           ,950
           ,CURRENT_TIMESTAMP)
		   		   		   	,(11
           ,CURRENT_TIMESTAMP
           ,18
           ,1000
           ,CURRENT_TIMESTAMP)


GO
INSERT INTO [dbo].[HorsePurchase]
           ([HorseId]
           ,[PurchasePrice]
           ,[PurchaseDate]
           ,[CreatedDate])
     VALUES
	 --1
           (1
           ,120000.00
           ,'11-10-2013'
           ,CURRENT_TIMESTAMP)
		    ,(2
           ,145000.00
           ,'10-10-2013'
           ,CURRENT_TIMESTAMP)
			,(3
           ,137000.00
           ,'11-10-2013'
           ,CURRENT_TIMESTAMP)
		   	,(4
           ,110000.00
           ,'11-10-2013'
           ,CURRENT_TIMESTAMP)
			,(5
           ,190000.00
           ,'11-10-2013'
           ,CURRENT_TIMESTAMP)
		   	,(6
           ,100000.00
           ,'11-10-2013'
           ,CURRENT_TIMESTAMP)
		   	,(7
           ,200000.00
           ,'11-10-2013'
           ,CURRENT_TIMESTAMP)
		   	,(8
           ,195000.00
           ,'11-10-2013'
           ,CURRENT_TIMESTAMP)
		   	,(9
           ,189000.00
           ,'11-10-2013'
           ,CURRENT_TIMESTAMP)
		   	,(10
           ,157000.00
           ,'11-10-2013'
           ,CURRENT_TIMESTAMP)
		   	,(11
           ,169000.00
           ,'11-10-2013'
           ,CURRENT_TIMESTAMP)
GO
INSERT INTO [dbo].[HorseOwner]
           ([HorseId]
           ,[IndividualOwnerId]
           ,[StableOwnerId]
           ,[Percentage]
           ,[BoughtPurchaseId]
           ,[SoldPurchaseId]
           ,[CreatedDate])
     VALUES
           (1
           ,null
           ,1
           ,100
           ,1
           ,null
           ,CURRENT_TIMESTAMP)
		    ,(2
           ,null
           ,2
           ,100
           ,2
           ,null
           ,CURRENT_TIMESTAMP)
		   	,(3
           ,null
           ,3
           ,100
           ,3
           ,null
           ,CURRENT_TIMESTAMP)
		   	,(4
           ,null
           ,4
           ,100
           ,4
           ,null
           ,CURRENT_TIMESTAMP)
		   	,(5
           ,null
           ,5
           ,100
           ,5
           ,null
           ,CURRENT_TIMESTAMP)
		   	,(6
           ,null
           ,1
           ,100
           ,6
           ,null
           ,CURRENT_TIMESTAMP)
		   	,(7
           ,null
           ,2
           ,100
           ,7
           ,null
           ,CURRENT_TIMESTAMP)
		   	,(8
           ,null
           ,3
           ,100
           ,8
           ,null
           ,CURRENT_TIMESTAMP)
		   	,(9
           ,11
           ,null
           ,50
           ,9
           ,null
           ,CURRENT_TIMESTAMP)
		   	,(9
           ,12
           ,null
           ,50
           ,9
           ,null
           ,CURRENT_TIMESTAMP)
			,(10
           ,10
           ,null
           ,50
           ,10
           ,null
           ,CURRENT_TIMESTAMP)
		   	,(11
           ,13
           ,null
           ,100
           ,11
           ,null
           ,CURRENT_TIMESTAMP)
GO



INSERT INTO [dbo].[HorseTrainer]
           ([HorseId]
           ,[TrainerId]
           ,[DateStart]
           ,[CreatedDate])
     VALUES
           (1
           ,1
           ,CURRENT_TIMESTAMP
           ,CURRENT_TIMESTAMP)
           ,(2
           ,3
           ,CURRENT_TIMESTAMP
           ,CURRENT_TIMESTAMP)
		   ,(3
           ,14
           ,CURRENT_TIMESTAMP
           ,CURRENT_TIMESTAMP)
		   ,(4
           ,24
           ,CURRENT_TIMESTAMP
           ,CURRENT_TIMESTAMP)
		   ,(5
           ,23
           ,CURRENT_TIMESTAMP
           ,CURRENT_TIMESTAMP)
			,(6
           ,22
           ,CURRENT_TIMESTAMP
           ,CURRENT_TIMESTAMP)
			,(7
           ,21
           ,CURRENT_TIMESTAMP
           ,CURRENT_TIMESTAMP)
			,(8
           ,20
           ,CURRENT_TIMESTAMP
           ,CURRENT_TIMESTAMP)
			,(9
           ,14
           ,CURRENT_TIMESTAMP
           ,CURRENT_TIMESTAMP)
  			,(10
           ,24
           ,CURRENT_TIMESTAMP
           ,CURRENT_TIMESTAMP)
		   ,(11
           ,22
           ,CURRENT_TIMESTAMP
           ,CURRENT_TIMESTAMP)

GO

-- JockeyHeightWeightValues
INSERT INTO [dbo].[JockeyHeightWeight]
           ([JockeyId]
           ,[MeasurementDate]
           ,[HeightFeet]
           ,[WeightPounds]
           ,[CreatedDate])
     VALUES
           (1
           ,CURRENT_TIMESTAMP
           ,5.25
           ,120
           ,CURRENT_TIMESTAMP)
		    ,(2
           ,CURRENT_TIMESTAMP
           ,5.2
           ,110
           ,CURRENT_TIMESTAMP)
		   ,(3
           ,CURRENT_TIMESTAMP
           ,5.1
           ,98
           ,CURRENT_TIMESTAMP)
		   	,(4
           ,CURRENT_TIMESTAMP
           ,5.0
           ,102
           ,CURRENT_TIMESTAMP)
			,(5
           ,CURRENT_TIMESTAMP
           ,5.0
           ,102
           ,CURRENT_TIMESTAMP)
		   ,(6
           ,CURRENT_TIMESTAMP
           ,5.3
           ,125
           ,CURRENT_TIMESTAMP)
		   ,(7
           ,CURRENT_TIMESTAMP
           ,4.9
           ,96
           ,CURRENT_TIMESTAMP)
		   ,(8
           ,CURRENT_TIMESTAMP
           ,5.2
           ,110
           ,CURRENT_TIMESTAMP)
		   ,(9
           ,CURRENT_TIMESTAMP
           ,5.1
           ,98
           ,CURRENT_TIMESTAMP)
		   	,(15
           ,CURRENT_TIMESTAMP
           ,5.0
           ,102
           ,CURRENT_TIMESTAMP)

GO

INSERT INTO [dbo].[PersonRole]
           ([PersonId]
           ,[RoleTypeId]
           ,[DateBegan]
           ,[CreatedDate])
     VALUES
	 --Jockeys
           (1    ,3 -- Jockey
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
			,(1
           ,2 -- Trainer
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		    ,(2
           ,3 -- Jockey
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		    ,(3
           ,3 -- Jockey
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   	,(3
           ,2 -- Trainer
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(5
           ,3 -- Jockey
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(6
           ,3 -- Jockey
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(7
           ,3 -- Jockey
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(8
           ,3 -- Jockey
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(9
           ,3 -- Jockey
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(15
           ,3 -- Jockey
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(14
           ,2 -- Trainer
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(24
           ,2 -- Trainer
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(23
           ,2 -- Trainer
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(22
           ,2 -- Trainer
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(21
           ,2 -- Trainer
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(20
           ,2 -- Trainer
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(10
           ,1 -- Owner
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(11
           ,1 -- Owner
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(12
           ,1 -- Owner
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   ,(13
           ,1 -- Owner
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   	,(19
           ,5 -- Public Relations
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   	,(18
           ,5 -- Public Relations
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   	,(17
           ,4 -- Manager
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)
		   	,(16
           ,4 -- Manager
           ,'12-01-2009'
           ,CURRENT_TIMESTAMP)

GO

INSERT INTO [dbo].[TrainerStable]
           ([TrainerId]
           ,[StableId]
           ,[Salary]
           ,[CreatedDate])
     VALUES
           (1
           ,1
           ,350000.00
           ,CURRENT_TIMESTAMP)
		   ,(3
           ,2
           ,560000.00
           ,CURRENT_TIMESTAMP)
		   ,(14
           ,3
           ,470000.00
           ,CURRENT_TIMESTAMP)
		   ,(24
           ,4
           ,650000.00
           ,CURRENT_TIMESTAMP)
		   ,(23
           ,5
           ,700000.00
           ,CURRENT_TIMESTAMP)
		   ,(22
           ,1
           ,600000.00
           ,CURRENT_TIMESTAMP)
		   ,(21
           ,2
           ,5200000.00
           ,CURRENT_TIMESTAMP)
			,(20
           ,3
           ,630000.00
           ,CURRENT_TIMESTAMP)
GO

INSERT INTO [dbo].[StablePhoneNumber]
           ([StableId]
           ,[PhoneNumber]
           ,[ContactTypeId]
           ,[CreatedDate])
     VALUES
           (1
           ,'5145251'
           ,7
           ,CURRENT_TIMESTAMP)
			,(1
           ,'8738714'
           ,4
           ,CURRENT_TIMESTAMP)
		   	,(1
           ,'1457635'
           ,7
           ,CURRENT_TIMESTAMP)
		    ,(2
           ,'2262098'
           ,8
           ,CURRENT_TIMESTAMP)
		   	,(2
           ,'2040861'
           ,7
           ,CURRENT_TIMESTAMP)
		   	,(2
           ,'1089679'
           ,7
           ,CURRENT_TIMESTAMP)
		    ,(3
           ,'1320063'
           ,7
           ,CURRENT_TIMESTAMP)
		 ,(4
           ,'4455789'
           ,4
           ,CURRENT_TIMESTAMP)
		   	,(5
           ,'5047732'
           ,4
           ,CURRENT_TIMESTAMP)

INSERT INTO [dbo].[SurfaceType]
           ([Name]
           ,[Description]
           ,[CreatedDate])
     VALUES
	 -- 1
           ('Turf'
           ,'Turf'
           ,CURRENT_TIMESTAMP)
	 -- 2 
		    ,('Dirt'
           ,'Dirt'
           ,CURRENT_TIMESTAMP)
	-- 3	    
			,('Synthetic'
           ,'Synthetic'
           ,CURRENT_TIMESTAMP)
GO

INSERT INTO [dbo].[RaceType]
           ([Description]
           ,[SurfaceTypeId]
           ,[CreatedDate])
     VALUES
           ('Turf'
           ,1
           ,CURRENT_TIMESTAMP)
		    ,('Sprint - Dirt'
           ,2
           ,CURRENT_TIMESTAMP)
		   ,('Steeplechase - Dirt'
           ,2
           ,CURRENT_TIMESTAMP)
			,('Lefthand - Dirt'
           ,2
           ,CURRENT_TIMESTAMP)
		   ,('Steeplechase - Synthetic'
           ,3
           ,CURRENT_TIMESTAMP)
			,('Lefthand - Synthetic'
           ,3
           ,CURRENT_TIMESTAMP)
GO

INSERT INTO [dbo].[Track]
           ([TrackGuid]
           ,[Name]
           ,[AddressId]
           ,[WebsiteUrl]
           ,[CreatedDate])
     VALUES
           (NEWID()
           ,'Turf Paradise'
           ,31
           ,'http://www.turfparadise.com/'
           ,CURRENT_TIMESTAMP)
		   ,           (NEWID()
           ,'Del Mar Race Track'
           ,30
           ,'http://www.plug.com/'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'Churchill Downs'
           ,29
           ,'http://www.kentuckyderby.com'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'Fair Grounds'
           ,28
           ,'http://www.plug.com'
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,'Canterbury Park'
           ,27
           ,'http://www.plug.com'
           ,CURRENT_TIMESTAMP)

GO

INSERT INTO [dbo].[Race]
           ([RaceGuid]
           ,[Name]
           ,[RaceTypeId]
           ,[DistanceMeters]
           ,[Purse]
           ,[Date]
           ,[Time]
           ,[TrackId]
           ,[NumberGates]
           ,[CreatedDate])
     VALUES
	 --1
           (NEWID()
           ,'Hawthorne Fall SQ'
           ,1
           ,1200
           ,250000.00
           ,'2014-12-25'
           ,'12:00:00'
           ,1
           ,5
           ,CURRENT_TIMESTAMP)
	--2
		    ,(NEWID()
           ,'Derby Wars'
           ,1
           ,1200
           ,250000.00
           ,'2014-11-28'
           ,'12:00:00'
           ,1
           ,5
           ,CURRENT_TIMESTAMP)
	--3
		   	,(NEWID()
           ,'NHC Qualify'
           ,1
           ,1200
           ,300000.00
           ,'2014-11-25'
           ,'12:00:00'
           ,2
           ,5
           ,CURRENT_TIMESTAMP)

		-- 4 Race Type 1 
		,(NEWID()
		,'Emerald Downs' -- NAME
		,2 -- RaceTypeId
		,1200 -- Distance Meters
		,300000.00 -- Purse
		,'2014-09-10' -- Date
		,'12:00:00' -- Time
		,2 -- Track ID
		,5 -- # Gates
		,CURRENT_TIMESTAMP)

				--5 Race Type 2
		,(NEWID()
		,'Monmouth SSC' -- NAME
		,2 -- RaceTypeId
		,1200 -- Distance Meters
		,300000.00 -- Purse
		,'2014-09-15' -- Date
		,'12:00:00' -- Time
		,3 -- Track ID
		,5 -- # Gates
		,CURRENT_TIMESTAMP)

		--6 Race Type 3
		,(NEWID()
		,'Horsetourneys.com' -- NAME
		,3 -- RaceTypeId
		,1200 -- Distance Meters
		,300000.00 -- Purse
		,'2014-09-20' -- Date
		,'12:00:00' -- Time
		,1 -- Track ID
		,5 -- # Gates
		,CURRENT_TIMESTAMP)

		--7 Race Type 4
		,(NEWID()
		,'Lone Star Park Chance' -- NAME
		,5 -- RaceTypeId
		,1200 -- Distance Meters
		,300000.00 -- Purse
		,'2014-10-01' -- Date
		,'12:00:00' -- Time
		,2 -- Track ID
		,5 -- # Gates
		,CURRENT_TIMESTAMP)

				--8 Race Type 5
		,(NEWID()
		,'Santa Anita Double Down Challenge' -- NAME
		,5 -- RaceTypeId
		,1200 -- Distance Meters
		,300000.00 -- Purse
		,'2014-10-06' -- Date
		,'12:00:00' -- Time
		,3 -- Track ID
		,5 -- # Gates
		,CURRENT_TIMESTAMP)

		--9 Race Type 6
		,(NEWID()
		,'Surfside Race Place' -- NAME
		,2 -- RaceTypeId
		,1200 -- Distance Meters
		,300000.00 -- Purse
		,'2014-10-11' -- Date
		,'12:00:00' -- Time
		,2 -- Track ID
		,5 -- # Gates
		,CURRENT_TIMESTAMP)
	--10
		   	,(NEWID()
           ,'Twin Spires'
           ,1
           ,1200
           ,300000.00
           ,'2015-01-01'
           ,'12:00:00'
           ,2
           ,5
           ,CURRENT_TIMESTAMP)

		--11
		,(NEWID()
        ,'Pimlico Race Course'
        ,1
        ,1200
        ,300000.00
        ,'2014-10-31'
        ,'12:00:00'
        ,3
        ,5
        ,CURRENT_TIMESTAMP)
GO

INSERT INTO [dbo].[RaceEntry]
           ([RaceEntryGuid]
           ,[RaceId]
           ,[HorseId]
           ,[JockeyId]
           ,[RacingNumber]
           ,[GateNumber]
           ,[FinishingPlace]
           ,[Payout]
           ,[CreatedDate])
     VALUES
	 -- Race 2
           (NEWID()
           ,2
           ,1
           ,2
           ,1
           ,1
           ,1
           ,125000
           ,CURRENT_TIMESTAMP)
		    ,(NEWID()
           ,2 --RaceID
           ,2 --HorseID
           ,5 --JockeyID
           ,2 --racingNumber
           ,2 --GateNumber
           ,3 -- Finishing Place
           ,50000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,2 --RaceID
           ,3 --HorseID
           ,6 --JockeyID
           ,3 --racingNumber
           ,3 --GateNumber
           ,2 -- Finishing Place
           ,75000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,2 --RaceID
           ,4 --HorseID
           ,7 --JockeyID
           ,4 --racingNumber
           ,4 --GateNumber
           ,4 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,2 --RaceID
           ,5 --HorseID
           ,8 --JockeyID
           ,4 --racingNumber
           ,4 --GateNumber
           ,4 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)

	 --Race 3
		   	,(NEWID()
           ,3 --RaceID
           ,2 --HorseID
           ,5 --JockeyID
           ,1 --racingNumber
           ,1 --GateNumber
           ,2 -- Finishing Place
           ,75000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,3 --RaceID
           ,3 --HorseID
           ,6 --JockeyID
           ,2 --racingNumber
           ,2 --GateNumber
           ,4 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,3 --RaceID
           ,4 --HorseID
           ,7 --JockeyID
           ,3 --racingNumber
           ,3 --GateNumber
           ,3 -- Finishing Place
           ,50000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,3 --RaceID
           ,5 --HorseID
           ,8 --JockeyID
           ,4 --racingNumber
           ,4 --GateNumber
           ,5 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,3 --RaceID
           ,5 --HorseID
           ,8 --JockeyID
           ,5 --racingNumber
           ,5 --GateNumber
           ,1 -- Finishing Place
           ,200000 -- Payout
           ,CURRENT_TIMESTAMP)


		   	 --Race 1
		   	,(NEWID()
           ,1 --RaceID
           ,6 --HorseID
           ,6 --JockeyID
           ,1 --racingNumber
           ,1 --GateNumber
           ,null
           ,null
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,1 --RaceID
           ,7 --HorseID
           ,7 --JockeyID
           ,2 --racingNumber
           ,2 --GateNumber
           ,null
           ,null
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,1 --RaceID
           ,8 --HorseID
           ,8--JockeyID
           ,3 --racingNumber
           ,3 --GateNumber
           ,null
           ,null
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,1 --RaceID
           ,9 --HorseID
           ,9 --JockeyID
           ,4 --racingNumber
           ,4 --GateNumber
           ,null
           ,null
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,1 --RaceID
           ,10 --HorseID
           ,10 --JockeyID
           ,5 --racingNumber
           ,5 --GateNumber
           ,null
           ,null
           ,CURRENT_TIMESTAMP)

		   	--Race 4
		   	,(NEWID()
           ,4 --RaceID
           ,6 --HorseID
           ,6 --JockeyID
           ,1 --racingNumber
           ,1 --GateNumber
           ,5 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,4 --RaceID
           ,7 --HorseID
           ,7 --JockeyID
           ,2 --racingNumber
           ,2 --GateNumber
           ,4 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,4 --RaceID
           ,8 --HorseID
           ,8--JockeyID
           ,3 --racingNumber
           ,3 --GateNumber
           ,2 -- Finishing Place
           ,50000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,4 --RaceID
           ,9 --HorseID
           ,9 --JockeyID
           ,4 --racingNumber
           ,4 --GateNumber
           ,1 -- Finishing Place
           ,150000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,4 --RaceID
           ,11 --HorseID
           ,15 --JockeyID
           ,5 --racingNumber
           ,5 --GateNumber
           ,3 -- Finishing Place
           ,50000 -- Payout
           ,CURRENT_TIMESTAMP)

			--Race 5
		   	,(NEWID()
           ,5 --RaceID
           ,1 --HorseID
           ,2 --JockeyID
           ,1 --racingNumber
           ,1 --GateNumber
           ,5 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,5 --RaceID
           ,2 --HorseID
           ,4 --JockeyID
           ,2 --racingNumber
           ,2 --GateNumber
           ,4 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,5 --RaceID
           ,3 --HorseID
           ,5--JockeyID
           ,3 --racingNumber
           ,3 --GateNumber
           ,2 -- Finishing Place
           ,50000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,5 --RaceID
           ,4 --HorseID
           ,6 --JockeyID
           ,4 --racingNumber
           ,4 --GateNumber
           ,1 -- Finishing Place
           ,150000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,5 --RaceID
           ,5 --HorseID
           ,7 --JockeyID
           ,5 --racingNumber
           ,5 --GateNumber
           ,3 -- Finishing Place
           ,50000 -- Payout
           ,CURRENT_TIMESTAMP)

		   	--Race 6
		   	,(NEWID()
           ,6 --RaceID
           ,1 --HorseID
           ,2 --JockeyID
           ,1 --racingNumber
           ,1 --GateNumber
           ,5 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,6 --RaceID
           ,2 --HorseID
           ,4 --JockeyID
           ,2 --racingNumber
           ,2 --GateNumber
           ,4 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,6 --RaceID
           ,3 --HorseID
           ,5--JockeyID
           ,3 --racingNumber
           ,3 --GateNumber
           ,2 -- Finishing Place
           ,50000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,6 --RaceID
           ,4 --HorseID
           ,6 --JockeyID
           ,4 --racingNumber
           ,4 --GateNumber
           ,1 -- Finishing Place
           ,150000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,6 --RaceID
           ,5 --HorseID
           ,7 --JockeyID
           ,5 --racingNumber
           ,5 --GateNumber
           ,3 -- Finishing Place
           ,50000 -- Payout
           ,CURRENT_TIMESTAMP)

		   	--Race 7
		   	,(NEWID()
           ,7 --RaceID
           ,5 --HorseID
           ,7 --JockeyID
           ,1 --racingNumber
           ,1 --GateNumber
           ,5 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,7 --RaceID
           ,4 --HorseID
           ,6 --JockeyID
           ,2 --racingNumber
           ,2 --GateNumber
           ,4 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,7 --RaceID
           ,3 --HorseID
           ,5--JockeyID
           ,3 --racingNumber
           ,3 --GateNumber
           ,2 -- Finishing Place
           ,50000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,7 --RaceID
           ,2 --HorseID
           ,4 --JockeyID
           ,4 --racingNumber
           ,4 --GateNumber
           ,1 -- Finishing Place
           ,150000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,7 --RaceID
           ,1 --HorseID
           ,2 --JockeyID
           ,5 --racingNumber
           ,5 --GateNumber
           ,3 -- Finishing Place
           ,50000 -- Payout
           ,CURRENT_TIMESTAMP)

		   	--Race 8
		   	,(NEWID()
           ,8 --RaceID
           ,11 --HorseID
           ,15 --JockeyID
           ,1 --racingNumber
           ,1 --GateNumber
           ,5 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,8 --RaceID
           ,10 --HorseID
           ,9 --JockeyID
           ,2 --racingNumber
           ,2 --GateNumber
           ,4 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,8 --RaceID
           ,9 --HorseID
           ,8--JockeyID
           ,3 --racingNumber
           ,3 --GateNumber
           ,2 -- Finishing Place
           ,50000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,8 --RaceID
           ,8 --HorseID
           ,7 --JockeyID
           ,4 --racingNumber
           ,4 --GateNumber
           ,1 -- Finishing Place
           ,150000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,8 --RaceID
           ,7 --HorseID
           ,6 --JockeyID
           ,5 --racingNumber
           ,5 --GateNumber
           ,3 -- Finishing Place
           ,50000 -- Payout
           ,CURRENT_TIMESTAMP)

		   	--Race 9
		   	,(NEWID()
           ,9 --RaceID
           ,11 --HorseID
           ,15 --JockeyID
           ,1 --racingNumber
           ,1 --GateNumber
           ,3 -- Finishing Place
           ,50000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,9 --RaceID
           ,10 --HorseID
           ,7 --JockeyID
           ,2 --racingNumber
           ,2 --GateNumber
           ,1 -- Finishing Place
           ,150000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,9 --RaceID
           ,9 --HorseID
           ,8--JockeyID
           ,3 --racingNumber
           ,3 --GateNumber
           ,4 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,9 --RaceID
           ,8 --HorseID
           ,7 --JockeyID
           ,4 --racingNumber
           ,4 --GateNumber
           ,2
           ,75000
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,9 --RaceID
           ,7 --HorseID
           ,6 --JockeyID
           ,5 --racingNumber
           ,5 --GateNumber
			,5 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)

		   		   	--Race 10
		   	,(NEWID()
           ,10 --RaceID
           ,11 --HorseID
           ,15 --JockeyID
           ,1 --racingNumber
           ,1 --GateNumber
           ,null -- Finishing Place
           ,null -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,10 --RaceID
           ,10 --HorseID
           ,7 --JockeyID
           ,2 --racingNumber
           ,2 --GateNumber
           ,null -- Finishing Place
           ,null -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,10 --RaceID
           ,9 --HorseID
           ,8--JockeyID
           ,3 --racingNumber
           ,3 --GateNumber
           ,null -- Finishing Place
           ,null -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,10 --RaceID
           ,8 --HorseID
           ,7 --JockeyID
           ,4 --racingNumber
           ,4 --GateNumber
           ,null -- Finishing Place
           ,null -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,10 --RaceID
           ,7 --HorseID
           ,6 --JockeyID
           ,5 --racingNumber
           ,5 --GateNumber
           ,null -- Finishing Place
           ,null -- Payout
           ,CURRENT_TIMESTAMP)

		   	--Race 11
		   	,(NEWID()
           ,11 --RaceID
           ,6 --HorseID
           ,6 --JockeyID
           ,1 --racingNumber
           ,1 --GateNumber
           ,3 -- Finishing Place
           ,50000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,11 --RaceID
           ,7 --HorseID
           ,7 --JockeyID
           ,2 --racingNumber
           ,2 --GateNumber
           ,1 -- Finishing Place
           ,150000 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,11 --RaceID
           ,8 --HorseID
           ,8--JockeyID
           ,3 --racingNumber
           ,3 --GateNumber
           ,4 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,11 --RaceID
           ,9 --HorseID
           ,9 --JockeyID
           ,4 --racingNumber
           ,4 --GateNumber
           ,2
           ,75000
           ,CURRENT_TIMESTAMP)
		   	,(NEWID()
           ,11 --RaceID
           ,10 --HorseID
           ,10 --JockeyID
           ,5 --racingNumber
           ,5 --GateNumber
			,5 -- Finishing Place
           ,0 -- Payout
           ,CURRENT_TIMESTAMP)

GO
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'M8-HorseRacing', 'ON';
    END


GO
PRINT N'Update complete.';


GO
