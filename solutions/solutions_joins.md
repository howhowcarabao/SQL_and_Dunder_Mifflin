## Dunder Mifflin -- Query solutions
--------------------------------
Author: Carlos Vasquez

Tool used: BigQuery
--------------------------------


JOINS

## 1. Find the client name and total amount of money spent by each client
```sql
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
```
#### Results:
|client_id|	client_name|	total_purchase|
|:--------|-----------:|--:|
|401|	Lackawana Country|	267000|
|406|	FedEx|	145000|
|400|	Dunmore Highschool|	55000|
|404|	Scranton Whitepages|	33000|
|405|	Times Newspaper|	26000|
|402|	FedEx|	22500|
|403|	John Daly Law LLC|	17000|

## 2. Find the first name of the total sales of each salesman
````sql
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
````
#### Results:
|sales_man_id|  first_name|	total_sales|
|:--------|-----------:|--:|
|102|	Michael|	282000|
|105|	Stanley|	218000|
|108|       Jim|   	34500|
|107|	Andy|	31000|

## 3. Find the name of the head of each branch.
````sql
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
````
#### Results:
|emp_id|	first_name|	branch_name|
|:-----|-----------:|--:|
|100|	David|	Corporate|
|102|	Michael|	Scranton|
|106|	Josh|	Stamford|
