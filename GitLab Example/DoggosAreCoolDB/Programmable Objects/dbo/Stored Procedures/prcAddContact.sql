IF OBJECT_ID('[dbo].[prcAddContact]') IS NOT NULL
	DROP PROCEDURE [dbo].[prcAddContact];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
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
EXEC sp_addextendedproperty N'MS_Description', N'Add a new contact to the Simple Talk community', 'SCHEMA', N'dbo', 'PROCEDURE', N'prcAddContact', NULL, NULL
GO
