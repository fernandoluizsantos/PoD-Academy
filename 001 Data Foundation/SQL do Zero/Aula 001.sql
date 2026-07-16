-- 1) Descreva o nome e tipo de cada coluna da tabela employees

DESCRIBE employees;

-- 2) Quais são as tabelas disponíveis no Database employee ?

USE employee;

SHOW TABLES;

RESULTADO:
departments
dept_emp
dept_manager
employees
salaries
titles

-- 3) Realize uma consulta na tabela employees selecionando todas as colunas e limitando o retorno em 20 registros.

SELECT * 
FROM employee.employees e
LIMIT 20;

-- 4)

SELECT 
	e.first_name, 
	e.last_name, 
	e.birth_date 
FROM 
	employee.employees e
ORDER BY
	e.birth_date DESC
LIMIT 10;

Surveyors	Bade

-- 5)

SELECT 
	e.first_name, 
	e.last_name, 
	e.hire_date
FROM 
	employee.employees e
ORDER BY
	e.hire_date ASC
LIMIT 10;

Tonny	Butterworth

-- 6)

SELECT
	COUNT(1) as 'Contagem'
FROM
	employees e 
WHERE
	e.gender = 'F' AND
	e.hire_date > '1990-12-02';

44421

-- 7)
Existe mais Homens.

179973	M
120051	F

-- 8)

SELECT 
	COUNT(1)
FROM
	employee.titles t;

443308

-- 9) 
158220	38623	63810.7448