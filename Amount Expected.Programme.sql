SELECT ProgrammeID,Programme_name,Faculty,Number_of_courses, Cost_per_course, Number_of_courses*Cost_per_course AS Amount_expected
FROM Programmes
ORDER BY Faculty;