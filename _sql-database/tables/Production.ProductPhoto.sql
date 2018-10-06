if not exists (select * from sys.objects where object_id = object_id('[Production].[ProductPhoto]') and type = 'U')
create table [Production].[ProductPhoto]
(
    [ProductPhotoID] int not null identity(1, 1),
    [ThumbNailPhoto] varbinary(max) null,
    [ThumbnailPhotoFileName] nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS null,
    [LargePhoto] varbinary(max) null,
    [LargePhotoFileName] nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ProductPhoto_ProductPhotoID] primary key ([ProductPhotoID] asc)
)