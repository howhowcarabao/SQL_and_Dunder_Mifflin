## Dunder Mifflin -- Query solutions
--------------------------------
Author: Carlos Vasquez

Tool used: BigQuery
--------------------------------

Functions

## 1. Find the number of employees
````sql
SELECT
  COUNT(super_id) AS num_of_employees
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
````
#### Results:
|num_of_employee|
|:-------------:|
|8|

## 2. Find the average of all employee's salaries
````sql
SELECT
  AVG(salary) AS average_salary
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
````
#### Results:
|average_salary|
|:------------:|
|92888.88888888889|

## 3. Find the average of all employee's salaries (ROUND 2 decimal places)
````sql
SELECT
  ROUND(AVG(salary),2) AS average_salary
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
````
#### Results:
|average_salary|
|:------------:|
|92888.89|

## 4. Find the sum of all employee's salaries
````sql
SELECT
  SUM(salary) AS sum_of_salary
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
````
|sum_of_salary|
|:-----------:|
|836000|

## 5. Find out how many males and females there are
````sql
SELECT
  DISTINCT (sex),
  COUNT(sex) AS number_of_employees
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
GROUP BY 
sex
````
|sex| number_of_employees|
|:--|----------:|
|M|6|
|F|3|


## 6. Find the total sales of each salesman
````sql
SELECT
  DISTINCT (emp_id),
  SUM(total_sales) AS total_sales
FROM
  `my-data-project-11097972.Dunder_Mifflin.works_with`
GROUP BY
emp_id
````
|emp_id|total_sales|
|:-----|-------:|
|102|	282000|
|105|	218000|
|107|	31000|
|108|	34500|


## 7. Find the total amount of money spent by each client
````sql
SELECT
  DISTINCT (client_id),
  SUM(total_sales) AS total_purchase
FROM
  `my-data-project-11097972.Dunder_Mifflin.works_with`
GROUP BY
client_id
ORDER BY 
total_purchase DESC
````
|client_id|total_purchase|
|:-------:|-------------:|
|401|	267000|
|406|	145000|
|400|	55000|
|404|	33000|
|405|	26000|
|402|	22500|
|403|	17000|
