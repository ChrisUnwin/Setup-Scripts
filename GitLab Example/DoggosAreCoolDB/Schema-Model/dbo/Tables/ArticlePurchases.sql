CREATE TABLE [dbo].[ArticlePurchases]
(
[ArticlePurchasesID] [int] NOT NULL IDENTITY(1, 1),
[ArticlePricesID] [int] NOT NULL,
[Quantity] [int] NOT NULL CONSTRAINT [DF__ArticlePu__Quant__22AA2996] DEFAULT ((1)),
[InvoiceNumber] [nvarchar] (20) NULL,
[PurchaseDate] [datetime] NOT NULL
)
GO
ALTER TABLE [dbo].[ArticlePurchases] ADD CONSTRAINT [PK_ArticlePurchases] PRIMARY KEY CLUSTERED  ([ArticlePurchasesID])
GO
