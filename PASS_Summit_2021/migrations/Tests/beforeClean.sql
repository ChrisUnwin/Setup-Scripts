SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL Serializable
GO
BEGIN TRANSACTION
GO
-- Drop all procs in the tSQLt schema 
DECLARE @procName VARCHAR(500);
DECLARE @sql NVARCHAR(500);
DECLARE cur CURSOR FOR
SELECT s.[name]+'.'+o.[name]
FROM sys.objects          o
    LEFT JOIN sys.schemas s
        ON o.schema_id = s.schema_id
WHERE o.type IN ('P', 'PC') AND s.name = 'tSQLt';
OPEN cur;
FETCH NEXT FROM cur
INTO @procName;
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @sql = 'DROP PROCEDURE IF EXISTS ' + @procName + ''
    EXEC sp_executesql @sql
    FETCH NEXT FROM cur
    INTO @procName;
END;
CLOSE cur;
DEALLOCATE cur;
GO

-- Drop all functions in the tSQLt schema 
DECLARE @funcName VARCHAR(500);
DECLARE @sql NVARCHAR(500);
DECLARE cur CURSOR FOR
SELECT s.[name]+'.'+o.[name]
FROM sys.objects          o
    LEFT JOIN sys.schemas s
        ON o.schema_id = s.schema_id
WHERE o.type IN ('FN', 'IF') AND s.name = 'tSQLt';
OPEN cur;
FETCH NEXT FROM cur
INTO @funcName;
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @sql = 'DROP FUNCTION IF EXISTS ' + @funcName + ''
    EXEC sp_executesql @sql
    FETCH NEXT FROM cur
    INTO @funcName;
END;
CLOSE cur;
DEALLOCATE cur;
GO

-- Drop all views in the tSQLt schema 
DECLARE @viewName VARCHAR(500);
DECLARE @sql NVARCHAR(500);
DECLARE cur CURSOR FOR
SELECT s.[name]+'.'+o.[name]
FROM sys.objects          o
    LEFT JOIN sys.schemas s
        ON o.schema_id = s.schema_id
WHERE o.type = 'V' AND s.name = 'tSQLt';
OPEN cur;
FETCH NEXT FROM cur
INTO @viewName;
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @sql = 'DROP VIEW IF EXISTS ' + @viewName + ''
    EXEC sp_executesql @sql
    FETCH NEXT FROM cur
    INTO @viewName;
END;
CLOSE cur;
DEALLOCATE cur;
GO

-- Drop all tables in the tSQLt schema 
DECLARE @tabName VARCHAR(500);
DECLARE @sql NVARCHAR(500);
DECLARE cur CURSOR FOR
SELECT s.[name]+'.'+o.[name]
FROM sys.objects          o
    LEFT JOIN sys.schemas s
        ON o.schema_id = s.schema_id
WHERE o.type = 'U' AND s.name = 'tSQLt';
OPEN cur;
FETCH NEXT FROM cur
INTO @tabName;
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @sql = 'DROP TABLE IF EXISTS ' + @tabName + ''
    EXEC sp_executesql @sql
    FETCH NEXT FROM cur
    INTO @tabName;
END;
CLOSE cur;
DEALLOCATE cur;
GO

IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping types'
GO
DROP TYPE IF EXISTS [tSQLt].[AssertStringTable]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DROP TYPE IF EXISTS [tSQLt].[Private]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping CLR assemblies'
GO
DROP ASSEMBLY IF EXISTS [tSQLtCLR]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping schemas'
GO
DROP SCHEMA IF EXISTS [tSQLt]
GO
COMMIT TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DECLARE @Success AS BIT
SET @Success = 1
SET NOEXEC OFF
IF (@Success = 1) PRINT 'The database update succeeded'
ELSE BEGIN
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	PRINT 'The database update failed'
END
GO