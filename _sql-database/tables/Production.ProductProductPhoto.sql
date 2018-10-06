if not exists (select * from sys.objects where object_id = object_id('[Production].[ProductProductPhoto]') and type = 'U')
create table [Production].[ProductProductPhoto]
(
    [ProductID] int not null,
    [ProductPhotoID] int not null,
    [Primary] Flag not null default((0)),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ProductProductPhoto_ProductID_ProductPhotoID] primary key ([ProductID] asc)
    constraint [PK_ProductProductPhoto_ProductID_ProductPhotoID] primary key ([ProductPhotoID] asc)
)

alter table [Production].[ProductProductPhoto] with check add constraint [FK_ProductProductPhoto_Product_ProductID] foreign key([ProductID]) references [Production].[Product] ([ProductID]) alter table [Production].[ProductProductPhoto] check constraint [FK_ProductProductPhoto_Product_ProductID]
alter table [Production].[ProductProductPhoto] with check add constraint [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID] foreign key([ProductPhotoID]) references [Production].[ProductPhoto] ([ProductPhotoID]) alter table [Production].[ProductProductPhoto] check constraint [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID]