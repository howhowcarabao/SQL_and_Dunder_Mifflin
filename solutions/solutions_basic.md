## Dunder Mifflin -- Query solutions
--------------------------------
Author: Carlos Vasquez

Tool used: BigQuery
--------------------------------

Basic Queries

 ## 1. Find ALL employees
````sql
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
````

#### Results:
|emp_id|	first_name|	last_name|	birth_day|	sex|	salary|	super_id|	branch_id|
|:-----|-----------:|---------:|----------:|----:|-------:|--------:|---------:|
|100|	David|	Wallace|	1967-11-17|	M|	250000|		NULL| 1|
|101|	Jan|	Levinson|	1961-05-11|	F|	110000|	100|	1|
|102|	Michael|	Scott|	1964-03-15|	M|	75000|	100|	2|
|103|	Angela|	Martin|	1971-06-25|	F|	63000|	102|	2|
|104|	Kelly|	Kapoor|	1980-02-05|	F|	55000|	102|	2|
105|	Stanley|	Hudson|	1958-02-19|	M|	69000|	102|	2|
|106|	Josh|	Porter|	1969-09-05|	M|	78000|	100|	3|
|107|	Andy|	Bernard|	1973-07-22|	M|	65000|	106|	3|
|108|	Jim|	Halpert|	1978-10-01|	M|	71000|	106|	3|

***

## 2. Find all clients
````sql
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.client`
````

#### Results:
|client_id|	client_name|	branch_id|
|:--------|-----------:|----------:|
|400|	Dunmore Highschool|	2|
|401|	Lackawana Country|	2|
|404|	Scranton Whitepages|	2|
|406|	FedEx|	2|
|402|	FedEx|	3|
|403|	John Daly Law LLC|	3|
|405|	Times Newspaper|	3|

## 3. Find all employees ordered by salary (ASC)
````sql
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
ORDER BY
  salary
````

#### Results:
|emp_id|	first_name|	last_name|	birth_day|	sex|	salary|	super_id|	branch_id|
|:-----|-----------:|---------:|----------:|----:|-------:|--------:|---------:|
|104|	Kelly|	Kapoor|	1980-02-05|	F|	55000|	102|	2|
|103|	Angela|	Martin|	1971-06-25|	F|	63000|	102|	2|
|107|	Andy|	Bernard|	1973-07-22|	M|	65000|	106|	3|
|105|	Stanley|	Hudson|	1958-02-19|	M|	69000|	102|	2|
|108|	Jim|	Halpert|	1978-10-01|	M|	71000|	106|	3|
|102|	Michael|	Scott|	1964-03-15|	M|	75000|	100|	2|
|106|	Josh|	Porter|	1969-09-05|	M|	78000|	100|	3|
|101|	Jan|	Levinson|	1961-05-11|	F|	110000|	100|	1|
|100|	David|	Wallace|	1967-11-17|	M|	250000|		NULL| 1|

## 4. Find all employees ordered by salary (DESC)
````sql
SELECT
  *
FROM
  `my-data-project-11097972.Dundler_Miffin.employee`
ORDER BY
  salary DESC
````

#### Results:
|emp_id|	first_name|	last_name|	birth_day|	sex|	salary|	super_id|	branch_id|
|:-----|-----------:|---------:|----------:|----:|-------:|--------:|---------:|
|100|	David|	Wallace|	1967-11-17|	M|	250000|	NULL|	1|
|101|	Jan|	Levinson|	1961-05-11|	F|	110000|	100|	1|
|106| Josh|	Porter|	1969-09-05|	M|	78000|	100|	3|
|102|	Michael|	Scott|	1964-03-15|	M|	75000|	100|	2|
|108|	Jim|	Halpert|	1978-10-01|	M|	71000|	106|	3|
|105|	Stanley|	Hudson|	1958-02-19|	M|	69000|	102|	2|
|107|	Andy|	Bernard|	1973-07-22|	M|	65000|	106|	3|
|103|	Angela|	Martin|	1971-06-25|	F|	63000|	102|	2|
|104|	Kelly|	Kapoor|	1980-02-05|	F|	55000|	102|	2|

## 5. Find all employees ordered by sex then name
````sql
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
ORDER BY 
  sex,
  first_name
````

#### Results:
|emp_id|	first_name|	last_name|	birth_day|	sex|	salary|	super_id|	branch_id|
|:-----|-----------:|---------:|----------:|----:|-------:|--------:|---------:|
|103|	Angela|	Martin|	1971-06-25|	F|	63000|	102|	2|
|101|	Jan|	Levinson|	1961-05-11|	F|	110000|	100|	1|
|104|	Kelly|	Kapoor|	1980-02-05|	F|	55000|	102|	2|
|107|	Andy|	Bernard|	1973-07-22|	M|	65000|	106|	3|
|100|	David|	Wallace|	1967-11-17|	M|	250000|  NULL|  1|
|108|	Jim|	Halpert|	1978-10-01|	M|	71000|	106|	3|
|106|	Josh|	Porter|	1969-09-05|	M|	78000|	100|	3|
|102|	Michael|	Scott|	1964-03-15|	M|	75000|	100|	2|
|105|	Stanley|	Hudson|	1958-02-19|	M|	69000|	102|	2|


## 6. Find the first 5 employees in the table
````sql
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
LIMIT 5
````

#### Results:
|emp_id|	first_name|	last_name|	birth_day|	sex|	salary|	super_id|	branch_id|
|:-----|-----------:|---------:|----------:|----:|-------:|--------:|---------:|
|100|	David|	Wallace|	1967-11-17|	M|	250000|		NULL| 1|
|101|	Jan|	Levinson|	1961-05-11|	F|	110000|	100|	1|
|102|	Michael|	Scott|	1964-03-15|	M|	75000|	100|	2|
|103|	Angela|	Martin|	1971-06-25|	F|	63000|	102|	2|
|104|	Kelly|	Kapoor|	1980-02-05|	F|	55000|	102|	2|

## 7. Find the first and last names of all employees
````sql
SELECT
  first_name,
  last_name
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
````

#### Results:
|first_name|	last_name|
|:---------|----------:|
|David|	Wallace|
|Jan|	Levinson|
|Michael|	Scott|
|Angela|	Martin|
|Kelly|	Kapoor|
|Stanley|	Hudson|
|Josh|	Porter|
|Andy|	Bernard|
|Jim|	Halpert|


## 8. Find the forename and surnames names of all employees
````sql
SELECT
  first_name AS forename,
  last_name AS surname
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
````

#### Results:
|forename|	surname|
|:-------|--------:|
|David|	Wallace|
|Jan|	Levinson|
|Michael|	Scott|
|Angela|	Martin|
|Kelly|	Kapoor|
|Stanley|	Hudson|
|Josh|	Porter|
|Andy|	Bernard|
|Jim|	Halpert|

## 9. Find out all the different genders
````sql
SELECT
  DISTINCT(sex)
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
````

#### Results:
|sex|
|:-|
|M|
|F|

## 9. Find all male employees
````sql
SELECT
  first_name,
  last_name
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE
  sex = 'M'
````
#### Results:
|first_name|	last_name|
|:---------|----------:|
|David|	Wallace|
|Michael|	Scott|
|Stanley|	Hudson|
|Josh|	Porter|
|Andy|	Bernard|
|Jim|	Halpert|

## 10. Find all employees at branch 2
````sql
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE
  branch_id = 2
````

#### Results:
|emp_id|	first_name|	last_name|	birth_day|	sex|	salary|	super_id|	branch_id|
|:-----|-----------:|---------:|----------:|----:|-------:|--------:|---------:|
|102|	Michael|	Scott|	1964-03-15|	M|	75000|	100|	2|
|103|	Angela|	Martin|	1971-06-25|	F|	63000|	102|	2|
|104|	Kelly|	Kapoor|	1980-02-05|	F|	55000|	102|	2|
|105|	Stanley|	Hudson|	1958-02-19|	M|	69000|	102|	2|

## 11. Find all employee's id's and names who were born after 1969
````sql
SELECT
  emp_id,
  first_name,
  last_name
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE
  birth_day >= '1970-01-01'
````

#### Results:
|first_name|	last_name|
|:---------|----------:|
|Angela|	Martin|
|Kelly|	Kapoor|
|Andy|	Bernard|
|Jim|	Halpert|


## 12. Find all female employees at branch 2
````sql
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE
  sex ="F" AND branch_id = 2
````

#### Results:
|emp_id|	first_name|	last_name|	birth_day|	sex|	salary|	super_id|	branch_id|
|:-----|-----------:|---------:|----------:|----:|-------:|--------:|---------:|
|103|	Angela|	Martin|	1971-06-25|	F|	63000|	102|	2|
|104|	Kelly|	Kapoor|	1980-02-05|	F|	55000|	102|	2|

## 13. Find all employees who are female & born after 1969 or who make over 80000
````sql
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE 
sex = 'F' AND birth_day >= '1970-01-01'OR sex = 'F' AND salary > 80000
````

#### Results:
|emp_id|	first_name|	last_name|	birth_day|	sex|	salary|	super_id|	branch_id|
|:-----|-----------:|---------:|----------:|----:|-------:|--------:|---------:|
|101|	Jan|	Levinson|	1961-05-11|	F|	110000|	100|	1|
|103|	Angela|	Martin|	1971-06-25|	F|	63000|	102|	2|
|104|	Kelly|	Kapoor|	1980-02-05|	F|	55000|	102|	2|

## 14. Find all employees born between 1970 and 1975
```sql
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE
  birth_day BETWEEN '1970-01-01' AND '1975-01-01'
```
  
#### Results:
|emp_id|	first_name|	last_name|	birth_day|	sex|	salary|	super_id|	branch_id|
|:-----|-----------:|---------:|----------:|----:|-------:|--------:|---------:|
|103|	Angela|	Martin|	1971-06-25|	F|	63000|	102|	2|
|107|	Andy|	Bernard|	1973-07-22|	M|	65000|	106|	3|

## 15. Find all employees named Jim, Michael, Johnny or David
````sql
SELECT
  *
FROM
  `my-data-project-11097972.Dunder_Mifflin.employee`
WHERE
  first_name IN ('Jim','Michael','David')
````

#### Results:
|emp_id|	first_name|	last_name|	birth_day|	sex|	salary|	super_id|	branch_id|
|:-----|-----------:|---------:|----------:|----:|-------:|--------:|---------:|
|100|	David|	Wallace|	1967-11-17|	M|	250000|		NULL| 1|
|102|	Michael|	Scott|	1964-03-15|	M|	75000|	100|	2|
|108|	Jim|	Halpert|	1978-10-01|	M|	71000|	106|	3|
