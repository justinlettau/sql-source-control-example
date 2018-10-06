if not exists (select * from sys.objects where object_id = object_id('[Purchasing].[Vendor]') and type = 'U')
create table [Purchasing].[Vendor]
(
    [BusinessEntityID] int not null,
    [AccountNumber] AccountNumber collate SQL_Latin1_General_CP1_CI_AS not null,
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [CreditRating] tinyint not null,
    [PreferredVendorStatus] Flag not null default((1)),
    [ActiveFlag] Flag not null default((1)),
    [PurchasingWebServiceURL] nvarchar(1024) collate SQL_Latin1_General_CP1_CI_AS null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Vendor_BusinessEntityID] primary key ([BusinessEntityID] asc)
)

alter table [Person].[Vendor] with check add constraint [FK_Vendor_BusinessEntity_BusinessEntityID] foreign key([BusinessEntityID]) references [Person].[BusinessEntity] ([BusinessEntityID]) alter table [Person].[Vendor] check constraint [FK_Vendor_BusinessEntity_BusinessEntityID]


if not exists (select * from sys.indexes where object_id = object_id('[Purchasing].[Vendor]') and name = 'AK_Vendor_AccountNumber')
create unique nonclustered index [AK_Vendor_AccountNumber] on [Purchasing].[Vendor]([AccountNumber] asc)