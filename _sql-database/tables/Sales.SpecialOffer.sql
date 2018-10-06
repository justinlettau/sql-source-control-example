if not exists (select * from sys.objects where object_id = object_id('[Sales].[SpecialOffer]') and type = 'U')
create table [Sales].[SpecialOffer]
(
    [SpecialOfferID] int not null identity(1, 1),
    [Description] nvarchar(255) collate SQL_Latin1_General_CP1_CI_AS not null,
    [DiscountPct] smallmoney not null default((0.00)),
    [Type] nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS not null,
    [Category] nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS not null,
    [StartDate] datetime not null,
    [EndDate] datetime not null,
    [MinQty] int not null default((0)),
    [MaxQty] int null,
    [rowguid] uniqueidentifier not null default(newid()),
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_SpecialOffer_SpecialOfferID] primary key ([SpecialOfferID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Sales].[SpecialOffer]') and name = 'AK_SpecialOffer_rowguid')
create unique nonclustered index [AK_SpecialOffer_rowguid] on [Sales].[SpecialOffer]([rowguid] asc)