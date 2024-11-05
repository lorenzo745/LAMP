--crea un database per una videoteca
CREATE DATABASE IF NOT EXISTS videoteca;
use videoteca;

--crea una tabella per i film
CREATE TABLE IF NOT EXISTS film (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titolo VARCHAR(100) NOT NULL,
  anno_uscita YEAR NOT NULL,
  durata_minuti INT NOT NULL,
  genere VARCHAR(50) NOT NULL,
  regista VARCHAR(100) NOT NULL
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
  FOREIGN KEY (film_id) REFERENCES film(id),
  FOREIGN KEY (utente_id) REFERENCES utente(id)
);

--aggiunge un film all'elenco
INSERT INTO film (titolo, anno_uscita, durata_minuti, genere, regista)
VALUES ('Titanic', 1997, 194 minutes, 'Drama', 'Francis Ford Coppola');

INSERT INTO film (titolo, anno_uscita, durata_minuti, genere, regista)
VALUES ('Avatar', 2009, 162 minutes, 'Fantasy', 'Christopher Nolan');

--aggiunge un utente all'elenco
INSERT INTO utente (nome, cognome, email, password)
VALUES ('John', 'Doe', 'john.doe@example.com')

--prenota un film per un utente
INSERT INTO prenotazione (film_id, utente_id, data_prenotazione)
VALUES (1, 1, '2022-01-01');


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
