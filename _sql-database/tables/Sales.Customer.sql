if not exists (select * from sys.objects where object_id = object_id('[Sales].[Customer]') and type = 'U')
create table [Sales].[Customer]
(
    [CustomerID] int not null identity(1, 1),
    [PersonID] int null,
    [StoreID] int null,
    [TerritoryID] int null,
    [AccountNumber] as (isnull('AW'+[dbo].[ufnLeadingZeros]([CustomerID]),'')),
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Customer_CustomerID] primary key ([CustomerID] asc)
)

alter table [Person].[Customer] with check add constraint [FK_Customer_Person_PersonID] foreign key([PersonID]) references [Person].[Person] ([BusinessEntityID]) alter table [Person].[Customer] check constraint [FK_Customer_Person_PersonID]
alter table [Sales].[Customer] with check add constraint [FK_Customer_SalesTerritory_TerritoryID] foreign key([TerritoryID]) references [Sales].[SalesTerritory] ([TerritoryID]) alter table [Sales].[Customer] check constraint [FK_Customer_SalesTerritory_TerritoryID]
alter table [Sales].[Customer] with check add constraint [FK_Customer_Store_StoreID] foreign key([StoreID]) references [Sales].[Store] ([BusinessEntityID]) alter table [Sales].[Customer] check constraint [FK_Customer_Store_StoreID]


if not exists (select * from sys.indexes where object_id = object_id('[Sales].[Customer]') and name = 'AK_Customer_rowguid')
create unique nonclustered index [AK_Customer_rowguid] on [Sales].[Customer]([rowguid] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Sales].[Customer]') and name = 'AK_Customer_AccountNumber')
create unique nonclustered index [AK_Customer_AccountNumber] on [Sales].[Customer]([AccountNumber] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Sales].[Customer]') and name = 'IX_Customer_TerritoryID')
create nonclustered index [IX_Customer_TerritoryID] on [Sales].[Customer]([TerritoryID] asc)