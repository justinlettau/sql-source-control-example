IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Purchasing].[PurchaseOrderDetail]') AND type = 'U')
CREATE TABLE [Purchasing].[PurchaseOrderDetail]
(
    [PurchaseOrderID] int NOT NULL,
    [PurchaseOrderDetailID] int NOT NULL IDENTITY(1, 1),
    [DueDate] datetime NOT NULL,
    [OrderQty] smallint NOT NULL,
    [ProductID] int NOT NULL,
    [UnitPrice] money NOT NULL,
    [LineTotal] AS (isnull([OrderQty]*[UnitPrice],(0.00))),
    [ReceivedQty] decimal(8, 2) NOT NULL,
    [RejectedQty] decimal(8, 2) NOT NULL,
    [StockedQty] AS (isnull([ReceivedQty]-[RejectedQty],(0.00))),
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID] PRIMARY KEY CLUSTERED (
        [PurchaseOrderID] ASC,
        [PurchaseOrderDetailID] ASC
    )
)

ALTER TABLE [Production].[PurchaseOrderDetail] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrderDetail_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PurchaseOrderDetail_Product_ProductID]
ALTER TABLE [Purchasing].[PurchaseOrderDetail] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID] FOREIGN KEY ([PurchaseOrderID]) REFERENCES [Purchasing].[PurchaseOrderHeader] ([PurchaseOrderID])
ALTER TABLE [Purchasing].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID]

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Purchasing].[PurchaseOrderDetail]') AND name = 'IX_PurchaseOrderDetail_ProductID')
CREATE NONCLUSTERED INDEX [IX_PurchaseOrderDetail_ProductID] ON [Purchasing].[PurchaseOrderDetail]([ProductID] ASC)