if not exists (select * from sys.objects where object_id = object_id('[Production].[TransactionHistoryArchive]') and type = 'U')
create table [Production].[TransactionHistoryArchive]
(
    [TransactionID] int not null,
    [ProductID] int not null,
    [ReferenceOrderID] int not null,
    [ReferenceOrderLineID] int not null default((0)),
    [TransactionDate] datetime not null default(getdate()),
    [TransactionType] nchar(1) collate SQL_Latin1_General_CP1_CI_AS not null,
    [Quantity] int not null,
    [ActualCost] money not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_TransactionHistoryArchive_TransactionID] primary key ([TransactionID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Production].[TransactionHistoryArchive]') and name = 'IX_TransactionHistoryArchive_ProductID')
create nonclustered index [IX_TransactionHistoryArchive_ProductID] on [Production].[TransactionHistoryArchive]([ProductID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[TransactionHistoryArchive]') and name = 'IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID')
create nonclustered index [IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID] on [Production].[TransactionHistoryArchive]([ReferenceOrderID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[TransactionHistoryArchive]') and name = 'IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID')
create nonclustered index [IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID] on [Production].[TransactionHistoryArchive]([ReferenceOrderLineID] asc)