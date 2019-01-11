IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Purchasing].[Vendor]') AND type = 'U')
CREATE TABLE [Purchasing].[Vendor]
(
    [BusinessEntityID] int NOT NULL,
    [AccountNumber] AccountNumber COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [Name] Name COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [CreditRating] tinyint NOT NULL,
    [PreferredVendorStatus] Flag NOT NULL DEFAULT((1)),
    [ActiveFlag] Flag NOT NULL DEFAULT((1)),
    [PurchasingWebServiceURL] nvarchar(1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_Vendor_BusinessEntityID] PRIMARY KEY CLUSTERED (
        [BusinessEntityID] ASC
    )
)

ALTER TABLE [Person].[Vendor] WITH CHECK ADD CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])
ALTER TABLE [Person].[Vendor] CHECK CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID]

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Purchasing].[Vendor]') AND name = 'AK_Vendor_AccountNumber')
CREATE UNIQUE NONCLUSTERED INDEX [AK_Vendor_AccountNumber] ON [Purchasing].[Vendor]([AccountNumber] ASC)