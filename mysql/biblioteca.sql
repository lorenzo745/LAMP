CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- Creare la tabella delle nazionalità
CREATE TABLE IF NOT EXISTS nazionalita (
    id_nazionalita INT AUTO_INCREMENT PRIMARY KEY,
    nome_nazionalita VARCHAR(50) NOT NULL
);

-- Creare la tabella degli autori
CREATE TABLE IF NOT EXISTS autori (
    id_autore INT AUTO_INCREMENT PRIMARY KEY,
    nome_autore VARCHAR(50) NOT NULL,
    data_nascita DATE,
    data_morte DATE,
    nazionalita_id INT,
    FOREIGN KEY (nazionalita_id) REFERENCES nazionalita(id_nazionalita)
);

INSERT INTO nazionalita (nome_nazionalita)
VALUES
    ('Inglese'),
    ('Americana'),
    ('Francese'),
    ('Germanica'),
    ('Spagnolo');



INSERT INTO autori (nome_autore, nazionalita_id, data_nascita, data_morte)
VALUES
    ('Jane Austen', 1, '1775-12-16', '1817-07-18'),
    ('George Orwell', 1, '1903-06-25', '1950-01-21'),
    ('Harper Lee', 2, '1926-04-28', '2016-02-19');


SELECT * FROM autori;

CREATE TABLE IF NOT EXISTS categorie (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
);


INSERT INTO categorie (nome_categoria)
VALUES
    ('Romanzo'),
    ('Saggio'),
    ('Fantascienza'),
    ('Mistero');


SELECT * FROM categorie ;


CREATE TABLE IF NOT EXISTS libri (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titolo VARCHAR(100) NOT NULL,
    id_autore INT,
    id_categoria INT,
    anno_pubblicazione INT,
    FOREIGN KEY (id_autore) REFERENCES autori(id_autore),
    FOREIGN KEY (id_categoria) REFERENCES categorie(id_categoria)
);


INSERT INTO libri (titolo, id_autore, id_categoria, anno_pubblicazione)
VALUES
    ('Orgoglio e pregiudizio', 1, 1, 1813),
    ('1984', 2, 3, 1949),
    ('Il buio oltre la siepe', 3, 1, 1960),
    ('Guerra e pace', 1, 1, 1869);


SELECT * FROM libri;

SHOW TABLES;