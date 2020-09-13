set SERVEROUTPUT ON;

CREATE TABLE DEPARTAMENTOS
(
    codigo int not null primary key,
    nome VARCHAR(20) not null,
    total_func int default 0
);

CREATE TABLE funcionarios
(
    codigo int not null primary key,
    nome varchar(20) not null,
    data_contr date,
    salario float,
    cod_depto int ,
    foreign key (cod_depto) references departamentos(codigo)
);


create or replace trigger dml_func
    before insert or update or delete on funcionarios
   
BEGIN
    CASE
        WHEN INSERTING THEN
                DBMS_OUTPUT.PUT_LINE('Novo funcionário inserido. ');
        WHEN UPDATING THEN
                DBMS_OUTPUT.PUT_LINE('Funcionário atualizado');
        WHEN DELETING THEN
                DBMS_OUTPUT.PUT_LINE('Funcionário removido');
    END CASE;
END;
/

CREATE OR REPLACE TRIGGER DML_FUNC 
BEFORE INSERT OR UPDATE OR DELETE ON FUNCIONARIOS
FOR EACH ROW
BEGIN
        DBMS_OUTPUT.PUT_LINE('DADOS ANTIGOS:' || chr(10) || 
                                                            'CODIGO = ' || :OLD.CODIGO || chr(10) ||
                                                            'NOME = ' || :OLD.NOME || chr(10) || 
                                                            'DATA CONTRATACAO = ' || :OLD.DATA_CONTR || chr(10) ||
                                                            'SALARIO = ' || :OLD.SALARIO || chr(10) ||
                                                            'COD_DEPTO = ' || :OLD.COD_DEPTO || chr(10)); 




        DBMS_OUTPUT.PUT_LINE('DADOS NOVOS:' || chr(10) || 
                                                            'CODIGO = ' || :NEW.CODIGO || chr(10) || 
                                                            'NOME = ' || :NEW.NOME || chr(10) || 
                                                            'DATA CONTRATACAO = ' || :NEW.DATA_CONTR || chr(10) || 
                                                            'SALARIO = ' || :NEW.SALARIO || chr(10) || 
                                                            'COD_DEPTO = ' || :NEW.COD_DEPTO || chr(10)); 
END; 
/

    TRUNCATE table funcionarios;
    INSERT INTO FUNCIONARIOS(CODIGO ,NOME)
    VALUES (1 , 'CRISTIANE');
    INSERT INTO FUNCIONARIOS(CODIGO , NOME)
    VALUES(2, 'FERNANDO');
/    
    
CREATE OR REPLACE TRIGGER imprimir_alteracao_salario 
BEFORE INSERT OR UPDATE OF salario ON funcionarios 
FOR EACH ROW 
WHEN (NEW.salario > 10000) 

DECLARE 
    diferenca number; 
BEGIN 
    diferenca := :NEW.salario - :OLD.salario; 
    dbms_output.put_line('salario antigo: ' || :OLD.salario); 
    dbms_output.put_line('salario novo: ' || :NEW.salario); 
    dbms_output.put_line('diferença: ' || diferenca); 
END; 
/
update funcionarios
set salario = 20000;
    
    