CREATE DATABASE consulta_medica;
use consulta_medica;

SELECT * FROM consulta;

-- DROP TABLE REMOVE UMA TABELA --


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

INSERT INTO pessoa(nome, cpf ,data_nascimento ,rg ,telefone ,email ,situacao)
VALUES ('João Paulo','00098721600','2000-10-10','125611','6191928397','teste@teste.com','A');
SELECT * FROM pessoa;