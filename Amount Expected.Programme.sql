SELECT 
pg.ProgrammeID AS Programme_ID,
pg.Programme_name,
pg.Department,
SUM(std.No_of_courses*pg.Cost_per_course) AS Amount_expected
FROM Student_details std
JOIN Programmes pg
ON pg.ProgrammeID=std.ProgrammeID
GROUP BY pg.ProgrammeID,pg.Programme_name,pg.Department
ORDER BY Programme_ID;

