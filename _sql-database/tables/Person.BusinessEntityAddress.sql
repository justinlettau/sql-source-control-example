if not exists (select * from sys.objects where object_id = object_id('[Person].[BusinessEntityAddress]') and type = 'U')
create table [Person].[BusinessEntityAddress]
(
    [BusinessEntityID] int not null,
    [AddressID] int not null,
    [AddressTypeID] int not null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID] primary key ([BusinessEntityID] asc)
    constraint [PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID] primary key ([AddressID] asc)
    constraint [PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID] primary key ([AddressTypeID] asc)
)

alter table [Person].[BusinessEntityAddress] with check add constraint [FK_BusinessEntityAddress_Address_AddressID] foreign key([AddressID]) references [Person].[Address] ([AddressID]) alter table [Person].[BusinessEntityAddress] check constraint [FK_BusinessEntityAddress_Address_AddressID]
alter table [Person].[BusinessEntityAddress] with check add constraint [FK_BusinessEntityAddress_AddressType_AddressTypeID] foreign key([AddressTypeID]) references [Person].[AddressType] ([AddressTypeID]) alter table [Person].[BusinessEntityAddress] check constraint [FK_BusinessEntityAddress_AddressType_AddressTypeID]
alter table [Person].[BusinessEntityAddress] with check add constraint [FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID] foreign key([BusinessEntityID]) references [Person].[BusinessEntity] ([BusinessEntityID]) alter table [Person].[BusinessEntityAddress] check constraint [FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID]


if not exists (select * from sys.indexes where object_id = object_id('[Person].[BusinessEntityAddress]') and name = 'AK_BusinessEntityAddress_rowguid')
create unique nonclustered index [AK_BusinessEntityAddress_rowguid] on [Person].[BusinessEntityAddress]([rowguid] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[BusinessEntityAddress]') and name = 'IX_BusinessEntityAddress_AddressID')
create nonclustered index [IX_BusinessEntityAddress_AddressID] on [Person].[BusinessEntityAddress]([AddressID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[BusinessEntityAddress]') and name = 'IX_BusinessEntityAddress_AddressTypeID')
create nonclustered index [IX_BusinessEntityAddress_AddressTypeID] on [Person].[BusinessEntityAddress]([AddressTypeID] asc)