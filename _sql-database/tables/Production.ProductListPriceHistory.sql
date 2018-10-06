if not exists (select * from sys.objects where object_id = object_id('[Production].[ProductListPriceHistory]') and type = 'U')
create table [Production].[ProductListPriceHistory]
(
    [ProductID] int not null,
    [StartDate] datetime not null,
    [EndDate] datetime null,
    [ListPrice] money not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ProductListPriceHistory_ProductID_StartDate] primary key ([ProductID] asc)
    constraint [PK_ProductListPriceHistory_ProductID_StartDate] primary key ([StartDate] asc)
)

alter table [Production].[ProductListPriceHistory] with check add constraint [FK_ProductListPriceHistory_Product_ProductID] foreign key([ProductID]) references [Production].[Product] ([ProductID]) alter table [Production].[ProductListPriceHistory] check constraint [FK_ProductListPriceHistory_Product_ProductID]