SELECT 
    d.dept_name,
    e.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    CASE
        WHEN
            YEAR(dm.to_date) >= YEAR(e.hire_date)
                AND YEAR(dm.from_date) <= YEAR(e.hire_date)
        THEN
            1
        ELSE 0
    END AS ACTIVE
FROM
    t_departments d
        INNER JOIN
    t_dept_emp de ON d.dept_no = de.dept_no
        INNER JOIN
    t_dept_manager dm ON dm.dept_no = d.dept_no
        INNER JOIN
    t_employees e ON dm.emp_no = e.emp_no