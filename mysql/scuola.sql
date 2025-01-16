--crea un database con studenti valutazioni e materia--
CREATE DATABASE IF NOT EXISTS scuola;
use scuola;

--crea corso studi
CREATE TABLE IF NOT EXISTS corsi (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

--crea una tabella per gli studenti--
CREATE TABLE IF NOT EXISTS studenti (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cognome VARCHAR(100) NOT NULL,
  data_nascita DATE NOT NULL,
  corso_studi VARCHAR(100) NOT NULL,
  capogruppo INT
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
  data_voto DATE NOT NULL,
  comment VARCHAR(1000), 
  FOREIGN KEY (studente_id) REFERENCES studenti(id)ON DELETE CASCADE ON UPDATE NO ACTION,
  FOREIGN KEY (materia_id) REFERENCES materie(id)ON DELETE CASCADE ON UPDATE NO ACTION
);

INSERT INTO corsi (nome)
VALUES
    ('Informatica'),
    ('Scienze Umane'),
    ('Lingue');


--aggiunge studenti a tabella studenti--
INSERT INTO studenti (cognome, data_nascita,corso_studi,capogruppo)
VALUES
    ( 'Rossi', '1990-05-15',1,2),
    ('Verdi', '1988-12-07',3,1),
    ('Bianchi', '1995-03-20',2,3);

--aggiunge materie a tabella materie--
INSERT INTO materie (nome)
VALUES
    ('Matematica'),
    ('Inglese'),
    ('Scienze'),
    ('Fisica');

--aggiunge valutazioni a tabella valutazioni--
INSERT INTO valutazioni (studente_id, materia_id, voto,data_voto,comment)
VALUES
    (1, 1, 9.0,'2024-01-12', 'bravo'),
    (1, 2, 8.5,'2024-12-23', 'bravissimo'),
    (1, 3, 9.5,'2025-9-23', 'malino'),
    (2, 1, 8.0,'2024-7-27', 'ottimo');

select s.cognome, v.voto
from studenti s join valutazioni v
    ON s.id = v.studente_id;

select s.cognome , v.voto , m.nome
from studenti s,valutazioni v, materie m
where s.id = v.studente_id and v.materia_id = m.id;


mysqldump -u root scuola > scuola_v1_05122024.sql
mysql -u root scuola < scuola_v1_051224.sql 
