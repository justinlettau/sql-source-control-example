if not exists (select * from sys.objects where object_id = object_id('[Sales].[PersonCreditCard]') and type = 'U')
create table [Sales].[PersonCreditCard]
(
    [BusinessEntityID] int not null,
    [CreditCardID] int not null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_PersonCreditCard_BusinessEntityID_CreditCardID] primary key ([BusinessEntityID] asc)
    constraint [PK_PersonCreditCard_BusinessEntityID_CreditCardID] primary key ([CreditCardID] asc)
)

alter table [Person].[PersonCreditCard] with check add constraint [FK_PersonCreditCard_Person_BusinessEntityID] foreign key([BusinessEntityID]) references [Person].[Person] ([BusinessEntityID]) alter table [Person].[PersonCreditCard] check constraint [FK_PersonCreditCard_Person_BusinessEntityID]
alter table [Sales].[PersonCreditCard] with check add constraint [FK_PersonCreditCard_CreditCard_CreditCardID] foreign key([CreditCardID]) references [Sales].[CreditCard] ([CreditCardID]) alter table [Sales].[PersonCreditCard] check constraint [FK_PersonCreditCard_CreditCard_CreditCardID]