if not exists (select * from sys.objects where object_id = object_id('[Production].[Culture]') and type = 'U')
create table [Production].[Culture]
(
    [CultureID] nchar(6) collate SQL_Latin1_General_CP1_CI_AS not null,
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Culture_CultureID] primary key ([CultureID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Production].[Culture]') and name = 'AK_Culture_Name')
create unique nonclustered index [AK_Culture_Name] on [Production].[Culture]([Name] asc)