--VIEWS
--Creates a view for students and their respective sponsors

create view sponsors
AS
SELECT Reg_no, Student_name, Contact, Sponsor
FROM Student_details;

