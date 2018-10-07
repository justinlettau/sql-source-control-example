IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Purchasing].[ShipMethod]') AND type = 'U')
CREATE TABLE [Purchasing].[ShipMethod]
(
    [ShipMethodID] int NOT NULL IDENTITY(1, 1),
    [Name] Name COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [ShipBase] money NOT NULL DEFAULT((0.00)),
    [ShipRate] money NOT NULL DEFAULT((0.00)),
    [rowguid] uniqueidentifier NOT NULL DEFAULT(newid()),
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_ShipMethod_ShipMethodID] PRIMARY KEY ([ShipMethodID] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Purchasing].[ShipMethod]') AND name = 'AK_ShipMethod_Name')
CREATE UNIQUE NONCLUSTERED INDEX [AK_ShipMethod_Name] ON [Purchasing].[ShipMethod]([Name] ASC)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Purchasing].[ShipMethod]') AND name = 'AK_ShipMethod_rowguid')
CREATE UNIQUE NONCLUSTERED INDEX [AK_ShipMethod_rowguid] ON [Purchasing].[ShipMethod]([rowguid] ASC)