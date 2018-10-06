if not exists (select * from sys.objects where object_id = object_id('[Production].[UnitMeasure]') and type = 'U')
create table [Production].[UnitMeasure]
(
    [UnitMeasureCode] nchar(3) collate SQL_Latin1_General_CP1_CI_AS not null,
    [Name] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_UnitMeasure_UnitMeasureCode] primary key ([UnitMeasureCode] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Production].[UnitMeasure]') and name = 'AK_UnitMeasure_Name')
create unique nonclustered index [AK_UnitMeasure_Name] on [Production].[UnitMeasure]([Name] asc)