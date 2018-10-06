if exists (select * from sys.objects where object_id = object_id('[dbo].[ufnGetAccountingEndDate]') and type = 'FN')
drop function [dbo].[ufnGetAccountingEndDate]
go


CREATE FUNCTION [dbo].[ufnGetAccountingEndDate]()
RETURNS [datetime] 
AS 
BEGIN
    RETURN DATEADD(millisecond, -2, CONVERT(datetime, '20040701', 112));
END;