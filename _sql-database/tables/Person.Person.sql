if not exists (select * from sys.objects where object_id = object_id('[Person].[Person]') and type = 'U')
create table [Person].[Person]
(
    [BusinessEntityID] int not null,
    [PersonType] nchar(2) collate SQL_Latin1_General_CP1_CI_AS not null,
    [NameStyle] NameStyle not null default((0)),
    [Title] nvarchar(8) collate SQL_Latin1_General_CP1_CI_AS null,
    [FirstName] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [MiddleName] Name collate SQL_Latin1_General_CP1_CI_AS null,
    [LastName] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [Suffix] nvarchar(10) collate SQL_Latin1_General_CP1_CI_AS null,
    [EmailPromotion] int not null default((0)),
    [AdditionalContactInfo] xml null,
    [Demographics] xml null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Person_BusinessEntityID] primary key ([BusinessEntityID] asc)
)

alter table [Person].[Person] with check add constraint [FK_Person_BusinessEntity_BusinessEntityID] foreign key([BusinessEntityID]) references [Person].[BusinessEntity] ([BusinessEntityID]) alter table [Person].[Person] check constraint [FK_Person_BusinessEntity_BusinessEntityID]


if not exists (select * from sys.indexes where object_id = object_id('[Person].[Person]') and name = 'IX_Person_LastName_FirstName_MiddleName')
create nonclustered index [IX_Person_LastName_FirstName_MiddleName] on [Person].[Person]([LastName] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[Person]') and name = 'IX_Person_LastName_FirstName_MiddleName')
create nonclustered index [IX_Person_LastName_FirstName_MiddleName] on [Person].[Person]([FirstName] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[Person]') and name = 'IX_Person_LastName_FirstName_MiddleName')
create nonclustered index [IX_Person_LastName_FirstName_MiddleName] on [Person].[Person]([MiddleName] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[Person]') and name = 'AK_Person_rowguid')
create unique nonclustered index [AK_Person_rowguid] on [Person].[Person]([rowguid] asc)