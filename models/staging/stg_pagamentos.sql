select
id as pagamento_id,
pedido_id,
metodo,
valor_centavos / 100.0 as valor
from {{ ref('raw_pagamentos') }}