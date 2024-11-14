CREATE DATABASE IF NOT EXISTS videoteca;
use videoteca;

--crea tabella genere
CREATE TABLE IF NOT EXISTS genere (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
);

--crea una tabella per i film
CREATE TABLE IF NOT EXISTS film (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_genere INT NOT NULL,
  titolo VARCHAR(100) NOT NULL,
  anno_uscita YEAR NOT NULL,
  durata_minuti INT NOT NULL,
  genere VARCHAR(50) NOT NULL,
  regista VARCHAR(100) NOT NULL,
  FOREIGN KEY (id_genere) REFERENCES genere (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

--crea una tabella per gli utenti
CREATE TABLE IF NOT EXISTS utente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  cognome VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL
);

--crea una tabella per le prenotazioni dei film
CREATE TABLE IF NOT EXISTS prenotazione (
  id INT AUTO_INCREMENT PRIMARY KEY,
  film_id INT NOT NULL,
  utente_id INT NOT NULL,
  data_prenotazione DATE NOT NULL,
  costo INT NOT NULL,
  FOREIGN KEY (film_id) REFERENCES film(id) ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (utente_id) REFERENCES utente(id) ON DELETE NO ACTION ON UPDATE CASCADE
);

--crea una tabella registi
CREATE TABLE IF NOT EXISTS regista (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  cognome VARCHAR(50) NOT NULL
);
--crea tabella attori
CREATE TABLE IF NOT EXISTS attori (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  cognome VARCHAR(50) NOT NULL
);
--crea tabella contratto
CREATE TABLE IF NOT EXISTS contratto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  regista_id INT NOT NULL,
  attori_id INT NOT NULL,
  costo INT NOT NULL,
  data_inizio DATE NOT NULL,
  data_fine DATE,
  FOREIGN KEY (regista_id) REFERENCES regista(id) ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (attori_id) REFERENCES attori(id) ON DELETE NO ACTION ON UPDATE CASCADE
);

--insert into genere
INSERT INTO genere (nome)
VALUES ('Drama'),
  ('Fantasy'),
  ('Action'),
  ('Sci-fi');

--aggiunge un film all'elenco
INSERT INTO film (id_genere, titolo, anno_uscita, durata_minuti, genere, regista)
VALUES 
  (1, 'Inception', 2010, 148, 'Thriller', 'Christopher Nolan'),
  (2, 'The Shawshank Redemption', 1994, 142, 'Drama', 'Frank Darabont'),
  (3, 'Eternal Sunshine of the Spotless Mind', 2004, 108, 'Drama', 'Kate Winslet');


--aggiunge un utente all'elenco
INSERT INTO utente (nome, cognome, email, password)
VALUES ('John', 'Doe', 'john.doe@example.com',12345);

--prenota un film per un utente
INSERT INTO prenotazione (film_id, utente_id, data_prenotazione, costo)
VALUES (1, 1, '2022-01-15', 100);

--insert into di registi
INSERT INTO regista (nome, cognome)
VALUES ('Francis', 'Ford Coppola'),
  ('Christopher', 'Nolan'),
  ('George', 'Lucas'),
  ('Micheal', 'Radford');


--insert into di attori
INSERT INTO attori (nome, cognome)
VALUES 
  ('Leonardo', 'DiCaprio'),
  ('Ryan', 'Reynolds'),
  ('Ryan', 'Gosling'),
  ('Chris', 'Hemsworth');

--inserti into contratto
INSERT INTO contratto (regista_id, attori_id, costo, data_inizio)
VALUES
  (1, 1, 100000, '2022-01-01'),
  (2, 2, 150000, '2022-01-01'),
  (3, 3, 200000, '2022-01-01'),
  (4, 4, 250000, '2022-01-01');


--mostra tutti i film prenotati da un utente
SELECT f.titolo, f.anno_uscita, f.durata_minuti, f.genere, f.regista
FROM prenotazione p
JOIN film f ON p.film_id = f.id
JOIN utente u ON p.utente_id = u.id
WHERE u.id = 1;


--mostra tutti i film in prenotazione
SELECT f.titolo, f.anno_uscita, f.durata_minuti, f.genere, f.regista, p.data_prenotazione
FROM film f
LEFT JOIN prenotazione p ON f.id = p.film_id
WHERE p.data_prenotazione IS NOT NULL;


--mostra tutti i film disponibili per prenotazione
SELECT f.titolo, f.anno_uscita, f.durata_minuti, f.genere, f.regista
FROM film f
LEFT JOIN prenotazione p ON f.id = p.film_id
WHERE p.data_prenotazione IS NULL;


--cancella una prenotazione
DELETE FROM prenotazione
WHERE id = 1;

--cancella un film dall'elenco
DELETE FROM film
WHERE id = 1;

--cancella un utente dall'elenco
DELETE FROM utente
WHERE id = 1;
