if not exists (select * from sys.objects where object_id = object_id('[Person].[EmailAddress]') and type = 'U')
create table [Person].[EmailAddress]
(
    [BusinessEntityID] int not null,
    [EmailAddressID] int not null identity(1, 1),
    [EmailAddress] nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_EmailAddress_BusinessEntityID_EmailAddressID] primary key ([BusinessEntityID] asc)
    constraint [PK_EmailAddress_BusinessEntityID_EmailAddressID] primary key ([EmailAddressID] asc)
)

alter table [Person].[EmailAddress] with check add constraint [FK_EmailAddress_Person_BusinessEntityID] foreign key([BusinessEntityID]) references [Person].[Person] ([BusinessEntityID]) alter table [Person].[EmailAddress] check constraint [FK_EmailAddress_Person_BusinessEntityID]


if not exists (select * from sys.indexes where object_id = object_id('[Person].[EmailAddress]') and name = 'IX_EmailAddress_EmailAddress')
create nonclustered index [IX_EmailAddress_EmailAddress] on [Person].[EmailAddress]([EmailAddress] asc)