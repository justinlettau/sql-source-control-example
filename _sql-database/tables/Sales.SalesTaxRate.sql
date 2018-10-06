if not exists (select * from sys.objects where object_id = object_id('[Sales].[SalesTaxRate]') and type = 'U')
create table [Sales].[SalesTaxRate]
(
    [SalesTaxRateID] int not null identity(1, 1),
    [StateProvinceID] int not null,
    [TaxType] tinyint not null,
    [TaxRate] smallmoney not null default((0.00)),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_SalesTaxRate_SalesTaxRateID] primary key ([SalesTaxRateID] asc)
)

alter table [Person].[SalesTaxRate] with check add constraint [FK_SalesTaxRate_StateProvince_StateProvinceID] foreign key([StateProvinceID]) references [Person].[StateProvince] ([StateProvinceID]) alter table [Person].[SalesTaxRate] check constraint [FK_SalesTaxRate_StateProvince_StateProvinceID]


if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SalesTaxRate]') and name = 'AK_SalesTaxRate_StateProvinceID_TaxType')
create unique nonclustered index [AK_SalesTaxRate_StateProvinceID_TaxType] on [Sales].[SalesTaxRate]([StateProvinceID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SalesTaxRate]') and name = 'AK_SalesTaxRate_StateProvinceID_TaxType')
create unique nonclustered index [AK_SalesTaxRate_StateProvinceID_TaxType] on [Sales].[SalesTaxRate]([TaxType] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SalesTaxRate]') and name = 'AK_SalesTaxRate_rowguid')
create unique nonclustered index [AK_SalesTaxRate_rowguid] on [Sales].[SalesTaxRate]([rowguid] asc)