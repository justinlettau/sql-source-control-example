if not exists (select * from sys.schemas where name = 'dbo')
exec('create schema dbo')