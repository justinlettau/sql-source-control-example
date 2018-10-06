if not exists (select * from sys.objects where object_id = object_id('[Production].[Product]') and type = 'U')
create table [Production].[Product]
(
    [ProductID] int not null identity(1, 1),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [ProductNumber] nvarchar(25) collate SQL_Latin1_General_CP1_CI_AS not null,
    [MakeFlag] Flag not null default((1)),
    [FinishedGoodsFlag] Flag not null default((1)),
    [Color] nvarchar(15) collate SQL_Latin1_General_CP1_CI_AS null,
    [SafetyStockLevel] smallint not null,
    [ReorderPoint] smallint not null,
    [StandardCost] money not null,
    [ListPrice] money not null,
    [Size] nvarchar(5) collate SQL_Latin1_General_CP1_CI_AS null,
    [SizeUnitMeasureCode] nchar(3) collate SQL_Latin1_General_CP1_CI_AS null,
    [WeightUnitMeasureCode] nchar(3) collate SQL_Latin1_General_CP1_CI_AS null,
    [Weight] decimal(8, 2) null,
    [DaysToManufacture] int not null,
    [ProductLine] nchar(2) collate SQL_Latin1_General_CP1_CI_AS null,
    [Class] nchar(2) collate SQL_Latin1_General_CP1_CI_AS null,
    [Style] nchar(2) collate SQL_Latin1_General_CP1_CI_AS null,
    [ProductSubcategoryID] int null,
    [ProductModelID] int null,
    [SellStartDate] datetime not null,
    [SellEndDate] datetime null,
    [DiscontinuedDate] datetime null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Product_ProductID] primary key ([ProductID] asc)
)

alter table [Production].[Product] with check add constraint [FK_Product_ProductModel_ProductModelID] foreign key([ProductModelID]) references [Production].[ProductModel] ([ProductModelID]) alter table [Production].[Product] check constraint [FK_Product_ProductModel_ProductModelID]
alter table [Production].[Product] with check add constraint [FK_Product_ProductSubcategory_ProductSubcategoryID] foreign key([ProductSubcategoryID]) references [Production].[ProductSubcategory] ([ProductSubcategoryID]) alter table [Production].[Product] check constraint [FK_Product_ProductSubcategory_ProductSubcategoryID]
alter table [Production].[Product] with check add constraint [FK_Product_UnitMeasure_SizeUnitMeasureCode] foreign key([SizeUnitMeasureCode]) references [Production].[UnitMeasure] ([UnitMeasureCode]) alter table [Production].[Product] check constraint [FK_Product_UnitMeasure_SizeUnitMeasureCode]
alter table [Production].[Product] with check add constraint [FK_Product_UnitMeasure_WeightUnitMeasureCode] foreign key([WeightUnitMeasureCode]) references [Production].[UnitMeasure] ([UnitMeasureCode]) alter table [Production].[Product] check constraint [FK_Product_UnitMeasure_WeightUnitMeasureCode]


if not exists (select * from sys.indexes where object_id = object_id('[Production].[Product]') and name = 'AK_Product_ProductNumber')
create unique nonclustered index [AK_Product_ProductNumber] on [Production].[Product]([ProductNumber] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[Product]') and name = 'AK_Product_Name')
create unique nonclustered index [AK_Product_Name] on [Production].[Product]([Name] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[Product]') and name = 'AK_Product_rowguid')
create unique nonclustered index [AK_Product_rowguid] on [Production].[Product]([rowguid] asc)