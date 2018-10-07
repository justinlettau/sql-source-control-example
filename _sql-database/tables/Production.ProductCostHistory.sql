IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Production].[ProductCostHistory]') AND type = 'U')
CREATE TABLE [Production].[ProductCostHistory]
(
    [ProductID] int NOT NULL,
    [StartDate] datetime NOT NULL,
    [EndDate] datetime NULL,
    [StandardCost] money NOT NULL,
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_ProductCostHistory_ProductID_StartDate] PRIMARY KEY ([ProductID] ASC)
    CONSTRAINT [PK_ProductCostHistory_ProductID_StartDate] PRIMARY KEY ([StartDate] ASC)
)

ALTER TABLE [Production].[ProductCostHistory] WITH CHECK ADD CONSTRAINT [FK_ProductCostHistory_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product_ProductID]