if not exists (select * from sys.objects where object_id = object_id('[Sales].[SalesPersonQuotaHistory]') and type = 'U')
create table [Sales].[SalesPersonQuotaHistory]
(
    [BusinessEntityID] int not null,
    [QuotaDate] datetime not null,
    [SalesQuota] money not null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate] primary key ([BusinessEntityID] asc)
    constraint [PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate] primary key ([QuotaDate] asc)
)

alter table [Sales].[SalesPersonQuotaHistory] with check add constraint [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID] foreign key([BusinessEntityID]) references [Sales].[SalesPerson] ([BusinessEntityID]) alter table [Sales].[SalesPersonQuotaHistory] check constraint [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID]


if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SalesPersonQuotaHistory]') and name = 'AK_SalesPersonQuotaHistory_rowguid')
create unique nonclustered index [AK_SalesPersonQuotaHistory_rowguid] on [Sales].[SalesPersonQuotaHistory]([rowguid] asc)