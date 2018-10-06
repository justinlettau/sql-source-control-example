if not exists (select * from sys.schemas where name = 'Person')
exec('create schema Person')