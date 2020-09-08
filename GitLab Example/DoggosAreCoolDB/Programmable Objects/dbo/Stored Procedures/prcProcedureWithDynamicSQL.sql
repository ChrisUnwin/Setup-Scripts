IF OBJECT_ID('[dbo].[prcProcedureWithDynamicSQL]') IS NOT NULL
	DROP PROCEDURE [dbo].[prcProcedureWithDynamicSQL];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/* This is a procedure that simply contains dynamic SQL just to demonstrate that dependencies aren't picked up. 
Use SQL Search to find these. */
CREATE PROCEDURE [dbo].[prcProcedureWithDynamicSQL]
AS 
    BEGIN

        EXECUTE  ('SELECT count(*) FROM Contacts WHERE ContactFullName LIKE ''D%''')
    END
GO
EXEC sp_addextendedproperty N'MS_Description', N'This serves no purpose except to demonstrate that SQL Search can find object names referenced in dynamic SQL, whereas other methods and tools can''t.', 'SCHEMA', N'dbo', 'PROCEDURE', N'prcProcedureWithDynamicSQL', NULL, NULL
GO
