if not exists (select * from sys.objects where object_id = object_id('[Production].[ProductModelIllustration]') and type = 'U')
create table [Production].[ProductModelIllustration]
(
    [ProductModelID] int not null,
    [IllustrationID] int not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ProductModelIllustration_ProductModelID_IllustrationID] primary key ([ProductModelID] asc)
    constraint [PK_ProductModelIllustration_ProductModelID_IllustrationID] primary key ([IllustrationID] asc)
)

alter table [Production].[ProductModelIllustration] with check add constraint [FK_ProductModelIllustration_Illustration_IllustrationID] foreign key([IllustrationID]) references [Production].[Illustration] ([IllustrationID]) alter table [Production].[ProductModelIllustration] check constraint [FK_ProductModelIllustration_Illustration_IllustrationID]
alter table [Production].[ProductModelIllustration] with check add constraint [FK_ProductModelIllustration_ProductModel_ProductModelID] foreign key([ProductModelID]) references [Production].[ProductModel] ([ProductModelID]) alter table [Production].[ProductModelIllustration] check constraint [FK_ProductModelIllustration_ProductModel_ProductModelID]