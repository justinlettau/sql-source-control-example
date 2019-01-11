IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Sales].[SalesPerson]') AND type = 'U')
CREATE TABLE [Sales].[SalesPerson]
(
    [BusinessEntityID] int NOT NULL,
    [TerritoryID] int NULL,
    [SalesQuota] money NULL,
    [Bonus] money NOT NULL DEFAULT((0.00)),
    [CommissionPct] smallmoney NOT NULL DEFAULT((0.00)),
    [SalesYTD] money NOT NULL DEFAULT((0.00)),
    [SalesLastYear] money NOT NULL DEFAULT((0.00)),
    [rowguid] uniqueidentifier NOT NULL DEFAULT(newid()),
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_SalesPerson_BusinessEntityID] PRIMARY KEY CLUSTERED (
        [BusinessEntityID] ASC
    )
)

ALTER TABLE [Sales].[SalesPerson] WITH CHECK ADD CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID] FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])
ALTER TABLE [Sales].[SalesPerson] CHECK CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID]
ALTER TABLE [HumanResources].[SalesPerson] WITH CHECK ADD CONSTRAINT [FK_SalesPerson_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
ALTER TABLE [HumanResources].[SalesPerson] CHECK CONSTRAINT [FK_SalesPerson_Employee_BusinessEntityID]

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Sales].[SalesPerson]') AND name = 'AK_SalesPerson_rowguid')
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesPerson_rowguid] ON [Sales].[SalesPerson]([rowguid] ASC)