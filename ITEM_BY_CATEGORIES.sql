select distinct organization_Code from inv.mtl_parameters mp;

select  mp.organization_code "Org Code",
        mc.CONCATENATED_SEGMENTS "Category",
        msi.segment1 "Item",
        msi.description "Item Description",
        msi.primary_uom_code "UOM"
from    mtl_system_items_b msi,         -- Item 
        mtl_item_categories mic,        -- item / category association
        mtl_categories_kfv mc,          -- Category definition
--        mtl_category_sets_b mcs,        -- base category set table
        mtl_default_category_sets mdcs, -- default categories by functional area
        mtl_parameters mp               -- inventory organization definition
where   msi.organization_id = mp.organization_id
and     mic.inventory_item_id = msi.inventory_item_id
and     mic.organization_id = msi.organization_id
and     mic.category_id = mc.category_id
--and     mic.category_set_id = mcs.category_set_id
--and     mcs.category_set_id = mdcs.category_set_id
and     mic.category_set_id = mdcs.category_set_id
and     mdcs.functional_area_id = 1 -- Inventory
-- 1 Inventory
-- 2 Purchasing
-- 3 Planning
-- 4 Service
-- 5 Cost
-- 6 Engineering
-- 7 Order Entry
-- 8 Product Line Accounting
-- 9 Asset Management
-- 10 Contracts
-- 11 Product Reporting
-- 12 GDSN Syndication - UDEX
-- 13 Process Allocation Class
-- 14 Process Sequence Dependency Class
-- 15 Process Substandard Item Class
-- 16 Process Technical Class
-- 17 Process GL Class
-- 18 Process GL Business Class
-- 19 Process Cost Class
-- 20 Process Product Line
-- 21 GDSN Syndication - GPC
and     mp.organization_code = 'ST1'
order by 1,2 
/

desc mtl_categories_kfv
