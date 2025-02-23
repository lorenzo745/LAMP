CREATE DATABASE IF NOT EXISTS test_maturita;
use test_maturita;

create table docenti
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    materia VARCHAR(100) NOT NULL
);

create table classe (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL,
    sezione VARCHAR(100) NOT NULL,
    materia VARCHAR(100) NOT NULL,
    docente_id INT,
    FOREIGN KEY (docente_id) REFERENCES docenti(id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table studenti
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascita DATE NOT NULL,
    classe_id INT,
    FOREIGN KEY (classe_id) REFERENCES classe(id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table videogioco (
    id INT NOT NULL,
    titolo VARCHAR(255) NOT NULL,
    descrizione_breve VARCHAR(160) NOT NULL,
    descrizione_estesa VARCHAR(500) NOT NULL,
    monete INT NOT NULL,
    docente INT NOT NULL,
    classe INT NOT NULL,
    FOREIGN KEY (docente) REFERENCES docente (id) ON DELETE NO ACTION ON UPDATE CASCADE
    FOREIGN KEY (classe) REFERENCES classe (id) ON DELETE NO ACTION ON UPDATE CASCADE
);