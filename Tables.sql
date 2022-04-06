CREATE database college_fees
Use college_fees
CREATE TABLE Programmes
  ( ProgrammeID VARCHAR(10)PRIMARY KEY,
  Programme_name VARCHAR(30),
  Faculty VARCHAR(30),
  Department VARCHAR(30),
  Number_of_courses INT,
  Cost_per_course INT,);

CREATE TABLE Student_details
(Reg_no VARCHAR(15)NOT NULL,
Student_name VARCHAR(30)NOT NULL,
DOB DATETIME,
Contact VARCHAR(10),
Sponsor VARCHAR(20),--name of sponsor, as lec recommended
ProgrammeID VARCHAR(10)REFERENCES Programmes(ProgrammeID) ON DELETE SET NULL,
Degree_programme VARCHAR(20),
No_of_courses INT,
PRIMARY KEY(Reg_no));

CREATE TABLE Payment_details
( Payment_ID VARCHAR(15)NOT NULL,
  Reg_no VARCHAR(15)REFERENCES Student_details(Reg_no),
  No_of_courses INT,
  Cost_per_course INT,
  Total_expected INT,
  Amount_paid INT,
  Payment_method VARCHAR(15),
  Amount_remaining INT,
  Installment_amount INT,
  PRIMARY KEY (Payment_ID));

CREATE TABLE Payments( 
  Transaction_ID VARCHAR(10) PRIMARY KEY,
  Reg_no VARCHAR(15)REFERENCES Student_details(Reg_no),
  Pay_date DATETIME,
  ProgrammeID VARCHAR(10)REFERENCES Programmes(ProgrammeID));


INSERT INTO Programmes 
VALUES
('P15','Computer Science','Science and Technology','Computing and Informatics',7,26000),
('A07','Agriculture','Agriculture','General Agriculture',8,26500),
('A21','Animal Husbandry','Agriculture','Animal Agriculture',8,26500),
('H31','Medicine and Surgery','Science and Technology','Health Sciences',8,29000),
('D12','Electical Engineering','Engineering','Electrical Works',8,26000)

INSERT INTO Student_details VALUES 
('P15/2097/2021','Kimani Andrew Kamau','08-11-2003','0702605230','Government','P15','Computer Science',6),
('P15/1450/2021','Anthony Mbeka','07-17-2000','0722345768','Government','P15','Computer Science',7),
('H31/1479/2019','Ali Omar Ali','09-15-2001','0756323751','Self','H31','Medicine and Surgery',8),
('A21/1630/2018','Trevor Fred Kamau','04-03-1999','0710323032','Equity Bank','A21','Animal Husbandry',6),
('D12/1323/2020','Mary Jane','05-03-1995','0115816578','Self','D12','Electrical Enginnering',8),
('P15/2099/2019','Ali Hassan','07-12-2003','0702604630','Government','P15','Computer Science',6),
('P15/7087/2021','Amina Kinoti','07-11-2001','0715615236','Government','P15','Computer Science',6),
('A07/2097/2021','Seth Sebastian ','08-11-2003','0702605230','Self','A07','General Agriculture',8),
('A21/7902/2020','Franklin Kiplagat','08-21-1985','0702605230','Government','A21','Animal Husbandry',8),
('A21/3583/2021','Simon Kamau','08-11-1998','0702605230','Government','A21','Animal Husbandry',8)

INSERT INTO Payment_details VALUES
('TR/01','P15/1450/2021',7,35000,245000,50000,'Cash',195000,2000),
('TR/02','P15/2097/2021',6,50000,350000,0,'N/A',350000,0),
('TR/03','P15/7087/2021',6,25000,175000,50000,'Cash',125000,5000),
('TR/04','A07/2097/2021',8,75000,600000,100000,'Cash',500000,50000),
('TR/05','D12/1323/2020',8,40000,320000,100000,'Cash',220000,270000),
('TR/06','A21/3583/2021',7,100000,700000,500000,'Cash',200000,5000),
('TR/07','P15/2099/2019',6,50000,300000,100000,'Cheque',200000,2000),


UPDATE Student_details
SET DOB='08-11-2003' WHERE Reg_no='P15';
ALTER TABLE Student_details
ALTER COLUMN Contact VARCHAR(15);

ALTER TABLE Payment_details
DROP COLUMN Amount_remaining;  

DROP TABLE Payments;

ALTER TABLE Payment_details
DROP COLUMN Total_expected;

ALTER TABLE Payment_details
DROP COLUMN Installment_amount;

--Displaying columns
--from the programmes table
SELECT ProgrammeID, Programme_name, Faculty, Department,Number_of_courses, Cost_per_course 
FROM Programmes
--from the student_details table
SELECT Reg_no ,Student_name,DOB,Contact,Sponsor,ProgrammeID,Degree_programme,No_of_courses
FROM Student_details
--from the payment_details table
SELECT Payment_ID,Reg_no,No_of_courses,Cost_per_course,Amount_paid,Payment_method
FROM Payment_details
  

--Amount expected per programme

SELECT ProgrammeID,Programme_name,Faculty,Number_of_courses, Cost_per_course, Number_of_courses*Cost_per_course AS Amount_expected
FROM Programmes
ORDER BY Faculty;

--Amount expected per Faculty

SELECT Faculty, COUNT(ProgrammeID) AS No_of_Programme, SUM(Cost_per_course*Number_of_courses) AS Total_expected
FROM Programmes
GROUP BY Faculty;

--Amount expected per Department


SELECT 
Student_details.Reg_no, Student_details.Student_name, Programmes.Department, Student_details.Degree_programme, Student_details.ProgrammeID
FROM Student_details
JOIN Programmes
ON Student_details.ProgrammeID=Programmes.ProgrammeID; 
--better if we could group by department

--Students in each department

ALTER TABLE Student_details
ADD CONSTRAINT df_Sponsor
DEFAULT 'Self' FOR Sponsor;

--Default Sponsor is 'Self'

--VIEWS
--Displays views
--For self-sponsored syudents
SELECT Reg_no, Student_name, Contact, Sponsor
FROM sponsors
WHERE sponsor='Self'
--For government sponsored students
SELECT Reg_no, Student_name, Contact, Sponsor
FROM sponsors
WHERE sponsor='Government'
--For bank sponsored students
SELECT Reg_no, Student_name, Contact, Sponsor
FROM sponsors
WHERE sponsor LIKE '%ank%'




