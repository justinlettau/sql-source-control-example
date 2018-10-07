IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Sales].[Customer]') AND type = 'U')
CREATE TABLE [Sales].[Customer]
(
    [CustomerID] int NOT NULL IDENTITY(1, 1),
    [PersonID] int NULL,
    [StoreID] int NULL,
    [TerritoryID] int NULL,
    [AccountNumber] AS (isnull('AW'+[dbo].[ufnLeadingZeros]([CustomerID]),'')),
    [rowguid] uniqueidentifier NOT NULL DEFAULT(newid()),
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY ([CustomerID] ASC)
)

ALTER TABLE [Person].[Customer] WITH CHECK ADD CONSTRAINT [FK_Customer_Person_PersonID] FOREIGN KEY ([PersonID]) REFERENCES [Person].[Person] ([BusinessEntityID])
ALTER TABLE [Person].[Customer] CHECK CONSTRAINT [FK_Customer_Person_PersonID]
ALTER TABLE [Sales].[Customer] WITH CHECK ADD CONSTRAINT [FK_Customer_SalesTerritory_TerritoryID] FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])
ALTER TABLE [Sales].[Customer] CHECK CONSTRAINT [FK_Customer_SalesTerritory_TerritoryID]
ALTER TABLE [Sales].[Customer] WITH CHECK ADD CONSTRAINT [FK_Customer_Store_StoreID] FOREIGN KEY ([StoreID]) REFERENCES [Sales].[Store] ([BusinessEntityID])
ALTER TABLE [Sales].[Customer] CHECK CONSTRAINT [FK_Customer_Store_StoreID]

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Sales].[Customer]') AND name = 'AK_Customer_rowguid')
CREATE UNIQUE NONCLUSTERED INDEX [AK_Customer_rowguid] ON [Sales].[Customer]([rowguid] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Sales].[Customer]') AND name = 'AK_Customer_AccountNumber')
CREATE UNIQUE NONCLUSTERED INDEX [AK_Customer_AccountNumber] ON [Sales].[Customer]([AccountNumber] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Sales].[Customer]') AND name = 'IX_Customer_TerritoryID')
CREATE NONCLUSTERED INDEX [IX_Customer_TerritoryID] ON [Sales].[Customer]([TerritoryID] ASC)