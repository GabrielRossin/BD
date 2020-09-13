DECLARE
    CURSOR emp_cursor IS
        select job_id from employees;
       
BEGIN
        FOR emp_register IN emp_cursor LOOP
                IF emp_register.job_id = 'PU_CLERK' THEN
                    update employees
                    set salary = salary * 1.12
                    where job_id = 'PU_CLERK';
               END IF;
               
              IF emp_register.job_id = 'SH_CLERK' THEN
                    update employees
                    set salary = salary * 1.11;
            END IF;
            IF emp_register.job_id = 'ST_CLERK' THEN
                    update employees
                    set salary = salary * 1.10;
            ELSE
                update employees
                set salary = salary * 1.05;
                
            END IF;
      
        END LOOP;
END;
/   

ROLLBACK;
select * from employees;


DECLARE 
    CURSOR emp_cursor IS --declara o cursor
        select employee_id , last_name --hire_date , salary
        from employees
        where department_id = 60;
        
        emp_record emp_cursor %rowtype;
        
       /* id_emp employees.employee_id % TYPE;
        hdate employees.hire_date % TYPE;
        salario employees.salary %TYPE;*/
      
BEGIN
      OPEN emp_cursor; -- abre o cursor
    
      IF NOT emp_cursor%ISOPEN THEN --verifica se o cursor está aberto
                OPEN emp_cursor;
      END IF;
      
    LOOP
            FETCH emp_cursor into emp_record;
             --FETCH emp_cursor into id_emp , hdate,salario; -- associa os valores da linha as variaveis
             EXIT When emp_cursor %notfound or emp_cursor%rowcount > 10;
             DBMS_OUTPUT.PUT_LINE(emp_cursor%rowcount || '    ' || emp_record.last_name);
    END LOOP;
    
    CLOSE emp_cursor; -- fecha o cursor
end;
/




DECLARE
    CURSOR emp_cursor (dept NUMBER) IS
            select employee_id , last_name from employees
            where department_id = dept;
BEGIN

        OPEN emp_cursor(60);
        CLOSE emp_cursor;
        
        OPEN emp_cursor(80);
        CLOSE emp_cursor;
END;
/

DECLARE
    CURSOR emp_cursor IS
        SELECT employee_id , last_name FROM employees 
        where department_id = 60;
BEGIN
        FOR emp_record IN emp_cursor LOOP
            DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || '    ' || emp_record.last_name);
        END LOOP;
END;
/     

DECLARE
    CURSOR emp_cursor IS
        SELECT last_name , job_id , salary , commission_pct
        FROM employees
       where commission_pct is not NULL;
BEGIN
        FOR emp_record in emp_cursor LOOP
        DBMS_OUTPUT.PUT_LINE(emp_record.last_name || '     ' || 
                                                                    emp_record.job_id || '    '||
                                                                    emp_record.salary || '    '||
                                                                  TO_CHAR(emp_record.salary + emp_record.salary  * emp_record.commission_pct)
                                                                );
        END LOOP;                                                          
END;
 /       
        
        
        

        
        
        
        