if not exists (select * from sys.schemas where name = 'Purchasing')
exec('create schema Purchasing')