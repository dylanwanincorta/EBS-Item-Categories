
-- One way to identify the item master orgaizations
select count(*) FRom mtl_parameters group by master_organization_id
/
-- we can ensure that item master org must use itsself as the master
select I.organization_id, I.master_organization_id
from (select master_organization_id FRom mtl_parameters group by master_organization_id) ML
, mtl_parameters I
where ML.master_organization_id  = I.organization_id
and I.master_organization_id <>I.organization_id
/

-- > there is no parent child relationships.

