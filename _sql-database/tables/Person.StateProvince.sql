if not exists (select * from sys.objects where object_id = object_id('[Person].[StateProvince]') and type = 'U')
create table [Person].[StateProvince]
(
    [StateProvinceID] int not null identity(1, 1),
    [StateProvinceCode] nchar(3) collate SQL_Latin1_General_CP1_CI_AS not null,
    [CountryRegionCode] nvarchar(3) collate SQL_Latin1_General_CP1_CI_AS not null,
    [IsOnlyStateProvinceFlag] Flag not null default((1)),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [TerritoryID] int not null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_StateProvince_StateProvinceID] primary key ([StateProvinceID] asc)
)

alter table [Sales].[StateProvince] with check add constraint [FK_StateProvince_SalesTerritory_TerritoryID] foreign key([TerritoryID]) references [Sales].[SalesTerritory] ([TerritoryID]) alter table [Sales].[StateProvince] check constraint [FK_StateProvince_SalesTerritory_TerritoryID]
alter table [Person].[StateProvince] with check add constraint [FK_StateProvince_CountryRegion_CountryRegionCode] foreign key([CountryRegionCode]) references [Person].[CountryRegion] ([CountryRegionCode]) alter table [Person].[StateProvince] check constraint [FK_StateProvince_CountryRegion_CountryRegionCode]


if not exists (select * from sys.indexes where object_id = object_id('[Person].[StateProvince]') and name = 'AK_StateProvince_Name')
create unique nonclustered index [AK_StateProvince_Name] on [Person].[StateProvince]([Name] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[StateProvince]') and name = 'AK_StateProvince_StateProvinceCode_CountryRegionCode')
create unique nonclustered index [AK_StateProvince_StateProvinceCode_CountryRegionCode] on [Person].[StateProvince]([StateProvinceCode] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[StateProvince]') and name = 'AK_StateProvince_StateProvinceCode_CountryRegionCode')
create unique nonclustered index [AK_StateProvince_StateProvinceCode_CountryRegionCode] on [Person].[StateProvince]([CountryRegionCode] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[StateProvince]') and name = 'AK_StateProvince_rowguid')
create unique nonclustered index [AK_StateProvince_rowguid] on [Person].[StateProvince]([rowguid] asc)