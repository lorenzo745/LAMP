CREATE DATABASE carpooling;
use carpooling;

CREATE TABLE utente_passeggero (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    documento_identita VARCHAR(200) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE dati_automobile (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    numero_targa VARCHAR(20) UNIQUE NOT NULL,
    modello VARCHAR(20) UNIQUE NOT NULL,
    colore VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE utente_guidatore (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    numero_patente VARCHAR(50) NOT NULL,
    scadenza_patente DATE NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    fotografia VARCHAR(200) UNIQUE NOT NULL,
    dati_automobile INT NOT NULL,
    FOREIGN KEY (dati_automobile) REFERENCES dati_automobile(id)
);


CREATE TABLE viaggio_guidatore (
    id INT AUTO_INCREMENT PRIMARY KEY,
    partenza INT NOT NULL,
    arrivo INT NOT NULL,
    DATA_PARTENZA DATE NOT NULL,
    ora TIME NOT NULL,
    costo INT NOT NULL,
    tempo_percorrenza time NOT NULL,
    utente_guidatore_id INT NOT NULL,
    FOREIGN KEY (utente_guidatore_id) REFERENCES utente_guidatore(id)
);

CREATE TABLE viaggio_passeggero (
    id INT AUTO_INCREMENT PRIMARY KEY,
    città_partenza INT NOT NULL,
    città_destinazione INT NOT NULL,
    data_partenza DATE NOT NULL,
    utente_passeggero INT NOT NULL,
    FOREIGN KEY (utente_passeggero) REFERENCES utente_passeggero(id)
)

