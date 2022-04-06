SELECT DISTINCT std.Reg_no,std.Student_name,std.Contact,std.ProgrammeID,std.Sponsor,
SUM(std.No_of_courses*pg.Cost_per_course) AS Amount_expected,
ISNULL(SUM(payd.Amount_paid),0) AS Amount_paid,
ISNULL(SUM(std.No_of_courses*pg.Cost_per_course)-payd.Amount_paid,SUM(std.No_of_courses*pg.Cost_per_course)) AS Balance
FROM Payment_details payd
RIGHT JOIN Student_details std
ON std.Reg_no=payd.Reg_no
JOIN Programmes pg
ON pg.ProgrammeID=std.ProgrammeID
GROUP BY std.Reg_no,std.Student_name,std.Contact,std.ProgrammeID,std.Sponsor,payd.Amount_paid;


