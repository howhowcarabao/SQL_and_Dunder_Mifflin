--------------------------------
--Dunder Mifflin--Query solutions
--------------------------------

--Author: Carlos Vasquez
--Date: 16/01/2022 
--Tool used: BigQuery

---- Basic Queries

 -- Find ALL employees
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`

-- Find all clients
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.client`

-- Find all employees ordered by salary (ASC)
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
ORDER BY
  salary

-- Find all employees ordered by salary (DESC)
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
ORDER BY
  salary DESC

-- Find all employees ordered by sex then name
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
ORDER BY 
  sex,
  first_name

-- Find the first 5 employees in the table
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
LIMIT 5

-- Find the first and last names of all employees
SELECT
  first_name,
  last_name
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`

-- Find the forename and surnames names of all employees
SELECT
  first_name AS forename,
  last_name AS surname
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`

-- Find out all the different genders
SELECT
  DISTINCT(sex)
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`

-- Find all male employees
SELECT
  first_name,
  last_name
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE
  sex = 'M'

-- Find all employees at branch 2
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE
  branch_id = 2

-- Find all employee's id's and names who were born after 1969
SELECT
  emp_id,
  first_name,
  last_name
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE
  birth_day >= '1970-01-01'

-- Find all female employees at branch 2
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE
  sex ="F" AND branch_id = 2

-- Find all employees who are female & born after 1969 or who make over 80000
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE 
sex = 'F' AND birth_day >= '1970-01-01'OR sex = 'F' AND salary > 80000

-- Find all employees born between 1970 and 1975
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE
  birth_day BETWEEN '1970-01-01' AND '1975-01-01'

-- Find all employees named Jim, Michael, Johnny or David
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE
  first_name IN ('Jim','Michael','David')

----Functions

-- Find the number of employees
SELECT
  COUNT(super_id) AS num_of_employees
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`

-- Find the average of all employee's salaries
SELECT
  AVG(salary) AS average_salary
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`

-- Find the average of all employee's salaries (ROUND 2 decimal places)
SELECT
  ROUND(AVG(salary),2) AS average_salary
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`

-- Find the sum of all employee's salaries
SELECT
  SUM(salary) AS sum_of_salary
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`

-- Find out how many males and females there are
SELECT
  DISTINCT (sex),
  COUNT(sex) AS number_of_employees
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
GROUP BY 
sex

-- Find the total sales of each salesman
SELECT
  DISTINCT (emp_id),
  SUM(total_sales) AS total_sales
FROM
  `my-data-project-11097972.Dunder_Mifflin.works_with`
GROUP BY
emp_id

-- Find the total amount of money spent by each client
SELECT
  DISTINCT (client_id),
  SUM(total_sales) AS total_purchase
FROM
  `my-data-project-11097972.Dunder_Mifflin.works_with`
GROUP BY
client_id
ORDER BY 
total_purchase DESC

---- JOINS
-- Find the client name and total amount of money spent by each client
SELECT
  DISTINCT (`my-data-project-11097972.Dunder_Mifflin.works_with`.client_id),
  client_name,
  SUM(`my-data-project-11097972.Dunder_Mifflin.works_with`.total_sales) AS total_purchase

FROM
  `my-data-project-11097972.Dunder_Mifflin.works_with`
JOIN
  `my-data-project-11097972.Dunder_Mifflin.client` -- LEFT JOIN
ON 
`my-data-project-11097972.Dunder_Mifflin.works_with`.client_id = `my-data-project-11097972.Dunder_Mifflin.client`.client_id
GROUP BY
client_id,
client_name
ORDER BY 
total_purchase DESC

-- Find the first name of the total sales of each salesman
SELECT
  DISTINCT (works_with.emp_id) AS sales_man_id,
  first_name,
  SUM(works_with.total_sales) AS total_sales
FROM
  `my-data-project-11097972.Dunder_Mifflin.works_with` AS works_with --(ALIAS)
JOIN                                                                             
    `my-data-project-11097972.Dunder_Mifflin.employee` AS employee   --(ALIAS)  
ON 
works_with.emp_id = employee.emp_id
GROUP BY
sales_man_id,
first_name
ORDER BY 
total_sales DESC

-- Find the name of the head of each branch.
SELECT 
  employee.emp_id, 
  employee.first_name, 
  branch.branch_name
FROM 
`my-data-project-11097972.Dunder_Mifflin.employee` AS employee
JOIN 
`my-data-project-11097972.Dunder_Mifflin.branch` AS branch    -- LEFT JOIN
ON 
employee.emp_id = branch.mgr_id;

----Unions
-- Find a list of employee and branch names
SELECT 
 first_name AS Employee_Branch_Names
FROM
 `my-data-project-11097972.Dunder_Mifflin.employee`
UNION ALL
SELECT 
 branch_name
FROM 
 `my-data-project-11097972.Dunder_Mifflin.branch`

-- Find a list of all clients & branch suppliers' names
SELECT 
  client_name AS Non_Employee_Entities,
  branch_id AS Branch_ID
FROM
  `my-data-project-11097972.Dunder_Mifflin.client`
UNION ALL
SELECT 
  supplier_name,
  branch_id
FROM
  `my-data-project-11097972.Dunder_Mifflin.branch_supplier`

-- Find a list of all money spent or earned by the company
SELECT 
  salary AS money_in_and_out
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
UNION ALL
SELECT 
  total_sales
FROM 
  `my-data-project-11097972.Dunder_Mifflin.works_with`

---- Nested Queries
-- Find names of all employees who have sold over 50,000
SELECT
 first_name,        -- Second step: build the outer query
 last_name
FROM 
`my-data-project-11097972.Dunder_Mifflin.employee`
WHERE emp_id IN (

                  SELECT              -- first step: build the inner query
                      emp_id
                  FROM
                      `my-data-project-11097972.Dunder_Mifflin.works_with`
                  WHERE
                        total_sales >= 50000)

-- Find all clients who are handles by the branch that Michael Scott manages (Assume you know Michael's ID - 102)
SELECT
client_name
FROM
`my-data-project-11097972.Dunder_Mifflin.client`    -- build outer query
WHERE
branch_id IN (
               SELECT
                 branch_id
               FROM
                `my-data-project-11097972.Dunder_Mifflin.branch`  -- build inner query
                WHERE
                 mgr_id = 102)

-- Find all clients who are handles by the branch that Michael Scott manages (Assume you DONT'T know Michael's ID)
SELECT 
  client_name
FROM 
  `my-data-project-11097972.Dunder_Mifflin.client` -- outer query
WHERE
  branch_id IN (
                 SELECT 
                   branch_id
                 FROM
                   `my-data-project-11097972.Dunder_Mifflin.branch` --- second inner query
                  WHERE 
                    mgr_id IN (
                                 SELECT
                                   emp_id
                                 FROM
                                   `my-data-project-11097972.Dunder_Mifflin.employee` -- build inner query
                                 WHERE 
                                   first_name = 'Michael' AND last_name = 'Scott'))

-- Find the names of employees who work with clients handled by the scranton branch
SELECT
  first_name,
  last_name
FROM 
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE
  emp_id IN (
              SELECT 
                emp_id                     -- inner query
              FROM 
               `my-data-project-11097972.Dunder_Mifflin.works_with`)
AND 
  branch_id = 2

-- Find the names of all clients who have spent more than 100,000 dollars
SELECT 
  client_name
FROM
  `my-data-project-11097972.Dunder_Mifflin.client`
WHERE
  client_id IN (
                SELECT client_id
                FROM (
                        SELECT 
                          SUM(total_sales) AS totals, 
                          client_id
                        FROM
                          `my-data-project-11097972.Dunder_Mifflin.works_with`
                        GROUP BY 
                        client_id)
               WHERE totals > 100000)