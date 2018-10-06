if not exists (select * from sys.objects where object_id = object_id('[Person].[CountryRegion]') and type = 'U')
create table [Person].[CountryRegion]
(
    [CountryRegionCode] nvarchar(3) collate SQL_Latin1_General_CP1_CI_AS not null,
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_CountryRegion_CountryRegionCode] primary key ([CountryRegionCode] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Person].[CountryRegion]') and name = 'AK_CountryRegion_Name')
create unique nonclustered index [AK_CountryRegion_Name] on [Person].[CountryRegion]([Name] asc)