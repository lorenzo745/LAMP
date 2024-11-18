CREATE DATABASE scrittorilibri;
use scrittorilibri;

CREATE TABLE scrittori(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(25) NOT NULL,
    data_nascita DATE,
    data_morte DATE
);

CREATE TABLE libri(
    ISBN INT AUTO_INCREMENT PRIMARY KEY,
    titolo VARCHAR(100) NOT NULL,
    scrittore_id INT,
    FOREIGN KEY (scrittore_id) REFERENCES scrittori(id)
);

CREATE TABLE premi(
    cod INT AUTO_INCREMENT PRIMARY KEY,
    anno INT,
    nome_premio VARCHAR(50) NOT NULL,
    scrittore_id INT,
    FOREIGN KEY (scrittore_id) REFERENCES scrittori(id)
);

CREATE TABLE nazionalita(
    cod INT AUTO_INCREMENT PRIMARY KEY,
    nazione VARCHAR(50) NOT NULL,
    scrittore_id INT,
    FOREIGN KEY (scrittore_id) REFERENCES scrittori(id)
);

CREATE TABLE genere(
    cod INT AUTO_INCREMENT PRIMARY KEY,
    genere VARCHAR(50) NOT NULL,
    libro_id INT,
    FOREIGN KEY (libro_id) REFERENCES libri(ISBN)
);

INSERT INTO scrittori (nome, cognome, data_nascita, data_morte)
VALUES 
    ('Mario', 'Rossi', '1950-01-01', '2000-12-31'),
    ('Andrea', 'Bianchi', '1960-02-02', NULL);

INSERT INTO libri (titolo, scrittore_id)
VALUES 
    ('Il Gioco della Truffa', 1),
    ('La Divina Commedia', 2);

INSERT INTO premi (anno, nome_premio, scrittore_id)
VALUES
    (2000, 'Premio al Pulito', 1),
    (2010, 'Premio al Saggiatore', 2);

INSERT INTO nazionalita (nazione, scrittore_id)
VALUES
    ('Italiana', 1),
    ('Francese', 2);

INSERT INTO genere (genere, libro_id)
VALUES
    ('Fantasy', 1),
    ('Classico', 2);


DROP TABLE nazionalita;

delete from premi 
where anno = 2000;

update premi 
set anno = 2000
where anno = 2010;

alter table genere
add anno_pubblicazione1 INT;

alter table genere
DROP COLUMN anno_pubblicazione1;

alter table genere 
change anno_pubblicazione INT;
