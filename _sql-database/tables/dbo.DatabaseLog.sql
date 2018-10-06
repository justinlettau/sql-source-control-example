if not exists (select * from sys.objects where object_id = object_id('[dbo].[DatabaseLog]') and type = 'U')
create table [dbo].[DatabaseLog]
(
    [DatabaseLogID] int not null identity(1, 1),
    [PostTime] datetime not null,
    [DatabaseUser] sysname collate SQL_Latin1_General_CP1_CI_AS not null,
    [Event] sysname collate SQL_Latin1_General_CP1_CI_AS not null,
    [Schema] sysname collate SQL_Latin1_General_CP1_CI_AS null,
    [Object] sysname collate SQL_Latin1_General_CP1_CI_AS null,
    [TSQL] nvarchar(max) collate SQL_Latin1_General_CP1_CI_AS not null,
    [XmlEvent] xml not null,
    constraint [PK_DatabaseLog_DatabaseLogID] primary key ([DatabaseLogID] asc)
)