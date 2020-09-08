IF OBJECT_ID('[dbo].[calculateEstimateOfReadingTime]') IS NOT NULL
	DROP FUNCTION [dbo].[calculateEstimateOfReadingTime];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- This is a much more accurate function
CREATE FUNCTION [dbo].[calculateEstimateOfReadingTime] ( @value VARCHAR(MAX) )
RETURNS INT
    BEGIN
        DECLARE @ret AS INT = 1 ,
            @i AS INT = 1;
        WHILE @i <= LEN(@value) 
            BEGIN
                IF SUBSTRING(@value, @i, 1) = ' ' 
                    BEGIN
                        SET @ret = @ret + 1;
                    END
                SET @i = @i + 1;
            END  
        RETURN @ret / 250;
    END
GO
EXEC sp_addextendedproperty N'MS_Description', N'Function to estimate how long an average reader will take to read an article based on its length.
This is infomation that will be displayed alongside the article summary on the main Simple Talk home page.
Research indicates that an average person can read 250 words in a minute.', 'SCHEMA', N'dbo', 'FUNCTION', N'calculateEstimateOfReadingTime', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The article text', 'SCHEMA', N'dbo', 'FUNCTION', N'calculateEstimateOfReadingTime', 'PARAMETER', N'@value'
GO
