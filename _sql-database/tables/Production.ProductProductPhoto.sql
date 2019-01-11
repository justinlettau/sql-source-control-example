IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Production].[ProductProductPhoto]') AND type = 'U')
CREATE TABLE [Production].[ProductProductPhoto]
(
    [ProductID] int NOT NULL,
    [ProductPhotoID] int NOT NULL,
    [Primary] Flag NOT NULL DEFAULT((0)),
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_ProductProductPhoto_ProductID_ProductPhotoID] PRIMARY KEY NONCLUSTERED (
        [ProductID] ASC,
        [ProductPhotoID] ASC
    )
)

ALTER TABLE [Production].[ProductProductPhoto] WITH CHECK ADD CONSTRAINT [FK_ProductProductPhoto_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[ProductProductPhoto] CHECK CONSTRAINT [FK_ProductProductPhoto_Product_ProductID]
ALTER TABLE [Production].[ProductProductPhoto] WITH CHECK ADD CONSTRAINT [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID] FOREIGN KEY ([ProductPhotoID]) REFERENCES [Production].[ProductPhoto] ([ProductPhotoID])
ALTER TABLE [Production].[ProductProductPhoto] CHECK CONSTRAINT [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID]