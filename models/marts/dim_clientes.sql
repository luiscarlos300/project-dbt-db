with pedidos as (
select * from {{ ref('fct_pedidos') }}
where status != 'cancelado'
)
select
c.cliente_id,
c.nome,
c.email,
min(p.data_pedido) as primeiro_pedido,
count(p.pedido_id) as qtd_pedidos,
coalesce(sum(p.valor_total), 0) as receita_total
from {{ ref('stg_clientes') }} c
left join pedidos p using (cliente_id)
group by 1, 2, 3