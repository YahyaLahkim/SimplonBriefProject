-- Création de la table Client
CREATE TABLE Client (
    id_client VARCHAR(6) PRIMARY KEY CHECK (id_client REGEXP '^[a-z]{2}-[0-9]{3}$'),
    nom VARCHAR(255),
    prenom VARCHAR(255)
);


-- Création de la table Boite
CREATE TABLE Boite (
    id_boite INT PRIMARY KEY AUTO_INCREMENT,
    matiere VARCHAR(50),
    couleur VARCHAR(50),
    longueur INTEGER NOT NULL CHECK (longueur > 0 AND longueur <= 1000),
    largeur INTEGER NOT NULL CHECK (longueur > 0 AND longueur <= 1000),
    hauteur INTEGER NOT NULL CHECK (longueur > 0 AND longueur <= 1000),
    surface_ext INTEGER,
    prix_boite DECIMAL(10,4) NOT NULL,
);


-- Création de la table Commande
CREATE TABLE Commande (
    id_commande INT PRIMARY KEY AUTO_INCREMENT,
    id_client VARCHAR(6),
    date_commande DATE,
    prix_totale DECIMAL(10,2),
    FOREIGN KEY (id_client) REFERENCES Client(id_client)
);

-- Table de relation Commande - Boite 
CREATE TABLE Commande_Boite (
    id_commande INTEGER,
    id_boite INTEGER,
    quantite INTEGER NOT NULL CHECK (quantite > 0),
    PRIMARY KEY (id_commande, id_boite),
    FOREIGN KEY (id_commande) REFERENCES Commande(id_commande),
    FOREIGN KEY (id_boite) REFERENCES Boite(id_boite)
);