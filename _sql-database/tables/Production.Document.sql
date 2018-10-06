if not exists (select * from sys.objects where object_id = object_id('[Production].[Document]') and type = 'U')
create table [Production].[Document]
(
    [DocumentNode] hierarchyid not null,
    [DocumentLevel] as ([DocumentNode].[GetLevel]()),
    [Title] nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS not null,
    [Owner] int not null,
    [FolderFlag] bit not null default((0)),
    [FileName] nvarchar(400) collate SQL_Latin1_General_CP1_CI_AS not null,
    [FileExtension] nvarchar(8) collate SQL_Latin1_General_CP1_CI_AS not null,
    [Revision] nchar(5) collate SQL_Latin1_General_CP1_CI_AS not null,
    [ChangeNumber] int not null default((0)),
    [Status] tinyint not null,
    [DocumentSummary] nvarchar(max) collate SQL_Latin1_General_CP1_CI_AS null,
    [Document] varbinary(max) null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_Document_DocumentNode] primary key ([DocumentNode] asc)
)

alter table [HumanResources].[Document] with check add constraint [FK_Document_Employee_Owner] foreign key([Owner]) references [HumanResources].[Employee] ([BusinessEntityID]) alter table [HumanResources].[Document] check constraint [FK_Document_Employee_Owner]


if not exists (select * from sys.indexes where object_id = object_id('[Production].[Document]') and name = 'UQ__Document__F73921F7C5112C2E')
create unique nonclustered index [UQ__Document__F73921F7C5112C2E] on [Production].[Document]([rowguid] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[Document]') and name = 'AK_Document_DocumentLevel_DocumentNode')
create unique nonclustered index [AK_Document_DocumentLevel_DocumentNode] on [Production].[Document]([DocumentLevel] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[Document]') and name = 'AK_Document_DocumentLevel_DocumentNode')
create unique nonclustered index [AK_Document_DocumentLevel_DocumentNode] on [Production].[Document]([DocumentNode] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[Document]') and name = 'AK_Document_rowguid')
create unique nonclustered index [AK_Document_rowguid] on [Production].[Document]([rowguid] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[Document]') and name = 'IX_Document_FileName_Revision')
create nonclustered index [IX_Document_FileName_Revision] on [Production].[Document]([FileName] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[Document]') and name = 'IX_Document_FileName_Revision')
create nonclustered index [IX_Document_FileName_Revision] on [Production].[Document]([Revision] asc)