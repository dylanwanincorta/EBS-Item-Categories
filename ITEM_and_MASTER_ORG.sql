-- an item can be reused in multiple master org
-- in OBIA, we made an assumption that this is a bad data senario
select organization_id, count(inventory_item_id)
from mtl_system_items_b
where inventory_item_id in (
select inventory_item_id from mtl_system_items_b i where organization_id in (
select master_organization_id FRom mtl_parameters group by master_organization_id
)
group by inventory_item_id
having count(*) > 1
)
group by organization_id
order by 1;

-- When the inventory org is not known, in OBIA, we use the master organization
-- It may not be a bad idea.  However, in many cases, the master organization is known.

-- We will deal with this in Incorta.  