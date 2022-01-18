This repository contains the solution to the questions Mikes walks us through in his series of [videos](https://www.mikedane.com/databases/sql/) about database management basics and SQL. I created the data set in Microsoft SQL Server Mangament Studio and downloaded the data into csv files. I then uploaded the csv files into BigQuery (sandbox) to answer Mike's questions. (Note Mike uses MySQL RDMBS throughout his course).

Thanks [@mike_dane](https://twitter.com/mike_dane) and Giraffe Academy for provding this excellent data set and SQL tutorial! 👋🏻 

## 📚 Table of Contents
<img align="right" src="https://cxl.com/wp-content/uploads/2019/10/google-bigquery-logo-1.png" alt="Image" width="600" height="350">

- [Business Task](#business-task)
- [Entity Relationship Diagram](#entity-relationship-diagram)
- [Case Study Questions](#case-study-questions)
- [Answers](#Answers)

### Business Task
Mike wants to use the data to answer mulitiple  questions about the company and its clients, basic information about the employees, and ofcourse who  is the top sales man.

### Entity Relationship Diagram

<img src="http://www.mikedane.com/databases/sql/company-relations.png" alt="Image" width="500" height="350">

## Case Study Questions
<img align="right" src="https://cdn3.whatculture.com/images/2021/04/d81733f712331d8a-600x338.jpg" alt="Image" width="600" height="350">

-- Questions are grouped by type of queries needed to answer them

<details>
<summary>
Preview
</summary>

<details>
<summary>
1. Basic Queries
</summary>
  
-- Find all employees
  
-- Find all clients
  
-- Find all employees ordered by salary (ASC/DESC);
  
-- Find all employees ordered by sex then name
  
-- Find the first 5 employees in the table
  
-- Find the first and last names of all employees
  
-- Find the forename and surnames names of all employees
  
-- Find out all the different genders
  
-- Find all male employees

-- Find all employees at branch 2
  
-- Find all employee's id's and names who were born after 1969
  
-- Find all female employees at branch 2
  
-- Find all employees who are female & born after 1969 or who make over 80000
  
-- Find all employees born between 1970 and 1975
  
-- Find all employees named Jim, Michael, Johnny or David
 
 </details>

<details>
<summary>
2. Functions
</summary>

-- Find the number of employees
  
-- Find the average of all employee's salaries ( then round)
  
-- Find the sum of all employee's salaries
  
-- Find out how many males and females there are
  
-- Find the total sales of each salesman
  
-- Find the total amount of money spent by each client

</details>
  
<details>
<summary>
3. Joins
</summary>
  
-- Find the client name and total amount of money spent by each client
  
-- Find the first name of the total sales of each salesman
  
-- Find the name of the head of each branch.

</details>

<details>
<summary>
4. Unions
</summary>
  
-- Find a list of employee and branch names
  
-- Find a list of all clients & branch suppliers' names
  
-- Find a list of all money spent or earned by the company

</details>

<details>
<summary>
5. Nested Queries
</summary>
  
-- Find names of all employees who have sold over 50,000
  
-- Find all clients who are handles by the branch that Michael Scott manages (Assume you know Michael's ID)
  
-- Find all clients who are handles by the branch that Michael Scott manages (Assume you DONT'T know Michael's ID)
  
-- Find the names of employees who work with clients handled by the scranton branch
  
-- Find the names of all clients who have spent more than 100,000 dollars

</details>
  
</details>

## Answers

-- SQL queries via BigQuery
1. [Basic Queries](https://github.com/howhowcarabao/SQL_and_Dunder_Mifflin/blob/master/solutions/solutions_basic.md)
2. [Functions](https://github.com/howhowcarabao/SQL_and_Dunder_Mifflin/blob/master/solutions/solutions_functions.md)
3. [Joins](https://github.com/howhowcarabao/SQL_and_Dunder_Mifflin/blob/master/solutions/solutions_joins.md)
4. [Unions](https://github.com/howhowcarabao/SQL_and_Dunder_Mifflin/blob/master/solutions/solutions_unions.md)
5. [Nested Queries](https://github.com/howhowcarabao/SQL_and_Dunder_Mifflin/blob/master/solutions/solutions_nested_queries.md)

***