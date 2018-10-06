if not exists (select * from sys.objects where object_id = object_id('[HumanResources].[EmployeeDepartmentHistory]') and type = 'U')
create table [HumanResources].[EmployeeDepartmentHistory]
(
    [BusinessEntityID] int not null,
    [DepartmentID] smallint not null,
    [ShiftID] tinyint not null,
    [StartDate] date not null,
    [EndDate] date null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID] primary key ([BusinessEntityID] asc)
    constraint [PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID] primary key ([DepartmentID] asc)
    constraint [PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID] primary key ([ShiftID] asc)
    constraint [PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID] primary key ([StartDate] asc)
)

alter table [HumanResources].[EmployeeDepartmentHistory] with check add constraint [FK_EmployeeDepartmentHistory_Shift_ShiftID] foreign key([ShiftID]) references [HumanResources].[Shift] ([ShiftID]) alter table [HumanResources].[EmployeeDepartmentHistory] check constraint [FK_EmployeeDepartmentHistory_Shift_ShiftID]
alter table [HumanResources].[EmployeeDepartmentHistory] with check add constraint [FK_EmployeeDepartmentHistory_Department_DepartmentID] foreign key([DepartmentID]) references [HumanResources].[Department] ([DepartmentID]) alter table [HumanResources].[EmployeeDepartmentHistory] check constraint [FK_EmployeeDepartmentHistory_Department_DepartmentID]
alter table [HumanResources].[EmployeeDepartmentHistory] with check add constraint [FK_EmployeeDepartmentHistory_Employee_BusinessEntityID] foreign key([BusinessEntityID]) references [HumanResources].[Employee] ([BusinessEntityID]) alter table [HumanResources].[EmployeeDepartmentHistory] check constraint [FK_EmployeeDepartmentHistory_Employee_BusinessEntityID]


if not exists (select * from sys.indexes where object_id = object_id('[HumanResources].[EmployeeDepartmentHistory]') and name = 'IX_EmployeeDepartmentHistory_DepartmentID')
create nonclustered index [IX_EmployeeDepartmentHistory_DepartmentID] on [HumanResources].[EmployeeDepartmentHistory]([DepartmentID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[HumanResources].[EmployeeDepartmentHistory]') and name = 'IX_EmployeeDepartmentHistory_ShiftID')
create nonclustered index [IX_EmployeeDepartmentHistory_ShiftID] on [HumanResources].[EmployeeDepartmentHistory]([ShiftID] asc)