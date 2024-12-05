--crea un database con studenti valutazioni e materia--
CREATE DATABASE IF NOT EXISTS scuola;
use scuola;

--crea una tabella per gli studenti--
CREATE TABLE IF NOT EXISTS studenti (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cognome VARCHAR(100) NOT NULL,
  data_nascita DATE NOT NULL
);

--crea una tabella per le materie--
CREATE TABLE IF NOT EXISTS materie (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

--crea una tabella per le valutazioni--
CREATE TABLE IF NOT EXISTS valutazioni (
  id INT AUTO_INCREMENT PRIMARY KEY,
  studente_id INT NOT NULL,
  materia_id INT NOT NULL,
  voto FLOAT NOT NULL,
  FOREIGN KEY (studente_id) REFERENCES studenti(id)ON DELETE CASCADE ON UPDATE NO ACTION,
  FOREIGN KEY (materia_id) REFERENCES materie(id)ON DELETE CASCADE ON UPDATE NO ACTION
);


--aggiunge studenti a tabella studenti--
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES
    ('Mario', 'Rossi', '1990-05-15'),
    ('Giuseppe', 'Verdi', '1988-12-07'),
    ('Anna', 'Bianchi', '1995-03-20');

--aggiunge materie a tabella materie--
INSERT INTO materie (nome)
VALUES
    ('Matematica'),
    ('Inglese'),
    ('Scienze'),
    ('Fisica');

--aggiunge valutazioni a tabella valutazioni--
INSERT INTO valutazioni (studente_id, materia_id, voto)
VALUES
    (1, 1, 9.0),
    (1, 2, 8.5),
    (1, 3, 9.5),
    (2, 1, 8.0);

select s.cognome, v.voto
from studenti s join valutazioni v
    ON s.id = v.studente_id;

select s.cognome , v.voto , m.nome
from studenti s,valutazioni v, materie m
where s.id = v.studente_id and v.materia_id = m.id;


mysqldump -u root scuola > scuola_v1_05122024.sql
mysql -u root scuola < scuola_v1_051224.sql 
