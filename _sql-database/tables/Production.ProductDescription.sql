if not exists (select * from sys.objects where object_id = object_id('[Production].[ProductDescription]') and type = 'U')
create table [Production].[ProductDescription]
(
    [ProductDescriptionID] int not null identity(1, 1),
    [Description] nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS not null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ProductDescription_ProductDescriptionID] primary key ([ProductDescriptionID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Production].[ProductDescription]') and name = 'AK_ProductDescription_rowguid')
create unique nonclustered index [AK_ProductDescription_rowguid] on [Production].[ProductDescription]([rowguid] asc)