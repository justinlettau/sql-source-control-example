if not exists (select * from sys.objects where object_id = object_id('[Sales].[CreditCard]') and type = 'U')
create table [Sales].[CreditCard]
(
    [CreditCardID] int not null identity(1, 1),
    [CardType] nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS not null,
    [CardNumber] nvarchar(25) collate SQL_Latin1_General_CP1_CI_AS not null,
    [ExpMonth] tinyint not null,
    [ExpYear] smallint not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_CreditCard_CreditCardID] primary key ([CreditCardID] asc)
)



if not exists (select * from sys.indexes where object_id = object_id('[Sales].[CreditCard]') and name = 'AK_CreditCard_CardNumber')
create unique nonclustered index [AK_CreditCard_CardNumber] on [Sales].[CreditCard]([CardNumber] asc)