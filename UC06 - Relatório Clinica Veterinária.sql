-- Criação do Banco de Dados
CREATE DATABASE PetClinic;
USE PetClinic;

-- Tabela Endereço
CREATE TABLE Endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    Rua VARCHAR(100),
    Numero VARCHAR(10),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado VARCHAR(50),
    CEP VARCHAR(10)
);

-- Tabela Pessoa
CREATE TABLE Pessoa (
    id_pessoa INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Data_Nascimento DATE,
    CPF VARCHAR(14) NOT NULL,
    id_endereco INT NOT NULL,
    FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);

-- Tabela Veterinário
CREATE TABLE Veterinario (
    id_veterinario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45),
    CRMV VARCHAR(20),
    Especialidade VARCHAR(50),
    id_endereco INT NOT NULL,
    FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);

-- Tabela Tutor
CREATE TABLE Tutor (
	id_tutor INT AUTO_INCREMENT PRIMARY KEY,
   id_pessoa INT NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    id_endereco INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa),
	FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);

-- Tabela Animal
CREATE TABLE Animal (
    id_animal INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(20),
    Especie VARCHAR(50),
    Raca VARCHAR(50),
    Data_Nascimento DATE,
    id_tutor INT NOT NULL,
    FOREIGN KEY (id_tutor) REFERENCES Tutor(id_tutor)
);

-- Tabela Consulta
CREATE TABLE Consulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    Dia DATE,
    Hora TIME,
	id_veterinario INT NOT NULL,
    id_animal INT NOT NULL,
    FOREIGN KEY (id_veterinario) REFERENCES Veterinario(id_veterinario),
    FOREIGN KEY (id_animal) REFERENCES Animal(id_animal)
);

-- Tabela Receita Médica
CREATE TABLE ReceitaMedica (
    id_recieta INT AUTO_INCREMENT PRIMARY KEY,
	id_consulta INT NOT NULL,
    Medicamento VARCHAR(100),
    Dosagem VARCHAR(50),
    Data_Inicio DATE,
    Data_Fim DATE,
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta)
);

-- Tabela Histórico Médico
CREATE TABLE HistoricoMedico (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
   id_animal INT NOT NULL,
    Data DATE,
    Descricao VARCHAR(45),
    FOREIGN KEY (id_animal) REFERENCES Animal(id_animal)
);

-- Inserção de Dados

-- Inserir Endereços
INSERT INTO Endereco (Rua, Numero, Bairro, Cidade, Estado, CEP) VALUES 
('Rua A', '123', 'Centro', 'São Paulo', 'SP', '01000-000'),
('Rua B', '456', 'Jardins', 'São Paulo', 'SP', '01400-000'),
('Rua C', '789', 'Liberdade', 'São Paulo', 'SP', '01500-000'),
('Rua D', '101', 'Pinheiros', 'São Paulo', 'SP', '05400-000');

-- Inserir Pessoas
INSERT INTO Pessoa (Nome, Data_Nascimento, CPF, id_endereco) VALUES 
('João Silva', '1985-05-15', '123.456.789-00', 1),
('Maria Oliveira', '1990-10-20', '987.654.321-00', 2),
('Carlos Pereira', '1982-03-30', '456.789.123-00', 3),
('Ana Santos', '1995-08-25', '321.654.987-00', 4);

-- Inserir Veterinários
INSERT INTO Veterinario (Nome, CRMV, Especialidade, id_endereco) VALUES 
('Dr. Pedro Almeida', 'CRMV-SP 1234', 'Cirurgia', 1),
('Dra. Fernanda Costa', 'CRMV-SP 5678', 'Dermatologia', 2);

-- Inserir Tutores
INSERT INTO Tutor (id_pessoa, Telefone, Email, id_endereco) VALUES 
(1, '(11) 91234-5678', 'joao@gmail.com', 1),
(2, '(11) 92345-6789', 'maria@gmail.com', 2),
(3, '(11) 93456-7890', 'carlos@gmail.com', 3),
(4, '(11) 94567-8901', 'ana@gmail.com', 4);
 
 -- Inserir Animais
INSERT INTO Animal (Nome, Especie, Raca, Data_Nascimento, id_tutor) VALUES 
('Rex', 'Cão', 'Labrador', '2018-01-10', 1),
('Mia', 'Gato', 'Siamês', '2019-05-15', 2),
('Bingo', 'Cão', 'Bulldog', '2020-03-20', 3),
('Luna', 'Gato', 'Persa', '2021-07-30', 4);

-- Inserir Consultas
INSERT INTO Consulta (Dia, Hora, id_veterinario, id_animal) VALUES 
('2023-10-01', '09:00:00', 1, 1),
('2023-10-02', '10:00:00', 2, 2),
('2023-10-03', '11:00:00', 1, 3),
('2023-10-04', '14:00:00', 2, 4);
-- Inserir Animais
INSERT INTO Animal (Nome, Especie, Raca, Data_Nascimento, id_tutor) VALUES 
('Rex', 'Cão', 'Labrador', '2018-01-10', 1),
('Mia', 'Gato', 'Siamês', '2019-05-15', 2),
('Bingo', 'Cão', 'Bulldog', '2020-03-20', 3),
('Luna', 'Gato', 'Persa', '2021-07-30', 4);

-- Inserir Consultas
INSERT INTO Consulta (Dia, Hora, id_veterinario, id_animal) VALUES 
('2023-10-01', '09:00:00', 1, 1),
('2023-10-02', '10:00:00', 2, 2),
('2023-10-03', '11:00:00', 1, 3),
('2023-10-04', '14:00:00', 2, 4);

-- Inserir Receitas Médicas
INSERT INTO ReceitaMedica (id_consulta, Medicamento, Dosagem, Data_Inicio, Data_Fim) VALUES 
(1, 'Antibiótico', '1 comprimido por dia', '2023-10-01', '2023-10-10'),
(2, 'Vermífugo', '1 vez a cada 6 meses', '2023-10-02', '2023-10-02'),
(3, 'Anti-inflamatório', '1 comprimido a cada 12 horas', '2023-10-03', '2023-10-05'),
(4, 'Vacina', 'Dose única', '2023-10-04', '2023-10-04');

-- Inserir Histórico Médico
INSERT INTO HistoricoMedico (id_animal, Data, Descricao) VALUES 
(1, '2022-09-15', 'Vacinação anual realizada.'),
(2, '2023-05-20', 'Consulta de rotina, tudo ok.'),
(3, '2023-01-10', 'Tratamento de alergia iniciado.'),
(4, '2023-06-30', 'Consulta para avaliação de pelagem.');
-- Inserir Receitas Médicas
INSERT INTO ReceitaMedica (id_consulta, Medicamento, Dosagem, Data_Inicio, Data_Fim) VALUES 
(1, 'Antibiótico', '1 comprimido por dia', '2023-10-01', '2023-10-10'),
(2, 'Vermífugo', '1 vez a cada 6 meses', '2023-10-02', '2023-10-02'),
(3, 'Anti-inflamatório', '1 comprimido a cada 12 horas', '2023-10-03', '2023-10-05'),
(4, 'Vacina', 'Dose única', '2023-10-04', '2023-10-04');

-- Inserir Histórico Médico
INSERT INTO HistoricoMedico (id_animal, Data, Descricao) VALUES 
(1, '2022-09-15', 'Vacinação anual realizada.'),
(2, '2023-05-20', 'Consulta de rotina, tudo ok.'),
(3, '2023-01-10', 'Tratamento de alergia iniciado.'),
(4, '2023-06-30', 'Consulta para avaliação de pelagem.');


-- especifica as colunas que deseja incluir no relatório
SELECT 
    T.Nome AS Nome_Tutor,
    V.Nome AS Veterinario,
    A.Nome AS Animal,
    A.Raca AS Raca,
    C.Dia AS Data_Consulta,
    R.Medicamento
    
-- relacionar as informações
FROM 
    Tutor T
INNER JOIN 
    Pessoa P ON T.id_pessoa = P.id_pessoa
INNER JOIN 
    Animal A ON T.id_tutor = A.id_tutor
INNER JOIN 
    Consulta C ON A.id_animal = C.id_animal
INNER JOIN 
    Veterinario V ON C.id_veterinario = V.id_veterinario
INNER JOIN 
    ReceitaMedica R ON C.id_consulta = R.id_consulta;
    
    -- especifica as colunas que deseja incluir no Histórico Medico 
    SELECT 
    HM.Descricao AS Observacao_Historico,
    A.Nome AS Nome_Animal,
    C.Descricao AS Observacao_Consulta,
    R.Medicamento AS Nome_Medicamento,
    R.Data_Inicio AS Data_Inicio,
    R.Data_Fim AS Data_Fim,
    R.Descricao AS Observacao_Medicamento,
    T.Nome AS Nome_Tutor
    
-- relacionar as informações
 FROM 
    HistoricoMedico HM
INNER JOIN 
    Animal A ON HM.id_animal = A.id_animal
INNER JOIN 
    Consulta C ON A.id_animal = C.id_animal
INNER JOIN 
    ReceitaMedica R ON C.id_consulta = R.id_consulta
INNER JOIN 
    Tutor T ON A.id_tutor = T.id_tutor;
