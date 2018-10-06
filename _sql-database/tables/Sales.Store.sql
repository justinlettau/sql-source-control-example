if not exists (select * from sys.objects where object_id = object_id('[Sales].[Store]') and type = 'U')
create table [Sales].[Store]
(
    [BusinessEntityID] int not null,
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [SalesPersonID] int null,
    [Demographics] xml null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Store_BusinessEntityID] primary key ([BusinessEntityID] asc)
)

alter table [Sales].[Store] with check add constraint [FK_Store_SalesPerson_SalesPersonID] foreign key([SalesPersonID]) references [Sales].[SalesPerson] ([BusinessEntityID]) alter table [Sales].[Store] check constraint [FK_Store_SalesPerson_SalesPersonID]
alter table [Person].[Store] with check add constraint [FK_Store_BusinessEntity_BusinessEntityID] foreign key([BusinessEntityID]) references [Person].[BusinessEntity] ([BusinessEntityID]) alter table [Person].[Store] check constraint [FK_Store_BusinessEntity_BusinessEntityID]


if not exists (select * from sys.indexes where object_id = object_id('[Sales].[Store]') and name = 'AK_Store_rowguid')
create unique nonclustered index [AK_Store_rowguid] on [Sales].[Store]([rowguid] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Sales].[Store]') and name = 'IX_Store_SalesPersonID')
create nonclustered index [IX_Store_SalesPersonID] on [Sales].[Store]([SalesPersonID] asc)