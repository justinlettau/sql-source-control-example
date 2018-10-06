if not exists (select * from sys.objects where object_id = object_id('[Sales].[SalesOrderDetail]') and type = 'U')
create table [Sales].[SalesOrderDetail]
(
    [SalesOrderID] int not null,
    [SalesOrderDetailID] int not null identity(1, 1),
    [CarrierTrackingNumber] nvarchar(25) collate SQL_Latin1_General_CP1_CI_AS null,
    [OrderQty] smallint not null,
    [ProductID] int not null,
    [SpecialOfferID] int not null,
    [UnitPrice] money not null,
    [UnitPriceDiscount] money not null default((0.0)),
    [LineTotal] as (isnull(([UnitPrice]*((1.0)-[UnitPriceDiscount]))*[OrderQty],(0.0))),
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID] primary key ([SalesOrderID] asc)
    constraint [PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID] primary key ([SalesOrderDetailID] asc)
)

alter table [Sales].[SalesOrderDetail] with check add constraint [FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID] foreign key([SpecialOfferID]) references [Sales].[SpecialOfferProduct] ([SpecialOfferID]) alter table [Sales].[SalesOrderDetail] check constraint [FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]
alter table [Sales].[SalesOrderDetail] with check add constraint [FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID] foreign key([ProductID]) references [Sales].[SpecialOfferProduct] ([ProductID]) alter table [Sales].[SalesOrderDetail] check constraint [FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]
alter table [Sales].[SalesOrderDetail] with check add constraint [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID] foreign key([SalesOrderID]) references [Sales].[SalesOrderHeader] ([SalesOrderID]) on delete cascade alter table [Sales].[SalesOrderDetail] check constraint [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]


if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SalesOrderDetail]') and name = 'AK_SalesOrderDetail_rowguid')
create unique nonclustered index [AK_SalesOrderDetail_rowguid] on [Sales].[SalesOrderDetail]([rowguid] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SalesOrderDetail]') and name = 'IX_SalesOrderDetail_ProductID')
create nonclustered index [IX_SalesOrderDetail_ProductID] on [Sales].[SalesOrderDetail]([ProductID] asc)