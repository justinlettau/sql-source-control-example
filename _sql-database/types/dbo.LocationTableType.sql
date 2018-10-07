IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[LocationTableType]') AND type = 'TT')
CREATE TYPE [dbo].[LocationTableType] AS TABLE
(
    [LocationName] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [CostRate] int NULL
)