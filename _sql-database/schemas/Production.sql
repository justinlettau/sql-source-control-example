if not exists (select * from sys.schemas where name = 'Production')
exec('create schema Production')