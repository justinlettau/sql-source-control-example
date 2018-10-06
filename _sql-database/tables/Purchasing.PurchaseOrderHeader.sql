if not exists (select * from sys.objects where object_id = object_id('[Purchasing].[PurchaseOrderHeader]') and type = 'U')
create table [Purchasing].[PurchaseOrderHeader]
(
    [PurchaseOrderID] int not null identity(1, 1),
    [RevisionNumber] tinyint not null default((0)),
    [Status] tinyint not null default((1)),
    [EmployeeID] int not null,
    [VendorID] int not null,
    [ShipMethodID] int not null,
    [OrderDate] datetime not null default(getdate()),
    [ShipDate] datetime null,
    [SubTotal] money not null default((0.00)),
    [TaxAmt] money not null default((0.00)),
    [Freight] money not null default((0.00)),
    [TotalDue] as (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_PurchaseOrderHeader_PurchaseOrderID] primary key ([PurchaseOrderID] asc)
)

alter table [Purchasing].[PurchaseOrderHeader] with check add constraint [FK_PurchaseOrderHeader_ShipMethod_ShipMethodID] foreign key([ShipMethodID]) references [Purchasing].[ShipMethod] ([ShipMethodID]) alter table [Purchasing].[PurchaseOrderHeader] check constraint [FK_PurchaseOrderHeader_ShipMethod_ShipMethodID]
alter table [Purchasing].[PurchaseOrderHeader] with check add constraint [FK_PurchaseOrderHeader_Vendor_VendorID] foreign key([VendorID]) references [Purchasing].[Vendor] ([BusinessEntityID]) alter table [Purchasing].[PurchaseOrderHeader] check constraint [FK_PurchaseOrderHeader_Vendor_VendorID]
alter table [HumanResources].[PurchaseOrderHeader] with check add constraint [FK_PurchaseOrderHeader_Employee_EmployeeID] foreign key([EmployeeID]) references [HumanResources].[Employee] ([BusinessEntityID]) alter table [HumanResources].[PurchaseOrderHeader] check constraint [FK_PurchaseOrderHeader_Employee_EmployeeID]


if not exists (select * from sys.indexes where object_id = object_id('[Purchasing].[PurchaseOrderHeader]') and name = 'IX_PurchaseOrderHeader_VendorID')
create nonclustered index [IX_PurchaseOrderHeader_VendorID] on [Purchasing].[PurchaseOrderHeader]([VendorID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Purchasing].[PurchaseOrderHeader]') and name = 'IX_PurchaseOrderHeader_EmployeeID')
create nonclustered index [IX_PurchaseOrderHeader_EmployeeID] on [Purchasing].[PurchaseOrderHeader]([EmployeeID] asc)