IF OBJECT_ID('[dbo].[ArticlesPriceList]') IS NOT NULL
	DROP VIEW [dbo].[ArticlesPriceList];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Create indexed view
CREATE VIEW [dbo].[ArticlesPriceList]
AS
SELECT     a.ArticlesID, a.Description AS Articles, ap.Price
FROM       dbo.Articles AS a LEFT JOIN
           dbo.ArticlePrices AS ap ON a.ArticlesID = ap.ArticlePricesID
GO
