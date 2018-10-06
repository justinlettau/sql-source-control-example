if not exists (select * from sys.objects where object_id = object_id('[Purchasing].[ShipMethod]') and type = 'U')
create table [Purchasing].[ShipMethod]
(
    [ShipMethodID] int not null identity(1, 1),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [ShipBase] money not null default((0.00)),
    [ShipRate] money not null default((0.00)),
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ShipMethod_ShipMethodID] primary key ([ShipMethodID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Purchasing].[ShipMethod]') and name = 'AK_ShipMethod_Name')
create unique nonclustered index [AK_ShipMethod_Name] on [Purchasing].[ShipMethod]([Name] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Purchasing].[ShipMethod]') and name = 'AK_ShipMethod_rowguid')
create unique nonclustered index [AK_ShipMethod_rowguid] on [Purchasing].[ShipMethod]([rowguid] asc)