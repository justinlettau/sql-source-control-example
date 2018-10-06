if not exists (select * from sys.objects where object_id = object_id('[Person].[BusinessEntityContact]') and type = 'U')
create table [Person].[BusinessEntityContact]
(
    [BusinessEntityID] int not null,
    [PersonID] int not null,
    [ContactTypeID] int not null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID] primary key ([BusinessEntityID] asc)
    constraint [PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID] primary key ([PersonID] asc)
    constraint [PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID] primary key ([ContactTypeID] asc)
)

alter table [Person].[BusinessEntityContact] with check add constraint [FK_BusinessEntityContact_Person_PersonID] foreign key([PersonID]) references [Person].[Person] ([BusinessEntityID]) alter table [Person].[BusinessEntityContact] check constraint [FK_BusinessEntityContact_Person_PersonID]
alter table [Person].[BusinessEntityContact] with check add constraint [FK_BusinessEntityContact_BusinessEntity_BusinessEntityID] foreign key([BusinessEntityID]) references [Person].[BusinessEntity] ([BusinessEntityID]) alter table [Person].[BusinessEntityContact] check constraint [FK_BusinessEntityContact_BusinessEntity_BusinessEntityID]
alter table [Person].[BusinessEntityContact] with check add constraint [FK_BusinessEntityContact_ContactType_ContactTypeID] foreign key([ContactTypeID]) references [Person].[ContactType] ([ContactTypeID]) alter table [Person].[BusinessEntityContact] check constraint [FK_BusinessEntityContact_ContactType_ContactTypeID]


if not exists (select * from sys.indexes where object_id = object_id('[Person].[BusinessEntityContact]') and name = 'AK_BusinessEntityContact_rowguid')
create unique nonclustered index [AK_BusinessEntityContact_rowguid] on [Person].[BusinessEntityContact]([rowguid] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[BusinessEntityContact]') and name = 'IX_BusinessEntityContact_PersonID')
create nonclustered index [IX_BusinessEntityContact_PersonID] on [Person].[BusinessEntityContact]([PersonID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[BusinessEntityContact]') and name = 'IX_BusinessEntityContact_ContactTypeID')
create nonclustered index [IX_BusinessEntityContact_ContactTypeID] on [Person].[BusinessEntityContact]([ContactTypeID] asc)