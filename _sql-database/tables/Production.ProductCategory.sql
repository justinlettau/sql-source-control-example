IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Production].[ProductCategory]') AND type = 'U')
CREATE TABLE [Production].[ProductCategory]
(
    [ProductCategoryID] int NOT NULL IDENTITY(1, 1),
    [Name] Name COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [rowguid] uniqueidentifier NOT NULL DEFAULT(newid()),
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_ProductCategory_ProductCategoryID] PRIMARY KEY ([ProductCategoryID] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Production].[ProductCategory]') AND name = 'AK_ProductCategory_Name')
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductCategory_Name] ON [Production].[ProductCategory]([Name] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Production].[ProductCategory]') AND name = 'AK_ProductCategory_rowguid')
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductCategory_rowguid] ON [Production].[ProductCategory]([rowguid] ASC)