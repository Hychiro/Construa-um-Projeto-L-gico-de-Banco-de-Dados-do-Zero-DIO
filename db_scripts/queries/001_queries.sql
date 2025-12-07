--1. Quantidade de ordens por cliente

SELECT c.nome, COUNT(o.id_ordem) AS total_ordens
FROM cliente c
JOIN veiculo v ON v.id_cliente = c.id_cliente
JOIN ordem_servico o ON o.id_veiculo = v.id_veiculo
GROUP BY c.nome
ORDER BY total_ordens DESC;

--2. Total de serviços por ordem e valor total

SELECT o.id_ordem, c.nome,
       SUM(s.valor * ios.quantidade) AS valor_total
FROM ordem_servico o
JOIN veiculo v ON v.id_veiculo = o.id_veiculo
JOIN cliente c ON c.id_cliente = v.id_cliente
JOIN item_ordem_servico ios ON ios.id_ordem = o.id_ordem
JOIN servico s ON s.id_servico = ios.id_servico
GROUP BY o.id_ordem, c.nome
HAVING SUM(s.valor * ios.quantidade) > 100
ORDER BY valor_total DESC;

--3. Ordens com pagamento pendente

SELECT o.id_ordem, c.nome, o.status, p.status AS status_pagamento
FROM ordem_servico o
JOIN veiculo v ON v.id_veiculo = o.id_veiculo
JOIN cliente c ON c.id_cliente = v.id_cliente
LEFT JOIN pagamento p ON p.id_ordem = o.id_ordem
WHERE p.status = 'PENDENTE';

--4. Funcionários com mais ordens atribuídas

SELECT f.nome, COUNT(o.id_ordem) AS qtd_ordens
FROM funcionario f
JOIN ordem_servico o ON o.id_funcionario = f.id_funcionario
GROUP BY f.nome
ORDER BY qtd_ordens DESC;

--5. Valor total recebido por método de pagamento

SELECT metodo, SUM(valor_pago) AS total_recebido
FROM pagamento
WHERE status = 'PAGO'
GROUP BY metodo
ORDER BY total_recebido DESC;