if not exists (select * from sys.objects where object_id = object_id('[Purchasing].[PurchaseOrderDetail]') and type = 'U')
create table [Purchasing].[PurchaseOrderDetail]
(
    [PurchaseOrderID] int not null,
    [PurchaseOrderDetailID] int not null identity(1, 1),
    [DueDate] datetime not null,
    [OrderQty] smallint not null,
    [ProductID] int not null,
    [UnitPrice] money not null,
    [LineTotal] as (isnull([OrderQty]*[UnitPrice],(0.00))),
    [ReceivedQty] decimal(8, 2) not null,
    [RejectedQty] decimal(8, 2) not null,
    [StockedQty] as (isnull([ReceivedQty]-[RejectedQty],(0.00))),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID] primary key ([PurchaseOrderID] asc)
    constraint [PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID] primary key ([PurchaseOrderDetailID] asc)
)

alter table [Production].[PurchaseOrderDetail] with check add constraint [FK_PurchaseOrderDetail_Product_ProductID] foreign key([ProductID]) references [Production].[Product] ([ProductID]) alter table [Production].[PurchaseOrderDetail] check constraint [FK_PurchaseOrderDetail_Product_ProductID]
alter table [Purchasing].[PurchaseOrderDetail] with check add constraint [FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID] foreign key([PurchaseOrderID]) references [Purchasing].[PurchaseOrderHeader] ([PurchaseOrderID]) alter table [Purchasing].[PurchaseOrderDetail] check constraint [FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID]


if not exists (select * from sys.indexes where object_id = object_id('[Purchasing].[PurchaseOrderDetail]') and name = 'IX_PurchaseOrderDetail_ProductID')
create nonclustered index [IX_PurchaseOrderDetail_ProductID] on [Purchasing].[PurchaseOrderDetail]([ProductID] asc)