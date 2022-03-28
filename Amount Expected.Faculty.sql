SELECT 
Faculty, COUNT(Department) AS No_of_Department, SUM(Cost_per_course*Number_of_courses) AS Total_expected
FROM Programmes
GROUP BY Faculty;