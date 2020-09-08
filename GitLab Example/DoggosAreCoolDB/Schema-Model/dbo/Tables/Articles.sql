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
ALTER TABLE [dbo].[Articles] ADD CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED  ([ArticlesID])
GO
ALTER TABLE [dbo].[Articles] ADD CONSTRAINT [FK_Author] FOREIGN KEY ([AuthorID]) REFERENCES [dbo].[Contacts] ([ContactsID])
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
