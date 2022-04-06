SELECT Payment_ID,std.Student_name,std.Reg_no,Payment_method
FROM Payment_details payd
JOIN Student_details std
ON std.Reg_no=payd.Reg_no
WHERE Payment_method='Cash';