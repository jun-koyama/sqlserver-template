--*--------------------------------------------------------------------------------------------------
--* [Description]
--*	
--*		Parameter1ÅF@param1
--*		Parameter2ÅF@param2
--*--------------------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[table_function_xxxx]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [table_function_xxxx]
GO

CREATE FUNCTION [table_function_xxxx]
(
	@param1			VARCHAR(10)
	, @param2		VARCHAR(10)
)
RETURNS @return_table TABLE
(
	value1 VARCHAR(20)			-- Value1
	, value2 VARCHAR(20)		-- Value2
)
AS
BEGIN

	DECLARE @value1		VARCHAR(20)
	DECLARE @value2		VARCHAR(20)

	SELECT 
		@value1 = 'Hello'
		, @value2 = 'World'
	FROM xxx

	IF @@ROWCOUNT = 0 BEGIN
		RETURN
	END 

	INSERT INTO @return_table
	SELECT @value1, @value2
	
	RETURN 
END
GO


