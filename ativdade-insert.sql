USE sistema_escola;

SELECT * FROM pessoa;
INSERT INTO pessoa(nome, cpf, idade, situacao)
VALUES ('Ruan Lobo','08709872100',18,'A'),
('Yan Felipe','14002892200',21,'A'),
('Talisson Rodrigues','27882738199',19,'A'),
('Gabrie','8987622', 20, 'A');

SELECT * FROM professor;
INSERT INTO professor(matricula, situacao, id_pessoa)
VALUES ('123456', 'A', 4),
('654321', 'B', 1);

SELECT * FROM aluno;
INSERT INTO aluno(matricula, situacao, id_pessoa)
VALUES ('123456', 'A', 2),
('123456','A', 3);
