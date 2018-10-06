if not exists (select * from sys.objects where object_id = object_id('[HumanResources].[Shift]') and type = 'U')
create table [HumanResources].[Shift]
(
    [ShiftID] tinyint not null identity(1, 1),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [StartTime] time not null,
    [EndTime] time not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Shift_ShiftID] primary key ([ShiftID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[HumanResources].[Shift]') and name = 'AK_Shift_Name')
create unique nonclustered index [AK_Shift_Name] on [HumanResources].[Shift]([Name] asc)

if not exists (select * from sys.indexes where object_id = object_id('[HumanResources].[Shift]') and name = 'AK_Shift_StartTime_EndTime')
create unique nonclustered index [AK_Shift_StartTime_EndTime] on [HumanResources].[Shift]([StartTime] asc)

if not exists (select * from sys.indexes where object_id = object_id('[HumanResources].[Shift]') and name = 'AK_Shift_StartTime_EndTime')
create unique nonclustered index [AK_Shift_StartTime_EndTime] on [HumanResources].[Shift]([EndTime] asc)