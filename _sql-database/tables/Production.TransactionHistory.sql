if not exists (select * from sys.objects where object_id = object_id('[Production].[TransactionHistory]') and type = 'U')
create table [Production].[TransactionHistory]
(
    [TransactionID] int not null identity(100000, 1),
    [ProductID] int not null,
    [ReferenceOrderID] int not null,
    [ReferenceOrderLineID] int not null default((0)),
    [TransactionDate] datetime not null default(getdate()),
    [TransactionType] nchar(1) collate SQL_Latin1_General_CP1_CI_AS not null,
    [Quantity] int not null,
    [ActualCost] money not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_TransactionHistory_TransactionID] primary key ([TransactionID] asc)
)

alter table [Production].[TransactionHistory] with check add constraint [FK_TransactionHistory_Product_ProductID] foreign key([ProductID]) references [Production].[Product] ([ProductID]) alter table [Production].[TransactionHistory] check constraint [FK_TransactionHistory_Product_ProductID]


if not exists (select * from sys.indexes where object_id = object_id('[Production].[TransactionHistory]') and name = 'IX_TransactionHistory_ProductID')
create nonclustered index [IX_TransactionHistory_ProductID] on [Production].[TransactionHistory]([ProductID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[TransactionHistory]') and name = 'IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID')
create nonclustered index [IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID] on [Production].[TransactionHistory]([ReferenceOrderID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[TransactionHistory]') and name = 'IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID')
create nonclustered index [IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID] on [Production].[TransactionHistory]([ReferenceOrderLineID] asc)