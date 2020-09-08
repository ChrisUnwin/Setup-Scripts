IF OBJECT_ID('[dbo].[prcGetRSSFeeds]') IS NOT NULL
	DROP PROCEDURE [dbo].[prcGetRSSFeeds];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[prcGetRSSFeeds]
AS
    SELECT  RSSFeedID,
            FeedName,
            Checked
    FROM    dbo.RSSFeeds

	-- v6
GO
