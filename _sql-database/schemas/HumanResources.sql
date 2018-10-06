if not exists (select * from sys.schemas where name = 'HumanResources')
exec('create schema HumanResources')