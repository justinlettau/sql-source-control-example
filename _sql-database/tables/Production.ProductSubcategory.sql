IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Production].[ProductSubcategory]') AND type = 'U')
CREATE TABLE [Production].[ProductSubcategory]
(
    [ProductSubcategoryID] int NOT NULL IDENTITY(1, 1),
    [ProductCategoryID] int NOT NULL,
    [Name] Name COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [rowguid] uniqueidentifier NOT NULL DEFAULT(newid()),
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_ProductSubcategory_ProductSubcategoryID] PRIMARY KEY CLUSTERED (
        [ProductSubcategoryID] ASC
    )
)

ALTER TABLE [Production].[ProductSubcategory] WITH CHECK ADD CONSTRAINT [FK_ProductSubcategory_ProductCategory_ProductCategoryID] FOREIGN KEY ([ProductCategoryID]) REFERENCES [Production].[ProductCategory] ([ProductCategoryID])
ALTER TABLE [Production].[ProductSubcategory] CHECK CONSTRAINT [FK_ProductSubcategory_ProductCategory_ProductCategoryID]

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Production].[ProductSubcategory]') AND name = 'AK_ProductSubcategory_Name')
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductSubcategory_Name] ON [Production].[ProductSubcategory]([Name] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Production].[ProductSubcategory]') AND name = 'AK_ProductSubcategory_rowguid')
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductSubcategory_rowguid] ON [Production].[ProductSubcategory]([rowguid] ASC)