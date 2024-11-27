USE sistema_escola;

CREATE TABLE avaliacao(
id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
nota1 FLOAT NOT NULL,
nota2 FLOAT NOT NULL,
nota3 FLOAT NOT NULL,
nota4 FLOAT NOT NULL,
media DECIMAL(2,2) NOT NULL, 
resultado FLOAT NOT NULL,
id_aluno INT NOT NULL,
FOREIGN KEY(id_aluno) REFERENCES aluno(id_aluno)
);

-- ALTER TABLE avaliacao 
-- MODIFY resultado VARCHAR(10);

-- ALTER TABLE avaliacao 
-- MODIFY media DECIMAL(4,2);

-- DROP TABLE avaliacao;

SELECT * FROM aluno;


CREATE TRIGGER calcular_media
BEFORE INSERT ON avaliacao
FOR EACH ROW
BEGIN
    SET NEW.media = (NEW.nota1 + NEW.nota2 + NEW.nota3 + NEW.nota4) / 4;

    SET NEW.resultado = CASE 
        WHEN NEW.media >= 6 THEN 'Aprovado' 
        ELSE 'Reprovado' 
    END;
END;
//
DELIMITER ;


INSERT INTO avaliacao(nota1, nota2, nota3, nota4, id_aluno) 
VALUES (8.0, 7.0, 6.0, 9.0, 1),
 (7.0, 2.0, 8.0, 1.0, 2);


SELECT * FROM avaliacao;

SELECT * FROM aluno;



SELECT 
a.id_aluno,
p.nome,
av.nota1,
av.nota2,
av.nota3,
av.nota4,
av.media,
av.resultado
FROM aluno a
INNER JOIN pessoa p ON p.id_pessoa = a.id_aluno
INNER JOIN avaliacao av ON av.id_aluno = a.id_aluno


