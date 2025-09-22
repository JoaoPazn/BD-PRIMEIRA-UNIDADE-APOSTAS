CREATE SCHEMA jackpot_if;
USE jackpot_if;

CREATE TABLE usuario(
    id INT AUTO_INCREMENT, -- ID se auto incrementa quando um usuário é logado
    PRIMARY KEY(id),
    nome_usuario VARCHAR(99) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    gasto FLOAT,
    ganho FLOAT,
    saldoatual FLOAT
);

CREATE TABLE tigrinho(
	userId INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES usuario(id),
    id_aposta INT AUTO_INCREMENT,
    PRIMARY KEY(id_aposta),
    gastotig FLOAT,
    ganhotig FLOAT,
    data_aposta TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE roleta(
	userId INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES usuario(id),
    id_aposta INT AUTO_INCREMENT,
    PRIMARY KEY(id_aposta),
    gastorol FLOAT,
    ganhorol FLOAT,
    data_aposta TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE esporte(
	userId INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES usuario(id),
    id_aposta INT AUTO_INCREMENT,
    PRIMARY KEY(id_aposta),
    gastoesp FLOAT,
    ganhoesp FLOAT,
    data_aposta TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sessoes_usuario (
	userId INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES usuario(id),
    id_sessao INT AUTO_INCREMENT,
    PRIMARY KEY(id_sessao),
    data_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_logout TIMESTAMP NULL,
    duracao_minutos INT
);

CREATE TABLE log_depositos (
	userId INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES usuario(id),
    id_sessao INT,
    FOREIGN KEY (id_sessao) REFERENCES sessoes_usuario(id_sessao),
    id_deposito INT AUTO_INCREMENT,
    PRIMARY KEY(id_deposito),
    valor_adicionado FLOAT NOT NULL,
    data_deposito TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
