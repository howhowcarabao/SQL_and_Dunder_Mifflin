## Dunder Mifflin -- Query solutions
--------------------------------
Author: Carlos Vasquez

Tool used: BigQuery
--------------------------------

Nested Queries

## 1. Find names of all employees who have sold over 50,000
````sql
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
````
#### Results:
|first_name|	last_name|
|:--:|:--:|
Michael|	Scott
Stanley|	Hudson

## 2. Find all clients who are handles by the branch that Michael Scott manages (Assume you know Michael's ID - 102).
````sql
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
````
#### Results:
client_name|
|--|
Dunmore Highschool
Lackawana Country
Scranton Whitepages
FedEx



## 3. Find all clients who are handles by the branch that Michael Scott manages (Assume you DONT'T know Michael's ID).
```sql
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
````
#### Results:
|client_name|
|:----------|
Dunmore Highschool
Lackawana Country
Scranton Whitepages
FedEx


## 4. Find the names of employees who work with clients handled by the scranton branch
````sql
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
````
#### Results:
|first_name|	last_name|
|:--:|:--:|
Michael|	Scott
Stanley|	Hudson

## 5.  Find the names of all clients who have spent more than 100,000 dollars
````sql
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
````

#### Results:
|client_name|
|----------|
|Lackawana Country|
|FedEx|