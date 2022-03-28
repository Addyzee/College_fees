SELECT std.Reg_no, std.Student_name, std.ProgrammeID, std.No_of_courses, pg.Cost_per_course,No_of_courses*pg.Cost_per_course AS Amount_expected
FROM Student_details std
JOIN Programmes pg
ON pg.ProgrammeID=std.ProgrammeID;