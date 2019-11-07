/*
Amber's conglomerate corporation just acquired some new companies.

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:

The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
Input Format

The following tables contain company data:

Company: The company_code is the code of the company and founder is the founder of the company. 

Lead_Manager: The lead_manager_code is the code of the lead manager, and the company_code is the code of the working company. 

Senior_Manager: The senior_manager_code is the code of the senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company. 

Manager: The manager_code is the code of the manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company. 

Employee: The employee_code is the code of the employee, the manager_code is the code of its manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company. 

Sample Output

C1 Monika 1 2 1 2
C2 Samantha 1 1 2 2
Explanation

In company C1, the only lead manager is LM1. There are two senior managers, SM1 and SM2, under LM1. There is one manager, M1, under senior manager SM1. There are two employees, E1 and E2, under manager M1.

In company C2, the only lead manager is LM2. There is one senior manager, SM3, under LM2. There are two managers, M2 and M3, under senior manager SM3. There is one employee, E3, under manager M2, and another employee, E4, under manager, M3.

*/

DECLARE @tbl_Company AS TABLE (company_code varchar(50), founder varchar(50))
DECLARE @tbl_Lead_Manager AS TABLE (lead_manager_code varchar(50), company_code varchar(50))
DECLARE @tbl_Senior_Manager AS TABLE (senior_manager_code varchar (50),lead_manager_code varchar(50), company_code varchar(50))
DECLARE @tbl_Manager AS TABLE (manager_code varchar(50),senior_manager_code varchar (50),lead_manager_code varchar(50), company_code varchar(50))
DECLARE @tbl_Employee AS TABLE (employee_code  varchar(50),manager_code varchar(50),senior_manager_code varchar (50),lead_manager_code varchar(50), company_code varchar(50))


INSERT INTO @tbl_Company VALUES ('C1','Monika')
INSERT INTO @tbl_Company VALUES ('C2','Samantha')

INSERT INTO @tbl_Lead_Manager VALUES ('LM1','C1')
INSERT INTO @tbl_Lead_Manager VALUES ('LM2','C2')

INSERT INTO @tbl_Senior_Manager VALUES ('SM1','LM1','C1')
INSERT INTO @tbl_Senior_Manager VALUES ('SM2','LM1','C1')
INSERT INTO @tbl_Senior_Manager VALUES ('SM3','LM2','C2')

INSERT INTO @tbl_Manager VALUES ('M1','SM1','LM1','C1')
INSERT INTO @tbl_Manager VALUES ('M2','SM3','LM2','C2')
INSERT INTO @tbl_Manager VALUES ('M3','SM3','LM2','C2')

INSERT INTO @tbl_Employee VALUES ('E1','M1','SM1','LM1','C1')
INSERT INTO @tbl_Employee VALUES ('E2','M1','SM1','LM1','C1')
INSERT INTO @tbl_Employee VALUES ('E3','M2','SM3','LM2','C2')
INSERT INTO @tbl_Employee VALUES ('E4','M3','SM3','LM2','C2')


SELECT Emp.company_code,Com.founder,COUNT(DISTINCT LM.lead_manager_code),COUNT( DISTINCT SM.senior_manager_code),COUNT(DISTINCT M.manager_code),COUNT( DISTINCT Emp.employee_code) 
FROM @tbl_Employee Emp
LEFT JOIN @tbl_Company AS Com ON Emp.company_code=Com.company_code
LEFT JOIN @tbl_Lead_Manager AS LM ON Emp.company_code=LM.company_code
LEFT JOIN @tbl_Senior_Manager AS SM ON Emp.company_code=SM.company_code AND LM.lead_manager_code=SM.lead_manager_code
LEFT JOIN @tbl_Manager AS M ON Emp.company_code=M.company_code AND LM.lead_manager_code=M.lead_manager_code AND SM.senior_manager_code=M.senior_manager_code
GROUP BY Emp.company_code,Com.founder ORDER BY Emp.company_code

--SELECT * FROM @tbl_Employee







