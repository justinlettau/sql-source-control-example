if not exists (select * from sys.objects where object_id = object_id('[Sales].[Currency]') and type = 'U')
create table [Sales].[Currency]
(
    [CurrencyCode] nchar(3) collate SQL_Latin1_General_CP1_CI_AS not null,
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Currency_CurrencyCode] primary key ([CurrencyCode] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Sales].[Currency]') and name = 'AK_Currency_Name')
create unique nonclustered index [AK_Currency_Name] on [Sales].[Currency]([Name] asc)