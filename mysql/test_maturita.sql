CREATE DATABASE maturita;
use maturita;

CREATE TABLE docente (
    id_doc INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cognome VARCHAR(255) NOT NULL
);

CREATE TABLE materia (
    materia_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE studente (
    id_stud INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cognome VARCHAR(255) NOT NULL
);

CREATE TABLE argomento (
    id_argomento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE classe (
    id_classe INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    docente INT,
    materia INT NOT NULL,
    FOREIGN KEY (materia) REFERENCES materia(materia_id) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (docente) REFERENCES docente(id_doc) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE pippo (
    id_pippo INT AUTO_INCREMENT PRIMARY KEY,
    classe INT,
    studenti INT,
    FOREIGN KEY (classe) REFERENCES classe(id_classe) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (studenti) REFERENCES studente (id_stud) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE videogioco (
    id_vg INT AUTO_INCREMENT PRIMARY KEY,
    titolo VARCHAR(255) NOT NULL,
    desc_brv VARCHAR(160) NOT NULL,
    desc_ests VARCHAR(255) NOT NULL,
    argomento INT,
    FOREIGN KEY (argomento) REFERENCES argomento (id_argomento) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE n_monete (
    id_monete INT AUTO_INCREMENT PRIMARY KEY,
    n_monete INT NOT NULL,
    studente INT NOT NULL,
    videogioco INT NOT NULL,
    FOREIGN KEY (studente) REFERENCES studente(id_stud) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (videogioco) REFERENCES videogioco(id_vg) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE immagine (
    id_immagine INT AUTO_INCREMENT PRIMARY KEY,
    nome_url VARCHAR(255) NOT NULL,
    videogioco INT,
    FOREIGN KEY (videogioco) REFERENCES videogioco(id_vg) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE topolino (
    id_topolino INT AUTO_INCREMENT PRIMARY KEY,
    classe INT,
    videogioco INT,
    FOREIGN KEY (classe) REFERENCES classe(id_classe) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (videogioco) REFERENCES videogioco (id_vg) ON DELETE NO ACTION ON UPDATE CASCADE
);

--inserire dati
INSERT INTO docente (nome, cognome) VALUES ('Mario', 'Rossi');
INSERT INTO materia (nome) VALUES ('Informatica');
INSERT INTO studente (nome, cognome) VALUES ('Giuseppe', 'Bianchi'), ('Luigi', 'Neri'), ('Anna', 'Gialli');
INSERT INTO argomento (nome) VALUES ('triangoli'), ('legge di OHM'), ('verismo');
INSERT INTO classe (nome, docente, materia) VALUES ('1A', 1, 1);
INSERT INTO pippo (classe, studenti) VALUES (1, 1), (1, 2);
INSERT INTO videogioco (titolo, desc_brv, desc_ests, argomento) VALUES ('ciao', 'ciao test', 'test maturita preparazione', 1);
INSERT INTO n_monete (n_monete, studente, videogioco) VALUES (100, 1, 1);
INSERT INTO immagine (nome_url, videogioco) VALUES ('ciao.jpg', 1);
INSERT INTO topolino (classe, videogioco) VALUES (1, 1);

mysqldump -u root maturita > test_maturita_24022024.sql
mysql -u root maturita < test_maturita_24022024.sql

