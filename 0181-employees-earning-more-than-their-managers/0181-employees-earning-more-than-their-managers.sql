# Write your MySQL query statement below


SELECT e2.name as Employee
FROM Employee e1 
JOIN Employee e2 
ON e1.id = e2.managerId
WHERE e2.salary > e1.salary