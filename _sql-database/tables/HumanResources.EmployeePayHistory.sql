if not exists (select * from sys.objects where object_id = object_id('[HumanResources].[EmployeePayHistory]') and type = 'U')
create table [HumanResources].[EmployeePayHistory]
(
    [BusinessEntityID] int not null,
    [RateChangeDate] datetime not null,
    [Rate] money not null,
    [PayFrequency] tinyint not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_EmployeePayHistory_BusinessEntityID_RateChangeDate] primary key ([BusinessEntityID] asc)
    constraint [PK_EmployeePayHistory_BusinessEntityID_RateChangeDate] primary key ([RateChangeDate] asc)
)

alter table [HumanResources].[EmployeePayHistory] with check add constraint [FK_EmployeePayHistory_Employee_BusinessEntityID] foreign key([BusinessEntityID]) references [HumanResources].[Employee] ([BusinessEntityID]) alter table [HumanResources].[EmployeePayHistory] check constraint [FK_EmployeePayHistory_Employee_BusinessEntityID]