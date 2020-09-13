-- 1
--usando inner 

    select j.job_title from jobs j
     join employees e
    on e.job_id = j.job_id
    where e.salary < 5000;
    
    select j.job_title from jobs j
     join employees e
    using(job_id)
    where e.salary < 5000;
    

--usando natural 
    select j.job_title from jobs j
    natural join employees e
    where e.salary < 5000;
    
    
-- 2
--usando inner
    select c.country_name , r.region_name from countries c
    join regions r
    on r.region_id = c.region_id;
    
    select c.country_name , r.region_name from countries c
    join regions r
    using(region_id);
    
--usando natural
   select c.country_name , r.region_name from countries c
   natural join regions r;

    
--3
--usando inner
    select d.department_name , e.last_name from departments d
     join employees e
     on d.manager_id = e.manager_id
     where e.salary < 10000;
     
     select d.department_name , e.last_name from departments d
     join employees e
     using(manager_id)
     where e.salary < 10000;
     
--4
--usando inner
    select d.department_name , l.city from departments d
    join locations l
    on l.location_id = d.location_id
    where d.manager_id Is Null;
    
    select d.department_name , l.city from departments d
    join locations l
    using(location_id)
    where d.manager_id Is Null;

--usando natural
    select d.department_name , l.city from departments d
    natural  join locations l
    where d.manager_id Is Null;
    
--5
--usando inner
    select e.first_name , e.last_name from employees e
    join departments d
    on d.department_id = e.department_id
    join locations l 
    on l.location_id = d.location_id
    where l.city like ('S%');
    
    select e.first_name , e.last_name from employees e
    join departments d
    using(department_id)
    join locations l 
    using(location_id)
    where l.city like ('S%');
    
    
    
--6
--usando inner
    select e.last_name from employees e
    join departments d
    on d.department_id = e.department_id
    join locations l
    on l.location_id = d.location_id
    join countries c
    on c.country_id = l.country_id
    where c.country_name like ('%United%')
    order by e.employee_id;
    
    select e.last_name from employees e
    join departments d
    using (department_id)
    join locations l
    using (location_id)
    join countries c
    using (country_id)
    where c.country_name like ('%United%')
    order by e.employee_id;
    
    
--7
--usando inner
    select jh.employee_id, jh.start_date, jh.end_date, jh.job_id ,d.department_name , e.last_name ,  j.job_title 
    from job_history jh
    join employees e
    on e.employee_id = jh.employee_id
    join jobs j
    on j.job_id = jh.job_id
    join departments d
    on d.department_id = e.department_id;
    
     
--8
--usando inner
select e.first_name, e.last_name , e.email from employees e
join departments d
on d.department_id = e.department_id
join locations l
on l.location_id = d.location_id
join countries c
on c.country_id = l.country_id
join regions r
on r.region_id = c.region_id
where r.region_name = 'Europe';

select e.first_name, e.last_name , e.email from employees e
join departments d
using (department_id)
join locations l
using(location_id)
join countries c
using(country_id)
join regions r
using (region_id)
where r.region_name = 'Europe';



    
    
    
    
    
    
    
    
    
    
    
    
