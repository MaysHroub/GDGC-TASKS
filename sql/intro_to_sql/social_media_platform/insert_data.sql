INSERT INTO Users (UserName, Gender, DOB, Email)
VALUES
('Mays Al-Reem', 'Female', '2004-04-14', 'msreem@gmail.com'),
('Baraa Hroub', 'Male', '1999-07-13', 'hbaraa@gmail.com');

INSERT INTO Post (Content, Visibility, UserID)
VALUES
('HI, this is my first post.', 'Public', 1),
('This post is only for me. hehe', 'Private', 2);

INSERT INTO Comment (Content, UserID, PostID)
VALUES
('Nice.', 2, 1),
('But I can see it :3', 1, 2);

INSERT INTO Interaction (Type, UserID, PostID)
VALUES
('Like', 2, 1),
('Funny', 1, 2);

INSERT INTO User_Post (UserID, PostID)
VALUES
(1, 1),
(2, 2);