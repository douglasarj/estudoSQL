CREATE DATABASE consulta_medica;
use consulta_medica;

SELECT * FROM consulta;

-- DROP TABLE REMOVE UMA TABELA --

SELECT 
pp.nome AS nome_paciente,
pp.cpf AS cpf_paciente,
pm.nome AS nome_medico,
pm.cpf AS cpf_medico,
c.tipo_consulta,
c.data_consulta,
c.stats,
p.numero_sus,
p.plano_saude,
m.crm,
m.especialidade
 FROM consulta c # id_paciente id_medico
 INNER JOIN paciente p ON c.id_paciente = p.id_paciente # id_pessoa
 INNER JOIN pessoa pp ON pp.id_pessoa = p.id_pessoa
 INNER JOIN medico m ON m.id_medico = c.id_medico #id_pessoa
 INNER JOIN pessoa pm ON pm.id_pessoa = m.id_pessoa;



CREATE TABLE pessoa (
id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf VARCHAR(11) NOT NULL,
data_nascimento DATE,
rg VARCHAR(7),
telefone VARCHAR(14),
email VARCHAR(45),
situacao CHAR(1)
);


CREATE TABLE paciente (
id_paciente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
numero_sus VARCHAR(20),
plano_saude VARCHAR(45),
observacao VARCHAR(100),
situacao CHAR (1),
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE medico (
id_medico INT PRIMARY KEY AUTO_INCREMENT,
crm VARCHAR(6) NOT NULL,
especialidade VARCHAR(45) NOT NULL,
salario DECIMAL (10,2),
situacao CHAR (1),
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE consulta (
id_consulta INT PRIMARY KEY AUTO_INCREMENT,
tipo_consulta VARCHAR(45) NOT NULL,
data_consulta DATETIME DEFAULT CURRENT_TIMESTAMP,
stats VARCHAR(45) NOT NULL,
id_paciente INT NOT NULL,
id_medico INT NOT NULL,
FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

SELECT * FROM pessoa;
INSERT INTO pessoa(nome, cpf ,data_nacimento,rg ,telefone ,email ,situacao)
VALUES ('João Paulo','12345678900','1998-10-10','1234567','6191928391','teste@teste.com','A'),
('Rafael Melo','98765432100','1999-10-10','7654321','6191928392','teste@teste.com','A'),
('Yan Felipe','56734512311','1980-10-10','4567890','6191928393','teste@teste.com','A'),
('Ruan Lobo','78945612300','2001-10-10','2828765','6191928394','teste@teste.com','A'),
('Talisson Dourado','86753431230','2004-10-10','7878632','6191928395','teste@teste.com','A'),
('Gabriel','00098721600','2002-10-10','8989765','6191928396','teste@teste.com','A'),
('Guilherme Soares','00011122233','2001-10-10','9090812','6191928397','teste@teste.com','A');

SELECT * FROM medico;
INSERT INTO medico(crm,especialidade,salario,situacao,id_pessoa)
VALUES('123456','ODONTOLOGO',1000.00,'A',3),
('656432','FARMACEUTICO',900.00,'A',5);

SELECT * FROM paciente;
INSERT INTO paciente(nome,numero_sus,plano_saude,observacao,situacao,id_pessoa)
VALUES('Guilherme Soares','1092837','88888888',NULL,'A',7),
('João Paulo','23456','88888888',NULL,'A',1),
('Rafael Melo','1092','88888888',NULL,'A',2),
('Ruan Lobo','109282','88888888',NULL,'A',4);






