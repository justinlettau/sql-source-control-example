if not exists (select * from sys.objects where object_id = object_id('[HumanResources].[Department]') and type = 'U')
create table [HumanResources].[Department]
(
    [DepartmentID] smallint not null identity(1, 1),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [GroupName] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Department_DepartmentID] primary key ([DepartmentID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[HumanResources].[Department]') and name = 'AK_Department_Name')
create unique nonclustered index [AK_Department_Name] on [HumanResources].[Department]([Name] asc)