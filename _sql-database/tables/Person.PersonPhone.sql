if not exists (select * from sys.objects where object_id = object_id('[Person].[PersonPhone]') and type = 'U')
create table [Person].[PersonPhone]
(
    [BusinessEntityID] int not null,
    [PhoneNumber] Phone collate SQL_Latin1_General_CP1_CI_AS not null,
    [PhoneNumberTypeID] int not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID] primary key ([BusinessEntityID] asc)
    constraint [PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID] primary key ([PhoneNumber] asc)
    constraint [PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID] primary key ([PhoneNumberTypeID] asc)
)

alter table [Person].[PersonPhone] with check add constraint [FK_PersonPhone_Person_BusinessEntityID] foreign key([BusinessEntityID]) references [Person].[Person] ([BusinessEntityID]) alter table [Person].[PersonPhone] check constraint [FK_PersonPhone_Person_BusinessEntityID]
alter table [Person].[PersonPhone] with check add constraint [FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID] foreign key([PhoneNumberTypeID]) references [Person].[PhoneNumberType] ([PhoneNumberTypeID]) alter table [Person].[PersonPhone] check constraint [FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID]


if not exists (select * from sys.indexes where object_id = object_id('[Person].[PersonPhone]') and name = 'IX_PersonPhone_PhoneNumber')
create nonclustered index [IX_PersonPhone_PhoneNumber] on [Person].[PersonPhone]([PhoneNumber] asc)