-- Clientes
INSERT INTO cliente (nome, telefone, email, tipo) VALUES
('João Silva', '31999999999', 'joao@email.com', 'PF'),
('Auto Peças Ltda', '3122223333', 'contato@autopecas.com', 'PJ');

-- Veículos
INSERT INTO veiculo (id_cliente, placa, marca, modelo, ano) VALUES
(1, 'ABC1234', 'Ford', 'Fiesta', 2012),
(2, 'XYZ9876', 'Volkswagen', 'Saveiro', 2018);

-- Funcionários
INSERT INTO funcionario (nome, cargo, especialidade) VALUES
('Carlos Mendes', 'Mecânico', 'Suspensão'),
('Ana Paula', 'Eletricista', 'Sistema elétrico');

-- Serviços
INSERT INTO servico (descricao, valor) VALUES
('Troca de óleo', 120.00),
('Alinhamento e balanceamento', 150.00),
('Revisão elétrica', 200.00);

-- Ordens de Serviço
INSERT INTO ordem_servico (id_veiculo, id_funcionario, data_entrada, status) VALUES
(1, 1, '2023-11-01', 'EM_EXECUCAO'),
(2, 2, '2023-11-03', 'FINALIZADA');

-- Itens da Ordem
INSERT INTO item_ordem_servico (id_ordem, id_servico, quantidade) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1);

-- Pagamentos
INSERT INTO pagamento (id_ordem, metodo, valor_pago, data_pagamento, status) VALUES
(2, 'PIX', 200.00, '2023-11-04', 'PAGO');