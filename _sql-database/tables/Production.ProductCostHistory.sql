if not exists (select * from sys.objects where object_id = object_id('[Production].[ProductCostHistory]') and type = 'U')
create table [Production].[ProductCostHistory]
(
    [ProductID] int not null,
    [StartDate] datetime not null,
    [EndDate] datetime null,
    [StandardCost] money not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ProductCostHistory_ProductID_StartDate] primary key ([ProductID] asc)
    constraint [PK_ProductCostHistory_ProductID_StartDate] primary key ([StartDate] asc)
)

alter table [Production].[ProductCostHistory] with check add constraint [FK_ProductCostHistory_Product_ProductID] foreign key([ProductID]) references [Production].[Product] ([ProductID]) alter table [Production].[ProductCostHistory] check constraint [FK_ProductCostHistory_Product_ProductID]