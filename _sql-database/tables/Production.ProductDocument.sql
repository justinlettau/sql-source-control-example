if not exists (select * from sys.objects where object_id = object_id('[Production].[ProductDocument]') and type = 'U')
create table [Production].[ProductDocument]
(
    [ProductID] int not null,
    [DocumentNode] hierarchyid not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ProductDocument_ProductID_DocumentNode] primary key ([ProductID] asc)
    constraint [PK_ProductDocument_ProductID_DocumentNode] primary key ([DocumentNode] asc)
)

alter table [Production].[ProductDocument] with check add constraint [FK_ProductDocument_Product_ProductID] foreign key([ProductID]) references [Production].[Product] ([ProductID]) alter table [Production].[ProductDocument] check constraint [FK_ProductDocument_Product_ProductID]
alter table [Production].[ProductDocument] with check add constraint [FK_ProductDocument_Document_DocumentNode] foreign key([DocumentNode]) references [Production].[Document] ([DocumentNode]) alter table [Production].[ProductDocument] check constraint [FK_ProductDocument_Document_DocumentNode]