-- <Migration ID="28877771-ec19-45c8-9a6d-93288949c26f" />
GO

PRINT N'Altering [dbo].[Contacts]'
GO
ALTER TABLE [dbo].[Contacts] ADD
[Hello] [nvarchar] (50) NULL
GO
