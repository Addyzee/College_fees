SELECT std.Reg_no,std.Student_name,ISNULL(SUM(Amount_paid),0) AS Amount_paid
FROM Payment_details payd
RIGHT JOIN Student_details std
ON std.Reg_no=payd.Reg_no
GROUP BY std.Reg_no,std.Student_name
ORDER BY SUM(Amount_paid) DESC;
