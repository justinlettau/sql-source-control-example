if not exists (select * from sys.objects where object_id = object_id('[Person].[Password]') and type = 'U')
create table [Person].[Password]
(
    [BusinessEntityID] int not null,
    [PasswordHash] varchar(128) collate SQL_Latin1_General_CP1_CI_AS not null,
    [PasswordSalt] varchar(10) collate SQL_Latin1_General_CP1_CI_AS not null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Password_BusinessEntityID] primary key ([BusinessEntityID] asc)
)

alter table [Person].[Password] with check add constraint [FK_Password_Person_BusinessEntityID] foreign key([BusinessEntityID]) references [Person].[Person] ([BusinessEntityID]) alter table [Person].[Password] check constraint [FK_Password_Person_BusinessEntityID]