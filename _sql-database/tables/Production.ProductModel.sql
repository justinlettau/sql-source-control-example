if not exists (select * from sys.objects where object_id = object_id('[Production].[ProductModel]') and type = 'U')
create table [Production].[ProductModel]
(
    [ProductModelID] int not null identity(1, 1),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [CatalogDescription] xml null,
    [Instructions] xml null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ProductModel_ProductModelID] primary key ([ProductModelID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Production].[ProductModel]') and name = 'AK_ProductModel_Name')
create unique nonclustered index [AK_ProductModel_Name] on [Production].[ProductModel]([Name] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[ProductModel]') and name = 'AK_ProductModel_rowguid')
create unique nonclustered index [AK_ProductModel_rowguid] on [Production].[ProductModel]([rowguid] asc)