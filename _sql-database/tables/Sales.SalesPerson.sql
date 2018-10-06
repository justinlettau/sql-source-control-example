if not exists (select * from sys.objects where object_id = object_id('[Sales].[SalesPerson]') and type = 'U')
create table [Sales].[SalesPerson]
(
    [BusinessEntityID] int not null,
    [TerritoryID] int null,
    [SalesQuota] money null,
    [Bonus] money not null default((0.00)),
    [CommissionPct] smallmoney not null default((0.00)),
    [SalesYTD] money not null default((0.00)),
    [SalesLastYear] money not null default((0.00)),
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_SalesPerson_BusinessEntityID] primary key ([BusinessEntityID] asc)
)

alter table [Sales].[SalesPerson] with check add constraint [FK_SalesPerson_SalesTerritory_TerritoryID] foreign key([TerritoryID]) references [Sales].[SalesTerritory] ([TerritoryID]) alter table [Sales].[SalesPerson] check constraint [FK_SalesPerson_SalesTerritory_TerritoryID]
alter table [HumanResources].[SalesPerson] with check add constraint [FK_SalesPerson_Employee_BusinessEntityID] foreign key([BusinessEntityID]) references [HumanResources].[Employee] ([BusinessEntityID]) alter table [HumanResources].[SalesPerson] check constraint [FK_SalesPerson_Employee_BusinessEntityID]


if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SalesPerson]') and name = 'AK_SalesPerson_rowguid')
create unique nonclustered index [AK_SalesPerson_rowguid] on [Sales].[SalesPerson]([rowguid] asc)