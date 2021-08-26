/* This schema is built from an older version of the Stack Exhcange Data Dump: https://archive.org/details/stackexchange
This is shared under Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) https://creativecommons.org/licenses/by-sa/4.0/
*/

CREATE TABLE dbo.Badges
(
    Id INT IDENTITY NOT NULL PRIMARY KEY,
    Name NVARCHAR(40) NOT NULL,
    UserId INT NOT NULL,
    Date DATETIME NOT NULL
);


CREATE TABLE dbo.Comments
(
    Id INT IDENTITY NOT NULL PRIMARY KEY,
    CreationDate DATETIME NOT NULL,
    PostId INT NOT NULL,
    Score INT NULL,
    [Text] NVARCHAR(700) NOT NULL,
    UserId INT NULL
);

CREATE TABLE dbo.LinkTypes
(
    Id INT IDENTITY NOT NULL PRIMARY KEY,
    Type NVARCHAR(50) NOT NULL
);

CREATE TABLE dbo.PostLinks
(
    Id INT IDENTITY NOT NULL PRIMARY KEY,
    CreationDate DATETIME NOT NULL,
    PostId INT NOT NULL,
    RelatedPostId INT NOT NULL,
    LinkTypeId INT NOT NULL
);

CREATE TABLE dbo.Posts
(
    Id INT IDENTITY NOT NULL PRIMARY KEY,
    AcceptedAnswerId INT NULL,
    AnswerCount INT NULL,
    Body TEXT NOT NULL,
    ClosedDate DATETIME NULL,
    CommentCount INT NULL,
    CommunityOwnedDate DATETIME NULL,
    CreationDate DATETIME NOT NULL,
    FavoriteCount INT NULL,
    LastActivityDate DATETIME NOT NULL,
    LastEditDate DATETIME NULL,
    LastEditorDisplayName VARCHAR(40) NULL,
    LastEditorUserId INT NULL,
    OwnerUserId INT NULL,
    ParentId INT NULL,
    PostTypeId INT NOT NULL,
    Score INT NOT NULL,
    Tags VARCHAR(150) NULL,
    Title VARCHAR(250) NULL,
    ViewCount INT NOT NULL
);


CREATE TABLE dbo.PostTypes
(
    Id INT IDENTITY NOT NULL PRIMARY KEY,
    Type NVARCHAR(50) NOT NULL
);

CREATE TABLE dbo.Users
(
    Id INT IDENTITY NOT NULL PRIMARY KEY,
    AboutMe TEXT NULL,
    Age INT NULL,
    CreationDate DATETIME NOT NULL,
    DisplayName VARCHAR(40) NOT NULL,
    DownVotes INT NOT NULL,
    EmailHash VARCHAR(40) NULL,
    LastAccessDate DATETIME NOT NULL,
    Location VARCHAR(100) NULL,
    Reputation INT NOT NULL,
    UpVotes INT NOT NULL,
    [Views] INT NOT NULL,
    WebsiteUrl VARCHAR(200) NULL,
    AccountId INT NULL
);

CREATE TABLE dbo.Votes
(
    Id INT IDENTITY NOT NULL PRIMARY KEY,
    PostId INT NOT NULL,
    UserId INT NULL,
    BountyAmount INT NULL,
    VoteTypeId INT NOT NULL,
    CreationDate DATETIME NOT NULL
);

CREATE TABLE dbo.VoteTypes
(
    Id INT IDENTITY NOT NULL PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL
);