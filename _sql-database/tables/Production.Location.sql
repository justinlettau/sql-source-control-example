if not exists (select * from sys.objects where object_id = object_id('[Production].[Location]') and type = 'U')
create table [Production].[Location]
(
    [LocationID] smallint not null identity(1, 1),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [CostRate] smallmoney not null default((0.00)),
    [Availability] decimal(8, 2) not null default((0.00)),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Location_LocationID] primary key ([LocationID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Production].[Location]') and name = 'AK_Location_Name')
create unique nonclustered index [AK_Location_Name] on [Production].[Location]([Name] asc)