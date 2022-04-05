SELECT 
--std.Reg_no,
--std.Student_name, 
std.ProgrammeID AS Programme_ID, --std.No_of_courses, 
--pg.Cost_per_course,No_of_courses*pg.Cost_per_course AS Amount_expected,
SUM(std.No_of_courses*pg.Cost_per_course) AS Prog_total
FROM Student_details std
JOIN Programmes pg
ON pg.ProgrammeID=std.ProgrammeID
WHERE pg.ProgrammeID IN 'P15'
GROUP BY pg.ProgrammeID;
--GROUP BY pg.ProgrammeID, Reg_no, Cost_per_course,No_of_courses*pg.Cost_per_course, std.No_of_courses, std.ProgrammeID,std.Student_name;