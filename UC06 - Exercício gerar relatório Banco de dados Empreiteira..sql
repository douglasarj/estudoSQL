CREATE DATABASE empreiteira;
use empreiteira;

CREATE TABLE pessoa(
id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
cnpj_cpf VARCHAR(14) NOT NULL,
nome_fantasia VARCHAR(45),
telefone VARCHAR(15) NOT NULL,
email VARCHAR(45) NOT NULL,
situacao CHAR(1) NOT NULL
);

CREATE TABLE endereco(
id_endereco INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR(100) NOT NULL,
cidade VARCHAR(100) NOT NULL,
bairro VARCHAR(100) NOT NULL,
cep VARCHAR(8) NOT NULL,
uf CHAR(2) NOT NULL,
situacao CHAR(1) NOT NULL,
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE colaborador(
id_colaborador INT PRIMARY KEY AUTO_INCREMENT,
funcao VARCHAR(45) NOT NULL,
matricula VARCHAR(20) NOT NULL,
salario DECIMAL(10,2) NOT NULL,
tipo_contrato VARCHAR(45) NOT NULL,
situacao CHAR(1) NOT NULL,
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE projeto(
id_projeto INT PRIMARY KEY AUTO_INCREMENT,
valor DECIMAL(10,2) NOT NULL,
tipo_projeto VARCHAR(45) NOT NULL,
nome_projeto VARCHAR(45) NOT NULL,
previsao DATE NOT NULL,
data_inicio DATE NOT NULL,
data_fim DATE,
status_ VARCHAR(15) NOT NULL,
id_colaborador INT NOT NULL,
FOREIGN KEY (id_colaborador) REFERENCES colaborador(id_colaborador)
);

CREATE TABLE empreiteira(
id_empreiteira INT PRIMARY KEY AUTO_INCREMENT,
area_atuacao VARCHAR(20) NOT NULL,
tipo_contrato VARCHAR(45) NOT NULL,
situacao CHAR(1) NOT NULL,
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE obra(
id_obra INT PRIMARY KEY AUTO_INCREMENT,
valor DECIMAL(10,2) NOT NULL,
previsao VARCHAR(10) NOT NULL,
data_inicio DATE NOT NULL,
data_fim DATE,
status_ VARCHAR(15) NOT NULL,
id_empreiteira INT NOT NULL,
id_colaborador INT NOT NULL,
id_projeto INT NOT NULL,
FOREIGN KEY (id_projeto) REFERENCES projeto(id_projeto),
FOREIGN KEY (id_colaborador) REFERENCES colaborador(id_colaborador),
FOREIGN KEY (id_empreiteira) REFERENCES empreiteira(id_empreiteira)
);


SELECT * FROM pessoa;
INSERT INTO pessoa(nome,cnpj_cpf,nome_fantasia,telefone,email,situacao)
VALUES
	('João Silva', '12345678909', NULL, '11987654321', 'joao.silva@email.com', 'A'),
    ('Maria Rodrigues', '98765432110', NULL, '11998765432', 'maria.rodrigues@email.com', 'A'),
    ('Pedro Oliveira', '54321098765', NULL, '11987654321', 'pedro.oliveira@email.com', 'A'),
    ('Ana Souza', '12345678911', NULL, '11998765432', 'ana.souza@email.com', 'A'),
    ('Luiz Carlos', '98765432112', NULL, '11987654321', 'luiz.carlos@email.com', 'A'),
    ('Julia Martins', '54321098766', NULL, '11998765432', 'julia.martins@email.com', 'A'),
    ('Empresa 1', '12345678901234', 'Empresa Um', '11987654321', 'empresa1@email.com', 'A'),
    ('Empresa 2', '98765432109876', 'Empresa Dois', '11998765432', 'empresa2@email.com', 'A'),
    ('Empresa 3', '54321098765432', 'Empresa Tres', '11987654321', 'empresa3@email.com', 'A');

SELECT * FROM endereco;    
INSERT INTO endereco(rua, cidade, uf, bairro, cep, situacao, id_pessoa) 
VALUES
('Rua das Flores', 'São Paulo', 'SP', 'Centro', '01000000', 'A', 1),
('Avenida Brasil', 'Rio de Janeiro', 'RJ', 'Copacabana', '22000001', 'A', 2),
('Rua 7 de Setembro', 'Vitória', 'ES', 'Praia do Canto', '29000002', 'A', 3),
('Rua dos Pinhais', 'Brasília', 'DF', 'Asa Sul', '70000003', 'A', 4),
('Rua das Palmeiras', 'Goiânia', 'GO', 'Jardim Goiás', '74000004', 'A', 5),
('Avenida Atlântica', 'Fortaleza', 'CE', 'Meireles', '60000005', 'A', 6),
('Rua Presidente Vargas', 'Salvador', 'BA', 'Pituba', '40000006', 'A', 7),
('Rua Augusto Severo', 'Belo Horizonte', 'MG', 'Savassi', '30000007', 'A', 8),
('Rua Monteiro Lobato', 'Curitiba', 'PR', 'Batel', '80000008', 'A', 9);

SELECT * FROM colaborador;
INSERT INTO colaborador(funcao,matricula,salario,tipo_contrato,situacao,id_pessoa)
VALUES
	('Mestre de Obras', '001', 5000.00, 'CLT', 'A', 1),
    ('Arquiteto', '002', 8000.00, 'CLT', 'A',  2),
    ('Mestre de Obras ', '003', 4000.00, 'PJ', 'A', 3),
    ('Arquiteto', '004', 3000.00, 'CLT', 'A', 4),
    ('Mestre de Obras', '005', 10000.00, 'CLT', 'A', 5),
    ('Arquiteto', '006', 2000.00, 'CLT', 'A', 6);
    
    SELECT * FROM empreiteira;
    INSERT INTO empreiteira(area_atuacao,tipo_contrato,situacao,id_pessoa)
    VALUES
    ('Infraestrutura','2 anos','A',7),
    ('Manutencao','3 anos','A',8),
    ('Designer','4 anos','A',9);
    
    SELECT * FROM projeto;
    INSERT INTO projeto(valor,tipo_projeto,nome_projeto,previsao,data_inicio,data_fim,status_,id_colaborador)
    VALUES
    (100000.00, 'Construção', 'Prédio Corporativo', '6 meses', '2022-01-01', NULL, 'Em Andamento', 2),
    (50000.00, 'Reforma', 'Reforma da Escola', '3 meses', '2022-03-01', NULL, 'Em Andamento', 4 ),
    (20000.00, 'Pavimentação', 'Pavimentação da Rua', '2 meses', '2022-06-01', NULL, 'Em Andamento', 6 );
    
    SELECT * FROM obra;
    INSERT INTO obra(valor,previsao,data_inicio,data_fim,status_,id_empreiteira,id_colaborador,id_projeto)
    VALUES
     (500000.00, '12 meses', '2022-01-01', NULL, 'Em Andamento', 1,1,1),
    (200000.00, '9 meses', '2022-03-01', NULL, 'Em Andamento', 2,2,2),
    (300000.00, '10 meses', '2022-06-01', NULL, 'Em Andamento', 3,3,3);
    
    
    SELECT 
    p.nome,
    pj.nome_projeto,
    pj.tipo_projeto,
    pj.valor,
    pj.data_inicio,
    pj.previsao,
    (data_inicio + INTERVAL previsao DAY) AS data_prevista_entrega
    FROM projeto pj 
    INNER JOIN colaborador c ON c.id_colaborador = pj.id_colaborador
    INNER JOIN pessoa p ON p.id_pessoa = c.id_pessoa;
    
    
    -- UC06 - Exercício gerar relatório Banco de dados Empreiteira.
    
    SELECT 
    o.valor,
    o.data_inicio,
    o.previsao,
    (data_inicio + INTERVAL previsao DAY) AS data_entrega,
    o.data_fim AS "previsao_entrega",
    o.status_,
    p.telefone,
    en.rua,
    en.cidade,
    en.uf
    FROM obra o  
    INNER JOIN empreiteira ep ON ep.id_empreiteira = o.id_empreiteira
    INNER JOIN pessoa p ON p.id_pessoa = ep.id_pessoa
    INNER JOIN endereco en ON en.id_pessoa = p.id_pessoa;
    
  





