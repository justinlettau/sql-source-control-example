if not exists (select * from sys.objects where object_id = object_id('[Person].[PhoneNumberType]') and type = 'U')
create table [Person].[PhoneNumberType]
(
    [PhoneNumberTypeID] int not null identity(1, 1),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_PhoneNumberType_PhoneNumberTypeID] primary key ([PhoneNumberTypeID] asc)
)