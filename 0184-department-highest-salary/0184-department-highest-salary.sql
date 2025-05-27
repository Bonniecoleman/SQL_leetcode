# Write your MySQL query statement below

-- SELECT d.name as Department, e.name as Employee, MAX(e.salary) as Salary
-- FROM Department d
-- INNER JOIN Employee e
-- ON d.id = e.departmentId
-- GROUP BY d.id;

-- SELECT d.name as Department, e.name as Employee, 
--     (SELECT RANK() OVER(PARTITION BY departmentId ORDER BY salary)
--     FROM Employee) as rank
-- FROM Department d
-- INNER JOIN Employee e
-- ON d.id = e.departmentId
-- GROUP BY d.id;



WITH ranked AS (
    SELECT 
        d.name AS Department, 
        e.name AS Employee, 
        e.salary AS Salary,
        RANK() OVER(PARTITION BY e.departmentId ORDER BY e.salary DESC) AS salary_rank
    FROM Department d
    JOIN Employee e ON d.id = e.departmentId
)
SELECT Department, Employee, Salary
FROM ranked
WHERE salary_rank = 1;
