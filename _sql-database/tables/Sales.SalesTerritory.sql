if not exists (select * from sys.objects where object_id = object_id('[Sales].[SalesTerritory]') and type = 'U')
create table [Sales].[SalesTerritory]
(
    [TerritoryID] int not null identity(1, 1),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [CountryRegionCode] nvarchar(3) collate SQL_Latin1_General_CP1_CI_AS not null,
    [Group] nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS not null,
    [SalesYTD] money not null default((0.00)),
    [SalesLastYear] money not null default((0.00)),
    [CostYTD] money not null default((0.00)),
    [CostLastYear] money not null default((0.00)),
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_SalesTerritory_TerritoryID] primary key ([TerritoryID] asc)
)

alter table [Person].[SalesTerritory] with check add constraint [FK_SalesTerritory_CountryRegion_CountryRegionCode] foreign key([CountryRegionCode]) references [Person].[CountryRegion] ([CountryRegionCode]) alter table [Person].[SalesTerritory] check constraint [FK_SalesTerritory_CountryRegion_CountryRegionCode]


if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SalesTerritory]') and name = 'AK_SalesTerritory_Name')
create unique nonclustered index [AK_SalesTerritory_Name] on [Sales].[SalesTerritory]([Name] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SalesTerritory]') and name = 'AK_SalesTerritory_rowguid')
create unique nonclustered index [AK_SalesTerritory_rowguid] on [Sales].[SalesTerritory]([rowguid] asc)