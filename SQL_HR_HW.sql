-- 1
SELECT e.first_name, e.last_name, d.department_id, d.department_name 
FROM employees e
JOIN departments d
ON e.department_id = d.department_id

-- 2
SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province 
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON l.location_id = d.location_id

-- 3
SELECT e.first_name, e.last_name, e.salary, jb.grade_level 
FROM employees e
JOIN job_grades jb
ON e.salary BETWEEN jb.lowest_sal AND jb.highest_sal

-- 4
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
AND e.department_id IN (40,80)

-- 5
SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province 
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON l.location_id=d.location_id
WHERE e.first_name LIKE '%z%'

-- 6
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id

-- 7
SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN employees s
ON e.salary < s.salary AND s.employee_id =182

-- 8
SELECT e.first_name AS Employee, m.first_name AS Manager
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id

-- 9
SELECT d.department_name, l.city, l.state_province
FROM departments d
JOIN locations l
ON d.location_id = l.location_id

-- 10
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id

-- 11
SELECT e.first_name AS Employee, m.first_name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id

-- 12
SELECT e.first_name, e.last_name, e.department_id
FROM employees e
JOIN employees t
ON e.department_id = t.department_id AND t.last_name = 'Taylor'

-- 13
SELECT j.job_title, d.department_name, e.first_name + ' ' + e.last_name AS employeeName, jh.start_date AS startDate
FROM job_history jh
JOIN jobs j
ON jh.job_id = j.job_id
JOIN departments d
ON jh.department_id = d.department_id
JOIN employees e
ON e.employee_id = jh.employee_id
WHERE jh.start_date >= '1993-01-01' AND jh.start_date <= '1997-08-31'

-- 14
SELECT j.job_title, e.first_name + ' ' + e.last_name AS EmployeeName, j.max_salary-e.salary AS salaryDifference
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id

-- 15
SELECT d.department_name, AVG(e.salary),  COUNT(e.commission_pct)
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name