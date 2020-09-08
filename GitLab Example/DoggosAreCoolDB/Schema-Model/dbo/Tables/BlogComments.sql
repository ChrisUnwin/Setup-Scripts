CREATE TABLE [dbo].[BlogComments]
(
[BlogCommentsID] [int] NOT NULL IDENTITY(1, 1),
[BlogsID] [int] NOT NULL,
[CommentText] [nvarchar] (200) NULL,
[CommentDate] [datetime] NOT NULL
)
GO
ALTER TABLE [dbo].[BlogComments] ADD CONSTRAINT [PK__BlogComments] PRIMARY KEY CLUSTERED  ([BlogCommentsID])
GO
ALTER TABLE [dbo].[BlogComments] ADD CONSTRAINT [FK__BlogComments] FOREIGN KEY ([BlogsID]) REFERENCES [dbo].[Blogs] ([BlogsID])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Comments made by readers', 'SCHEMA', N'dbo', 'TABLE', N'BlogComments', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The date the comment was made', 'SCHEMA', N'dbo', 'TABLE', N'BlogComments', 'COLUMN', N'CommentDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The text for the comment', 'SCHEMA', N'dbo', 'TABLE', N'BlogComments', 'COLUMN', N'CommentText'
GO
