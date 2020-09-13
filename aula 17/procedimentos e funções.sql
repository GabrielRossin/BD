SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE ADD_DEPT IS
dept_id departments.department_id %TYPE;
dept_name departments.department_name %TYPE;

BEGIN
    select max(department_id) INTO dept_id from departments;
    dept_name := 'Novo departamento';
    insert into departments (department_id , department_name)
    values ((dept_id + 1), dept_name);
    DBMS_OUTPUT.PUT_LINE('Inserida ' || sql%rowcount || 'linha. ');
END;
/

BEGIN
  add_dept;
END;
/

select * from departments;


CREATE OR REPLACE PROCEDURE add_dept1
(dept_name departments.department_name %TYPE , emp_id employees.employee_id %TYPE)
IS
BEGIN
        update departments
        set manager_id = emp_id
        where upper(department_name) = upper(dept_name);
        
        DBMS_OUTPUT.PUT_LINE('Atualizada(s)  ' || sql%rowcount || 'tupla(s)');
END;
/

BEGIN
    add_dept1('IT Support' , 100);
END;
/

ROLLBACK;
select * from departments;

drop procedure add_dept1;





CREATE OR REPLACE FUNCTION check_sal
    (emp_id employees.employee_id %TYPE)
    RETURN BOOLEAN
IS
        dept_id employees.department_id %TYPE;
        sal employees.salary %TYPE;
        avg_sal employees.salary % TYPE;
BEGIN

        select salary , department_id INTO sal , dept_id
        from employees where employee_id = emp_id;
        
        select avg(salary) into avg_sal
        from employees where department_id = dept_id;
        
        IF sal > avg_sal THEN
            return true;
    END IF;
    
    return false;
        
END;
/

BEGIN
    IF (check_sal(100) )THEN
        dbms_output.put_line('Salário > média');
    ELSE
       dbms_output.put_line('Salário < média');
    END IF;
END;
/

CREATE OR REPLACE FUNCTION qtd_salario
(emp_id employees.employee_id%TYPE)
RETURN NUMBER
IS
        qtd NUMBER;
BEGIN
        select count(*) into qtd from employees
        where salary > (    select salary from employees
                                        where employee_id = emp_id
                                    );
        return qtd;
END;
/

DECLARE 
    emp_id employees.employee_id%TYPE := &emp_id;
BEGIN
        DBMS_OUTPUT.PUT_LINE(qtd_salario(emp_id) || ' empregados ganham mais que que o empregado' || emp_id);
END;
/
SELECT employee_id, qtd_salario(employee_id) qtd FROM Employees 
ORDER BY qtd DESC;
