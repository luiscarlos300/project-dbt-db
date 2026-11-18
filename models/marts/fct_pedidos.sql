with pedidos as (
select * from {{ ref('stg_pedidos') }}
),
pagamentos as (
select pedido_id, sum(valor) as valor_total
from {{ ref('stg_pagamentos') }}
group by pedido_id
)
select
p.pedido_id,
p.cliente_id,
p.data_pedido,
p.status,
coalesce(pg.valor_total, 0) as valor_total
from pedidos p
left join pagamentos pg using (pedido_id)