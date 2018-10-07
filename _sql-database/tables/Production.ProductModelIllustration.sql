IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Production].[ProductModelIllustration]') AND type = 'U')
CREATE TABLE [Production].[ProductModelIllustration]
(
    [ProductModelID] int NOT NULL,
    [IllustrationID] int NOT NULL,
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_ProductModelIllustration_ProductModelID_IllustrationID] PRIMARY KEY ([ProductModelID] ASC)
    CONSTRAINT [PK_ProductModelIllustration_ProductModelID_IllustrationID] PRIMARY KEY ([IllustrationID] ASC)
)

ALTER TABLE [Production].[ProductModelIllustration] WITH CHECK ADD CONSTRAINT [FK_ProductModelIllustration_Illustration_IllustrationID] FOREIGN KEY ([IllustrationID]) REFERENCES [Production].[Illustration] ([IllustrationID])
ALTER TABLE [Production].[ProductModelIllustration] CHECK CONSTRAINT [FK_ProductModelIllustration_Illustration_IllustrationID]
ALTER TABLE [Production].[ProductModelIllustration] WITH CHECK ADD CONSTRAINT [FK_ProductModelIllustration_ProductModel_ProductModelID] FOREIGN KEY ([ProductModelID]) REFERENCES [Production].[ProductModel] ([ProductModelID])
ALTER TABLE [Production].[ProductModelIllustration] CHECK CONSTRAINT [FK_ProductModelIllustration_ProductModel_ProductModelID]