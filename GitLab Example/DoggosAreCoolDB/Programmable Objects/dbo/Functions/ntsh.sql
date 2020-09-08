IF OBJECT_ID('[dbo].[ntsh]') IS NOT NULL
	DROP FUNCTION [dbo].[ntsh];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/* This "nothing to see here" function does nothing but slow down v_Articles */
CREATE FUNCTION [dbo].[ntsh] (@x INT, @n INT)
RETURNS INT
WITH SCHEMABINDING AS
BEGIN
  DECLARE @retval AS INT;

	DECLARE @i INT = 0
-- Set i to 100 or greater to slow v_Articles to >100ms
	WHILE @i < @n
		BEGIN
			SET @i = @i + 1;
		END
	SET @retval = @x;

  RETURN @retval ;
END;
GO
EXEC sp_addextendedproperty N'MS_Description', N'This used to deliberately slow down the loading of the articles view, but is now deprecated.
The inefficient version of dbo.calculateEstimateOfReadingTime function achieves the same.', 'SCHEMA', N'dbo', 'FUNCTION', N'ntsh', NULL, NULL
GO
