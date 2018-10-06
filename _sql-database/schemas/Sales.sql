if not exists (select * from sys.schemas where name = 'Sales')
exec('create schema Sales')