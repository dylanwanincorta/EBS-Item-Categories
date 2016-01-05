--select * FRom ar_system_parameters_all;
select * from all_tables where  owner='ONT' and table_name like 'OE%PARA%';
desc OE_SYS_PARAMETERS_ALL
desc OE_SYSTEM_PARAMETERS_ALL

-- these two tables store the same data
select ORG_ID, TO_NUMBER(PARAMETER_VALUE) from OE_SYS_PARAMETERS_ALL where parameter_code = 'MASTER_ORGANIZATION_ID'
MINUS
select org_id, master_organization_id from OE_SYSTEM_PARAMETERS_ALL;

-- same validation org can be used in multiple OU
select master_organization_id, count(*) from OE_SYSTEM_PARAMETERS_ALL group by master_organization_id having count(*) > 1;


