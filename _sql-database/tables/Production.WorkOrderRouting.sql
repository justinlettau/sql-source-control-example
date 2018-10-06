if not exists (select * from sys.objects where object_id = object_id('[Production].[WorkOrderRouting]') and type = 'U')
create table [Production].[WorkOrderRouting]
(
    [WorkOrderID] int not null,
    [ProductID] int not null,
    [OperationSequence] smallint not null,
    [LocationID] smallint not null,
    [ScheduledStartDate] datetime not null,
    [ScheduledEndDate] datetime not null,
    [ActualStartDate] datetime null,
    [ActualEndDate] datetime null,
    [ActualResourceHrs] decimal(9, 4) null,
    [PlannedCost] money not null,
    [ActualCost] money null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence] primary key ([WorkOrderID] asc)
    constraint [PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence] primary key ([ProductID] asc)
    constraint [PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence] primary key ([OperationSequence] asc)
)

alter table [Production].[WorkOrderRouting] with check add constraint [FK_WorkOrderRouting_Location_LocationID] foreign key([LocationID]) references [Production].[Location] ([LocationID]) alter table [Production].[WorkOrderRouting] check constraint [FK_WorkOrderRouting_Location_LocationID]
alter table [Production].[WorkOrderRouting] with check add constraint [FK_WorkOrderRouting_WorkOrder_WorkOrderID] foreign key([WorkOrderID]) references [Production].[WorkOrder] ([WorkOrderID]) alter table [Production].[WorkOrderRouting] check constraint [FK_WorkOrderRouting_WorkOrder_WorkOrderID]


if not exists (select * from sys.indexes where object_id = object_id('[Production].[WorkOrderRouting]') and name = 'IX_WorkOrderRouting_ProductID')
create nonclustered index [IX_WorkOrderRouting_ProductID] on [Production].[WorkOrderRouting]([ProductID] asc)