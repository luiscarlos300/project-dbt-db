select
id as cliente_id,
nome,
lower(email) as email,
cast(data_cadastro as date) as data_cadastro
from {{ ref('raw_clientes') }}