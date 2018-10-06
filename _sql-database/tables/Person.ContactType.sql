if not exists (select * from sys.objects where object_id = object_id('[Person].[ContactType]') and type = 'U')
create table [Person].[ContactType]
(
    [ContactTypeID] int not null identity(1, 1),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ContactType_ContactTypeID] primary key ([ContactTypeID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Person].[ContactType]') and name = 'AK_ContactType_Name')
create unique nonclustered index [AK_ContactType_Name] on [Person].[ContactType]([Name] asc)