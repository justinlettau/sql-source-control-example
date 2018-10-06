if not exists (select * from sys.objects where object_id = object_id('[Production].[Illustration]') and type = 'U')
create table [Production].[Illustration]
(
    [IllustrationID] int not null identity(1, 1),
    [Diagram] xml null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Illustration_IllustrationID] primary key ([IllustrationID] asc)
)