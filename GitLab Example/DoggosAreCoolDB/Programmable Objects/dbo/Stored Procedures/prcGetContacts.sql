IF OBJECT_ID('[dbo].[prcGetContacts]') IS NOT NULL
	DROP PROCEDURE [dbo].[prcGetContacts];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[prcGetContacts]
AS
    SELECT  *
    FROM    Contacts

	-- v6
GO
