if not exists (select * from sys.objects where object_id = object_id('[Sales].[CurrencyRate]') and type = 'U')
create table [Sales].[CurrencyRate]
(
    [CurrencyRateID] int not null identity(1, 1),
    [CurrencyRateDate] datetime not null,
    [FromCurrencyCode] nchar(3) collate SQL_Latin1_General_CP1_CI_AS not null,
    [ToCurrencyCode] nchar(3) collate SQL_Latin1_General_CP1_CI_AS not null,
    [AverageRate] money not null,
    [EndOfDayRate] money not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_CurrencyRate_CurrencyRateID] primary key ([CurrencyRateID] asc)
)

alter table [Sales].[CurrencyRate] with check add constraint [FK_CurrencyRate_Currency_FromCurrencyCode] foreign key([FromCurrencyCode]) references [Sales].[Currency] ([CurrencyCode]) alter table [Sales].[CurrencyRate] check constraint [FK_CurrencyRate_Currency_FromCurrencyCode]
alter table [Sales].[CurrencyRate] with check add constraint [FK_CurrencyRate_Currency_ToCurrencyCode] foreign key([ToCurrencyCode]) references [Sales].[Currency] ([CurrencyCode]) alter table [Sales].[CurrencyRate] check constraint [FK_CurrencyRate_Currency_ToCurrencyCode]


if not exists (select * from sys.indexes where object_id = object_id('[Sales].[CurrencyRate]') and name = 'AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode')
create unique nonclustered index [AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode] on [Sales].[CurrencyRate]([CurrencyRateDate] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Sales].[CurrencyRate]') and name = 'AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode')
create unique nonclustered index [AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode] on [Sales].[CurrencyRate]([FromCurrencyCode] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Sales].[CurrencyRate]') and name = 'AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode')
create unique nonclustered index [AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode] on [Sales].[CurrencyRate]([ToCurrencyCode] asc)