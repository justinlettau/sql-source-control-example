IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Sales].[SalesReason]') AND type = 'U')
CREATE TABLE [Sales].[SalesReason]
(
    [SalesReasonID] int NOT NULL IDENTITY(1, 1),
    [Name] Name COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [ReasonType] Name COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_SalesReason_SalesReasonID] PRIMARY KEY CLUSTERED (
        [SalesReasonID] ASC
    )
)