if not exists (select * from sys.objects where object_id = object_id('[HumanResources].[JobCandidate]') and type = 'U')
create table [HumanResources].[JobCandidate]
(
    [JobCandidateID] int not null identity(1, 1),
    [BusinessEntityID] int null,
    [Resume] xml null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_JobCandidate_JobCandidateID] primary key ([JobCandidateID] asc)
)

alter table [HumanResources].[JobCandidate] with check add constraint [FK_JobCandidate_Employee_BusinessEntityID] foreign key([BusinessEntityID]) references [HumanResources].[Employee] ([BusinessEntityID]) alter table [HumanResources].[JobCandidate] check constraint [FK_JobCandidate_Employee_BusinessEntityID]


if not exists (select * from sys.indexes where object_id = object_id('[HumanResources].[JobCandidate]') and name = 'IX_JobCandidate_BusinessEntityID')
create nonclustered index [IX_JobCandidate_BusinessEntityID] on [HumanResources].[JobCandidate]([BusinessEntityID] asc)