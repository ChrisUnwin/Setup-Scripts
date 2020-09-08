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
[Twitter] [nvarchar] (50) NULL,
[Hello] [nvarchar] (50) NULL
)
GO
ALTER TABLE [dbo].[Contacts] ADD CONSTRAINT [PK__Contacts__912F378B7C53D1A0] PRIMARY KEY CLUSTERED  ([ContactsID])
GO
ALTER TABLE [dbo].[Contacts] ADD CONSTRAINT [FK__Contacts__Countr__145C0A3F] FOREIGN KEY ([CountryCode]) REFERENCES [dbo].[CountryCodes] ([CountryCode])
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
