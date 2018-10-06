if not exists (select * from sys.objects where object_id = object_id('[Sales].[CountryRegionCurrency]') and type = 'U')
create table [Sales].[CountryRegionCurrency]
(
    [CountryRegionCode] nvarchar(3) collate SQL_Latin1_General_CP1_CI_AS not null,
    [CurrencyCode] nchar(3) collate SQL_Latin1_General_CP1_CI_AS not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode] primary key ([CountryRegionCode] asc)
    constraint [PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode] primary key ([CurrencyCode] asc)
)

alter table [Person].[CountryRegionCurrency] with check add constraint [FK_CountryRegionCurrency_CountryRegion_CountryRegionCode] foreign key([CountryRegionCode]) references [Person].[CountryRegion] ([CountryRegionCode]) alter table [Person].[CountryRegionCurrency] check constraint [FK_CountryRegionCurrency_CountryRegion_CountryRegionCode]
alter table [Sales].[CountryRegionCurrency] with check add constraint [FK_CountryRegionCurrency_Currency_CurrencyCode] foreign key([CurrencyCode]) references [Sales].[Currency] ([CurrencyCode]) alter table [Sales].[CountryRegionCurrency] check constraint [FK_CountryRegionCurrency_Currency_CurrencyCode]


if not exists (select * from sys.indexes where object_id = object_id('[Sales].[CountryRegionCurrency]') and name = 'IX_CountryRegionCurrency_CurrencyCode')
create nonclustered index [IX_CountryRegionCurrency_CurrencyCode] on [Sales].[CountryRegionCurrency]([CurrencyCode] asc)