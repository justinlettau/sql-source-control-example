if not exists (select * from sys.objects where object_id = object_id('[Sales].[SpecialOfferProduct]') and type = 'U')
create table [Sales].[SpecialOfferProduct]
(
    [SpecialOfferID] int not null,
    [ProductID] int not null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_SpecialOfferProduct_SpecialOfferID_ProductID] primary key ([SpecialOfferID] asc)
    constraint [PK_SpecialOfferProduct_SpecialOfferID_ProductID] primary key ([ProductID] asc)
)

alter table [Production].[SpecialOfferProduct] with check add constraint [FK_SpecialOfferProduct_Product_ProductID] foreign key([ProductID]) references [Production].[Product] ([ProductID]) alter table [Production].[SpecialOfferProduct] check constraint [FK_SpecialOfferProduct_Product_ProductID]
alter table [Sales].[SpecialOfferProduct] with check add constraint [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID] foreign key([SpecialOfferID]) references [Sales].[SpecialOffer] ([SpecialOfferID]) alter table [Sales].[SpecialOfferProduct] check constraint [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]


if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SpecialOfferProduct]') and name = 'AK_SpecialOfferProduct_rowguid')
create unique nonclustered index [AK_SpecialOfferProduct_rowguid] on [Sales].[SpecialOfferProduct]([rowguid] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SpecialOfferProduct]') and name = 'IX_SpecialOfferProduct_ProductID')
create nonclustered index [IX_SpecialOfferProduct_ProductID] on [Sales].[SpecialOfferProduct]([ProductID] asc)