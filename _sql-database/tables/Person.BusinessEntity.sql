if not exists (select * from sys.objects where object_id = object_id('[Person].[BusinessEntity]') and type = 'U')
create table [Person].[BusinessEntity]
(
    [BusinessEntityID] int not null identity(1, 1),
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_BusinessEntity_BusinessEntityID] primary key ([BusinessEntityID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Person].[BusinessEntity]') and name = 'AK_BusinessEntity_rowguid')
create unique nonclustered index [AK_BusinessEntity_rowguid] on [Person].[BusinessEntity]([rowguid] asc)