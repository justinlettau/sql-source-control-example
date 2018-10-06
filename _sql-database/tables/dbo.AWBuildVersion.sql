if not exists (select * from sys.objects where object_id = object_id('[dbo].[AWBuildVersion]') and type = 'U')
create table [dbo].[AWBuildVersion]
(
    [SystemInformationID] tinyint not null identity(1, 1),
    [Database Version] nvarchar(25) collate SQL_Latin1_General_CP1_CI_AS not null,
    [VersionDate] datetime not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_AWBuildVersion_SystemInformationID] primary key ([SystemInformationID] asc)
)