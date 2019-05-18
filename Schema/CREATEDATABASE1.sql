CREATE DATABASE Review_Conference;
SHOW DATABASES;
USE DATABASE Review_Conference;

CREATE TABLE Author (EmailAddr VARCHAR (20) NOT NULL, Firstname VARCHAR(20) NOT NULL, Lastname VARCHAR(20) NOT NULL, PRIMARY KEY (EmailAddr));

CREATE TABLE Paper (ID INT unsigned NOT NULL AUTO_INCREMENT, Title VARCHAR(150) NOT NULL, Abstract VARCHAR(500) NOT NULL, Filename VARCHAR(150) NOT NULL, PRIMARY KEY (ID));
ALTER TABLE Paper ADD (AuthorEmail VARCHAR(20) NOT NULL);
ALTER TABLE Paper ADD FOREIGN KEY (AuthorEmail) REFERENCES Author(EmailAddr);

CREATE TABLE Review (ID INT unsigned NOT NULL AUTO_INCREMENT, Recommendation  VARCHAR(150) NOT NULL, MeritScore VARCHAR(20) NOT NULL, ReadabiltyScore VARCHAR(20) NOT NULL, OriginalityScore VARCHAR(20) NOT NULL, RelevanceScore VARCHAR(20) NOT NULL, PRIMARY KEY (ID));
ALTER TABLE Review ADD (PaperID INT unsigned NOT NULL);
ALTER TABLE Review ADD FOREIGN KEY (PaperId) REFERENCES Paper(ID);
ALTER TABLE Review ADD (ReviewerID VARCHAR(20) NOT NULL);

CREATE TABLE Reviewer (EmailAddr VARCHAR(20) NOT NULL, Firstname VARCHAR(20) NOT NULL, Lastname VARCHAR(20) NOT NULL, AuthorFeedback VARCHAR(250) NOT NULL, CommiteeFeedback VARCHAR(250) NOT NULL, PhoneNum INT unsigned, Affiliation VARCHAR(20), PRIMARY KEY (EmailAddr));

CREATE TABLE Topic (ID INT unsigned NOT NULL AUTO_INCREMENT,  TopicName VARCHAR(50) NOT NULL, PRIMARY KEY (ID));

ALTER TABLE Reviewer ADD (TopicID INT unsigned NOT NULL);
ALTER TABLE Reviewer ADD FOREIGN KEY (TopicID) REFERENCES Topic(ID);
ALTER TABLE Reviewer ADD (ReviewID INT unsigned NOT NULL);
ALTER TABLE Reviewer ADD FOREIGN KEY (ReviewID) REFERENCES Review(ID);

INSERT INTO Author (EmailAddr, Firstname, Lastname) VALUES ('skinsella@abc.com', 'Sophie',  'Kinsella');
INSERT INTO Author (EmailAddr, Firstname, Lastname) VALUES ('jkrowling@def.com', 'Joanne',  'Rowling');
INSERT INTO Author (EmailAddr, Firstname, Lastname) VALUES ('maxevans@geh.com', 'Max', 'Evans');
INSERT INTO Author (EmailAddr, Firstname, Lastname) VALUES ('swilliams@njk.com', 'Serenity', 'Williams');

INSERT INTO Paper (ID, Title, Abstract, Filename,AuthorEmail) VALUE ('0001','Title 01','This is the abstract of title 01', 'The Book of Magic','skinsella@abc.com');
INSERT INTO Paper (ID, Title, Abstract, Filename,AuthorEmail) VALUES ('0002','Title 02','This is the abstract of title 02', 'The Book of Wandering Souls','jkrowling@def.com');
INSERT INTO Paper (ID, Title, Abstract, Filename,AuthorEmail) VALUES ('0003','Title 03','This is the abstract of title 03', 'The Day The Earth Stood Still','maxevans@geh.com');
INSERT INTO Paper (ID, Title, Abstract, Filename,AuthorEmail) VALUES ('0004','Title 04','This is the abstract of title 04', 'The Book of Maps','swilliams@njk.com');

INSERT INTO Review (ID, Recommendation, MeritScore, ReadabiltyScore, OriginalityScore, RelevanceScore, PaperID) VALUES ('0104', 'Publish', 'Average', 'Below Average', 'Average', 'Above Average', '0004');
INSERT INTO Review (ID, Recommendation, MeritScore, ReadabiltyScore, OriginalityScore, RelevanceScore, PaperID, ReviewerID) VALUES ('0101', 'Publish', 'Above Average', 'Above Average', 'Above Average', 'Above Average', '0001', 'wsmith@abc.com');
INSERT INTO Review (ID, Recommendation, MeritScore, ReadabiltyScore, OriginalityScore, RelevanceScore, PaperID, ReviewerID) VALUES ('0102', 'Not to publish', 'Above Average', 'Average', 'Above Average', 'Average', '0002', 'cmartin@abc.com');
INSERT INTO Review (ID, Recommendation, MeritScore, ReadabiltyScore, OriginalityScore, RelevanceScore, PaperID, ReviewerID) VALUES ('0103', 'Publish', 'Average', 'Average', 'Above Average', 'Average', '0003', 'zoeyp@abc.com');
INSERT INTO Review (ID, Recommendation, MeritScore, ReadabiltyScore, OriginalityScore, RelevanceScore, PaperID, ReviewerID) VALUES ('0104', 'Publish', 'Average', 'Below Average', 'Average', 'Above Average', '0004', 'harperchase@abc.com');

INSERT INTO Topic (ID, TopicName) VALUE ('0111', 'Future of Computing and Artificial Intelligence');
INSERT INTO Topic (ID, TopicName) VALUE ('0112', 'Infinity Stones and Legacy');
INSERT INTO Topic (ID, TopicName) VALUE ('0113', 'Conspiracy of The Night King');
INSERT INTO Topic (ID, TopicName) VALUE ('0114', 'Global Warming and Hazards');

INSERT INTO Reviewer (EmailAddr, Firstname, Lastname, AuthorFeedback, CommiteeFeedback, PhoneNum, Affiliation, TopicID, ReviewID) VALUES ('wsmith@abc.com', 'Will', 'Smith', 'This is feedback of author', 'The feedback of commitee', '2345789756', 'Affiliation 01','0111', '0101');
INSERT INTO Reviewer (EmailAddr, Firstname, Lastname, AuthorFeedback, CommiteeFeedback, PhoneNum, Affiliation, TopicID, ReviewID) VALUES ('cmartin@abc.com', 'Chris', 'Martin', 'This is feedback of author ab', 'The feedback of commitee ab', '2114567780', 'Affiliation 02', '0112', '0102');
INSERT INTO Reviewer (EmailAddr, Firstname, Lastname, AuthorFeedback, CommiteeFeedback, PhoneNum, Affiliation, TopicID, ReviewID) VALUES ('zoeyp@abc.com', 'Zoey', 'Parker', 'This is feedback of author tt', 'The feedback of commitee tt', '2990876522', 'Affiliation 03', '0113', '0103');
INSERT INTO Reviewer (EmailAddr, Firstname, Lastname, AuthorFeedback, CommiteeFeedback, PhoneNum, Affiliation,TopicID, ReviewID) VALUES ('harperchase@abc.com', 'Harper', 'Chase', 'This is feedback of author dd', 'The feedback of commitee dd', '2908875541', 'Affiliation 04', '0114', '0104');
