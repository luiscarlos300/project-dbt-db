select
id as pedido_id,
cliente_id,
cast(data_pedido as date) as data_pedido,
status
from {{ ref('raw_pedidos') }}