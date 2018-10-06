if not exists (select * from sys.objects where object_id = object_id('[Person].[Address]') and type = 'U')
create table [Person].[Address]
(
    [AddressID] int not null identity(1, 1),
    [AddressLine1] nvarchar(60) collate SQL_Latin1_General_CP1_CI_AS not null,
    [AddressLine2] nvarchar(60) collate SQL_Latin1_General_CP1_CI_AS null,
    [City] nvarchar(30) collate SQL_Latin1_General_CP1_CI_AS not null,
    [StateProvinceID] int not null,
    [PostalCode] nvarchar(15) collate SQL_Latin1_General_CP1_CI_AS not null,
    [SpatialLocation] geography null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Address_AddressID] primary key ([AddressID] asc)
)

alter table [Person].[Address] with check add constraint [FK_Address_StateProvince_StateProvinceID] foreign key([StateProvinceID]) references [Person].[StateProvince] ([StateProvinceID]) alter table [Person].[Address] check constraint [FK_Address_StateProvince_StateProvinceID]


if not exists (select * from sys.indexes where object_id = object_id('[Person].[Address]') and name = 'AK_Address_rowguid')
create unique nonclustered index [AK_Address_rowguid] on [Person].[Address]([rowguid] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[Address]') and name = 'IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode')
create unique nonclustered index [IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode] on [Person].[Address]([AddressLine1] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[Address]') and name = 'IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode')
create unique nonclustered index [IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode] on [Person].[Address]([AddressLine2] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[Address]') and name = 'IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode')
create unique nonclustered index [IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode] on [Person].[Address]([City] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[Address]') and name = 'IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode')
create unique nonclustered index [IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode] on [Person].[Address]([StateProvinceID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[Address]') and name = 'IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode')
create unique nonclustered index [IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode] on [Person].[Address]([PostalCode] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Person].[Address]') and name = 'IX_Address_StateProvinceID')
create nonclustered index [IX_Address_StateProvinceID] on [Person].[Address]([StateProvinceID] asc)