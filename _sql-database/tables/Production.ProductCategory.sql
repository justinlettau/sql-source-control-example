if not exists (select * from sys.objects where object_id = object_id('[Production].[ProductCategory]') and type = 'U')
create table [Production].[ProductCategory]
(
    [ProductCategoryID] int not null identity(1, 1),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ProductCategory_ProductCategoryID] primary key ([ProductCategoryID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Production].[ProductCategory]') and name = 'AK_ProductCategory_Name')
create unique nonclustered index [AK_ProductCategory_Name] on [Production].[ProductCategory]([Name] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[ProductCategory]') and name = 'AK_ProductCategory_rowguid')
create unique nonclustered index [AK_ProductCategory_rowguid] on [Production].[ProductCategory]([rowguid] asc)