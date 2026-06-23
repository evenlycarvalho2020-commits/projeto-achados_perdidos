CREATE DATABASE achados_perdidos;
USE achados_perdidos;

CREATE TABLE itens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    categoria VARCHAR(50),
    local_encontrado VARCHAR(100),
    data_encontrado DATE
);

CREATE TABLE retiradas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    turma VARCHAR(50),
    funcao VARCHAR(50),
    situacao VARCHAR(30),
    data_retirada DATE,
    assinatura VARCHAR(100),

    FOREIGN KEY (item_id) REFERENCES itens(id)
);

describe retiradas;