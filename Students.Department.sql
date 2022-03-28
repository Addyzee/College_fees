SELECT 
Student_details.Reg_no, Student_details.Student_name, Programmes.Department, Student_details.Degree_programme, Student_details.ProgrammeID
FROM Student_details
JOIN Programmes
ON Student_details.ProgrammeID=Programmes.ProgrammeID; 
--better if we could group by department