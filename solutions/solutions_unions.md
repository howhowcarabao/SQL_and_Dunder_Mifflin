## Dunder Mifflin -- Query solutions
--------------------------------
Author: Carlos Vasquez

Tool used: BigQuery
--------------------------------

Unions

## 1. Find a list of employee and branch names
````sql
SELECT 
 first_name AS Employee_Branch_Names
FROM
 `my-data-project-11097972.Dunder_Mifflin.employee`
UNION ALL
SELECT 
 branch_name
FROM 
 `my-data-project-11097972.Dunder_Mifflin.branch`
````
#### Results:
|Employee_Branch_Names|
|:----:|
Corporate
Scranton
Stamford
David
Jan
Michael
Angela
Kelly
Stanley
Josh
Andy
Jim

## 2. Find a list of all clients & branch suppliers' names
````sql
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
````
#### Results:
|Non_Employee_Entities|	Branch_ID|
|:--:|:--:|
Dunmore Highschool|	2
Lackawana Country|	2
Scranton Whitepages|	2
FedEx|	2
FedEx|	3
John Daly Law LLC|	3
Times Newspaper|	3
Hammer Mill|	2
Hammer Mill|	3
Patriot Paper|	3
Stamford Lables|	3
J.T. Forms & Labels|	2
Uni-ball|	2
Uni-ball|	3


## 3. Find a list of all money spent or earned by the company
````sql
SELECT 
  salary AS money_in_and_out
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
UNION ALL
SELECT 
  total_sales
FROM 
  `my-data-project-11097972.Dunder_Mifflin.works_with`
  ````
  #### Results:
  |money_in_and_out|
  |:--:|
267000
15000
55000
33000
130000
5000
26000
22500
12000
250000
110000
75000
63000
55000
69000
78000
65000
71000

