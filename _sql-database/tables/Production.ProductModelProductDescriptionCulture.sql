if not exists (select * from sys.objects where object_id = object_id('[Production].[ProductModelProductDescriptionCulture]') and type = 'U')
create table [Production].[ProductModelProductDescriptionCulture]
(
    [ProductModelID] int not null,
    [ProductDescriptionID] int not null,
    [CultureID] nchar(6) collate SQL_Latin1_General_CP1_CI_AS not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID] primary key ([ProductModelID] asc)
    constraint [PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID] primary key ([ProductDescriptionID] asc)
    constraint [PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID] primary key ([CultureID] asc)
)

alter table [Production].[ProductModelProductDescriptionCulture] with check add constraint [FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID] foreign key([ProductDescriptionID]) references [Production].[ProductDescription] ([ProductDescriptionID]) alter table [Production].[ProductModelProductDescriptionCulture] check constraint [FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID]
alter table [Production].[ProductModelProductDescriptionCulture] with check add constraint [FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID] foreign key([ProductModelID]) references [Production].[ProductModel] ([ProductModelID]) alter table [Production].[ProductModelProductDescriptionCulture] check constraint [FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID]
alter table [Production].[ProductModelProductDescriptionCulture] with check add constraint [FK_ProductModelProductDescriptionCulture_Culture_CultureID] foreign key([CultureID]) references [Production].[Culture] ([CultureID]) alter table [Production].[ProductModelProductDescriptionCulture] check constraint [FK_ProductModelProductDescriptionCulture_Culture_CultureID]