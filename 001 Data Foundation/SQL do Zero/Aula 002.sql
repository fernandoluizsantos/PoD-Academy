SELECT 
	e.emp_no,
	e.first_name,
	s.from_date,
	s.to_date,
	s.salary
FROM
	salaries s
INNER JOIN
	employees e 
ON 
	s.emp_no = e.emp_no;


-- subqueries
SELECT 
	sq.Nome,
	sq.`Salário`,
	SUM(sq.`Salário`)
FROM (
	SELECT 
		e.emp_no as 'ID funcionario',
		e.first_name as 'Nome',
		s.from_date as 'Data inicio', 
		s.to_date as 'Data Fim',
		s.salary as 'Salário'
	FROM
		salaries s
	INNER JOIN
		employees e 
	ON 
		s.emp_no = e.emp_no
) AS sq
GROUP BY
	sq.Nome
HAVING
	sq.`Salário` > 70000;



SELECT 
	sq.Nome,
	sq.`Salário`,
	SUM(sq.`Salário`)
FROM (
	SELECT 
		e.emp_no as 'ID funcionario',
		e.first_name as 'Nome',
		s.from_date as 'Data inicio', 
		s.to_date as 'Data Fim',
		s.salary as 'Salário'
	FROM
		salaries s
	INNER JOIN
		employees e 
	ON 
		s.emp_no = e.emp_no
) AS sq
GROUP BY
	sq.Nome
HAVING
	sq.`Salário` > 70000;