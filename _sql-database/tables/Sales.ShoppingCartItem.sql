IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Sales].[ShoppingCartItem]') AND type = 'U')
CREATE TABLE [Sales].[ShoppingCartItem]
(
    [ShoppingCartItemID] int NOT NULL IDENTITY(1, 1),
    [ShoppingCartID] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [Quantity] int NOT NULL DEFAULT((1)),
    [ProductID] int NOT NULL,
    [DateCreated] datetime NOT NULL DEFAULT(getdate()),
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_ShoppingCartItem_ShoppingCartItemID] PRIMARY KEY ([ShoppingCartItemID] ASC)
)

ALTER TABLE [Production].[ShoppingCartItem] WITH CHECK ADD CONSTRAINT [FK_ShoppingCartItem_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[ShoppingCartItem] CHECK CONSTRAINT [FK_ShoppingCartItem_Product_ProductID]

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Sales].[ShoppingCartItem]') AND name = 'IX_ShoppingCartItem_ShoppingCartID_ProductID')
CREATE NONCLUSTERED INDEX [IX_ShoppingCartItem_ShoppingCartID_ProductID] ON [Sales].[ShoppingCartItem]([ShoppingCartID] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Sales].[ShoppingCartItem]') AND name = 'IX_ShoppingCartItem_ShoppingCartID_ProductID')
CREATE NONCLUSTERED INDEX [IX_ShoppingCartItem_ShoppingCartID_ProductID] ON [Sales].[ShoppingCartItem]([ProductID] ASC)