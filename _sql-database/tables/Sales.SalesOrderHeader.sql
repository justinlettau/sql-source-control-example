IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Sales].[SalesOrderHeader]') AND type = 'U')
CREATE TABLE [Sales].[SalesOrderHeader]
(
    [SalesOrderID] int NOT NULL IDENTITY(1, 1),
    [RevisionNumber] tinyint NOT NULL DEFAULT((0)),
    [OrderDate] datetime NOT NULL DEFAULT(getdate()),
    [DueDate] datetime NOT NULL,
    [ShipDate] datetime NULL,
    [Status] tinyint NOT NULL DEFAULT((1)),
    [OnlineOrderFlag] Flag NOT NULL DEFAULT((1)),
    [SalesOrderNumber] AS (isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID]),N'*** ERROR ***')),
    [PurchaseOrderNumber] OrderNumber COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [AccountNumber] AccountNumber COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [CustomerID] int NOT NULL,
    [SalesPersonID] int NULL,
    [TerritoryID] int NULL,
    [BillToAddressID] int NOT NULL,
    [ShipToAddressID] int NOT NULL,
    [ShipMethodID] int NOT NULL,
    [CreditCardID] int NULL,
    [CreditCardApprovalCode] varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [CurrencyRateID] int NULL,
    [SubTotal] money NOT NULL DEFAULT((0.00)),
    [TaxAmt] money NOT NULL DEFAULT((0.00)),
    [Freight] money NOT NULL DEFAULT((0.00)),
    [TotalDue] AS (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))),
    [Comment] nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [rowguid] uniqueidentifier NOT NULL DEFAULT(newid()),
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_SalesOrderHeader_SalesOrderID] PRIMARY KEY CLUSTERED (
        [SalesOrderID] ASC
    )
)

ALTER TABLE [Sales].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID] FOREIGN KEY ([SalesPersonID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])
ALTER TABLE [Sales].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID]
ALTER TABLE [Sales].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID] FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])
ALTER TABLE [Sales].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID]
ALTER TABLE [Purchasing].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID] FOREIGN KEY ([ShipMethodID]) REFERENCES [Purchasing].[ShipMethod] ([ShipMethodID])
ALTER TABLE [Purchasing].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID]
ALTER TABLE [Person].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID] FOREIGN KEY ([BillToAddressID]) REFERENCES [Person].[Address] ([AddressID])
ALTER TABLE [Person].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID]
ALTER TABLE [Person].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID] FOREIGN KEY ([ShipToAddressID]) REFERENCES [Person].[Address] ([AddressID])
ALTER TABLE [Person].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID]
ALTER TABLE [Sales].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID] FOREIGN KEY ([CreditCardID]) REFERENCES [Sales].[CreditCard] ([CreditCardID])
ALTER TABLE [Sales].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID]
ALTER TABLE [Sales].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID] FOREIGN KEY ([CurrencyRateID]) REFERENCES [Sales].[CurrencyRate] ([CurrencyRateID])
ALTER TABLE [Sales].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID]
ALTER TABLE [Sales].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID] FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customer] ([CustomerID])
ALTER TABLE [Sales].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Sales].[SalesOrderHeader]') AND name = 'AK_SalesOrderHeader_rowguid')
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesOrderHeader_rowguid] ON [Sales].[SalesOrderHeader]([rowguid] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Sales].[SalesOrderHeader]') AND name = 'AK_SalesOrderHeader_SalesOrderNumber')
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesOrderHeader_SalesOrderNumber] ON [Sales].[SalesOrderHeader]([SalesOrderNumber] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Sales].[SalesOrderHeader]') AND name = 'IX_SalesOrderHeader_CustomerID')
CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_CustomerID] ON [Sales].[SalesOrderHeader]([CustomerID] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Sales].[SalesOrderHeader]') AND name = 'IX_SalesOrderHeader_SalesPersonID')
CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_SalesPersonID] ON [Sales].[SalesOrderHeader]([SalesPersonID] ASC)