
-- ex1
create table dependente(
    id_codigo int not null primary key,
    id_empregado number not null,
    nome varchar(50),
    nascimento date,
    parentesco varchar(20) default  'filho',
   foreign key(id_empregado) references employees(employee_id) on delete cascade
);


--ex2

insert into employees
values
('207','Gabriel','Rossin','fhfhfhfh','515.125.1818','07-06-02','SH_CLERK','5000','','120','50');

insert into dependente
values
('1','207','Maria','05-03-1998','neta');

--SELECT  * FROM dependente;

DELETE from employees
where employee_id = 207;

--SELECT  * FROM dependente;

--ex3
--a
    select first_name,last_name from employees
    where salary > 5000;

--b
    select first_name , last_name from employees
    where salary between 8000 and 10000;

--c
    select last_name , salary , department_id from employees 
    where job_id in ( select  job_id from jobs
                   where  job_id like '%CLERK%' );
    --usando join         
   /* select last_name , salary , department_id from employees e
    join jobs j
    on j.job_id =  e.job_id
    where j.job_id like '%CLERK%' ;*/
    
--d
    select last_name , salary from employees
    where department_id = 50 and salary < 3000 ;
    

--e
        select last_name , phone_number , email from employees 
        where job_id in ( select  job_id from jobs
                   where  job_title = 'Programmer');

    --usando join
    /*select e.last_name , e.phone_number, e.email  from employees e
    join jobs j
    on j.job_id = e.job_id
    where j.job_title = 'Programmer' ;*/
    
--f
    
    select first_name , last_name  from employees 
    where department_id in ( select  department_id from departments
                                              where department_name = 'Marketing');  
    
    --usando  join
    select e.first_name , e.last_name from employees e
    join departments d
    on d.department_id = e.department_id
    where d.department_name = 'Marketing';
    
    
--g

    select * from locations
    where country_id in (select country_id from countries
                                        where country_name = 'Canada');
    --usando join
    
    /*select l.* from locations l
    join countries c
    on c.country_id = l.country_id
    where c.country_name = 'Canada';*/
    
    
-- h
    
    select country_name from countries
    where region_id in (select region_id from regions
                                        where region_name = 'Europe');
    
    -- usando Join
    
   /* select c.country_name from countries c
    join regions r
    on r.region_id = c.region_id
    where r.region_name = 'Europe' ;*/
    
    
    
    
    
    
    
    

    































