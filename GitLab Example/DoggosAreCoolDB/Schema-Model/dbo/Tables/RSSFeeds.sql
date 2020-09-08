CREATE TABLE [dbo].[RSSFeeds]
(
[RSSFeedID] [int] NOT NULL IDENTITY(1, 1),
[FeedName] [varchar] (max) NULL,
[Checked] [bit] NULL,
[FeedBurner] [bit] NOT NULL
)
GO
ALTER TABLE [dbo].[RSSFeeds] ADD CONSTRAINT [PK__RSSFeeds__DF1690F2C1F77AC5] PRIMARY KEY CLUSTERED  ([RSSFeedID])
GO
EXEC sp_addextendedproperty N'MS_Description', N'A feature to create a custom RSS feed', 'SCHEMA', N'dbo', 'TABLE', N'RSSFeeds', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Whether checked by default on the list offered to users', 'SCHEMA', N'dbo', 'TABLE', N'RSSFeeds', 'COLUMN', N'Checked'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Eg, SQL, .NET, SysAdmin, Opinion etc.', 'SCHEMA', N'dbo', 'TABLE', N'RSSFeeds', 'COLUMN', N'FeedName'
GO
