if not exists (select * from sys.objects where object_id = object_id('[Sales].[SalesOrderHeader]') and type = 'U')
create table [Sales].[SalesOrderHeader]
(
    [SalesOrderID] int not null identity(1, 1),
    [RevisionNumber] tinyint not null default((0)),
    [OrderDate] datetime not null default(getdate()),
    [DueDate] datetime not null,
    [ShipDate] datetime null,
    [Status] tinyint not null default((1)),
    [OnlineOrderFlag] Flag not null default((1)),
    [SalesOrderNumber] as (isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID]),N'*** ERROR ***')),
    [PurchaseOrderNumber] OrderNumber collate SQL_Latin1_General_CP1_CI_AS null,
    [AccountNumber] AccountNumber collate SQL_Latin1_General_CP1_CI_AS null,
    [CustomerID] int not null,
    [SalesPersonID] int null,
    [TerritoryID] int null,
    [BillToAddressID] int not null,
    [ShipToAddressID] int not null,
    [ShipMethodID] int not null,
    [CreditCardID] int null,
    [CreditCardApprovalCode] varchar(15) collate SQL_Latin1_General_CP1_CI_AS null,
    [CurrencyRateID] int null,
    [SubTotal] money not null default((0.00)),
    [TaxAmt] money not null default((0.00)),
    [Freight] money not null default((0.00)),
    [TotalDue] as (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))),
    [Comment] nvarchar(128) collate SQL_Latin1_General_CP1_CI_AS null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_SalesOrderHeader_SalesOrderID] primary key ([SalesOrderID] asc)
)

alter table [Sales].[SalesOrderHeader] with check add constraint [FK_SalesOrderHeader_SalesPerson_SalesPersonID] foreign key([SalesPersonID]) references [Sales].[SalesPerson] ([BusinessEntityID]) alter table [Sales].[SalesOrderHeader] check constraint [FK_SalesOrderHeader_SalesPerson_SalesPersonID]
alter table [Sales].[SalesOrderHeader] with check add constraint [FK_SalesOrderHeader_SalesTerritory_TerritoryID] foreign key([TerritoryID]) references [Sales].[SalesTerritory] ([TerritoryID]) alter table [Sales].[SalesOrderHeader] check constraint [FK_SalesOrderHeader_SalesTerritory_TerritoryID]
alter table [Purchasing].[SalesOrderHeader] with check add constraint [FK_SalesOrderHeader_ShipMethod_ShipMethodID] foreign key([ShipMethodID]) references [Purchasing].[ShipMethod] ([ShipMethodID]) alter table [Purchasing].[SalesOrderHeader] check constraint [FK_SalesOrderHeader_ShipMethod_ShipMethodID]
alter table [Person].[SalesOrderHeader] with check add constraint [FK_SalesOrderHeader_Address_BillToAddressID] foreign key([BillToAddressID]) references [Person].[Address] ([AddressID]) alter table [Person].[SalesOrderHeader] check constraint [FK_SalesOrderHeader_Address_BillToAddressID]
alter table [Person].[SalesOrderHeader] with check add constraint [FK_SalesOrderHeader_Address_ShipToAddressID] foreign key([ShipToAddressID]) references [Person].[Address] ([AddressID]) alter table [Person].[SalesOrderHeader] check constraint [FK_SalesOrderHeader_Address_ShipToAddressID]
alter table [Sales].[SalesOrderHeader] with check add constraint [FK_SalesOrderHeader_CreditCard_CreditCardID] foreign key([CreditCardID]) references [Sales].[CreditCard] ([CreditCardID]) alter table [Sales].[SalesOrderHeader] check constraint [FK_SalesOrderHeader_CreditCard_CreditCardID]
alter table [Sales].[SalesOrderHeader] with check add constraint [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID] foreign key([CurrencyRateID]) references [Sales].[CurrencyRate] ([CurrencyRateID]) alter table [Sales].[SalesOrderHeader] check constraint [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID]
alter table [Sales].[SalesOrderHeader] with check add constraint [FK_SalesOrderHeader_Customer_CustomerID] foreign key([CustomerID]) references [Sales].[Customer] ([CustomerID]) alter table [Sales].[SalesOrderHeader] check constraint [FK_SalesOrderHeader_Customer_CustomerID]


if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SalesOrderHeader]') and name = 'AK_SalesOrderHeader_rowguid')
create unique nonclustered index [AK_SalesOrderHeader_rowguid] on [Sales].[SalesOrderHeader]([rowguid] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SalesOrderHeader]') and name = 'AK_SalesOrderHeader_SalesOrderNumber')
create unique nonclustered index [AK_SalesOrderHeader_SalesOrderNumber] on [Sales].[SalesOrderHeader]([SalesOrderNumber] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SalesOrderHeader]') and name = 'IX_SalesOrderHeader_CustomerID')
create nonclustered index [IX_SalesOrderHeader_CustomerID] on [Sales].[SalesOrderHeader]([CustomerID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SalesOrderHeader]') and name = 'IX_SalesOrderHeader_SalesPersonID')
create nonclustered index [IX_SalesOrderHeader_SalesPersonID] on [Sales].[SalesOrderHeader]([SalesPersonID] asc)