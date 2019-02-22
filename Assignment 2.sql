use employees;
SELECT gender,
min(salary),max(salary),avg(salary),
count(salary)
from employees as e, salaries as s
where (e.emp_no=s.emp_no)
group by gender;
select count(emp_no) from dept_emp where ((from_date<'1986-01-01') and (to_date>'1991-03-07'))
and dept_no='d007';
select count(distinct emp_no) from salaries;
select emp_no, avg(salary) from salaries group by emp_no;
select count(emp_no) from titles where (title='senior staff' or title='staff')