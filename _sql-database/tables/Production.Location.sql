IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Production].[Location]') AND type = 'U')
CREATE TABLE [Production].[Location]
(
    [LocationID] smallint NOT NULL IDENTITY(1, 1),
    [Name] Name COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [CostRate] smallmoney NOT NULL DEFAULT((0.00)),
    [Availability] decimal(8, 2) NOT NULL DEFAULT((0.00)),
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_Location_LocationID] PRIMARY KEY ([LocationID] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Production].[Location]') AND name = 'AK_Location_Name')
CREATE UNIQUE NONCLUSTERED INDEX [AK_Location_Name] ON [Production].[Location]([Name] ASC)