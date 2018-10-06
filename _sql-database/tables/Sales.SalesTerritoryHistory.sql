if not exists (select * from sys.objects where object_id = object_id('[Sales].[SalesTerritoryHistory]') and type = 'U')
create table [Sales].[SalesTerritoryHistory]
(
    [BusinessEntityID] int not null,
    [TerritoryID] int not null,
    [StartDate] datetime not null,
    [EndDate] datetime null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID] primary key ([BusinessEntityID] asc)
    constraint [PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID] primary key ([TerritoryID] asc)
    constraint [PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID] primary key ([StartDate] asc)
)

alter table [Sales].[SalesTerritoryHistory] with check add constraint [FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID] foreign key([BusinessEntityID]) references [Sales].[SalesPerson] ([BusinessEntityID]) alter table [Sales].[SalesTerritoryHistory] check constraint [FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID]
alter table [Sales].[SalesTerritoryHistory] with check add constraint [FK_SalesTerritoryHistory_SalesTerritory_TerritoryID] foreign key([TerritoryID]) references [Sales].[SalesTerritory] ([TerritoryID]) alter table [Sales].[SalesTerritoryHistory] check constraint [FK_SalesTerritoryHistory_SalesTerritory_TerritoryID]


if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SalesTerritoryHistory]') and name = 'AK_SalesTerritoryHistory_rowguid')
create unique nonclustered index [AK_SalesTerritoryHistory_rowguid] on [Sales].[SalesTerritoryHistory]([rowguid] asc)