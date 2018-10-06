if not exists (select * from sys.objects where object_id = object_id('[Sales].[SalesReason]') and type = 'U')
create table [Sales].[SalesReason]
(
    [SalesReasonID] int not null identity(1, 1),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [ReasonType] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_SalesReason_SalesReasonID] primary key ([SalesReasonID] asc)
)