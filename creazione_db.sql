CREATE TABLE utenti(
    username VARCHAR(25) PRIMARY KEY,
    password CHAR(64) NOT NULL,
    email VARCHAR(30) NOT NULL
);

CREATE TABLE clienti(
    nome VARCHAR(25) NOT NULL,
    cognome VARCHAR(25) NOT NULL,
    data_di_nascita DATE NOT NULL,
    telefono INT NOT NULL,
    aderente BOOLEAN NOT NULL,
    username VARCHAR(25),
    FOREIGN KEY (username) REFERENCES utenti(username)
);

CREATE TABLE amministratori(
    username VARCHAR(25) NOT NULL,
    FOREIGN KEY (username) REFERENCES utenti(username)
);
