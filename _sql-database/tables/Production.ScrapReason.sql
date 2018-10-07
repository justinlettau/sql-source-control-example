IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Production].[ScrapReason]') AND type = 'U')
CREATE TABLE [Production].[ScrapReason]
(
    [ScrapReasonID] smallint NOT NULL IDENTITY(1, 1),
    [Name] Name COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_ScrapReason_ScrapReasonID] PRIMARY KEY ([ScrapReasonID] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Production].[ScrapReason]') AND name = 'AK_ScrapReason_Name')
CREATE UNIQUE NONCLUSTERED INDEX [AK_ScrapReason_Name] ON [Production].[ScrapReason]([Name] ASC)