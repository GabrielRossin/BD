CREATE OR REPLACE VIEW EMP_50
AS  
    select employee_id,last_name,salary
    from employees
    where department_id = 50;
    
describe emp50_view;

CREATE OR REPLACE VIEW EMP_10
(Nome, DataCntr, SalAnual)
AS
    select first_name||' '||last_name, hire_date"data da contratação",  salary*12 "SALÁRIO ANUAL"
    FROM employees
    WHERE job_id like '%CLERK%';
    
CREATE OR REPLACE VIEW  DEPT_ADDRESS_VIEW 
(nome, rua, cidade, cod, estado, pais)
AS
    select d.department_name,    L.street_address,  L.city, L.postal_code,  L.state_province , c.country_name
    from departments d , locations L , countries c
    where d.location_id = L.location_id and L.country_id = c.country_id;
    
SELECT * FROM DEPT_ADDRESS_VIEW 
WHERE cidade = 'Seattle';

select view_name from user_views;







