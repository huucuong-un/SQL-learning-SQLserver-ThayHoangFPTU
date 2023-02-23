


CREATE TABLE MajorV1
(
	MajorID char(2) PRIMARY KEY,
	MajorName nvarchar(40) NOT NULL


)


DROP TABLE StudentV1
CREATE TABLE StudentV1
(
	StudentID char(8),
	LastName nvarchar(40),	--tại sao ko gộp fullname?
	FirstName nvarchar(10), --n để lưu kí tự unicode
	DOB datetime,
	[Address] nvarchar(50),

	MajorID char(2),
	CONSTRAINT FK_StudentV1_MajorV1 
							FOREIGN KEY(MajorID) REFERENCES  MajorV1(MajorID)


)

ALTER TABLE StudentV1 DROP CONSTRAINT FK_StudentV1_MajorV1 
ALTER TABLE StudentV1 ADD CONSTRAINT FK_StudentV1_MajorV1 
							FOREIGN KEY(MajorID) REFERENCES  MajorV1(MajorID)
			
			