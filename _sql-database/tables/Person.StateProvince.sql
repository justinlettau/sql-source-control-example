IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Person].[StateProvince]') AND type = 'U')
CREATE TABLE [Person].[StateProvince]
(
    [StateProvinceID] int NOT NULL IDENTITY(1, 1),
    [StateProvinceCode] nchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [CountryRegionCode] nvarchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [IsOnlyStateProvinceFlag] Flag NOT NULL DEFAULT((1)),
    [Name] Name COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [TerritoryID] int NOT NULL,
    [rowguid] uniqueidentifier NOT NULL DEFAULT(newid()),
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_StateProvince_StateProvinceID] PRIMARY KEY ([StateProvinceID] ASC)
)

ALTER TABLE [Sales].[StateProvince] WITH CHECK ADD CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID] FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])
ALTER TABLE [Sales].[StateProvince] CHECK CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID]
ALTER TABLE [Person].[StateProvince] WITH CHECK ADD CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode] FOREIGN KEY ([CountryRegionCode]) REFERENCES [Person].[CountryRegion] ([CountryRegionCode])
ALTER TABLE [Person].[StateProvince] CHECK CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode]

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Person].[StateProvince]') AND name = 'AK_StateProvince_Name')
CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_Name] ON [Person].[StateProvince]([Name] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Person].[StateProvince]') AND name = 'AK_StateProvince_StateProvinceCode_CountryRegionCode')
CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_StateProvinceCode_CountryRegionCode] ON [Person].[StateProvince]([StateProvinceCode] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Person].[StateProvince]') AND name = 'AK_StateProvince_StateProvinceCode_CountryRegionCode')
CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_StateProvinceCode_CountryRegionCode] ON [Person].[StateProvince]([CountryRegionCode] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Person].[StateProvince]') AND name = 'AK_StateProvince_rowguid')
CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_rowguid] ON [Person].[StateProvince]([rowguid] ASC)