if not exists (select * from sys.objects where object_id = object_id('[dbo].[ErrorLog]') and type = 'U')
create table [dbo].[ErrorLog]
(
    [ErrorLogID] int not null identity(1, 1),
    [ErrorTime] datetime not null default(getdate()),
    [UserName] sysname collate SQL_Latin1_General_CP1_CI_AS not null,
    [ErrorNumber] int not null,
    [ErrorSeverity] int null,
    [ErrorState] int null,
    [ErrorProcedure] nvarchar(126) collate SQL_Latin1_General_CP1_CI_AS null,
    [ErrorLine] int null,
    [ErrorMessage] nvarchar(4000) collate SQL_Latin1_General_CP1_CI_AS not null,
    constraint [PK_ErrorLog_ErrorLogID] primary key ([ErrorLogID] asc)
)