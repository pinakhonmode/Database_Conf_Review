CREATE DATABASE Conference_Review;
SHOW DATABASES;
USE Conference_Review;

CREATE TABLE Paper 
(ID INT unsigned NOT NULL AUTO_INCREMENT, 
Title VARCHAR(150) NOT NULL, 
Abstract VARCHAR(500) NOT NULL, 
Filename VARCHAR(150) NOT NULL, 
PRIMARY KEY (ID));
SHOW TABLES;
DESCRIBE Paper;

CREATE TABLE Author 
(EmailAddr VARCHAR (20) NOT NULL, 
Firstname VARCHAR(20) NOT NULL, 
Lastname VARCHAR(20) NOT NULL, 
PRIMARY KEY (EmailAddr));
SHOW TABLES;
DESCRIBE Author;

CREATE TABLE Reviewer 
(EmailAddr VARCHAR(20) NOT NULL, 
Firstname VARCHAR(20) NOT NULL, 
Lastname VARCHAR(20) NOT NULL, 
AuthorFeedback VARCHAR(250) NOT NULL, 
CommiteeFeedback VARCHAR(250) NOT NULL, 
PhoneNum INT unsigned, 
Affiliation VARCHAR(20), 
PRIMARY KEY (EmailAddr));
SHOW TABLES;
DESCRIBE Reviewer;

CREATE TABLE Review 
(ID INT unsigned NOT NULL AUTO_INCREMENT, 
Recommendation  VARCHAR(150) NOT NULL, 
MeritScore VARCHAR(20) NOT NULL, 
ReadabiltyScore VARCHAR(20) NOT NULL, 
OriginalityScore VARCHAR(20) NOT NULL, 
RelevanceScore VARCHAR(20) NOT NULL, 
PaperID INT references Paper(ID), 
ReviewerID INT references Reviewer(EmailAddr), 
PRIMARY KEY (ID));
SHOW TABLES;
Describe Review;

ALTER TABLE Review ADD 
(PaperID INT unsigned NOT NULL);
ALTER TABLE Review ADD FOREIGN KEY 
(PaperId) REFERENCES Paper(ID);
DESCRIBE Review;

ALTER TABLE Review ADD 
(ReviewerID VARCHAR(20) NOT NULL);
ALTER TABLE Review ADD FOREIGN KEY 
(ReviewerID) REFERENCES Reviewer(EmailAddr);
DESCRIBE Review;

CREATE TABLE Topic 
(ID INT unsigned NOT NULL AUTO_INCREMENT,  
TopicName VARCHAR(50) NOT NULL, 
PRIMARY KEY (ID));

INSERT INTO Paper (ID, Title, Abstract, Filename) VALUE 
('0001','Title 01','This is the abstract of title 01', 'The Book of Magic');

SELECT * FROM Paper;

INSERT INTO Paper (ID, Title, Abstract, Filename) VALUES 
('0002','Title 02','This is the abstract of title 02', 'The Book of Wandering Souls');

SELECT * FROM Paper;

INSERT INTO Paper (ID, Title, Abstract, Filename) VALUES 
('0003','Title 03','This is the abstract of title 03', 'The Day The Earth Stood Still');
SELECT * FROM Paper;

INSERT INTO Paper (ID, Title, Abstract, Filename) VALUES 
('0004','Title 04','This is the abstract of title 04', 'The Book of Maps');
SELECT * FROM Paper;

INSERT INTO Author (EmailAddr, Firstname, Lastname) VALUES 
('skinsella@abc.com', 'Sophie',  'Kinsella');
SELECT * FROM Author;

INSERT INTO Author (EmailAddr, Firstname, Lastname) VALUES 
('jkrowling@def.com', 'Joanne',  'Rowling');
SELECT * FROM Author;

INSERT INTO Author (EmailAddr, Firstname, Lastname) VALUES 
('maxevans@geh.com', 'Max', 'Evans');
SELECT * FROM Author;

INSERT INTO Author (EmailAddr, Firstname, Lastname) VALUES 
('swilliams@njk.com', 'Serenity', 'Williams');
SELECT * FROM Author;

INSERT INTO Reviewer (EmailAddr, Firstname, Lastname, AuthorFeedback, CommiteeFeedback, PhoneNum, Affiliation) VALUES 
('wsmith@abc.com', 'Will', 'Smith', 'This is feedback of author', 
SELECT * FROM Reviewer;


INSERT INTO Reviewer (EmailAddr, Firstname, Lastname, AuthorFeedback, CommiteeFeedback, PhoneNum, Affiliation) VALUES 
('cmartin@abc.com', 'Chris', 'Martin', 'This is feedback of author ab', 'The feedback of commitee ab', '2114567780', 'Affiliation 02');
SELECT * FROM Reviewer;

INSERT INTO Reviewer (EmailAddr, Firstname, Lastname, AuthorFeedback, CommiteeFeedback, PhoneNum, Affiliation) VALUES 
('zoeyp@abc.com', 'Zoey', 'Parker', 'This is feedback of author tt', 'The feedback of commitee tt', '2990876522', 'Affiliation 03');
SELECT * FROM Reviewer;

INSERT INTO Reviewer (EmailAddr, Firstname, Lastname, AuthorFeedback, CommiteeFeedback, PhoneNum, Affiliation) VALUES 
('harperchase@abc.com', 'Harper', 'Chase', 'This is feedback of author dd', 'The feedback of commitee dd', '2908875541', 'Affiliation 04');
SELECT * FROM Reviewer;

INSERT INTO Review (ID, Recommendation, MeritScore, ReadabiltyScore, OriginalityScore, RelevanceScore, PaperID, ReviewerID) VALUES 
('0101', 'Recommendation from professor1', 'Above Average', 'Above Average', 'Above Average', 'Above Average', '0001', 'wsmith@abc.com');
SELECT * FROM Review;

INSERT INTO Review (ID, Recommendation, MeritScore, ReadabiltyScore, OriginalityScore, RelevanceScore, PaperID, ReviewerID) VALUES 
('0102', 'Recommendation from professor2', 'Above Average', 'Average', 'Above Average', 'Average', '0002', 'cmartin@abc.com');
SELECT * FROM Review;

INSERT INTO Review (ID, Recommendation, MeritScore, ReadabiltyScore, OriginalityScore, RelevanceScore, PaperID, ReviewerID) VALUES 
('0103', 'Recommendation from professor3', 'Average', 'Average', 'Above Average', 'Average', '0003', 'zoeyp@abc.com');
SELECT * FROM Review;

INSERT INTO Review (ID, Recommendation, MeritScore, ReadabiltyScore, OriginalityScore, RelevanceScore, PaperID, ReviewerID) VALUES 
('0104', 'Recommendation from professor4', 'Average', 'Below Average', 'Average', 'Above Average', '0004', 'harperchase@abc.com');
SELECT * FROM Review;

INSERT INTO Topic (ID, TopicName) VALUE 
('0111', 'Future of Computing and Artificial Intelligence');
SELECT * FROM Topic;

INSERT INTO Topic (ID, TopicName) VALUE 
('0112', 'Infinity Stones and Legacy');
SELECT * FROM Topic;

INSERT INTO Topic (ID, TopicName) VALUE 
('0113', 'Conspiracy of The Night King');
SELECT * FROM Topic;

INSERT INTO Topic (ID, TopicName) VALUE 
('0114', 'Global Warming and Hazards');
SELECT * FROM Topic;

