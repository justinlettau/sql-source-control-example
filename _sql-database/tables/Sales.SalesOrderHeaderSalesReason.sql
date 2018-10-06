if not exists (select * from sys.objects where object_id = object_id('[Sales].[SalesOrderHeaderSalesReason]') and type = 'U')
create table [Sales].[SalesOrderHeaderSalesReason]
(
    [SalesOrderID] int not null,
    [SalesReasonID] int not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID] primary key ([SalesOrderID] asc)
    constraint [PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID] primary key ([SalesReasonID] asc)
)

alter table [Sales].[SalesOrderHeaderSalesReason] with check add constraint [FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID] foreign key([SalesReasonID]) references [Sales].[SalesReason] ([SalesReasonID]) alter table [Sales].[SalesOrderHeaderSalesReason] check constraint [FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID]
alter table [Sales].[SalesOrderHeaderSalesReason] with check add constraint [FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID] foreign key([SalesOrderID]) references [Sales].[SalesOrderHeader] ([SalesOrderID]) on delete cascade alter table [Sales].[SalesOrderHeaderSalesReason] check constraint [FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID]