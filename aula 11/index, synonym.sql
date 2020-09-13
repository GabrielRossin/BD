CREATE INDEX EMP_LAST_NAME
ON employees(last_name);

SELECT  *
FROM    all_indexes
where index_name = 'EMP_LAST_NAME';

DROP INDEX EMP_LAST_NAME;

----------------------------------------------------------------------------

CREATE SYNONYM offices
for locations;

select * from offices;

DROP SYNONYM offices;


