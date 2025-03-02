CREATE DATABASE SocialMediaPlatform;
USE SocialMediaPlatform;

CREATE TABLE Users (
    UserID INT IDENTITY PRIMARY KEY ,
    UserName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    DOB DATETIME NOT NULL,
	Gender NVARCHAR(50) NOT NULL,
    joinDate DATETIME DEFAULT GETUTCDATE(),
);

CREATE TABLE Posts (
    PostID INT IDENTITY PRIMARY KEY,
    UserID INT,
    Content NVARCHAR(MAX) NOT NULL, 
    PostDate DATETIME DEFAULT GETUTCDATE(),
	Visibility NVARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ,
);

CREATE TABLE Interactions (
    InteractionID INT IDENTITY PRIMARY KEY,
    InteractionType NVARCHAR(50) ,
    InteractionDate DATETIME DEFAULT GETUTCDATE(),
);

CREATE TABLE Comments (
   CommentID INT IDENTITY PRIMARY KEY,
   Content NVARCHAR(MAX) ,
   CommentDate DATETIME DEFAULT GETUTCDATE(),
   UserID INT,
   PostID INT,
   FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
   FOREIGN KEY (PostID) REFERENCES Posts(PostID) ON DELETE CASCADE,
);

CREATE TABLE Interact 
(
  UserID INT,
  InteractionID INT,
  PostID INT,
  FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
  FOREIGN KEY (InteractionID) REFERENCES Interactions(InteractionID) ON DELETE CASCADE,
  FOREIGN KEY (PostID) REFERENCES Posts(PostID) ON DELETE CASCADE,
);

INSERT INTO Users ( UserName ,  Email ,DOB, Gender )
VALUES
( 'menna' , 'mennaibrahim@gmail.com' , '2004-11-10' , 'female' );

INSERT INTO Interactions ( InteractionType )
VALUES
('Like')