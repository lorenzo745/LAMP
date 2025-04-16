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
  corso_studi INT NULL,
  capogruppo INT,
  FOREIGN KEY (corso_studi) REFERENCES corsi(id)ON DELETE SET NULL ON UPDATE CASCADE
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
    ('Rossi', '1990-05-15',1,2),
    ('Verdi', '1988-12-07',3,1),
    ('Bianchi', '1995-03-20',2,3),
    ('Marchetti', '1995-03-20',2,1),
    ('Marini', '1995-03-20',2,1),
    ('Mele', '1995-03-20',2,1);

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
    (2, 1, 8.0,'2024-7-27', 'ottimo'),
    (2, 2, 7.5,'2024-3-29', 'mediocre'),
    (2, 3, 9.0,'2025-9-23', 'ottimo'),
    (3, 1, 9.0,'2024-1-12', 'bravo'),
    (3, 2, 8.5,'2024-12-23', 'bravissimo'),
    (3, 3, 9.5,'2025-9-23', 'ottimo'),
    (4, 1, 8.0,'2024-7-27', 'ottimo'),
    (4, 2, 7.5,'2024-3-29', 'mediocre'),
    (4, 3, 9.0,'2025-9-23', 'ottimo'),
    (5, 1, 8.0,'2024-7-27', 'ottimo'),
    (5, 2, 7.5,'2024-3-29', 'mediocre'),
    (5, 3, 9.0,'2025-9-23', 'ottimo');

--join interno
select s.cognome, v.voto
from studenti s join valutazioni v
    ON s.id = v.studente_id;

--join tra tre tabelle
select s.cognome , v.voto , m.nome
from studenti s,valutazioni v, materie m
where s.id = v.studente_id and v.materia_id = m.id;

--left join
select s.cognome, v.voto
from studenti s left join valutazioni v 
    ON s.id = v.studente_id;

--self join
select s.cognome, s1.cognome
from studenti s, studenti s1
where s.capogruppo = s1.id;

select s.cognome, v.voto, m.nome as materia, YEAR(CURDATE())-YEAR(s.data_nascita) as età
from studenti s, valutazioni v, materie m
where s.id = v.studente_id and v.materia_id = m.id and s.cognome like 'M%'
order by cognome;

select s.cognome, COUNT(v.voto) as conteggio_voti, AVG(v.voto) as media,MIN(v.voto) as voto_minimo, MAX(v.voto) as voto_massimo
from studenti s, valutazioni v
where s.id = v.studente_id and s.id = 3;

select s.cognome 
from studenti s 
where YEAR(CURDATE())-YEAR(data_nascita)>=18;

select s.cognome
from studenti s left join valutazioni v 
    ON s.id = v.studente_id
    where v.id is NULL;



mysqldump -u root scuola > scuola_v1_05122024.sql
mysql -u root scuola < scuola_v1_05122024.sql
