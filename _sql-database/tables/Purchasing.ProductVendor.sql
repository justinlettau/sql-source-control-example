IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Purchasing].[ProductVendor]') AND type = 'U')
CREATE TABLE [Purchasing].[ProductVendor]
(
    [ProductID] int NOT NULL,
    [BusinessEntityID] int NOT NULL,
    [AverageLeadTime] int NOT NULL,
    [StandardPrice] money NOT NULL,
    [LastReceiptCost] money NULL,
    [LastReceiptDate] datetime NULL,
    [MinOrderQty] int NOT NULL,
    [MaxOrderQty] int NOT NULL,
    [OnOrderQty] int NULL,
    [UnitMeasureCode] nchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_ProductVendor_ProductID_BusinessEntityID] PRIMARY KEY CLUSTERED (
        [ProductID] ASC,
        [BusinessEntityID] ASC
    )
)

ALTER TABLE [Production].[ProductVendor] WITH CHECK ADD CONSTRAINT [FK_ProductVendor_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[ProductVendor] CHECK CONSTRAINT [FK_ProductVendor_Product_ProductID]
ALTER TABLE [Production].[ProductVendor] WITH CHECK ADD CONSTRAINT [FK_ProductVendor_UnitMeasure_UnitMeasureCode] FOREIGN KEY ([UnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])
ALTER TABLE [Production].[ProductVendor] CHECK CONSTRAINT [FK_ProductVendor_UnitMeasure_UnitMeasureCode]
ALTER TABLE [Purchasing].[ProductVendor] WITH CHECK ADD CONSTRAINT [FK_ProductVendor_Vendor_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Purchasing].[Vendor] ([BusinessEntityID])
ALTER TABLE [Purchasing].[ProductVendor] CHECK CONSTRAINT [FK_ProductVendor_Vendor_BusinessEntityID]

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Purchasing].[ProductVendor]') AND name = 'IX_ProductVendor_UnitMeasureCode')
CREATE NONCLUSTERED INDEX [IX_ProductVendor_UnitMeasureCode] ON [Purchasing].[ProductVendor]([UnitMeasureCode] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Purchasing].[ProductVendor]') AND name = 'IX_ProductVendor_BusinessEntityID')
CREATE NONCLUSTERED INDEX [IX_ProductVendor_BusinessEntityID] ON [Purchasing].[ProductVendor]([BusinessEntityID] ASC)