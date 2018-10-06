if not exists (select * from sys.objects where object_id = object_id('[Production].[WorkOrder]') and type = 'U')
create table [Production].[WorkOrder]
(
    [WorkOrderID] int not null identity(1, 1),
    [ProductID] int not null,
    [OrderQty] int not null,
    [StockedQty] as (isnull([OrderQty]-[ScrappedQty],(0))),
    [ScrappedQty] smallint not null,
    [StartDate] datetime not null,
    [EndDate] datetime null,
    [DueDate] datetime not null,
    [ScrapReasonID] smallint null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_WorkOrder_WorkOrderID] primary key ([WorkOrderID] asc)
)

alter table [Production].[WorkOrder] with check add constraint [FK_WorkOrder_Product_ProductID] foreign key([ProductID]) references [Production].[Product] ([ProductID]) alter table [Production].[WorkOrder] check constraint [FK_WorkOrder_Product_ProductID]
alter table [Production].[WorkOrder] with check add constraint [FK_WorkOrder_ScrapReason_ScrapReasonID] foreign key([ScrapReasonID]) references [Production].[ScrapReason] ([ScrapReasonID]) alter table [Production].[WorkOrder] check constraint [FK_WorkOrder_ScrapReason_ScrapReasonID]


if not exists (select * from sys.indexes where object_id = object_id('[Production].[WorkOrder]') and name = 'IX_WorkOrder_ScrapReasonID')
create nonclustered index [IX_WorkOrder_ScrapReasonID] on [Production].[WorkOrder]([ScrapReasonID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[WorkOrder]') and name = 'IX_WorkOrder_ProductID')
create nonclustered index [IX_WorkOrder_ProductID] on [Production].[WorkOrder]([ProductID] asc)