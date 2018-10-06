if not exists (select * from sys.objects where object_id = object_id('[Production].[ProductInventory]') and type = 'U')
create table [Production].[ProductInventory]
(
    [ProductID] int not null,
    [LocationID] smallint not null,
    [Shelf] nvarchar(10) collate SQL_Latin1_General_CP1_CI_AS not null,
    [Bin] tinyint not null,
    [Quantity] smallint not null default((0)),
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ProductInventory_ProductID_LocationID] primary key ([ProductID] asc)
    constraint [PK_ProductInventory_ProductID_LocationID] primary key ([LocationID] asc)
)

alter table [Production].[ProductInventory] with check add constraint [FK_ProductInventory_Location_LocationID] foreign key([LocationID]) references [Production].[Location] ([LocationID]) alter table [Production].[ProductInventory] check constraint [FK_ProductInventory_Location_LocationID]
alter table [Production].[ProductInventory] with check add constraint [FK_ProductInventory_Product_ProductID] foreign key([ProductID]) references [Production].[Product] ([ProductID]) alter table [Production].[ProductInventory] check constraint [FK_ProductInventory_Product_ProductID]