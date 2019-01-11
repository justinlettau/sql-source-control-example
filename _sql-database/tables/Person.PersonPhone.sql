IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[Person].[PersonPhone]') AND type = 'U')
CREATE TABLE [Person].[PersonPhone]
(
    [BusinessEntityID] int NOT NULL,
    [PhoneNumber] Phone COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    [PhoneNumberTypeID] int NOT NULL,
    [ModifiedDate] datetime NOT NULL DEFAULT(getdate()),
    CONSTRAINT [PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID] PRIMARY KEY CLUSTERED (
        [BusinessEntityID] ASC,
        [PhoneNumber] ASC,
        [PhoneNumberTypeID] ASC
    )
)

ALTER TABLE [Person].[PersonPhone] WITH CHECK ADD CONSTRAINT [FK_PersonPhone_Person_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])
ALTER TABLE [Person].[PersonPhone] CHECK CONSTRAINT [FK_PersonPhone_Person_BusinessEntityID]
ALTER TABLE [Person].[PersonPhone] WITH CHECK ADD CONSTRAINT [FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID] FOREIGN KEY ([PhoneNumberTypeID]) REFERENCES [Person].[PhoneNumberType] ([PhoneNumberTypeID])
ALTER TABLE [Person].[PersonPhone] CHECK CONSTRAINT [FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID]

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[Person].[PersonPhone]') AND name = 'IX_PersonPhone_PhoneNumber')
CREATE NONCLUSTERED INDEX [IX_PersonPhone_PhoneNumber] ON [Person].[PersonPhone]([PhoneNumber] ASC)