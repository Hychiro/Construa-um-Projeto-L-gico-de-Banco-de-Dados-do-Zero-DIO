CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    tipo CHAR(2) CHECK (tipo IN ('PF','PJ'))
);

CREATE TABLE veiculo (
    id_veiculo SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES cliente(id_cliente),
    placa VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT
);

CREATE TABLE funcionario (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    especialidade VARCHAR(100)
);

CREATE TABLE servico (
    id_servico SERIAL PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    valor NUMERIC(10,2) NOT NULL
);

CREATE TABLE ordem_servico (
    id_ordem SERIAL PRIMARY KEY,
    id_veiculo INT REFERENCES veiculo(id_veiculo),
    id_funcionario INT REFERENCES funcionario(id_funcionario),
    data_entrada DATE NOT NULL,
    data_saida DATE,
    status VARCHAR(30) CHECK (status IN ('ABERTA','EM_EXECUCAO','FINALIZADA','CANCELADA'))
);

CREATE TABLE item_ordem_servico (
    id_ordem INT REFERENCES ordem_servico(id_ordem),
    id_servico INT REFERENCES servico(id_servico),
    quantidade INT CHECK (quantidade > 0),
    PRIMARY KEY (id_ordem, id_servico)
);

CREATE TABLE pagamento (
    id_pagamento SERIAL PRIMARY KEY,
    id_ordem INT REFERENCES ordem_servico(id_ordem),
    metodo VARCHAR(30) CHECK (metodo IN ('DINHEIRO','CARTAO','PIX','BOLETO')),
    valor_pago NUMERIC(10,2),
    data_pagamento DATE,
    status VARCHAR(30) CHECK (status IN ('PENDENTE','PAGO','CANCELADO'))
);