CREATE DATABASE Conference_Review;
SHOW DATABASES;
USE Conference_Review;

CREATE TABLE Paper 
(ID INT unsigned NOT NULL AUTO_INCREMENT, 
Title VARCHAR(150) NOT NULL, 
Abstract VARCHAR(500) NOT NULL, 
Filename VARCHAR(150) NOT NULL, 
PRIMARY KEY (ID));


CREATE TABLE Author 
(EmailAddr VARCHAR (20) NOT NULL, 
Firstname VARCHAR(20) NOT NULL, 
Lastname VARCHAR(20) NOT NULL, 
PRIMARY KEY (EmailAddr));


CREATE TABLE Reviewer 
(EmailAddr VARCHAR(20) NOT NULL, 
Firstname VARCHAR(20) NOT NULL, 
Lastname VARCHAR(20) NOT NULL, 
AuthorFeedback VARCHAR(250) NOT NULL, 
CommiteeFeedback VARCHAR(250) NOT NULL, 
PhoneNum INT unsigned, 
Affiliation VARCHAR(20), 
PRIMARY KEY (EmailAddr));


CREATE TABLE Review 
(ID INT unsigned NOT NULL AUTO_INCREMENT, 
Recommendation  VARCHAR(150) NOT NULL, 
MeritScore VARCHAR(20) NOT NULL, 
ReadabiltyScore VARCHAR(20) NOT NULL, 
OriginalityScore VARCHAR(20) NOT NULL, 
RelevanceScore VARCHAR(20) NOT NULL, 
PRIMARY KEY (ID));


ALTER TABLE Review ADD 
(PaperID INT unsigned NOT NULL);

ALTER TABLE Review ADD FOREIGN KEY 
(PaperId) REFERENCES Paper(ID);

ALTER TABLE Review ADD 
(ReviewerID VARCHAR(20) NOT NULL);

ALTER TABLE Review ADD FOREIGN KEY 
(ReviewerID) REFERENCES Reviewer(EmailAddr);


CREATE TABLE Topic 
(ID INT unsigned NOT NULL AUTO_INCREMENT,  
TopicName VARCHAR(50) NOT NULL, 
PRIMARY KEY (ID));


INSERT INTO Paper (ID, Title, Abstract, Filename) VALUE 
('0001','Title 01','This is the abstract of title 01', 'The Book of Magic');

INSERT INTO Paper (ID, Title, Abstract, Filename) VALUES 
('0002','Title 02','This is the abstract of title 02', 'The Book of Wandering Souls');

INSERT INTO Paper (ID, Title, Abstract, Filename) VALUES 
('0003','Title 03','This is the abstract of title 03', 'The Day The Earth Stood Still');

INSERT INTO Paper (ID, Title, Abstract, Filename) VALUES 
('0004','Title 04','This is the abstract of title 04', 'The Book of Maps');

INSERT INTO Author (EmailAddr, Firstname, Lastname) VALUES 
('skinsella@abc.com', 'Sophie',  'Kinsella');

INSERT INTO Author (EmailAddr, Firstname, Lastname) VALUES 
('jkrowling@def.com', 'Joanne',  'Rowling');

INSERT INTO Author (EmailAddr, Firstname, Lastname) VALUES 
('maxevans@geh.com', 'Max', 'Evans');

INSERT INTO Author (EmailAddr, Firstname, Lastname) VALUES 
('swilliams@njk.com', 'Serenity', 'Williams');

INSERT INTO Reviewer (EmailAddr, Firstname, Lastname, AuthorFeedback, CommiteeFeedback, PhoneNum, Affiliation) VALUES 
('wsmith@abc.com', 'Will', 'Smith', 'This is feedback of author', 'The feedback of commitee', '2345789756', 'Affiliation 01');

INSERT INTO Reviewer (EmailAddr, Firstname, Lastname, AuthorFeedback, CommiteeFeedback, PhoneNum, Affiliation) VALUES 
('cmartin@abc.com', 'Chris', 'Martin', 'This is feedback of author ab', 'The feedback of commitee ab', '2114567780', 'Affiliation 02');

INSERT INTO Reviewer (EmailAddr, Firstname, Lastname, AuthorFeedback, CommiteeFeedback, PhoneNum, Affiliation) VALUES 
('zoeyp@abc.com', 'Zoey', 'Parker', 'This is feedback of author tt', 'The feedback of commitee tt', '2990876522', 'Affiliation 03');

INSERT INTO Reviewer (EmailAddr, Firstname, Lastname, AuthorFeedback, CommiteeFeedback, PhoneNum, Affiliation) VALUES 
('harperchase@abc.com', 'Harper', 'Chase', 'This is feedback of author dd', 'The feedback of commitee dd', '2908875541', 'Affiliation 04');

INSERT INTO Review (ID, Recommendation, MeritScore, ReadabiltyScore, OriginalityScore, RelevanceScore, PaperID, ReviewerID) VALUES 
('0101', 'Recommendation from professor1', 'Above Average', 'Above Average', 'Above Average', 'Above Average', '0001', 'wsmith@abc.com');

INSERT INTO Review (ID, Recommendation, MeritScore, ReadabiltyScore, OriginalityScore, RelevanceScore, PaperID, ReviewerID) VALUES 
('0102', 'Recommendation from professor2', 'Above Average', 'Average', 'Above Average', 'Average', '0002', 'cmartin@abc.com');

INSERT INTO Review (ID, Recommendation, MeritScore, ReadabiltyScore, OriginalityScore, RelevanceScore, PaperID, ReviewerID) VALUES 
('0103', 'Recommendation from professor3', 'Average', 'Average', 'Above Average', 'Average', '0003', 'zoeyp@abc.com');

INSERT INTO Review (ID, Recommendation, MeritScore, ReadabiltyScore, OriginalityScore, RelevanceScore, PaperID, ReviewerID) VALUES 
('0104', 'Recommendation from professor4', 'Average', 'Below Average', 'Average', 'Above Average', '0004', 'harperchase@abc.com');

INSERT INTO Topic (ID, TopicName) VALUE 
('0111', 'Future of Computing and Artificial Intelligence');

INSERT INTO Topic (ID, TopicName) VALUE 
('0112', 'Infinity Stones and Legacy');

INSERT INTO Topic (ID, TopicName) VALUE 
('0113', 'Conspiracy of The Night King');

INSERT INTO Topic (ID, TopicName) VALUE 
('0114', 'Global Warming and Hazards');



