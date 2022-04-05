SELECT 
std.Reg_no,std.Student_name, std.ProgrammeID AS Programme_ID, 
std.No_of_courses, 
pg.Cost_per_course,
SUM(std.No_of_courses*pg.Cost_per_course) AS Amount_expected
FROM Student_details std
JOIN Programmes pg
ON pg.ProgrammeID=std.ProgrammeID
GROUP BY pg.ProgrammeID,std.ProgrammeID, Reg_no, Cost_per_course,No_of_courses*pg.Cost_per_course,
std.No_of_courses, std.ProgrammeID,std.Student_name;
