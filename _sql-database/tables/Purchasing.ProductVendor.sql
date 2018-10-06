if not exists (select * from sys.objects where object_id = object_id('[Purchasing].[ProductVendor]') and type = 'U')
create table [Purchasing].[ProductVendor]
(
    [ProductID] int not null,
    [BusinessEntityID] int not null,
    [AverageLeadTime] int not null,
    [StandardPrice] money not null,
    [LastReceiptCost] money null,
    [LastReceiptDate] datetime null,
    [MinOrderQty] int not null,
    [MaxOrderQty] int not null,
    [OnOrderQty] int null,
    [UnitMeasureCode] nchar(3) collate SQL_Latin1_General_CP1_CI_AS not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ProductVendor_ProductID_BusinessEntityID] primary key ([ProductID] asc)
    constraint [PK_ProductVendor_ProductID_BusinessEntityID] primary key ([BusinessEntityID] asc)
)

alter table [Production].[ProductVendor] with check add constraint [FK_ProductVendor_Product_ProductID] foreign key([ProductID]) references [Production].[Product] ([ProductID]) alter table [Production].[ProductVendor] check constraint [FK_ProductVendor_Product_ProductID]
alter table [Production].[ProductVendor] with check add constraint [FK_ProductVendor_UnitMeasure_UnitMeasureCode] foreign key([UnitMeasureCode]) references [Production].[UnitMeasure] ([UnitMeasureCode]) alter table [Production].[ProductVendor] check constraint [FK_ProductVendor_UnitMeasure_UnitMeasureCode]
alter table [Purchasing].[ProductVendor] with check add constraint [FK_ProductVendor_Vendor_BusinessEntityID] foreign key([BusinessEntityID]) references [Purchasing].[Vendor] ([BusinessEntityID]) alter table [Purchasing].[ProductVendor] check constraint [FK_ProductVendor_Vendor_BusinessEntityID]


if not exists (select * from sys.indexes where object_id = object_id('[Purchasing].[ProductVendor]') and name = 'IX_ProductVendor_UnitMeasureCode')
create nonclustered index [IX_ProductVendor_UnitMeasureCode] on [Purchasing].[ProductVendor]([UnitMeasureCode] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Purchasing].[ProductVendor]') and name = 'IX_ProductVendor_BusinessEntityID')
create nonclustered index [IX_ProductVendor_BusinessEntityID] on [Purchasing].[ProductVendor]([BusinessEntityID] asc)