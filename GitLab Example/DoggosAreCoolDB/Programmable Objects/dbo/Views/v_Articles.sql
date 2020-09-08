IF OBJECT_ID('[dbo].[v_Articles]') IS NOT NULL
	DROP VIEW [dbo].[v_Articles];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/* This view gets called from the ST web app to show the articles */
CREATE VIEW [dbo].[v_Articles]
AS
    SELECT  TOP 250 a.[Title] ,
            a.[PublishDate] ,
            a.[Description] ,
            a.[URL] ,
            a.[Comments], 
			dbo.calculateEstimateOfReadingTime(a.Article) AS readingTime,
            c.[ContactFullName] ,
			c.[Photo],
			cc.CountryCode,
			cc.CountryName
    FROM    Articles a
		        LEFT JOIN Contacts c ON a.AuthorID = c.ContactsID
			LEFT JOIN dbo.CountryCodes cc ON c.CountryCode = cc.Countrycode
GO
EXEC sp_addextendedproperty N'MS_Description', N'This is the view that is called from the web application to display the articles on the main Simple Talk website', 'SCHEMA', N'dbo', 'VIEW', N'v_Articles', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Note: photos are no longer pulled from the database.', 'SCHEMA', N'dbo', 'VIEW', N'v_Articles', 'COLUMN', N'Photo'
GO
