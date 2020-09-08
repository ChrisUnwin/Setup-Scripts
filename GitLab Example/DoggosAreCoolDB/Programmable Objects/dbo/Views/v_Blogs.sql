IF OBJECT_ID('[dbo].[v_Blogs]') IS NOT NULL
	DROP VIEW [dbo].[v_Blogs];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[v_Blogs]
AS
SELECT  c.ContactFullName, Title, Article, PublishDate
FROM    Blogs
        INNER JOIN dbo.Contacts c ON c.ContactsID = dbo.Blogs.AuthorID
GO
EXEC sp_addextendedproperty N'MS_Description', N'View to pull down list of blogs', 'SCHEMA', N'dbo', 'VIEW', N'v_Blogs', NULL, NULL
GO
