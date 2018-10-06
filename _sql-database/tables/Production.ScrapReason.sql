if not exists (select * from sys.objects where object_id = object_id('[Production].[ScrapReason]') and type = 'U')
create table [Production].[ScrapReason]
(
    [ScrapReasonID] smallint not null identity(1, 1),
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ScrapReason_ScrapReasonID] primary key ([ScrapReasonID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Production].[ScrapReason]') and name = 'AK_ScrapReason_Name')
create unique nonclustered index [AK_ScrapReason_Name] on [Production].[ScrapReason]([Name] asc)