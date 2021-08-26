CREATE OR ALTER VIEW dbo.PostsWithUsers
AS
SELECT OwnerUserId,
       DisplayName,
       Title
FROM dbo.Posts
    LEFT JOIN dbo.Users
        ON Users.Id = Posts.OwnerUserId;