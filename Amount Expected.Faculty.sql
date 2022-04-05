SELECT 
pg.Faculty,
COUNT(DISTINCT pg.Department) AS No_of_Department,
COUNT(DISTINCT pg.ProgrammeID) AS No_of_Programme,
SUM(std.No_of_courses*pg.Cost_per_course) AS Amount_expected
FROM Programmes pg
JOIN Student_details std
ON pg.ProgrammeID=std.ProgrammeID
GROUP BY pg.Faculty;
