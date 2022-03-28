SELECT 
Department,COUNT(ProgrammeID) AS No_of_Programme, SUM(Cost_per_course*Number_of_courses) AS Total_expected
FROM Programmes
GROUP BY Department;