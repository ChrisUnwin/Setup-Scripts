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
ALTER TABLE [dbo].[PersonData] ADD CONSTRAINT [PK__PersonDa__3214EC27CA5DC9C3] PRIMARY KEY CLUSTERED  ([ID])
GO
