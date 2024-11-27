CREATE DATABASE sistema_escola;
USE sistema_escola;

SELECT * FROM professor;

CREATE TABLE pessoa (
id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf VARCHAR(11) NOT NULL,
idade VARCHAR(100) NOT NULL,
situacao CHAR(1)
);

CREATE TABLE professor (
id_professor INT PRIMARY KEY AUTO_INCREMENT,
matricula VARCHAR(6) NOT NULL,
situacao CHAR(1),
id_pessoa INT NOT NULL,
FOREIGN KEY(id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE aluno (
id_aluno INT PRIMARY KEY AUTO_INCREMENT,
matricula VARCHAR(6) NOT NULL,
situacao CHAR(1),
id_pessoa INT NOT NULL,
FOREIGN KEY(id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE endereco (
id_endereco INT PRIMARY KEY AUTO_INCREMENT,
cidade VARCHAR(45) NOT NULL,
rua VARCHAR(45) NOT NULL,
bairro VARCHAR(45) NOT NULL,
cep VARCHAR(45) NOT NULL,
uf CHAR(2) NOT NULL,
situacao CHAR(1),
id_pessoa INT NOT NULL,
FOREIGN KEY(id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE curso (
id_curso INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR (100) NOT NULL,
carga_horaria VARCHAR (45) NOT NULL,
data_inicio DATETIME DEFAULT CURRENT_TIMESTAMP,
data_fim DATE,
situacao CHAR(1),
id_aluno INT NOT NULL,
FOREIGN KEY(id_aluno) REFERENCES aluno(id_aluno)
);

CREATE TABLE turma (
id_turma INT PRIMARY KEY AUTO_INCREMENT,
numero_sala VARCHAR (45) NOT NULL,
capacidade VARCHAR (100) NOT NULL,
situacao CHAR(1),
id_professor INT NOT NULL,
id_aluno INT NOT NULL,
id_curso INT NOT NULL,
FOREIGN KEY(id_professor) REFERENCES professor(id_professor),
FOREIGN KEY(id_aluno) REFERENCES aluno(id_aluno),
FOREIGN KEY(id_curso) REFERENCES curso(id_curso)
);