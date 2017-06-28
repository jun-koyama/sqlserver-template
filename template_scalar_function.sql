--*--------------------------------------------------------------------------------------------------
--* [Description]
--*	
--*--------------------------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[template_scalar_function]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[template_scalar_function]
GO

CREATE FUNCTION [dbo].[template_scalar_function]
(
    @param1		VARCHAR(10)
)
RETURNS VARCHAR(20)
AS
BEGIN
			
    RETURN ''
END