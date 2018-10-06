if not exists (select * from sys.objects where object_id = object_id('[Sales].[ShoppingCartItem]') and type = 'U')
create table [Sales].[ShoppingCartItem]
(
    [ShoppingCartItemID] int not null identity(1, 1),
    [ShoppingCartID] nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS not null,
    [Quantity] int not null default((1)),
    [ProductID] int not null,
    [DateCreated] datetime not null default(getdate()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ShoppingCartItem_ShoppingCartItemID] primary key ([ShoppingCartItemID] asc)
)

alter table [Production].[ShoppingCartItem] with check add constraint [FK_ShoppingCartItem_Product_ProductID] foreign key([ProductID]) references [Production].[Product] ([ProductID]) alter table [Production].[ShoppingCartItem] check constraint [FK_ShoppingCartItem_Product_ProductID]


if not exists (select * from sys.indexes where object_id = object_id('[Sales].[ShoppingCartItem]') and name = 'IX_ShoppingCartItem_ShoppingCartID_ProductID')
create nonclustered index [IX_ShoppingCartItem_ShoppingCartID_ProductID] on [Sales].[ShoppingCartItem]([ShoppingCartID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Sales].[ShoppingCartItem]') and name = 'IX_ShoppingCartItem_ShoppingCartID_ProductID')
create nonclustered index [IX_ShoppingCartItem_ShoppingCartID_ProductID] on [Sales].[ShoppingCartItem]([ProductID] asc)