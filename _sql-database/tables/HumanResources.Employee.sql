if not exists (select * from sys.objects where object_id = object_id('[HumanResources].[Employee]') and type = 'U')
create table [HumanResources].[Employee]
(
    [BusinessEntityID] int not null,
    [NationalIDNumber] nvarchar(15) collate SQL_Latin1_General_CP1_CI_AS not null,
    [LoginID] nvarchar(256) collate SQL_Latin1_General_CP1_CI_AS not null,
    [OrganizationNode] hierarchyid null,
    [OrganizationLevel] as ([OrganizationNode].[GetLevel]()),
    [JobTitle] nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS not null,
    [BirthDate] date not null,
    [MaritalStatus] nchar(1) collate SQL_Latin1_General_CP1_CI_AS not null,
    [Gender] nchar(1) collate SQL_Latin1_General_CP1_CI_AS not null,
    [HireDate] date not null,
    [SalariedFlag] Flag not null default((1)),
    [VacationHours] smallint not null default((0)),
    [SickLeaveHours] smallint not null default((0)),
    [CurrentFlag] Flag not null default((1)),
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Employee_BusinessEntityID] primary key ([BusinessEntityID] asc)
)

alter table [Person].[Employee] with check add constraint [FK_Employee_Person_BusinessEntityID] foreign key([BusinessEntityID]) references [Person].[Person] ([BusinessEntityID]) alter table [Person].[Employee] check constraint [FK_Employee_Person_BusinessEntityID]


if not exists (select * from sys.indexes where object_id = object_id('[HumanResources].[Employee]') and name = 'IX_Employee_OrganizationNode')
create nonclustered index [IX_Employee_OrganizationNode] on [HumanResources].[Employee]([OrganizationNode] asc)

if not exists (select * from sys.indexes where object_id = object_id('[HumanResources].[Employee]') and name = 'IX_Employee_OrganizationLevel_OrganizationNode')
create nonclustered index [IX_Employee_OrganizationLevel_OrganizationNode] on [HumanResources].[Employee]([OrganizationLevel] asc)

if not exists (select * from sys.indexes where object_id = object_id('[HumanResources].[Employee]') and name = 'IX_Employee_OrganizationLevel_OrganizationNode')
create nonclustered index [IX_Employee_OrganizationLevel_OrganizationNode] on [HumanResources].[Employee]([OrganizationNode] asc)

if not exists (select * from sys.indexes where object_id = object_id('[HumanResources].[Employee]') and name = 'AK_Employee_LoginID')
create unique nonclustered index [AK_Employee_LoginID] on [HumanResources].[Employee]([LoginID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[HumanResources].[Employee]') and name = 'AK_Employee_NationalIDNumber')
create unique nonclustered index [AK_Employee_NationalIDNumber] on [HumanResources].[Employee]([NationalIDNumber] asc)

if not exists (select * from sys.indexes where object_id = object_id('[HumanResources].[Employee]') and name = 'AK_Employee_rowguid')
create unique nonclustered index [AK_Employee_rowguid] on [HumanResources].[Employee]([rowguid] asc)