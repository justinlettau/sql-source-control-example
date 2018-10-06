if not exists (select * from sys.objects where object_id = object_id('[Person].[AddressType]') and type = 'U')
create table [Person].[AddressType]
(
    [AddressTypeID] int not null identity(1, 1),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_AddressType_AddressTypeID] primary key ([AddressTypeID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Person].[AddressType]') and name = 'AK_AddressType_rowguid')
create unique nonclustered index [AK_AddressType_rowguid] on [Person].[AddressType]([rowguid] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[AddressType]') and name = 'AK_AddressType_Name')
create unique nonclustered index [AK_AddressType_Name] on [Person].[AddressType]([Name] asc)