if not exists (select * from sys.objects where object_id = object_id('[Production].[BillOfMaterials]') and type = 'U')
create table [Production].[BillOfMaterials]
(
    [BillOfMaterialsID] int not null identity(1, 1),
    [ProductAssemblyID] int null,
    [ComponentID] int not null,
    [StartDate] datetime not null default(getdate()),
    [EndDate] datetime null,
    [UnitMeasureCode] nchar(3) collate SQL_Latin1_General_CP1_CI_AS not null,
    [BOMLevel] smallint not null,
    [PerAssemblyQty] decimal(8, 2) not null default((1.00)),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_BillOfMaterials_BillOfMaterialsID] primary key ([BillOfMaterialsID] asc)
)

alter table [Production].[BillOfMaterials] with check add constraint [FK_BillOfMaterials_Product_ProductAssemblyID] foreign key([ProductAssemblyID]) references [Production].[Product] ([ProductID]) alter table [Production].[BillOfMaterials] check constraint [FK_BillOfMaterials_Product_ProductAssemblyID]
alter table [Production].[BillOfMaterials] with check add constraint [FK_BillOfMaterials_Product_ComponentID] foreign key([ComponentID]) references [Production].[Product] ([ProductID]) alter table [Production].[BillOfMaterials] check constraint [FK_BillOfMaterials_Product_ComponentID]
alter table [Production].[BillOfMaterials] with check add constraint [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode] foreign key([UnitMeasureCode]) references [Production].[UnitMeasure] ([UnitMeasureCode]) alter table [Production].[BillOfMaterials] check constraint [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode]


if not exists (select * from sys.indexes where object_id = object_id('[Production].[BillOfMaterials]') and name = 'IX_BillOfMaterials_UnitMeasureCode')
create nonclustered index [IX_BillOfMaterials_UnitMeasureCode] on [Production].[BillOfMaterials]([UnitMeasureCode] asc)