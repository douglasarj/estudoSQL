USE sistema_escola;

SELECT * FROM pessoa;
INSERT INTO pessoa(nome, cpf, idade, situacao)
VALUES ('Ruan Lobo','08709872100',18,'A'),
('Yan Felipe','14002892200',21,'A'),
('Talisson Rodrigues','27882738199',19,'A'),
('Gabrie','8987622', 20, 'A');

SELECT * FROM professor;
INSERT INTO professor(matricula, situacao, id_pessoa)
VALUES ('123456', 'A', 1),
('654321', 'B', 2);

SELECT * FROM aluno;
INSERT INTO aluno(matricula, situacao, id_pessoa)
VALUES ('123456', 'A', 3),
('123456','A', 4);

SELECT * FROM endereco;
INSERT INTO endereco(cidade, rua, bairro, cep, uf, situacao, id_pessoa)
VALUES ('RUA ALEGRE','18','SANTA MERY','420','DF','A',1);


SELECT * FROM curso;
INSERT INTO curso(descricao,carga_horaria,data_inicio,data_fim,situacao,id_aluno)
VALUES('Desenvolvimento de Sistemas','1200h','2024-03-28','2025-08-30','A',3),
('Desenvolvimento de Sistemas','1200h','2024-03-28','2025-08-30','B',4);

SELECT * FROM turma;
INSERT INTO turma(numero_sala,capacidade,situacao,id_professor,id_aluno,id_curso)
VALUES('20','50','A',1,3,3),
('20','50','A',2,4,4);