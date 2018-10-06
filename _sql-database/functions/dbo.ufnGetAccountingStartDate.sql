if exists (select * from sys.objects where object_id = object_id('[dbo].[ufnGetAccountingStartDate]') and type = 'FN')
drop function [dbo].[ufnGetAccountingStartDate]
go


CREATE FUNCTION [dbo].[ufnGetAccountingStartDate]()
RETURNS [datetime] 
AS 
BEGIN
    RETURN CONVERT(datetime, '20030701', 112);
END;