--*--------------------------------------------------------------------------------------------------
--* [Description]
--*	
--*		Parameter1ÅF@param1
--*		Parameter2ÅF@param2
--*--------------------------------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[template_stored_procedure]') AND type in (N'P', N'PC'))
DROP PROCEDURE [template_stored_procedure]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [template_stored_procedure]	(
	@param1                    VARCHAR(10)
	, @param2                  VARCHAR(10)
	, @return_cd               CHAR(1) OUTPUT
	, @error_position          VARCHAR(255) OUTPUT
	, @application_error_cd    VARCHAR(10) OUTPUT
	, @database_error_cd       VARCHAR(10) OUTPUT
	, @database_error_contents VARCHAR(2000) OUTPUT
) AS
BEGIN TRY
	-- If exists tempdb
	IF OBJECT_ID(N'tempdb..#xxx', N'U') IS NOT NULL BEGIN
		DROP TABLE #xxx
	END

	DECLARE @value1 VARCHAR(10)

	DECLARE cur CURSOR LOCAL FORWARD_ONLY FAST_FORWARD READ_ONLY FOR
	SELECT
		''
	FROM xxx
	OPEN cur
	FETCH NEXT FROM cur INTO @value1
	IF @@FETCH_STATUS <> 0
	BEGIN
		GOTO EXIT_PROC
	END
	WHILE (@@FETCH_STATUS = 0)
	BEGIN

		FETCH NEXT FROM cur INTO @value1
	END
	CLOSE cur
	DEALLOCATE cur

EXIT_PROC:
	SET @return_cd = '0'
	SET @error_position = NULL
	SET @application_error_cd = NULL
	SET @database_error_cd = NULL
	SET @database_error_contents = NULL
	IF OBJECT_ID(N'tempdb..#xxx', N'U') IS NOT NULL BEGIN
		DROP TABLE #xxx
	END
	IF  CURSOR_STATUS('LOCAL', 'cur') > -2 DEALLOCATE cur
	RETURN
END TRY
BEGIN CATCH
	IF OBJECT_ID(N'tempdb..#xxx', N'U') IS NOT NULL BEGIN
		DROP TABLE #xxx
	END
	IF  CURSOR_STATUS('LOCAL', 'cur') > -2 DEALLOCATE cur
	SET @return_cd = '1'
	SET @error_position = CONVERT(VARCHAR(255), ERROR_PROCEDURE()) + '(' + CONVERT(VARCHAR(5), ERROR_LINE()) + ')'
	SET @application_error_cd = CONVERT(VARCHAR(10), ERROR_STATE())
	SET @database_error_cd = CONVERT(VARCHAR(10), ERROR_NUMBER())
	SET @database_error_contents = ERROR_MESSAGE() 
	RETURN
END CATCH
