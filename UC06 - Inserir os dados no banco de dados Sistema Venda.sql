CREATE DATABASE sistema_venda;
USE sistema_venda;

CREATE TABLE pessoa (
    id_pessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    cpf CHAR(11) UNIQUE NOT NULL,
    situacao ENUM('ativo', 'inativo') DEFAULT 'ativo'
);

CREATE TABLE atendente (
    id_atendente INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    situacao ENUM('ativo', 'inativo') DEFAULT 'ativo',
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
    
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    telefone VARCHAR(15) NOT NULL,
    saldo DECIMAL(10, 2) DEFAULT 0.00,
    email VARCHAR(100) UNIQUE,
    situacao ENUM('ativo', 'inativo') DEFAULT 'ativo',
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);
INSERT INTO categoria (descricao) VALUES
("Smartphones"),
("Notebooks"),
("Eletrodomesticos");

CREATE TABLE produto (
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    codigo INT,
    descricao VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    situacao ENUM('disponivel', 'indisponivel') DEFAULT 'disponivel',
    quantidade_estoque INT DEFAULT 0,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);
INSERT INTO produto (codigo, descricao, preco, situacao, quantidade_estoque, id_categoria) VALUES
(1001, 'Smartphone XYZ', 1200.00, 'disponivel', 50, 1), -- categoria smartphones
(1002, 'Smartphone ABC', 1500.00, 'disponivel', 30, 1), -- categoria smartphones
(2001, 'Notebook Gamer', 4000.00, 'disponivel', 20, 2), -- categoria notebooks
(2002, 'Notebook Ultra', 3000.00, 'disponivel', 15, 2), -- categoria notebooks
(3001, 'Geladeira Inox', 2500.00, 'disponivel', 10, 3), -- categoria eletrodomésticos
(3002, 'Máquina de Lavar', 1800.00, 'disponivel', 5, 3); -- categoria eletrodomésticos

CREATE TABLE venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    desconto DECIMAL(10, 2) DEFAULT 0.00,
    acrescimo DECIMAL(10, 2) DEFAULT 0.00,
    situacao ENUM('concluida', 'pendente', 'cancelada') DEFAULT 'pendente',
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE itens_venda (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    desconto DECIMAL(10, 2) DEFAULT 0.00,
    acrescimo DECIMAL(10, 2) DEFAULT 0.00,
    quantidade INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    valor_bruto DECIMAL(10, 2) NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    cancelado BOOLEAN DEFAULT FALSE,
    id_venda INT NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda)
);

-- Inserindo 6 pessoas sendo 3 pessoas que serão (atendentes)
INSERT INTO pessoa (nome, idade, cpf, situacao) VALUES
('João Silva', 30, '12345678901', 'ativo'), # atendente 1
('Maria Oliveira', 28, '10987654321', 'ativo'), #atendente 2
('Carlos Santos', 35, '98765432100', 'ativo'); #atendente 3

-- e 3 pessoas que serão (clientes)
INSERT INTO pessoa (nome, idade, cpf, situacao) VALUES
('Ana Lima', 22, '11223344556', 'ativo'), #cliente 1
('Pedro Costa', 40, '22334455667', 'ativo'), #cliente 2
('Fernanda Almeida', 33, '33445566778', 'ativo'); #cliente 3

INSERT INTO cliente (telefone, saldo,email,situacao, id_pessoa) VALUES 
('61999872492',9000.00,'douglas@teste.xyz','ativo',1),
('61925932476',1000.00,'bouglas@teste.xyz','ativo',2),
('61943932453',2000.00,'rouglas@teste.xyz','ativo',3);

--  3 atendentes com base nas pessoas ja inseridas
INSERT INTO atendente (matricula, salario, situacao, id_pessoa) VALUES 
('AT004',3000.00,'ativo',4),
('AT005',1000.00,'ativo',5),
('AT006',4000.00,'ativo',6);

select * from atendente;


-- VENDA

SELECT * FROM venda;
INSERT INTO venda(quantidade,preco,total,desconto,acrescimo,situacao,situacao)
VALUES
(, , , , , ,),
(, , , , , ,),
(, , , , , ,);


-- ITENS VENDAS

SELECT * FROM itens_venda;
INSERT INTO itens_venda(desconto,acrescimo,quantide, preco, valor_butro,valor_total,cancelado,id_venda)
VALUES
(, , , , , ,),
(, , , , , ,),
(, , , , , ,);