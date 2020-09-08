IF OBJECT_ID('[dbo].[ufnGetBlogInformation]') IS NOT NULL
	DROP FUNCTION [dbo].[ufnGetBlogInformation];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[ufnGetBlogInformation] (@Contact INT)
RETURNS @retBlogInformation TABLE (-- Columns returned by the function
                                   [AuthorID] INT NOT NULL,
                                   [Title] [nvarchar](50) NULL)
AS 

BEGIN
    INSERT  INTO @retBlogInformation
            SELECT  AuthorID, Title
            FROM    dbo.Blogs
            WHERE   AuthorID=@Contact

    RETURN
END
GO
EXEC sp_addextendedproperty N'MS_Description', N'This function returns a table with basic infomation pulled from the Blogs table', 'SCHEMA', N'dbo', 'FUNCTION', N'ufnGetBlogInformation', NULL, NULL
GO
