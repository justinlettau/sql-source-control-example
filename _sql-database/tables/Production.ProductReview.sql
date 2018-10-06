if not exists (select * from sys.objects where object_id = object_id('[Production].[ProductReview]') and type = 'U')
create table [Production].[ProductReview]
(
    [ProductReviewID] int not null identity(1, 1),
    [ProductID] int not null,
    [ReviewerName] Name collate SQL_Latin1_General_CP1_CI_AS not null,
    [ReviewDate] datetime not null default(getdate()),
    [EmailAddress] nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS not null,
    [Rating] int not null,
    [Comments] nvarchar(3850) collate SQL_Latin1_General_CP1_CI_AS null,
    [ModifiedDate] datetime not null default(getdate()),
    constraint [PK_ProductReview_ProductReviewID] primary key ([ProductReviewID] asc)
)

alter table [Production].[ProductReview] with check add constraint [FK_ProductReview_Product_ProductID] foreign key([ProductID]) references [Production].[Product] ([ProductID]) alter table [Production].[ProductReview] check constraint [FK_ProductReview_Product_ProductID]


if not exists (select * from sys.indexes where object_id = object_id('[Production].[ProductReview]') and name = 'IX_ProductReview_ProductID_Name')
create nonclustered index [IX_ProductReview_ProductID_Name] on [Production].[ProductReview]([ProductID] asc)

if not exists (select * from sys.indexes where object_id = object_id('[Production].[ProductReview]') and name = 'IX_ProductReview_ProductID_Name')
create nonclustered index [IX_ProductReview_ProductID_Name] on [Production].[ProductReview]([ReviewerName] asc)