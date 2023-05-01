select 
o.orderdate,
o.shipdate,
o.shipmode,
--o.orderid,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
c.customername,
c.segment,
c.country,
p.category,
p.productname,
p.subcategory,
d.delivery_team,
{{ markup() }} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid
left join {{ ref('delivery_team') }} as d
on o.shipmode = d.shipmode