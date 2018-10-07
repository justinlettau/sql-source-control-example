IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Sales].[SalesPersonQuotaHistory]') AND type = 'U')
CREATE TABLE [Sales].[SalesPersonQuotaHistory]
(
    [BusinessEntityID] int NOT NULL,
    [QuotaDate] datetime NOT NULL,
    [SalesQuota] money NOT NULL,
    [rowguid] uniqueidentifier NOT NULL DEFAULT(newid()),
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate] PRIMARY KEY ([BusinessEntityID] ASC)
    CONSTRAINT [PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate] PRIMARY KEY ([QuotaDate] ASC)
)

ALTER TABLE [Sales].[SalesPersonQuotaHistory] WITH CHECK ADD CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])
ALTER TABLE [Sales].[SalesPersonQuotaHistory] CHECK CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID]

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Sales].[SalesPersonQuotaHistory]') AND name = 'AK_SalesPersonQuotaHistory_rowguid')
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesPersonQuotaHistory_rowguid] ON [Sales].[SalesPersonQuotaHistory]([rowguid] ASC)