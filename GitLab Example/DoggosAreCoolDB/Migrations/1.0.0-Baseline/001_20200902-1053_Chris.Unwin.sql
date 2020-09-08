-- <Migration ID="1e53eea3-6e03-443e-9ac6-3c10025e2255" />
GO

PRINT N'Creating [dbo].[Blogs]'
GO
CREATE TABLE [dbo].[Blogs]
(
[BlogsID] [int] NOT NULL IDENTITY(1, 1),
[AuthorID] [int] NULL,
[Title] [char] (142) NULL,
[Article] [varchar] (max) NULL,
[PublishDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK__Blogs__C03C1E467AEB09A9] on [dbo].[Blogs]'
GO
ALTER TABLE [dbo].[Blogs] ADD CONSTRAINT [PK__Blogs__C03C1E467AEB09A9] PRIMARY KEY CLUSTERED  ([BlogsID])
GO
PRINT N'Creating [dbo].[BlogComments]'
GO
CREATE TABLE [dbo].[BlogComments]
(
[BlogCommentsID] [int] NOT NULL IDENTITY(1, 1),
[BlogsID] [int] NOT NULL,
[CommentText] [nvarchar] (200) NULL,
[CommentDate] [datetime] NOT NULL
)
GO
PRINT N'Creating primary key [PK__BlogComments] on [dbo].[BlogComments]'
GO
ALTER TABLE [dbo].[BlogComments] ADD CONSTRAINT [PK__BlogComments] PRIMARY KEY CLUSTERED  ([BlogCommentsID])
GO
PRINT N'Creating [dbo].[CountryCodes]'
GO
CREATE TABLE [dbo].[CountryCodes]
(
[CountryName] [nvarchar] (255) NULL,
[CountryCode] [nvarchar] (4) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Countries] on [dbo].[CountryCodes]'
GO
ALTER TABLE [dbo].[CountryCodes] ADD CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED  ([CountryCode])
GO
PRINT N'Creating [dbo].[Contacts]'
GO
CREATE TABLE [dbo].[Contacts]
(
[ContactsID] [int] NOT NULL IDENTITY(1, 1),
[ContactFullName] [nvarchar] (100) NOT NULL,
[PhoneWork] [nvarchar] (25) NULL,
[PhoneMobile] [nvarchar] (25) NULL,
[Address1] [nvarchar] (128) NULL,
[Address2] [nvarchar] (128) NULL,
[Address3] [nvarchar] (128) NULL,
[CountryCode] [nvarchar] (4) NULL CONSTRAINT [DF__Contacts__Countr__117F9D94] DEFAULT (N'US'),
[JoiningDate] [datetime] NULL CONSTRAINT [DF__Contacts__Joinin__1273C1CD] DEFAULT (getdate()),
[ModifiedDate] [datetime] NULL,
[Email] [nvarchar] (256) NULL,
[Photo] [image] NULL,
[LinkedIn] [nvarchar] (128) NULL,
[Twitter] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__Contacts__912F378B7C53D1A0] on [dbo].[Contacts]'
GO
ALTER TABLE [dbo].[Contacts] ADD CONSTRAINT [PK__Contacts__912F378B7C53D1A0] PRIMARY KEY CLUSTERED  ([ContactsID])
GO
PRINT N'Creating [dbo].[Articles]'
GO
CREATE TABLE [dbo].[Articles]
(
[ArticlesID] [int] NOT NULL IDENTITY(1, 1),
[AuthorID] [int] NULL,
[Title] [char] (142) NULL,
[Description] [varchar] (max) NULL,
[Article] [varchar] (max) NULL,
[PublishDate] [datetime] NULL,
[ModifiedDate] [datetime] NULL,
[URL] [char] (200) NULL,
[Comments] [int] NULL
)
GO
PRINT N'Creating primary key [PK_Article] on [dbo].[Articles]'
GO
ALTER TABLE [dbo].[Articles] ADD CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED  ([ArticlesID])
GO
PRINT N'Creating [dbo].[ArticleDescriptions]'
GO
CREATE TABLE [dbo].[ArticleDescriptions]
(
[ArticlesID] [int] NOT NULL IDENTITY(1, 1),
[ShortDescription] [nvarchar] (2000) NULL,
[Description] [text] NULL,
[ArticlesName] [varchar] (50) NULL,
[Picture] [image] NULL
)
GO
PRINT N'Creating primary key [PK_ArticleDescriptions] on [dbo].[ArticleDescriptions]'
GO
ALTER TABLE [dbo].[ArticleDescriptions] ADD CONSTRAINT [PK_ArticleDescriptions] PRIMARY KEY CLUSTERED  ([ArticlesID])
GO
PRINT N'Creating [dbo].[ArticlePrices]'
GO
CREATE TABLE [dbo].[ArticlePrices]
(
[ArticlePricesID] [int] NOT NULL IDENTITY(1, 1),
[ArticlesID] [int] NULL,
[Price] [money] NULL,
[ValidFrom] [datetime] NULL CONSTRAINT [DF__ArticlePr__Valid__1CF15040] DEFAULT (getdate()),
[ValidTo] [datetime] NULL,
[Active] [char] (1) NULL CONSTRAINT [DF__ArticlePr__Activ__1DE57479] DEFAULT ('N'),
[SalesPrice] [char] (1) NULL
)
GO
PRINT N'Creating primary key [PK_ArticlePrices] on [dbo].[ArticlePrices]'
GO
ALTER TABLE [dbo].[ArticlePrices] ADD CONSTRAINT [PK_ArticlePrices] PRIMARY KEY CLUSTERED  ([ArticlePricesID])
GO
PRINT N'Creating index [IX_ArticlePrices] on [dbo].[ArticlePrices]'
GO
CREATE NONCLUSTERED INDEX [IX_ArticlePrices] ON [dbo].[ArticlePrices] ([ArticlesID])
GO
PRINT N'Creating index [IX_ArticlePrices_1] on [dbo].[ArticlePrices]'
GO
CREATE NONCLUSTERED INDEX [IX_ArticlePrices_1] ON [dbo].[ArticlePrices] ([ValidFrom])
GO
PRINT N'Creating index [IX_ArticlePrices_2] on [dbo].[ArticlePrices]'
GO
CREATE NONCLUSTERED INDEX [IX_ArticlePrices_2] ON [dbo].[ArticlePrices] ([ValidTo])
GO
PRINT N'Creating [dbo].[ArticleReferences]'
GO
CREATE TABLE [dbo].[ArticleReferences]
(
[ArticlesID] [int] NOT NULL IDENTITY(1, 1),
[Reference] [varchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_ArticleReferences] on [dbo].[ArticleReferences]'
GO
ALTER TABLE [dbo].[ArticleReferences] ADD CONSTRAINT [PK_ArticleReferences] PRIMARY KEY CLUSTERED  ([ArticlesID])
GO
PRINT N'Creating [dbo].[calculateEstimateOfReadingTime]'
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
PRINT N'Creating [dbo].[v_Articles]'
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
PRINT N'Creating [dbo].[ufnGetBlogInformation]'
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
PRINT N'Creating [dbo].[prcAddBlog]'
GO
CREATE PROCEDURE [dbo].[prcAddBlog]
    @Author VARCHAR(30),
    @Title VARCHAR(142) = NULL,
    @Article VARCHAR(MAX) = NULL
    WITH EXECUTE AS CALLER
AS
BEGIN

    INSERT  INTO dbo.Blogs (AuthorID, Title, Article, PublishDate)
    VALUES  (@Author, @Title, @Article, GETDATE())
        
        
END;
GO
PRINT N'Creating [dbo].[prcAddContact]'
GO
/* 
Sample execution: 
EXEC [prcAddContact] 'david', '12345', '23456', '152 Riverside Place', 'Cambridge', '', 'feedback@red-gate.com', NULL
*/

CREATE PROCEDURE [dbo].[prcAddContact]   @ContactFullName VARCHAR(30),
										 @PhoneWork VARCHAR(30) = NULL,
										 @PhoneMobile VARCHAR(30) = NULL,
										 @Address1 VARCHAR(30) = NULL,
										 @Address2 VARCHAR(30) = NULL,
										 @Address3 VARCHAR(30) = NULL,
										 @Email VARCHAR(30) = NULL,
										 @JoiningDate DATETIME = NULL

WITH EXECUTE AS CALLER
AS
BEGIN

INSERT INTO dbo.Contacts
        ( ContactFullName ,
          PhoneWork ,
          PhoneMobile ,
          Address1 ,
          Address2 ,
          Address3 ,
          JoiningDate ,
          ModifiedDate ,
          Email
        )
VALUES  ( @ContactFullName , -- ContactFullName - nvarchar(100)
         @PhoneWork , -- PhoneWork - nvarchar(25)
         @PhoneMobile , -- PhoneMobile - nvarchar(25)
         @Address1 , -- Address1 - nvarchar(128)
         @Address2 , -- Address2 - nvarchar(128)
         @Address3 , -- Address3 - nvarchar(128)
          @JoiningDate , -- JoiningDate - datetime, e.g. '2012-01-17 11:42:45' 
          GETDATE() , -- ModifiedDate - datetime
          @Email  -- Email - nvarchar(256)
        )
        
        
        END;
GO
PRINT N'Creating [dbo].[prcGetContacts]'
GO
CREATE PROCEDURE [dbo].[prcGetContacts]
AS
    SELECT  *
    FROM    Contacts

	-- v6
GO
PRINT N'Creating [dbo].[prcGetCountries]'
GO
--SET QUOTED_IDENTIFIER ON|OFF
--SET ANSI_NULLS ON|OFF
--GO
CREATE PROCEDURE [dbo].[prcGetCountries]
 
-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| 'user_name'
AS
    SELECT * FROM dbo.CountryCodes
GO
PRINT N'Creating [dbo].[RSSFeeds]'
GO
CREATE TABLE [dbo].[RSSFeeds]
(
[RSSFeedID] [int] NOT NULL IDENTITY(1, 1),
[FeedName] [varchar] (max) NULL,
[Checked] [bit] NULL,
[FeedBurner] [bit] NOT NULL
)
GO
PRINT N'Creating primary key [PK__RSSFeeds__DF1690F2C1F77AC5] on [dbo].[RSSFeeds]'
GO
ALTER TABLE [dbo].[RSSFeeds] ADD CONSTRAINT [PK__RSSFeeds__DF1690F2C1F77AC5] PRIMARY KEY CLUSTERED  ([RSSFeedID])
GO
PRINT N'Creating [dbo].[prcGetRSSFeeds]'
GO
CREATE PROCEDURE [dbo].[prcGetRSSFeeds]
AS
    SELECT  RSSFeedID,
            FeedName,
            Checked
    FROM    dbo.RSSFeeds

	-- v6
GO
PRINT N'Creating [dbo].[ArticlesPriceList]'
GO
-- Create indexed view
CREATE VIEW [dbo].[ArticlesPriceList]
AS
SELECT     a.ArticlesID, a.Description AS Articles, ap.Price
FROM       dbo.Articles AS a LEFT JOIN
           dbo.ArticlePrices AS ap ON a.ArticlesID = ap.ArticlePricesID
GO
PRINT N'Creating [dbo].[v_Blogs]'
GO
CREATE VIEW [dbo].[v_Blogs]
AS
SELECT  c.ContactFullName, Title, Article, PublishDate
FROM    Blogs
        INNER JOIN dbo.Contacts c ON c.ContactsID = dbo.Blogs.AuthorID
GO
PRINT N'Creating [dbo].[ArticlePurchases]'
GO
CREATE TABLE [dbo].[ArticlePurchases]
(
[ArticlePurchasesID] [int] NOT NULL IDENTITY(1, 1),
[ArticlePricesID] [int] NOT NULL,
[Quantity] [int] NOT NULL CONSTRAINT [DF__ArticlePu__Quant__22AA2996] DEFAULT ((1)),
[InvoiceNumber] [nvarchar] (20) NULL,
[PurchaseDate] [datetime] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ArticlePurchases] on [dbo].[ArticlePurchases]'
GO
ALTER TABLE [dbo].[ArticlePurchases] ADD CONSTRAINT [PK_ArticlePurchases] PRIMARY KEY CLUSTERED  ([ArticlePurchasesID])
GO
PRINT N'Creating [dbo].[PersonData]'
GO
CREATE TABLE [dbo].[PersonData]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[NAME] [nvarchar] (200) NOT NULL,
[Email1] [nvarchar] (200) NULL,
[Email2] [nvarchar] (200) NULL,
[Phone1] [nvarchar] (100) NULL,
[Phone2] [nvarchar] (100) NULL,
[Street1] [nvarchar] (200) NULL,
[City1] [nvarchar] (200) NULL,
[StateProvince1] [nvarchar] (50) NULL,
[PostalCode1] [nvarchar] (50) NULL,
[Street2] [nvarchar] (200) NULL,
[City2] [nvarchar] (200) NULL,
[StateProvince2] [nvarchar] (50) NULL,
[PostalCode2] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__PersonDa__3214EC27CA5DC9C3] on [dbo].[PersonData]'
GO
ALTER TABLE [dbo].[PersonData] ADD CONSTRAINT [PK__PersonDa__3214EC27CA5DC9C3] PRIMARY KEY CLUSTERED  ([ID])
GO
PRINT N'Creating [dbo].[ntsh]'
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
PRINT N'Creating [dbo].[prcProcedureWithDynamicSQL]'
GO
/* This is a procedure that simply contains dynamic SQL just to demonstrate that dependencies aren't picked up. 
Use SQL Search to find these. */
CREATE PROCEDURE [dbo].[prcProcedureWithDynamicSQL]
AS 
    BEGIN

        EXECUTE  ('SELECT count(*) FROM Contacts WHERE ContactFullName LIKE ''D%''')
    END
GO
PRINT N'Adding foreign keys to [dbo].[BlogComments]'
GO
ALTER TABLE [dbo].[BlogComments] ADD CONSTRAINT [FK__BlogComments] FOREIGN KEY ([BlogsID]) REFERENCES [dbo].[Blogs] ([BlogsID])
GO
PRINT N'Adding foreign keys to [dbo].[ArticleDescriptions]'
GO
ALTER TABLE [dbo].[ArticleDescriptions] ADD CONSTRAINT [FK_ArticleDescriptions] FOREIGN KEY ([ArticlesID]) REFERENCES [dbo].[Articles] ([ArticlesID])
GO
PRINT N'Adding foreign keys to [dbo].[ArticlePrices]'
GO
ALTER TABLE [dbo].[ArticlePrices] ADD CONSTRAINT [FK_ArticlePrices] FOREIGN KEY ([ArticlesID]) REFERENCES [dbo].[Articles] ([ArticlesID])
GO
PRINT N'Adding foreign keys to [dbo].[ArticleReferences]'
GO
ALTER TABLE [dbo].[ArticleReferences] ADD CONSTRAINT [FK_Articles] FOREIGN KEY ([ArticlesID]) REFERENCES [dbo].[Articles] ([ArticlesID])
GO
PRINT N'Adding foreign keys to [dbo].[Articles]'
GO
ALTER TABLE [dbo].[Articles] ADD CONSTRAINT [FK_Author] FOREIGN KEY ([AuthorID]) REFERENCES [dbo].[Contacts] ([ContactsID])
GO
PRINT N'Adding foreign keys to [dbo].[Blogs]'
GO
ALTER TABLE [dbo].[Blogs] ADD CONSTRAINT [FK_BlogAuthor] FOREIGN KEY ([AuthorID]) REFERENCES [dbo].[Contacts] ([ContactsID])
GO
PRINT N'Adding foreign keys to [dbo].[Contacts]'
GO
ALTER TABLE [dbo].[Contacts] ADD CONSTRAINT [FK__Contacts__Countr__145C0A3F] FOREIGN KEY ([CountryCode]) REFERENCES [dbo].[CountryCodes] ([CountryCode])
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Function to estimate how long an average reader will take to read an article based on its length.
This is infomation that will be displayed alongside the article summary on the main Simple Talk home page.
Research indicates that an average person can read 250 words in a minute.', 'SCHEMA', N'dbo', 'FUNCTION', N'calculateEstimateOfReadingTime', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The article text', 'SCHEMA', N'dbo', 'FUNCTION', N'calculateEstimateOfReadingTime', 'PARAMETER', N'@value'
GO
EXEC sp_addextendedproperty N'MS_Description', N'This used to deliberately slow down the loading of the articles view, but is now deprecated.
The inefficient version of dbo.calculateEstimateOfReadingTime function achieves the same.', 'SCHEMA', N'dbo', 'FUNCTION', N'ntsh', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'This function returns a table with basic infomation pulled from the Blogs table', 'SCHEMA', N'dbo', 'FUNCTION', N'ufnGetBlogInformation', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'A short summary of the article appearing on the main Simple Talk page', 'SCHEMA', N'dbo', 'TABLE', N'ArticleDescriptions', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated - do not use', 'SCHEMA', N'dbo', 'TABLE', N'ArticleDescriptions', 'COLUMN', N'ArticlesName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated - do not use', 'SCHEMA', N'dbo', 'TABLE', N'ArticleDescriptions', 'COLUMN', N'Description'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Deprecated - do not use', 'SCHEMA', N'dbo', 'TABLE', N'ArticleDescriptions', 'COLUMN', N'Picture'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The description that appears on the main web page', 'SCHEMA', N'dbo', 'TABLE', N'ArticleDescriptions', 'COLUMN', N'ShortDescription'
GO
EXEC sp_addextendedproperty N'MS_Description', N'How much was paid for the article', 'SCHEMA', N'dbo', 'TABLE', N'ArticlePrices', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'References listed in an article', 'SCHEMA', N'dbo', 'TABLE', N'ArticleReferences', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Table of Simple Talk articles', 'SCHEMA', N'dbo', 'TABLE', N'Articles', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The actual article content', 'SCHEMA', N'dbo', 'TABLE', N'Articles', 'COLUMN', N'Article'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The number of reader comments for a given article', 'SCHEMA', N'dbo', 'TABLE', N'Articles', 'COLUMN', N'Comments'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A short description of the article going between the title and "read more"', 'SCHEMA', N'dbo', 'TABLE', N'Articles', 'COLUMN', N'Description'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When the article was last modified', 'SCHEMA', N'dbo', 'TABLE', N'Articles', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When the article was published', 'SCHEMA', N'dbo', 'TABLE', N'Articles', 'COLUMN', N'PublishDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The main title - appears on main web page as well as heading the article page', 'SCHEMA', N'dbo', 'TABLE', N'Articles', 'COLUMN', N'Title'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The hyperlink when the title or "read more" is clicked', 'SCHEMA', N'dbo', 'TABLE', N'Articles', 'COLUMN', N'URL'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Comments made by readers', 'SCHEMA', N'dbo', 'TABLE', N'BlogComments', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The date the comment was made', 'SCHEMA', N'dbo', 'TABLE', N'BlogComments', 'COLUMN', N'CommentDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The text for the comment', 'SCHEMA', N'dbo', 'TABLE', N'BlogComments', 'COLUMN', N'CommentText'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Blog posts made by Simple Talk members', 'SCHEMA', N'dbo', 'TABLE', N'Blogs', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The body text for the Blog', 'SCHEMA', N'dbo', 'TABLE', N'Blogs', 'COLUMN', N'Article'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Authors link back to the Contacts table', 'SCHEMA', N'dbo', 'TABLE', N'Blogs', 'COLUMN', N'AuthorID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date the Blog was published', 'SCHEMA', N'dbo', 'TABLE', N'Blogs', 'COLUMN', N'PublishDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Title of a Blog', 'SCHEMA', N'dbo', 'TABLE', N'Blogs', 'COLUMN', N'Title'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A list of all Simple Talk members, including authors, bloggers, and any other member or contributor', 'SCHEMA', N'dbo', 'TABLE', N'Contacts', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Contact name', 'SCHEMA', N'dbo', 'TABLE', N'Contacts', 'COLUMN', N'ContactFullName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Country for the given address', 'SCHEMA', N'dbo', 'TABLE', N'Contacts', 'COLUMN', N'CountryCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Contact email address', 'SCHEMA', N'dbo', 'TABLE', N'Contacts', 'COLUMN', N'Email'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When the contact joined Simple Talk', 'SCHEMA', N'dbo', 'TABLE', N'Contacts', 'COLUMN', N'JoiningDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When the contact details were last modified', 'SCHEMA', N'dbo', 'TABLE', N'Contacts', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Photo of contact, especially authors.
This is now deprecated as the photos are saved as image files outside of the database.', 'SCHEMA', N'dbo', 'TABLE', N'Contacts', 'COLUMN', N'Photo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A list of country codes 
ISO 3166-1-alpha-2 code
http://www.iso.org/iso/country_codes/iso_3166_code_lists/country_names_and_code_elements.htm', 'SCHEMA', N'dbo', 'TABLE', N'CountryCodes', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'In theory shouldn''t need more than two characters', 'SCHEMA', N'dbo', 'TABLE', N'CountryCodes', 'COLUMN', N'CountryCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A feature to create a custom RSS feed', 'SCHEMA', N'dbo', 'TABLE', N'RSSFeeds', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Whether checked by default on the list offered to users', 'SCHEMA', N'dbo', 'TABLE', N'RSSFeeds', 'COLUMN', N'Checked'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Eg, SQL, .NET, SysAdmin, Opinion etc.', 'SCHEMA', N'dbo', 'TABLE', N'RSSFeeds', 'COLUMN', N'FeedName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Procedure to add a new blog post to Simple Talk', 'SCHEMA', N'dbo', 'PROCEDURE', N'prcAddBlog', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Add a new contact to the Simple Talk community', 'SCHEMA', N'dbo', 'PROCEDURE', N'prcAddContact', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'This serves no purpose except to demonstrate that SQL Search can find object names referenced in dynamic SQL, whereas other methods and tools can''t.', 'SCHEMA', N'dbo', 'PROCEDURE', N'prcProcedureWithDynamicSQL', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'This is the view that is called from the web application to display the articles on the main Simple Talk website', 'SCHEMA', N'dbo', 'VIEW', N'v_Articles', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Note: photos are no longer pulled from the database.', 'SCHEMA', N'dbo', 'VIEW', N'v_Articles', 'COLUMN', N'Photo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'View to pull down list of blogs', 'SCHEMA', N'dbo', 'VIEW', N'v_Blogs', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Simple Talk is a technical journal and community hub from Red Gate', NULL, NULL, NULL, NULL, NULL, NULL
GO
