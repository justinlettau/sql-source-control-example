if not exists (select * from sys.objects where object_id = object_id('[Production].[ProductSubcategory]') and type = 'U')
create table [Production].[ProductSubcategory]
(
    [ProductSubcategoryID] int not null identity(1, 1),
    [ProductCategoryID] int not null,
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ProductSubcategory_ProductSubcategoryID] primary key ([ProductSubcategoryID] asc)
)

alter table [Production].[ProductSubcategory] with check add constraint [FK_ProductSubcategory_ProductCategory_ProductCategoryID] foreign key([ProductCategoryID]) references [Production].[ProductCategory] ([ProductCategoryID]) alter table [Production].[ProductSubcategory] check constraint [FK_ProductSubcategory_ProductCategory_ProductCategoryID]


if not exists (select * from sys.indexes where object_id = object_id('[Production].[ProductSubcategory]') and name = 'AK_ProductSubcategory_Name')
create unique nonclustered index [AK_ProductSubcategory_Name] on [Production].[ProductSubcategory]([Name] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[ProductSubcategory]') and name = 'AK_ProductSubcategory_rowguid')
create unique nonclustered index [AK_ProductSubcategory_rowguid] on [Production].[ProductSubcategory]([rowguid] asc)