-- creation base de données
CREATE DATABASE projet_tutkinnon;
USE projet_tutkinnon;
SET FOREIGN_KEY_CHECKS=0;

-- création table SQL

CREATE TABLE client (
    id_client INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255),
    password VARCHAR(255),
    adresse VARCHAR(255),
    num_tel VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    code_parrainage VARCHAR(10),
    date_naissance DATE,
    validation_email BOOLEAN,
    blocked BOOLEAN,
    age INT,
    reduction_id INT,
    commande_id INT,
    historique_commande_id INT,
    PRIMARY KEY (id_client)
) ENGINE = InnoDB;

CREATE TABLE reduction (
    id_reduction INT NOT NULL AUTO_INCREMENT,
    parrainage_5 BOOLEAN,
    client_id INT,
    reduc_anniv_10 BOOLEAN,
    CONSTRAINT pk_reduction PRIMARY KEY (id_reduction)
) ENGINE = InnoDB;

CREATE TABLE commande (
    id_commande INT NOT NULL AUTO_INCREMENT,
    article VARCHAR(255),
    adr_livraison VARCHAR(255),
    nbr_article VARCHAR(255),
    horaire TIME,
    date_lvr DATE,
    prix FLOAT,
    adresse_id INT,
    reservation_id INT,
    facture_id INT,
    client_id INT,
    historique_commande_id INT,
    restaurant_id INT,
    livreur_id INT,
    CONSTRAINT pk_commande PRIMARY KEY (id_commande)
) ENGINE = InnoDB;

CREATE TABLE adresse(
    id_adresse INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    adresse VARCHAR(255),
    CONSTRAINT pk_adresse PRIMARY KEY (id_adresse)
) ENGINE = InnoDB;

CREATE TABLE reservation(
    id_reservation INT NOT NULL AUTO_INCREMENT,
    date_creation DATE,
    date_reservation DATE,
    CONSTRAINT pk_reservation PRIMARY KEY (id_reservation)
) ENGINE = InnoDB;

CREATE TABLE facture (
    id_facture INT NOT NULL AUTO_INCREMENT,
    mode_paiement VARCHAR(255),
    nbr_payeur INT,
    montant_par_payeur FLOAT,
    commande_id INT,
    CONSTRAINT pk_facture PRIMARY KEY (id_facture)
) ENGINE = InnoDB;

CREATE TABLE historique_commande(
    id_historique_commande INT NOT NULL AUTO_INCREMENT,
    code CHAR(10),
    montant FLOAT,
    adresse VARCHAR(100),
    restaurant VARCHAR(100),
    plats VARCHAR(100),
    jour_mois_annee_livraison DATE,
    avoir VARCHAR(90),
    CONSTRAINT pk_historique_commande PRIMARY KEY (id_historique_commande) 
) ENGINE = InnoDB;

CREATE TABLE restaurant(
    id_restaurant INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255),
    password VARCHAR(90), 
    adresse VARCHAR(255),
    num_tel VARCHAR(20),
    nom_restaurant VARCHAR(90),
    description TEXT, 
    type_de_cuisine VARCHAR(90),
    photo_restaurant VARCHAR(90),
    note_restaurant FLOAT,
    plats_id INT, 
    formules_id INT, 
    formules_periode_id INT, 
    historique_commande_id INT, 
    CONSTRAINT pk_restaurant PRIMARY KEY (id_restaurant)
) ENGINE = InnoDB;

CREATE TABLE plats(
    id_plats INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(90),
    description TEXT, 
    allergenes TEXT(200),
    photo_plats VARCHAR(90),
    prix FLOAT,
    note FLOAT,
    restaurant VARCHAR(90), 
    CONSTRAINT pk_plats PRIMARY KEY (id_plats)
) ENGINE = InnoDB;

CREATE TABLE formules(
    id_formules INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(90),
    description TEXT, 
    allergenes TEXT(200),
    restaurant VARCHAR(90), 
    photo_formules VARCHAR(90),
    prix FLOAT,
    note FLOAT,
    CONSTRAINT pk_formules PRIMARY KEY (id_formules)
) ENGINE = InnoDB;

CREATE TABLE formules_periode(
    id_formules_periode INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(90),
    periode VARCHAR(50),
    description TEXT, 
    allergenes TEXT(200),
    photo_formules_periode VARCHAR(90),
    prix FLOAT,
    note FLOAT,
    restaurant VARCHAR(90), 
    CONSTRAINT pk_formules_periode PRIMARY KEY (id_formules_periode)
) ENGINE = InnoDB;

CREATE TABLE administrateurs(
    id_administrateurs INT NOT NULL AUTO_INCREMENT,
    administrateur VARCHAR(90), 
    admin_restaurateur VARCHAR(90),
    clients_id INT,
    restaurant_id INT,
    CONSTRAINT pk_administrateurs PRIMARY KEY (id_administrateurs)
) ENGINE = InnoDB;

CREATE TABLE livreur (
    id_livreur INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(90),
    prenom VARCHAR(90),
    email VARCHAR(255),
    tel VARCHAR(20),
    zone_geographique VARCHAR(255),
    matricule_livreur VARCHAR(20),
    date_visite_medicale DATE,
    client_id INT,
    permis_id INT,
    historique_livraison_id INT,
    commande_id INT,
    accident_id INT,
    CONSTRAINT pk_livreur PRIMARY KEY (id_livreur)
) ENGINE = InnoDB;

CREATE TABLE historique_livraison (
    id_historique_livraison INT NOT NULL AUTO_INCREMENT,
    livraison VARCHAR(10),
    matricule_livreur VARCHAR(20),
    restaurant VARCHAR(40),
    code_commande VARCHAR(255),
    date_livraison DATE,
    adresse_livraison VARCHAR(255),
    prix FLOAT,
    nb_km_parcouru VARCHAR(20),
    commande_id INT,
    CONSTRAINT pk_historique_livraison PRIMARY KEY (id_historique_livraison)
) ENGINE = InnoDB;

CREATE TABLE permis(
    id_permis INT NOT NULL AUTO_INCREMENT,
    type_permis VARCHAR(40),
    date_optention DATE,
    CONSTRAINT pk_permis PRIMARY KEY (id_permis)
) ENGINE = InnoDB;

CREATE TABLE accident (
    id_accident INT NOT NULL AUTO_INCREMENT,
    date_accident DATE,
    lieu_accident VARCHAR(255),
    type_accident VARCHAR(90),
    descriptif VARCHAR(255),
    livreur_id INT, 
    CONSTRAINT pk_accident PRIMARY KEY (id_accident)
) ENGINE = InnoDB;

-- Insertion de données dans nos tables 

INSERT INTO client (email, password, adresse, num_tel, first_name, last_name, code_parrainage, date_naissance, validation_email, blocked, age, reduction_id, commande_id, historique_commande_id)
VALUES 
('client1@example.com', 'motdepasse1', '123 Rue de Paris, Paris', '1234567890', 'John', 'Doe', 'ABC123XYZ', '2002-01-15', 1, 0, 33, 1, 1, 1),
('client2@example.com', 'motdepasse2', '456 Avenue des Lilas, Lyon', '9876543210', 'Jane', 'Smith', 'DEF456UVW', '1985-05-20', 1, 0, 28, 2, 2, 2),
('client3@example.com', 'motdepasse3', '111 Rue du Soleil, Lyon', '5551234567', 'Sarah', 'Johnson', 'ABC987XYZ', '2005-02-18', 1, 0, 27, 11, 11, 11),
('client4@example.com', 'motdepasse4', '789 Avenue de la Lune, Lille', '5559876543', 'John', 'Doe', 'DEF654UVW', '1989-07-11', 1, 0, 30, 12, 12, 12),
('client5@example.com', 'motdepasse5', '456 Rue de la Montagne, Nante', '5555555555', 'John', 'Doe', 'GHI123ABC', '1995-03-27', 1, 0, 29, 13, 13, 13),
('client11@example.com', 'motdepasse11', '123 Rue de la Mer, Marseille', '5557778888', 'Jean', 'Emart', 'JKL789MNO', '1993-11-28', 1, 0, 29, 1, 1, 1),
('client12@example.com', 'motdepasse12', '789 Avenue du Soleil, Toulouse', '5558887777', 'Jesui', 'Phatiger', 'PQR123XYZ', '1992-08-15', 1, 0, 30, 2, 2, 2),
('client13@example.com', 'motdepasse13', '456 Rue de la Plage, Nice', '5555551111', 'Esla', 'Tortura', 'STU456ABC', '1987-03-10', 1, 0, 35, 3, 3, 3),
('client14@example.com', 'motdepasse14', '101 Avenue des Montagnes, Bordeaux', '5553334444', 'Walter', 'White', 'VWX789DEF', '2000-07-03', 1, 0, 22, 4, 4, 4),
('client15@example.com', 'motdepasse15', '888 Rue des Roses, Strasbourg', '5556665555', 'Sah', 'Menerv', 'YZA123UVW', '1999-05-18', 1, 0, 23, 5, 5, 5);

INSERT INTO client (email, password, adresse, num_tel, first_name, last_name, date_naissance, validation_email, blocked, age, reduction_id, commande_id, historique_commande_id)
VALUES 
('client6@example.com', 'motdepasse6', '789 Avenue de l''Océan, Beauvais', '5556667777', 'John', 'Doe', '1990-10-05', 1, 0, 31, 14, 14, 14),
('client7@example.com', 'motdepasse7', '123 Rue de la Forêt, Beauvais', '5559998888', 'Olivia', 'Brown', '1988-04-29', 1, 0, 28, 15, 15, 15),
('client8@example.com', 'motdepasse8', '456 Avenue des Étoiles, Beauvais', '5554441111', 'Daniel', 'Miller','1998-01-10', 1, 0, 33, 16, 16, 16),
('client9@example.com', 'motdepasse9', '789 Rue du Ciel, Geneve', '5553332222', 'Sophia', 'Lee', '1991-09-22', 1, 0, 32, 17, 17, 17),
('client10@example.com', 'motdepasse10', '1010 Boulevard de la Galaxie, Lens', '5552223333', 'William', 'Harris','1994-05-14', 1, 0, 34, 18, 18, 18),
('client16@example.com', 'motdepasse16', '555 Avenue des Étoiles, Lyon', '5557779999', 'Kyl', 'Mepliz', '1998-09-12', 1, 0, 24, 6, 6, 6),
('client17@example.com', 'motdepasse17', '777 Rue du Lac, Paris', '5552226666', 'Danlavi', 'Onfaitdeschoi', '1996-04-05', 1, 0, 26, 7, 7, 7),
('client18@example.com', 'motdepasse18', '222 Boulevard de la Lune, Marseille', '5551114444', 'Keskon', 'Samuze', '2001-02-20', 1, 0, 21, 8, 8, 8),
('client19@example.com', 'motdepasse19', '333 Rue de la Forêt, Lyon', '5559991111', 'Mac', 'Dorecruit', '1997-11-25', 1, 0, 27, 9, 9, 9),
('client20@example.com', 'motdepasse20', '444 Avenue des Fleurs, Bordeaux', '5554448888', 'Jay', 'Phinicetparti', '2000-12-08', 1, 0, 22, 10, 10, 10);

INSERT INTO reduction (parrainage_5, client_id, reduc_anniv_10)
VALUES 
(1, 11, 1),
(0, 12, 1),
(1, 13, 1),
(0, 14, 1),
(1, 15, 1),
(0, 16, 1),
(1, 17, 1),
(1, 1, 1),
(0, 2, 1),
(0, 18, 1),
(1, 31, 1),
(0, 32, 1),
(1, 33, 1),
(0, 34, 1),
(1, 35, 1),
(0, 36, 1),
(1, 37, 1),
(1, 38, 1),
(0, 39, 1),
(0, 40, 1);

INSERT INTO commande (article, adr_livraison, nbr_article, horaire, date_lvr, prix, adresse_id, reservation_id, facture_id, historique_commande_id,restaurant_id,livreur_id)
VALUES 
('Pizza Margherita', '123 Rue de Paris, Paris', '2', '14:30:00', '2020-07-05', 15.99, 1, 1, 1, 1,1,1),
('Burger au poulet', '456 Avenue des Lilas, Lyon', '1', '19:00:00', '2021-08-10', 8.49, 2, 2, 2, 2,2,2),
('Pâtes Carbonara', '111 Rue du Soleil, Lyon', '2', '13:30:00', '2021-06-21', 12.99, 3, 3, 3, 3,3,3),
('Salade César', '789 Avenue de la Lune, Lille', '1', '19:30:00', '2020-09-15', 7.99, 4, 4, 4, 4,4,4),
('Sushi au kiwi', '456 Rue de la Montagne, NANTE', '3', '20:00:00', '2021-06-25', 19.99, 5, 5, 5, 5,5,5),
('Tacos au Poulet', '789 Avenue de l''Océan, Beauvais', '1', '18:45:00', '2021-07-03', 8.49, 6, 6, 6, 6,6,6),
('Pizza Hawaïenne', '123 Rue de la Forêt, Beauvais', '2', '14:00:00', '2022-08-05', 14.99, 7, 7, 7, 7,7,7),
('Burger Végétarien', '456 Avenue des Étoiles, Beauvais', '1', '19:15:00', '2023-09-10', 9.99, 8, 8, 8, 8,8,8),
('Sashimi Assorti', '789 Rue du Ciel, Genève', '4', '20:30:00', '2021-07-28', 24.99, 9, 9, 9, 9,9,9),
('Tarte aux Pommes', '1010 Boulevard de la Galaxie, Beauvais', '1', '17:30:00', '2021-06-30', 5.99, 10, 10, 10, 10,11,11),
('Pizza Margherita', '123 Rue de Paris, Paris', '2', '14:30:00', '2020-07-05', 15.99, 1, 1, 1, 1,1,1),
('AILES CROUSTILLANTES', '456 Avenue des Lilas, Lyon', '1', '19:00:00', '2022-08-10', 8.49, 2, 2, 2, 2,2,2),
('Pâtes Carbonara', '111 Rue du Soleil, Lyon', '2', '13:30:00', '2023-06-21', 12.99, 3, 3, 3, 3,3,3),
('Salade César', '789 Avenue de la Lune, Lille', '1', '19:30:00', '2021-09-15', 7.99, 4, 4, 4, 4,4,4),
('Sushi au kiwi', '456 Rue de la Montagne, NANTE', '3', '20:00:00', '2021-06-25', 19.99, 5, 5, 5, 5,5,5),
('Pizza Hawaïenne', '789 Avenue de l''Océan, Beauvais', '1', '18:45:00', '2021-07-03', 8.49, 6, 6, 6, 6,6,6),
('Sushi au kiwi', '789 Avenue de l''Océan, Beauvais', '1', '18:45:00', '2021-07-03', 8.49, 6, 6, 6, 6,6,6),
('Pizza Quatro Fromaggi', '123 Rue de la Forêt, Beauvais', '2', '14:00:00', '2022-08-05', 14.99, 7, 7, 7, 7,7,7),
('Burger', '456 Avenue des Étoiles, Beauvais', '1', '19:15:00', '2023-09-10', 9.99, 8, 8, 8, 8,8,8),
('Sashimi Assorti', '789 Rue du Ciel, Genève', '4', '20:30:00', '2021-07-28', 24.99, 9, 9, 9, 9,9,9),
('Eclair au chocolat', '1010 Boulevard de la Galaxie, Beauvais', '1', '17:30:00', '2021-06-30', 5.99, 10, 10, 10, 10,10,10),
('Pizza Margherita', '123 Rue de Paris, Paris', '2', '14:30:00', '2020-07-05', 15.99, 1, 1, 1, 1,1,1),
('Burger au boeuf', '456 Avenue des Lilas, Lyon', '1', '19:00:00', '2022-08-10', 8.49, 2, 2, 2, 2,1,1),
('Pâtes Carbonara', '111 Rue du Soleil, Lyon', '2', '13:30:00', '2023-06-21', 12.99, 3, 3, 3, 3,3,3),
('Salade César', '789 Avenue de la Lune, Lille', '1', '19:30:00', '2021-09-15', 7.99, 4, 4, 4, 4,4,4),
('Sushi au kiwi', '456 Rue de la Montagne, Nantes', '3', '20:00:00', '2021-06-25', 19.99, 5, 5, 5, 5,5,5),
('Sushi au kiwi', '789 Avenue de l''Océan, Beauvais', '1', '18:45:00', '2021-07-03', 8.49, 6, 6, 6, 6,6,6);

INSERT INTO facture (mode_paiement, nbr_payeur, montant_par_payeur, commande_id)
VALUES 
('avoir', 1, 12.99, 3),
('Carte de crédit', 1, 15.99, 1),
('avoir', 1, 8.49, 2),
('avoir', 1, 7.99, 4),
('Carte de crédit', 1, 19.99, 5),
('Espèces', 1, 8.49, 6),
('avoir', 1, 14.99, 7),
('Espèces', 2, 4.99, 8),
('Carte de crédit', 1, 24.99, 9),
('avoir', 1, 5.99, 10),
('carte de crédit', 2, 15.99, 7.99),
('carte de crédit', 1, 8.49, 8.49),
('carte de crédit', 2, 12.99, 6.50),
('carte de crédit', 1, 7.99, 7.99),
('especes', 3, 19.99, 6.66),
('carte de crédit', 1, 8.49, 8.49),
('avoir', 1, 12.99, 21),
('Carte de crédit', 1, 15.99, 22),
('Espèces', 1, 8.49, 23),
('avoir', 1, 7.99, 24),
('Carte de crédit', 1, 19.99, 25),
('Espèces', 1, 8.49, 26),
('avoir', 1, 14.99, 27),
('Espèces', 1, 9.99, 28),
('Carte de crédit', 1, 24.99, 29),
('avoir', 1, 5.99, 30);


INSERT INTO adresse (name, adresse)
VALUES 
('Maison', '123 Rue de Paris, Paris'),
('Bureau', '456 Avenue des Lilas, Lyon'),
('Ami2', '333 Rue du Soleil, Grenoble'),
('Ami1', '789 Avenue des Étoiles, Bamako'),
('Mami', '789 Avenue de la Lune, Lile'),
('Papi', '111 Rue du Ciel, Amsterdam'),
('Maman', '123 Rue de la Mer,Bamako'),
('Papa', '1010 Rue du Vent'),
('Moi', '456 Rue de la Montagne, Nante'),
('Copine', '789 Rue de la Plage'),
('Ami3', '555 Avenue des Étoiles, Paris'),
('Voisin', '777 Rue du Lac, Lyon'),
('Famille', '222 Boulevard de la Lune, Marseille'),
('Colocataire', '333 Rue de la Forêt, Nice'),
('Collègue', '444 Avenue des Fleurs, Bordeaux'),
('Ami4', '555 Rue des Roses, Strasbourg'),
('Ami5', '101 Avenue des Montagnes, Toulouse'),
('Voisine', '888 Rue des Roses, Marseille'),
('Cousin', '1010 Boulevard de la Galaxie, Lyon'),
('Tante', '101 Rue de la Plage, Nantes');

INSERT INTO reservation (date_creation, date_reservation)
VALUES 
('2021-10-15', '2021-10-25'),
('2022-10-16', '2022-10-28'),
('2021-10-17', '2021-10-30'),
('2021-10-18', '2021-10-27'),
('2023-10-19', '2023-10-26'),
('2022-10-20', '2022-10-24'),
('2021-10-21', '2021-10-29'),
('2023-10-13', '2023-10-20'),
('2022-10-14', '2022-10-22'),
('2020-10-22', '2020-10-23'),
('2020-07-05', '2020-07-05'),
('2022-08-10', '2022-08-10'),
('2023-06-21', '2023-06-21'),
('2021-09-15', '2021-09-15'),
('2021-06-25', '2021-06-25'),
('2021-07-03', '2021-07-03'),
('2020-10-24', '2020-10-27'),
('2021-11-01', '2021-11-10'),
('2022-11-02', '2022-11-12'),
('2021-11-03', '2021-11-14'),
('2021-11-04', '2021-11-16'),
('2023-11-05', '2023-11-18'),
('2022-11-06', '2022-11-20'),
('2021-11-07', '2021-11-22'),
('2023-11-08', '2023-11-25'),
('2022-11-09', '2022-11-28');

INSERT INTO historique_commande (code, montant, adresse, restaurant, plats, jour_mois_annee_livraison, avoir) VALUES 
('WXYZ1234', 12.99, '333 Rue du Soleil LYON', 'TRATORIA BELLA NAPOLI', 'Spaghetti Carbonara', '2023-10-15', 'NON'),
('UVWX5678', 7.99, '789 Avenue des Étoiles LILLE', 'SALADE SAVOUREUSE', 'Salade César', '2023-10-16', 'OUI'),
('TUVW9012', 19.99, '456 Avenue de la Lune NANTE', 'SAKURA SUSHI ET RAMEN', 'Sushi Mix', '2023-10-17', 'OUI'),
('QRST3456', 8.49, '111 Rue du Ciel BEAUVAIS', 'TACO FIESTA EXPRESS', 'Tacos au Poulet', '2023-10-18', 'NON'),
('PQRS7890', 14.99, '123 Rue de la Mer BEAUVAIS', 'DELARTE', 'Pizza Hawaïenne', '2023-10-19', 'NON'),
('LMNO1234', 9.99, '1010 Rue du Vent BEAUVAIS', 'GREENBURGER', 'Burger Végétarien', '2023-10-20', 'OUI'),
('KLMN5678', 24.99, '222 Rue de la Montagne GENEVE', 'SASHIMI ZEN', 'Sashimi Assorti', '2023-10-21', 'NON'),
('ABCD1234', 15.99, '789 Rue des Oliviers PARIS', 'PIZZARELLA DELIZIOSA', 'Pizza Margherita', '2023-10-13', 'NON'),
('EFGH5678', 8.49, '567 Avenue du Cheddar LYON', 'AILES CROUSTILLANTES', 'Burger au poulet', '2023-10-14', 'NON'),
('IJKL9012', 5.99, '789 Rue de la Plage LENS', 'DOUCEUR SUCREE', 'Tarte aux Pommes', '2023-10-22', 'OUI'),
('DHFK3218', 15.99, '123 Rue de Paris, PARIS', 'PIZZARELLA DELIZIOSA', 'Pizza Margherita', '2020-07-05', 'NON'),
('GHJK6467', 8.49, '456 Avenue des Lilas, LYON', 'AILES CROUSTILLANTES', 'Burger au poulet', '2022-08-10', 'NON'),
('DFGG7394', 12.99, '111 Rue du Soleil, LYON', 'TRATORIA BELLA NAPOLI', 'Pâtes Carbonara', '2023-06-21', 'NON'),
('LDHG9375', 7.99, '789 Avenue de la Lune, LILLE', 'SALADE SAVOUREUSE', 'Salade César', '2021-09-15', 'NON'),
('BDNC7394', 19.99, '456 Rue de la Montagne, NANTE', 'SAKURA SUSHI ET RAMEN', 'Sushi Mix', '2021-06-25', 'NON'),
('JCLF9384', 8.49, '789 Avenue de l''Océan, BEAUVAIS', 'DELARTE', 'Pizza Hawaïenne', '2021-07-03', 'NON'),
('JKL789MNO', 20.99, '13 Rue du Commerce NANTE', 'SAKURA SUSHI ET RAMEN','Brochettes de poulet grillées et marinées','2020-10-24', 'NON'),
('VWX789DEF', 11.99, '789 Rue des Oliviers PARIS', 'PIZZARELLA DELIZIOSA', 'Pizza Margherita', '2023-11-01', 'NON'),
('STU456ABC', 24.99, '222 Rue de la Montagne GENEVE', 'SASHIMI ZEN', 'Sashimi Assorti', '2023-11-02', 'NON'),
('ZIS1K2O4D', 16.99, '111 Rue du Ciel BEAUVAIS', 'TACO FIESTA EXPRESS', 'Burrito au Bœuf', '2023-11-03', 'OUI'),
('YZA123UVW', 9.99, '1010 Rue du Vent BEAUVAIS', 'GREENBURGER', 'Burger Végétarien', '2023-11-04', 'OUI'),
('9SJKZ20SK', 12.99, '333 Rue du Soleil LYON', 'TRATORIA BELLA NAPOLI', 'Spaghetti Bolognese', '2023-11-05', 'NON'),
('SJ2KSO30W', 8.49, '111 Rue du Ciel BEAUVAIS', 'TACO FIESTA EXPRESS', 'Tacos au Bœuf', '2023-11-07', 'NON'),
('91K240VSZ', 11.99, '23 Rue de la Liberté PARIS', 'PIZZA DELIZIOSA', 'Pizza Quattro Fromaggi', '2023-11-08', 'OUI'),
('2KSAPXWPP', 5.99, '789 Rue de la Plage LENS', 'DOUCEUR SUCREE', 'Éclair au Chocolat', '2023-11-09', 'NON'),
('92KSLWKYS', 19.99, '456 Avenue de la Lune NANTE', 'SAKURA SUSHI ET RAMEN', 'Sushi Mix', '2023-11-10', 'OUI');

INSERT INTO restaurant (email, password, adresse, num_tel, nom_restaurant, description, type_de_cuisine, photo_restaurant, note_restaurant)
VALUES
('restaurant1@example@.com', 'motdepasse1', '23 Rue de la Liberté PARIS', '2314312423', 'PIZZARELLA DELIZIOSA', 'Bienvenue à La Pizzeria Deliziosa ! Venez déguster nos délicieuses pizzas cuites au feu de bois, préparées avec des ingrédients frais et savoureux. Choisissez parmi une variété de garnitures alléchantes et une pâte fraîche faite maison. Notre ambiance chaleureuse et conviviale vous invite à savourer lauthenticité de la cuisine italienne. Buon appetito!', 'italienne', 'PIZZARELLA DELIZIOSA.PNG', 4.97),
('restaurant2@example@.com', 'motdepasse2', '23 Rue des Halles LYON', '7482748923', 'AILES CROUSTILLANTES', 'Plongez dans une expérience gustative exceptionnelle au ailes croustillantes ! Nous vous proposons des plats de poulet cuisinés avec passion et créativité. Notre menu offre une gamme variée, allant du poulet rôti croustillant aux savoureuses brochettes. Chaque plat est préparé avec des ingrédients frais et de qualité pour vous offrir une explosion de saveurs. Venez vous régaler avec notre cuisine de poulet délicieuse et réconfortante.', 'cuisine du poulet', 'AILES CROUSTILLANTES.PNG', 3.5),
('restaurant3@example@.com', 'motdepasse3', '42 Rue Bellecour LYON', '3254768765', 'TRATORIA BELLA NAPOLI', 'Bienvenue à Tratoria bella napoli ! Plongez dans lambiance chaleureuse et authentique de lItalie. Notre restaurant vous propose une expérience culinaire italienne inoubliable, avec des pâtes fraîches, des antipasti délicieux et des pizzas artisanales. Savourez chaque bouchée dans un cadre convivial et laissez-vous transporter en Italie à travers nos plats savoureux et notre hospitalité chaleureuse.', 'italienne', 'TRATORIA BELLA NAPOLI.PNG', 4.7),
('restaurant4@example@.com', 'motdepasse4', '54 Rue de la République LILLE', '1243546798', 'SALADE SAVOUREUSE', 'La salade savoureuse est lendroit idéal pour les amateurs de salades ! Découvrez notre large sélection de salades fraîches et colorées, composées dingrédients locaux et de saison. Personnalisez votre salade selon vos préférences et régalez-vous avec nos vinaigrettes maison. Nous vous promettons une expérience gustative saine et délicieuse.', 'spécialisé dans les salades', 'SALADE SAVOUREUSE.PNG', 4),
('restaurant5@example@.com', 'motdepasse5', '13 Rue du Commerce NANTE', '5476436532', 'SAKURA SUSHI ET RAMEN', 'Plongez dans lunivers exquis de la cuisine japonaise au "Sakura Sushi & Ramen ". Dégustez des sushis fraîchement préparés, des ramens réconfortants et bien plus encore. Notre équipe de chefs talentueux utilise les meilleurs ingrédients pour vous offrir des plats authentiques et délicieux. Venez savourer lharmonie des saveurs et des textures dans un cadre accueillant et élégant.', 'japonaise', 'SAKURA SUSHI ET RAMEN.PNG', 3.9),
('restaurant6@example@.com', 'motdepasse6', '21 Rue Saint-Jean BEAUVAIS', '4332436543', 'TACO FIESTA EXPRESS', 'Bienvenue chez "Taco Fiesta" ! Notre restaurant vous invite à une fête de saveurs tex-mex avec nos tacos généreusement garnis, nos burritos succulents et nos enchiladas savoureuses. Découvrez lauthenticité des plats mexicains préparés avec des ingrédients frais et épicés. Vivez une expérience culinaire vibrante et festive dans une ambiance décontractée et joyeuse.', 'mexicaine', 'TACO FIESTA EXPRESS.PNG', 4.3),
('restaurant7@example@.com', 'motdepasse7', '53 Rue de la Cathédrale BEAUVAIS', '3243534565', 'DELARTE', 'Venez savourer lauthenticité de lItalie dans notre pizzeria. Nos pizzas artisanales cuites au feu de bois sont confectionnées avec soin à partir dingrédients frais et sélectionnés avec exigence. Plongez dans une explosion de saveurs dans une atmosphère conviviale et chaleureuse. Venez, laissez-vous enchanter par lart de la pizza.', 'italienne', 'DELARTE.PNG', 3.6),
('restaurant8@example@.com', 'motdepasse8', '87 Rue Victor Hugo BEAUVAIS', '3242342354', 'GREENBURGER', 'Découvrez le paradis végétarien chez "Verdura Haven". Notre restaurant propose une palette de plats végétariens créatifs et délicieux. Des salades aux plats principaux, nous mettons en avant la fraîcheur des légumes et des produits naturels. Rejoignez-nous pour une expérience culinaire saine, durable et pleine de saveurs.', 'vegetarienne', 'GREENBURGER.PNG', 1),
('restaurant9@example@.com', 'motdepasse9', '31 Rue du Mont-Blanc GENEVE', '6323464342', 'SASHIMI ZEN', 'Bienvenue à "Sashimi Zen" ! Notre restaurant est dédié aux amateurs de sashimi, mettant en valeur la fraîcheur et la qualité des produits de la mer. Dégustez nos assortiments de sashimi finement tranchés et savourez lauthenticité de la cuisine japonaise. Nous nous engageons à offrir une expérience gastronomique exquise avec une variété de poissons frais et délicieux.', 'cuisine japonaise', 'SASHIMI ZEN.PNG', 4.1),
('restaurant0@example@.com', 'motdepasse0', '52 Rue Jean Jaurès LENS', '4254354769', 'DOUCEUR SUCREE', 'Bienvenue au paradis sucré de "douceur sucree" ! Laissez-vous tenter par nos délices sucrés, des pâtisseries exquises aux gâteaux artistiquement décorés. Chaque création est une œuvre dart comestible, préparée avec passion et dévouement. Venez déguster nos douceurs sucrées et laissez-vous enchanter par le monde magique de la pâtisserie.', 'patisserie', 'DOUCEUR SUCREE.PNG', 4.8);

INSERT INTO plats (nom, description, allergenes, photo_plats, prix, note, restaurant)
VALUES
('Spaghetti Carbonara', 'Pâtes spaghetti avec sauce à la crème, pancetta et parmesan.', 'Gluten, œufs, produits laitiers', 'Spaghetti Carbonara.PNG', 12.99, 4.5/5, 'PIZZARELLA DELIZIOSA'),
('Pizza Quattro Formaggi', 'Pizza généreusement garnie de quatre fromages différents.', 'Gluten, produits laitiers', 'Pizza Quattro Formaggi.PNG', 11.99, 4.5/5, 'PIZZARELLA DELIZIOSA'),
('Lasagnes', 'Lasagnes traditionnelles faites de pâtes, de sauce bolognaise et de béchamel.', 'Gluten, œufs, produits laitiers', 'Lasagnes.PNG', 14.49, 4.5/5, 'PIZZARELLA DELIZIOSA'),
('Fettuccine Alfredo', 'Pâtes fettuccine dans une sauce crémeuse au parmesan.', 'Gluten, produits laitiers', 'Fettuccine Alfredo.PNG', 13.49, 4.5/5, 'PIZZARELLA DELIZIOSA'),
('Ravioli aux épinards et ricotta', 'Ravioli farcis aux épinards et à la ricotta, servis avec une sauce tomate.', 'Gluten, produits laitiers', 'Ravioli aux épinards et ricotta.PNG', 15.99, 4.5/5, 'PIZZARELLA DELIZIOSA'),
('Salade César', 'Salade césar garnie de poulet grillé, croûtons et parmesan.', 'Gluten, produits laitiers', 'Salade César.PNG', 9.99, 4.5/5, 'SALADE SAVOUREUSE'),
('Salade Méditerranéenne', 'Salade fraîche avec tomates, concombres, olives et fromage feta.', 'Produits laitiers', 'Salade Méditerranéenne.PNG', 8.99, 4.5/5, 'SALADE SAVOUREUSE'),
('Salade du Chef', 'Assortiment de légumes frais et de protéines, accompagné dune vinaigrette maison.', 'Aucun allergène connu', 'Salade du Chef.PNG', 10.49, 4.5/5, 'SALADE SAVOUREUSE'),
('Salade de Quinoa aux Légumes', 'Salade saine et colorée à base de quinoa, légumes et herbes fraîches.', 'Gluten', 'Salade de Quinoa aux Légumes.PNG', 11.49, 4.5/5, 'SALADE SAVOUREUSE'),
('Salade de Chèvre Chaud', 'Salade verte avec fromage de chèvre chaud, noix et vinaigrette balsamique.', 'Gluten, produits laitiers', 'Salade de Chèvre Chaud.PNG', 12.99, 4.5/5, 'SALADE SAVOUREUSE'),
('Sushi Mix', 'Assortiment de sushis variés.', 'Poisson cru, riz, algues', 'Sushi Mix.PNG', 18.99, 4.5/5, 'SAKURA SUSHI ET RAMEN'),
('Ramen Tonkotsu', 'Ramen japonais avec un bouillon de porc riche et des nouilles épaisses.', 'Gluten, soja', 'Ramen Tonkotsu.PNG', 15.99, 4.5/5, 'SAKURA SUSHI ET RAMEN'),
('Tempura Assorti', 'Assortiment de tempura croustillant (légumes, crevettes, poisson).', 'Gluten, crustacés', 'Tempura Assorti.PNG', 14.49, 4.5/5, 'SAKURA SUSHI ET RAMEN'),
('Sashimi Assorti', 'Assortiment de sashimi frais et délicieux.', 'Poisson cru', 'Sashimi Assorti.PNG', 20.99, 4.5/5, 'SAKURA SUSHI ET RAMEN'),
('Yakitori', 'Brochettes de poulet grillées et marinées.', 'Soja', 'Yakitori.PNG', 12.99, 4.5/5, 'SAKURA SUSHI ET RAMEN'),
('Tacos au Poulet', 'Tortillas de maïs garnies de poulet grillé, légumes et sauce.', 'Gluten', 'Tacos au Poulet.PNG', 10.99, 4.5/5, 'TACO FIESTA EXPRESS'),
('Burrito au Bœuf', 'Burrito généreusement garni de bœuf, haricots, riz et salsa.', 'Gluten', 'Burrito au Bœuf.PNG', 11.99, 4.5/5, 'TACO FIESTA EXPRESS'),
('Enchiladas au Fromage', 'Tortillas de maïs farcies de fromage, cuites au four avec une sauce.', 'Gluten, produits laitiers', 'Enchiladas au Fromage.PNG', 12.49, 4.5/5, 'TACO FIESTA EXPRESS'),
('Guacamole et Nachos', 'Dip de guacamole frais servi avec des nachos croustillants.', 'Gluten', 'Guacamole et Nachos.PNG', 8.99, 4.5/5, 'TACO FIESTA EXPRESS'),
('Fajitas aux Légumes', 'Fajitas végétariennes avec poivrons, oignons et épices mexicaines.', 'Gluten', 'Fajitas aux Légumes.PNG', 10.49, 4.5/5, 'TACO FIESTA EXPRESS'),
('Pizza Hawaïenne', 'Pizza garnie de jambon, d\ananas et de fromage.', 'Gluten, produits laitiers', 'Pizza Hawaïenne.PNG', 12.99, 4.5/5, 'DELARTE'),
('Pâtes à la Carbonara', 'Pâtes spaghetti avec sauce à la crème, pancetta et parmesan.', 'Gluten, œufs, produits laitiers', 'Pâtes à la Carbonara.PNG', 11.99, 4.5/5, 'DELARTE'),
('Lasagnes', 'Lasagnes traditionnelles faites de pâtes, de sauce bolognaise et de béchamel.', 'Gluten, œufs, produits laitiers', 'Lasagnes.PNG', 14.49, 4.5/5, 'DELARTE'),
('Risotto aux Champignons', 'Risotto crémeux aux champignons et parmesan.', 'Gluten, produits laitiers', 'Risotto aux Champignons.PNG', 13.49, 4.5/5, 'DELARTE'),
('Cannelloni à la Ricotta et Épinards', 'Pâtes cannelloni farcies de ricotta et épinards, cuites au four avec une sauce tomate.', 'Gluten, produits laitiers', 'Cannelloni à la Ricotta et Épinards.PNG', 15.99, 4.5/5, 'DELARTE'),
('Burger Végétarien', 'Burger savoureux composé dune galette végétarienne, de légumes et de sauces.', 'Gluten, soja', 'Burger Végétarien.PNG', 11.99, 4.5/5, 'GREENBURGER'),
('Salade Méditerranéenne', 'Salade fraîche avec tomates, concombres, olives et fromage feta.', 'Produits laitiers', 'Salade Méditerranéenne.PNG', 8.99, 4.5/5, 'GREENBURGER'),
('Wrap aux Légumes Grillés', 'Wrap rempli de légumes grillés et de houmous.', 'Gluten', 'Wrap aux Légumes Grillés.PNG', 9.99, 4.5/5, 'GREENBURGER'),
('Quinoa Bowl', 'Bol de quinoa accompagné de légumes, davocat et de graines.', 'Aucun allergène connu', 'Quinoa Bowl.PNG', 10.49, 4.5/5, 'GREENBURGER'),
('Pizza Végétarienne', 'Pizza garnie dun mélange de légumes frais.', 'Gluten, produits laitiers', 'Pizza Végétarienne.PNG', 12.49, 4.5/5, 'GREENBURGER'),
('Sashimi Assorti', 'Assortiment de sashimi frais et délicieux.', 'Poisson cru', 'Sashimi Assorti.PNG', 20.99, 4.5/5, 'SASHIMI ZEN'),
('Sushi Mix', 'Assortiment varié de sushis.', 'Poisson cru, riz, algues', 'Sushi Mix.PNG', 18.99, 4.5/5, 'SASHIMI ZEN'),
('Tempura de Légumes', 'Légumes frais enrobés dune pâte légère et frits.', 'Gluten', 'Tempura de Légumes.PNG', 12.49, 4.5/5, 'SASHIMI ZEN'),
('Ramen aux Légumes', 'Ramen japonais avec un bouillon aux légumes et des nouilles.', 'Gluten, soja', 'Ramen aux Légumes.PNG', 14.99, 4.5/5, 'SASHIMI ZEN'),
('Donburi au Tofu', 'Bol de riz garni de tofu et de légumes.', 'Soja', 'Donburi au Tofu.PNG', 13.49, 4.5/5, 'SASHIMI ZEN'),
('Pizza Margherita', 'Pizza classique avec sauce tomate, mozzarella et basilic.', 'Gluten, produits laitiers', 'Pizza Margherita.PNG', 10.99, 4.5/5, 'TRATORIA BELLA NAPOLI'),
('Pâtes à la Carbonara', 'Pâtes spaghetti avec sauce à la crème, pancetta et parmesan.', 'Gluten, œufs, produits laitiers', 'Pâtes à la Carbonara.PNG', 11.99, 4.5/5, 'TRATORIA BELLA NAPOLI'),
('Lasagnes', 'Lasagnes traditionnelles faites de pâtes, de sauce bolognaise et de béchamel.', 'Gluten, œufs, produits laitiers', 'Lasagnes.PNG', 13.49, 4.5/5, 'TRATORIA BELLA NAPOLI'),
('Risotto aux Champignons', 'Risotto crémeux aux champignons et parmesan.', 'Gluten, produits laitiers', 'Risotto aux Champignons.PNG', 12.99, 4.5/5, 'TRATORIA BELLA NAPOLI'),
('Cannelloni à la Ricotta et Épinards', 'Pâtes cannelloni farcies de ricotta et épinards, cuites au four avec une sauce tomate.', 'Gluten, produits laitiers', 'Cannelloni à la Ricotta et Épinards.PNG', 14.99, 4.5/5, 'TRATORIA BELLA NAPOLI'),
('Burger au Poulet', 'Délicieux burger au poulet croustillant avec des légumes et de la sauce.', 'Gluten, œufs', 'Burger au Poulet.PNG', 11.99, 4.5/5, 'AILES CROUSTILLANTES'),
('Ailes de Poulet BBQ', 'Ailes de poulet grillées et nappées de sauce barbecue.', 'Gluten', 'Ailes de Poulet BBQ.PNG', 10.99, 4.5/5, 'AILES CROUSTILLANTES'),
('Poulet grillé', 'Poulet mariné et grillé à la perfection.', 'Aucun allergène connu', 'Poulet grillé.PNG', 12.99, 4.5/5, 'AILES CROUSTILLANTES'),
('Nuggets de Poulet', 'Nuggets de poulet croustillants et savoureux.', 'Gluten', 'Nuggets de Poulet.PNG', 9.99, 4.5/5, 'AILES CROUSTILLANTES'),
('Salade César au Poulet', 'Salade césar garnie de poulet grillé, croûtons et parmesan.', 'Gluten, produits laitiers', 'Salade César au Poulet.PNG', 10.99, 4.5/5, 'AILES CROUSTILLANTES'),
('Tarte aux Pommes', 'Délicieuse tarte aux pommes maison, garnie de compote et de morceaux de pommes.', 'Gluten', 'Tarte aux Pommes.PNG', 7.99, 4.5/5, 'DOUCEUR SUCREE'),
('Éclair au Chocolat', 'Éclair garni de crème pâtissière au chocolat et recouvert de glaçage.', 'Gluten, œufs, produits laitiers', 'Éclair au Chocolat.PNG', 5.99, 4.5/5, 'DOUCEUR SUCREE'),
('Macarons assortis', 'Assortiment de macarons aux saveurs variées.', 'Gluten, amandes, œufs', 'Macarons assortis.PNG', 12.99, 4.5/5, 'DOUCEUR SUCREE'),
('Muffin aux Myrtilles', 'Muffin moelleux aux myrtilles, parfait pour une pause douceur.', 'Gluten, produits laitiers', 'Muffin aux Myrtilles.PNG', 4.99, 4.5/5, 'DOUCEUR SUCREE'),
('Tiramisu', 'Dessert italien classique à base de mascarpone, café et biscuits.', 'Œufs, produits laitiers', 'Tiramisu.PNG', 8.99, 4.5/5, 'DOUCEUR SUCREE');

INSERT INTO Formules (nom, description, allergenes, restaurant, photo_formules, prix, note)
VALUES
('Formule Pizza Margherita', 'Délicieuse pizza Margherita avec de la sauce tomate, de la mozzarella et du basilic frais. Accompagnée d\une boisson au choix ou d\un tiramisu.', 'Gluten (pâte), lactose (mozzarella)', 'PIZZARELLA DELIZIOSA', 'Formule Pizza Margherita.PNG', 15.99, 4.5/5),
('Formule Pâtes Carbonara', 'Spaghetti al dente avec une sauce à la crème, du lard croustillant et du parmesan. Accompagnées d\une boisson au choix ou d\un tiramisu.', 'Gluten (pâtes), œufs, lactose (fromage)', 'PIZZARELLA DELIZIOSA', 'Formule Pâtes Carbonara.PNG', 17.99, 4.5/5),
('Formule Lasagnes à la Bolognaise', 'Délicieuses lasagnes superposées avec de la viande hachée, de la sauce tomate et du fromage fondu. Accompagnées d\une boisson au choix ou d\un tiramisu.', 'Gluten (pâtes), lactose (fromage)', 'PIZZARELLA DELIZIOSA', 'Formule Lasagnes à la Bolognaise.PNG', 19.99, 4.5/5),
('Formule Risotto aux Champignons', 'Risotto crémeux préparé avec du riz Arborio et des champignons sautés. Accompagné d\une boisson au choix ou d\un tiramisu.', 'Lactose (fromage), champignons', 'PIZZARELLA DELIZIOSA', 'Formule Risotto aux Champignons.PNG', 18.99, 4.5/5),
('Formule Tiramisu Classique', 'Dessert traditionnel italien à base de biscuits imbibés de café et de mascarpone. Accompagné d\une boisson au choix ou d\une portion de fruits frais.', 'Œufs, gluten (biscuits), lactose (mascarpone)', 'PIZZARELLA DELIZIOSA', 'Formule Tiramisu Classique.PNG', 11.99, 4.5/5),
('Formule Ailes de Poulet Épicées', 'Délicieuses ailes de poulet croustillantes assaisonnées avec des épices exquises. Accompagnées d\une boisson au choix ou d\un dessert.', 'Gluten (panure), lactose (sauce)', 'AILES CROUSTILLANTES', 'Formule Ailes de Poulet Épicées.PNG', 15.99, 4.5/5),
('Formule Poulet Rôti Classique', 'Poulet rôti tendre et juteux, assaisonné avec des herbes aromatiques. Accompagné d\une boisson au choix ou d\un dessert.', 'Lactose (sauce)', 'AILES CROUSTILLANTES', 'Formule Poulet Rôti Classique.PNG', 17.99, 4.5/5),
('Formule Brochettes de Poulet Grillé', 'Brochettes de poulet mariné et grillé à la perfection. Accompagnées d\une boisson au choix ou d\un dessert.', 'Lactose (marinade)', 'AILES CROUSTILLANTES', 'Formule Brochettes de Poulet Grillé.PNG', 19.99, 4.5/5),
('Formule Nuggets de Poulet', 'Nuggets de poulet dorés et croustillants. Accompagnés d\une boisson au choix ou d\un dessert.', 'Gluten (panure), lactose (sauce)', 'AILES CROUSTILLANTES', 'Formule Nuggets de Poulet.PNG', 18.99, 4.5/5),
('Formule Poulet Frit Original', 'Poulet frit croustillant et savoureux. Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten (panure), lactose (sauce)', 'AILES CROUSTILLANTES', 'Formule Poulet Frit Original.PNG', 11.99, 4.5/5),
('Formule Spaghetti Carbonara', 'Spaghetti al dente avec une sauce à la crème, du lard croustillant et du parmesan. Accompagnés d\une boisson au choix ou d\un tiramisu.', 'Gluten (pâtes), œufs, lactose (fromage)', 'TRATORIA BELLA NAPOLI', 'Formule Spaghetti Carbonara.PNG', 17.99, 4.5/5),
('Formule Pizza Quattro Stagioni', 'Pizza avec quatre garnitures différentes : artichauts, jambon, champignons et olives. Accompagnée d\une boisson au choix ou d\un tiramisu.', 'Gluten (pâte), lactose (mozzarella)', 'TRATORIA BELLA NAPOLI', 'Formule Pizza Quattro Stagioni.PNG', 19.99, 4.5/5),
('Formule Risotto aux Fruits de Mer', 'Risotto crémeux préparé avec du riz Arborio et des fruits de mer. Accompagné d\une boisson au choix ou d\un tiramisu.', 'Gluten (riz), fruits de mer', 'TRATORIA BELLA NAPOLI', 'Formule Risotto aux Fruits de Mer.PNG', 21.99, 4.5/5),
('Formule Lasagnes à la Bolognaise', 'Délicieuses lasagnes superposées avec de la viande hachée, de la sauce tomate et du fromage fondu. Accompagnées d\une boisson au choix ou d\un tiramisu.', 'Gluten (pâtes), lactose (fromage)', 'TRATORIA BELLA NAPOLI', 'Formule Lasagnes à la Bolognaise.PNG', 18.99, 4.5/5),
('Formule Tiramisu Classique', 'Dessert traditionnel italien à base de biscuits imbibés de café et de mascarpone. Accompagné d\une boisson au choix ou d\une portion de fruits frais.', 'Œufs, gluten (biscuits), lactose (mascarpone)', 'TRATORIA BELLA NAPOLI', 'Formule Tiramisu Classique.PNG', 11.99, 4.5/5),
('Formule Salade César', 'Salade César fraîche avec des croûtons, du poulet grillé, du parmesan et une vinaigrette spéciale. Accompagnée d\une boisson au choix ou d\un dessert aux fruits.', 'Gluten (croûtons), lactose (fromage)', 'SALADE SAVOUREUSE', 'Formule Salade César.PNG', 14.99, 4.5/5),
('Formule Salade Grecque', 'Salade grecque traditionnelle avec des légumes frais, de la feta, des olives et de l\huile d\olive. Accompagnée d\une boisson au choix ou d\un dessert aux fruits.', 'Lactose (fromage)', 'SALADE SAVOUREUSE', 'Formule Salade Grecque.PNG', 16.99, 4.5/5),
('Formule Salade Quinoa aux Légumes', 'Salade équilibrée avec du quinoa, des légumes colorés et une vinaigrette légère. Accompagnée d\une boisson au choix ou d\un dessert aux fruits.', 'Gluten (quinoa)', 'SALADE SAVOUREUSE', 'Formule Salade Quinoa aux Légumes.PNG', 18.99, 4.5/5),
('Formule Salade de Poulet aux Noix', 'Salade riche en protéines avec du poulet grillé, des noix, des légumes et une vinaigrette. Accompagnée d\une boisson au choix ou d\un dessert aux fruits.', 'Lactose (fromage), fruits à coque (noix)', 'SALADE SAVOUREUSE', 'Formule Salade de Poulet aux Noix.PNG', 17.99, 4.5/5),
('Formule Salade Méditerranéenne', 'Salade méditerranéenne avec des légumes grillés, du fromage de chèvre, des olives et de l\huile d\olive. Accompagnée d\une boisson au choix ou d\un dessert aux fruits.', 'Lactose (fromage)', 'SALADE SAVOUREUSE', 'Formule Salade Méditerranéenne.PNG', 19.99, 4.5/5),
('Formule Sushi Varié', 'Assortiment de sushis variés, préparés avec des ingrédients frais et de qualité. Accompagnés d\une boisson au choix ou d\un dessert japonais.', 'Poisson cru, crustacés, gluten (riz)', 'SAKURA SUSHI ET RAMEN', 'Formule Sushi Varié.PNG', 21.99, 4.5/5),
('Formule Ramen Classique', 'Bol de ramen japonais avec du bouillon savoureux, des nouilles, des légumes et des tranches de viande. Accompagné d\une boisson au choix ou d\un dessert japonais.', 'Gluten (nouilles), soja (bouillon)', 'SAKURA SUSHI ET RAMEN', 'Formule Ramen Classique.PNG', 18.99, 4.5/5),
('Formule Donburi au Poulet', 'Donburi garni de poulet grillé, de légumes et d\une sauce délicieuse. Accompagné d\une boisson au choix ou d\un dessert japonais.', 'Soja (sauce), riz, poulet', 'SAKURA SUSHI ET RAMEN', 'Formule Donburi au Poulet.PNG', 19.99, 4.5/5),
('Formule Tempura Mixte', 'Assortiment de tempura croustillant avec légumes et fruits de mer. Accompagné d\une boisson au choix ou d\un dessert japonais.', 'Gluten (pâte à tempura), crustacés, poissons', 'SAKURA SUSHI ET RAMEN', 'Formule Tempura Mixte.PNG', 22.99, 4.5/5),
('Formule Sashimi Deluxe', 'Assortiment de sashimi frais et finement tranchés. Accompagné d\une boisson au choix ou d\un dessert japonais.', 'Poisson cru, crustacés', 'SAKURA SUSHI ET RAMEN', 'Formule Sashimi Deluxe.PNG', 24.99, 4.5/5),
('Formule Tacos au Poulet', 'Trois délicieux tacos au poulet mariné, garnis de légumes frais et d\une sauce relevée. Accompagnés d\une boisson au choix ou d\un dessert mexicain.', 'Gluten (tortillas), lactose (fromage)', 'TACO FIESTA EXPRESS', 'Formule Tacos au Poulet.PNG', 15.99, 4.5/5),
('Formule Burrito au Bœuf', 'Burrito généreusement garni de bœuf épicé, de riz, de haricots et de légumes. Accompagné d\une boisson au choix ou d\un dessert mexicain.', 'Gluten (tortilla), lactose (fromage)', 'TACO FIESTA EXPRESS', 'Formule Burrito au Bœuf.PNG', 16.99, 4.5/5),
('Formule Enchiladas au Fromage', 'Enchiladas gratinées au four, farcies de fromage et accompagnées de sauce salsa. Accompagnées d\une boisson au choix ou d\un dessert mexicain.', 'Gluten (tortillas), lactose (fromage)', 'TACO FIESTA EXPRESS', 'Formule Enchiladas au Fromage.PNG', 18.99, 4.5/5),
('Formule Fajitas Mixtes', 'Fajitas délicieuses avec un mélange de viandes grillées, de poivrons et d\oignons. Accompagnées d\une boisson au choix ou d\un dessert mexicain.', 'Gluten (tortillas), lactose (fromage)', 'TACO FIESTA EXPRESS', 'Formule Fajitas Mixtes.PNG', 21.99, 4.5/5),
('Formule Guacamole et Nachos', 'Assortiment de nachos croustillants avec du guacamole frais et épicé. Accompagnés d\une boisson au choix ou d\un dessert mexicain.', 'Gluten (nachos), lactose (fromage)', 'TACO FIESTA EXPRESS', 'Formule Guacamole et Nachos.PNG', 14.99, 4.5/5),
('Formule Pizza Margherita', 'Délicieuse pizza Margherita avec de la sauce tomate, de la mozzarella et du basilic frais. Accompagnée d\une boisson au choix ou d\un tiramisu.', 'Gluten (pâte), lactose (mozzarella)', 'DELARTE', 'Formule Pizza Margherita.PNG', 17.99, 4.5/5),
('Formule Pâtes Carbonara', 'Spaghetti al dente avec une sauce à la crème, du lard croustillant et du parmesan. Accompagnées d\une boisson au choix ou d\un tiramisu.', 'Gluten (pâtes), œufs, lactose (fromage)', 'DELARTE', 'Formule Pâtes Carbonara.PNG', 19.99, 4.5/5),
('Formule Lasagnes à la Bolognaise', 'Délicieuses lasagnes superposées avec de la viande hachée, de la sauce tomate et du fromage fondu. Accompagnées d\une boisson au choix ou d\un tiramisu.', 'Gluten (pâtes), lactose (fromage)', 'DELARTE', 'Formule Risotto aux Champignons.PNG', 21.99, 4.5/5),
('Formule Risotto aux Champignons', 'Risotto crémeux préparé avec du riz Arborio et des champignons sautés. Accompagné d\une boisson au choix ou d\un tiramisu.', 'Lactose (fromage), champignons', 'DELARTE', 'Formule Tiramisu Classique.PNG', 18.99, 4.5/5),
('Formule Tiramisu Classique', 'Dessert traditionnel italien à base de biscuits imbibés de café et de mascarpone. Accompagné d\une boisson au choix ou d\une portion de fruits frais.', 'Œufs, gluten (biscuits), lactose (mascarpone)', 'DELARTE', 'Formule Burger Végétarien.PNG', 12.99, 4.5/5),
('Formule Burger Végétarien', 'Burger végétarien délicieux avec un steak végétarien, des légumes frais et une sauce spéciale. Accompagné d\une boisson au choix et d\un dessert végétalien.', 'Gluten (pain), soja (steak végétarien)', 'GREENBURGER', 'Formule Salade Méditerranéenne.PNG', 14.99, 4.5/5),
('Formule Salade Méditerranéenne', 'Salade fraîche et colorée avec des légumes méditerranéens, du fromage de chèvre et une vinaigrette légère. Accompagnée d\une boisson au choix ou d\un dessert végétalien.', 'Lactose (fromage), fruits à coque (noix)', 'GREENBURGER', 'Formule Wrap aux Légumes Grillés.PNG', 16.99, 4.5/5),
('Formule Wrap aux Légumes Grillés', 'Wrap aux légumes grillés et savoureux, enveloppés dans une tortilla. Accompagné d\une boisson au choix ou d\un dessert végétalien.', 'Gluten (tortilla), soja', 'GREENBURGER', 'Formule Buddha Bowl.PNG', 18.99, 4.5/5),
('Formule Buddha Bowl', 'Buddha bowl équilibré avec du quinoa, des légumes, des graines et une vinaigrette saine. Accompagné d\une boisson au choix ou d\un dessert végétalien.', 'Gluten (quinoa), fruits à coque (noix)', 'GREENBURGER', 'Formule Pizza Végétarienne.PNG', 17.99, 4.5/5),
('Formule Pizza Végétarienne', 'Pizza végétarienne avec une variété de légumes colorés et du fromage végétalien. Accompagnée d\une boisson au choix ou d\un dessert végétalien.', 'Gluten (pâte), soja (fromage végétalien)', 'GREENBURGER', 'Formule Sashimi Mixte.PNG', 19.99, 4.5/5),
('Formule Sashimi Mixte', 'Assortiment de sashimi frais et finement tranchés. Accompagné d\une boisson au choix ou d\un dessert japonais.', 'Poisson cru', 'SASHIMI ZEN', 'Formule Sushi Deluxe.PNG', 23.99, 4.5/5),
('Formule Sushi Deluxe', 'Assortiment de sushis variés, préparés avec des ingrédients frais et de qualité. Accompagné d\une boisson au choix ou d\un dessert japonais.', 'Poisson cru', 'SASHIMI ZEN', 'Formule Tempura Variée.PNG', 21.99, 4.5/5),
('Formule Tempura Variée', 'Assortiment de tempura croustillant avec légumes et fruits de mer. Accompagné d\une boisson au choix ou d\un dessert japonais.', 'Gluten (pâte à tempura), crustacés', 'SASHIMI ZEN', 'Formule Ramen aux Légumes.PNG', 22.99, 4.5/5),
('Formule Ramen aux Légumes', 'Bol de ramen japonais avec un bouillon savoureux, des nouilles, des légumes et des garnitures végétariennes. Accompagné d\une boisson au choix ou d\un dessert japonais.', 'Gluten (nouilles), soja (bouillon)', 'SASHIMI ZEN', 'Formule Donburi Végétarien.PNG', 19.99, 4.5/5),
('Formule Donburi Végétarien', 'Donburi garni de légumes variés et d\une sauce savoureuse. Accompagné d\une boisson au choix ou d\un dessert japonais.', 'Soja (sauce), riz', 'SASHIMI ZEN', 'Formule Donburi Végétarien.PNG', 18.99, 4.5/5),
('Formule Éclair au Chocolat', 'Éclair moelleux au chocolat garni de crème pâtissière. Accompagné d\une boisson chaude au choix ou d\un dessert au choix.', 'Gluten, œufs, lactose', 'DOUCEUR SUCREE', 'Formule Éclair au Chocolat.PNG', 8.99, 4.5/5),
('Formule Tarte aux Fruits', 'Tarte légère aux fruits de saison. Accompagnée d\une boisson fraîche au choix ou d\un dessert au choix.', 'Gluten, fruits (varie selon la saison), lactose', 'DOUCEUR SUCREE', 'Formule Tarte aux Fruits.PNG', 10.99, 4.5/5),
('Formule Millefeuille à la Vanille', 'Millefeuille croustillant à la vanille. Accompagné d\une boisson chaude ou froide au choix ou d\un dessert au choix.', 'Gluten, œufs, lactose', 'DOUCEUR SUCREE', 'Formule Millefeuille à la Vanille.PNG', 9.99, 4.5/5),
('Formule Macarons Variés', 'Assortiment de macarons aux saveurs variées. Accompagnés d\une boisson chaude ou froide au choix ou d\un dessert au choix.', 'Gluten, œufs, fruits à coque, lactose', 'DOUCEUR SUCREE', 'Formule Macarons Variés.PNG', 12.99, 4.5/5),
('Formule Cheesecake aux Fruits Rouges', 'Cheesecake crémeux aux fruits rouges. Accompagné d\une boisson fraîche au choix ou d\un dessert au choix.', 'Gluten, œufs, fruits rouges, lactose', 'DOUCEUR SUCREE', 'Formule Cheesecake aux Fruits Rouges.PNG', 11.99, 4.5/5);

INSERT INTO formules_periode (nom, periode, description, allergenes, photo_formules_periode, prix, note, restaurant)
VALUES
('Ramen poivron', 'Printemps', 'Ramen japonais avec un bouillon au poivron et des nouilles Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, soja', 'Ramen poivron.PNG', 15.99, 4.5/5, 'SAKURA SUSHI ET RAMEN'),
('Pates Aux Nutella', 'Printemps', 'Un dessert unique qui marie lart culinaire italien à une touche de gourmandise sucrée. Nos pâtes al dente sont soigneusement enrobées de Nutella crémeux, créant une harmonie parfaite entre la texture des pâtes et la richesse chocolatée du Nutella.', 'Blé (gluten), noisettes (fruits à coque), lait (lactose).', 'Ramen poivron.PNG', 15.99, 4.5/5, 'SAKURA SUSHI ET RAMEN'),
('Sushi melon', 'Été', 'Sushi frais et délicieux garni de melon Accompagné d\une boisson au choix ou d\un dessert.', 'Poisson cru, riz, algues', 'Sushi melon.PNG', 18.49, 4.5/5, 'SAKURA SUSHI ET RAMEN'),
('Sushi figue saumon', 'Automne', 'Sushi savoureux garni de figue et de saumon Accompagné d\une boisson au choix ou d\un dessert.', 'Poisson cru, riz, algues', 'Sushi figue saumon.PNG', 17.99, 4.5/5, 'SAKURA SUSHI ET RAMEN'),
('Ramen kiwi boeuf', 'Hiver', 'Ramen japonais avec un bouillon au kiwi et de la viande de bœuf Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, soja', 'Ramen kiwi boeuf.PNG', 16.99, 4.5/5, 'SAKURA SUSHI ET RAMEN'),
('Spaghetti fraise', 'Printemps', 'Pâtes spaghetti avec une sauce à la fraise Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, fruits', 'Spaghetti fraise.PNG', 13.99, 4.5/5, 'PIZZARELLA DELIZIOSA'),
('Pizza pastèque', 'Été', 'Pizza garnie de morceaux de pastèque Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, fruits', 'Pizza pastèque.PNG', 12.99, 4.5/5, 'PIZZARELLA DELIZIOSA'),
('Lasagnes pomme', 'Automne', 'Lasagnes traditionnelles avec une touche de pomme Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, fruits', 'Lasagnes pomme.PNG', 14.49, 4.5/5, 'PIZZARELLA DELIZIOSA'),
('Ravioli kiwi', 'Hiver', 'Ravioli farcis au kiwi, accompagnés d\une sauce spéciale Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, fruits', 'Ravioli kiwi.PNG', 15.99, 4.5/5, 'PIZZARELLA DELIZIOSA'),
('Salade petit pois', 'Printemps', 'Salade fraîche avec des petits pois et une vinaigrette légère Accompagné d\une boisson au choix ou d\un dessert.', 'Aucun allergène connu', 'Salade petit pois.PNG', 10.99, 4.5/5, 'SALADE SAVOUREUSE'),
('Salade courgette', 'Été', 'Salade estivale avec des courgettes grillées et une sauce citronnée Accompagné d\une boisson au choix ou d\un dessert.', 'Aucun allergène connu', 'Salade courgette.PNG', 11.49, 4.5/5, 'SALADE SAVOUREUSE'),
('Salade prune', 'Automne', 'Salade équilibrée avec des prunes fraîches et des noix Accompagné d\une boisson au choix ou d\un dessert.', 'Aucun allergène connu', 'Salade prune.PNG', 11.99, 4.5/5, 'SALADE SAVOUREUSE'),
('Salade endive', 'Hiver', 'Salade d\endives croquante avec une vinaigrette maison Accompagné d\une boisson au choix ou d\un dessertAccompagné d\une boisson au choix ou d\un dessert.', 'Aucun allergène connu', 'Salade endive.PNG', 10.49, 4.5/5, 'SALADE SAVOUREUSE'),
('Tacos asperge poulet', 'Printemps', 'Tacos garnis d\asperges et de poulet Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, poulet', 'Tacos asperge poulet.PNG', 12.99, 4.5/5, 'TACO FIESTA EXPRESS'),
('Burrito de raisin', 'Été', 'Burrito sucré garni de raisins et de saveurs estivales Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten', 'Burrito de raisin.PNG', 11.99, 4.5/5, 'TACO FIESTA EXPRESS'),
('Fajitas pomme', 'Automne', 'Fajitas avec des pommes pour une touche automnale Accompagné d\une boisson au choix ou d\un dessert.', 'Aucun allergène connu', 'Fajitas pomme.PNG', 13.49, 4.5/5, 'TACO FIESTA EXPRESS'),
('Tacos chou-fleur', 'Hiver', 'Tacos végétariens garnis de chou-fleur Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten', 'Tacos chou-fleur.PNG', 10.99, 4.5/5, 'TACO FIESTA EXPRESS'),
('Pizza petit pois', 'Printemps', 'Pizza garnie de petits pois pour une saveur printanière Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, produits laitiers', 'Pizza petit pois.PNG', 12.99, 4.5/5, 'DELARTE'),
('Pâtes pastèque', 'Été', 'Pâtes accompagnées de morceaux de pastèque pour une fraîcheur estivale Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten', 'Pâtes pastèque.PNG', 11.99, 4.5/5, 'DELARTE'),
('Risotto poire', 'Automne', 'Risotto crémeux avec des morceaux de poire pour une saveur automnale Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, produits laitiers', 'Risotto poire.PNG', 13.49, 4.5/5, 'DELARTE'),
('Pizza kiwi', 'Hiver', 'Pizza garnie de tranches de kiwi pour une touche hivernale Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, produits laitiers', 'Pizza kiwi.PNG', 10.99, 4.5/5, 'DELARTE'),
('Burger courgette', 'Printemps', 'Burger végétarien avec galette à la courgette pour une touche printanière Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, soja', 'Burger courgette.PNG', 11.99, 4.5/5, 'GREENBURGER'),
('Wrap poivron', 'Été', 'Wrap garni de poivrons pour une fraîcheur estivale Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten', 'Wrap poivron.PNG', 10.99, 4.5/5, 'GREENBURGER'),
('Quinoa prune', 'Automne', 'Bol de quinoa accompagné de pruneaux pour une saveur automnale Accompagné d\une boisson au choix ou d\un dessert.', 'Aucun allergène connu', 'Quinoa prune.PNG', 12.49, 4.5/5, 'GREENBURGER'),
('Pizza endive', 'Hiver', 'Pizza garnie d\endives pour une touche hivernale Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, produits laitiers', 'Pizza endive.PNG', 13.99, 4.5/5, 'GREENBURGER'),
('Sushi rhubarbe', 'Printemps', 'Sushi avec une touche de rhubarbe pour la saison printanière Accompagné d\une boisson au choix ou d\un dessert.', 'Poisson cru, riz, algues', 'Sushi rhubarbe.PNG', 18.99, 4.5/5, 'SASHIMI ZEN'),
('Sushi pasteque', 'Été', 'Sushi garni de pastèque pour une fraîcheur estivale Accompagné d\une boisson au choix ou d\un dessert.', 'Poisson cru, riz, algues', 'Sushi pasteque.PNG', 17.99, 4.5/5, 'SASHIMI ZEN'),
('Sushi figue prune', 'Automne', 'Sushi avec une combinaison de figue et prune pour une saveur automnale Accompagné d\une boisson au choix ou d\un dessert.', 'Poisson cru, riz, algues', 'Sushi figue prune.PNG', 19.49, 4.5/5, 'SASHIMI ZEN'),
('Sushi kiwi', 'Hiver', 'Sushi accompagné de kiwi pour la saison hivernale Accompagné d\une boisson au choix ou d\un dessert.', 'Poisson cru, riz, algues', 'Sushi kiwi.PNG', 18.99, 4.5/5, 'SASHIMI ZEN'),
('Lasagnes asperge', 'Printemps', 'Lasagnes traditionnelles faites de pâtes, sauce bolognaise et asperges Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, œufs, produits laitiers', 'Lasagnes asperge.PNG', 14.99, 4.5/5, 'TRATORIA BELLA NAPOLI'),
('Cannelloni au courgette', 'Été', 'Pâtes cannelloni farcies de courgettes, cuites au four avec une sauce tomate Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, œufs, produits laitiers', 'Cannelloni au courgette.PNG', 15.49, 4.5/5, 'TRATORIA BELLA NAPOLI'),
('Risotto pomme', 'Automne', 'Risotto crémeux aux pommes, parmesan et herbes Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, produits laitiers', 'Risotto pomme.PNG', 13.99, 4.5/5, 'TRATORIA BELLA NAPOLI'),
('Pâtes kiwi', 'Hiver', 'Pâtes accompagnées de morceaux de kiwi pour une touche fraîche en hiver Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten', 'Pâtes kiwi.PNG', 12.99, 4.5/5, 'TRATORIA BELLA NAPOLI'),
('Burger poulet fraise', 'Printemps', 'Burger savoureux composé dune galette de poulet, de fraises et de légumes Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, œufs', 'Burger poulet fraise.PNG', 13.99, 4.5/5, 'AILES CROUSTILLANTES'),
('Nuggets à la pastèque', 'Été', 'Nuggets de poulet accompagnés dune sauce à la pastèque Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten', 'Nuggets à la pastèque.PNG', 12.99, 4.5/5, 'AILES CROUSTILLANTES'),
('Salade pomme poire figue', 'Automne', 'Salade fraîche avec des pommes, des poires, des figues et une vinaigrette maison Accompagné d\une boisson au choix ou d\un dessert.', 'Aucun allergène connu', 'Salade pomme poire figue.PNG', 11.99, 4.5/5, 'AILES CROUSTILLANTES'),
('Poulet miel kiwi', 'Hiver', 'Poulet tendre mariné au miel et accompagné de kiwi pour une touche sucrée Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten', 'Poulet miel kiwi.PNG', 14.49, 4.5/5, 'AILES CROUSTILLANTES'),
('Tarte aux fraises', 'Printemps', 'Délicieuse tarte aux fraises garnie de crème et de fraises fraîches Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, produits laitiers', 'Tarte aux fraises.PNG', 8.99, 4.5/5, 'DOUCEUR SUCREE'),
('Macaron à la pastèque', 'Été', 'Macaron rafraîchissant à la saveur sucrée de la pastèque Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, amandes', 'Macaron à la pastèque.PNG', 3.99, 4.5/5, 'DOUCEUR SUCREE'),
('Muffin à la pomme', 'Automne', 'Muffin moelleux aux morceaux de pomme, parfait pour une pause douceur Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten', 'Muffin à la pomme.PNG', 4.49, 4.5/5, 'DOUCEUR SUCREE'),
('Tarte au kiwi', 'Hiver', 'Tarte aux kiwis frais, pour une touche acidulée et sucrée Accompagné d\une boisson au choix ou d\un dessert.', 'Gluten, produits laitiers', 'Tarte au kiwi.PNG', 7.99, 4.5/5, 'DOUCEUR SUCREE');

INSERT INTO administrateurs (administrateur, admin_restaurateur)
VALUES
('administrateurs', 'admin_PIZZARELLA DELIZIOSA'),
('administrateurs', 'admin_AILES CROUSTILLANTES'),
('administrateurs', 'admin_TRATORIA BELLA NAPOLI'),
('administrateurs', 'admin_SALADE SAVOUREUSE'),
('administrateurs', 'admin_SAKURA SUSHI ET RAMEN'),
('administrateurs', 'admin_TACO FIESTA EXPRESS'),
('administrateurs', 'admin_DELARTE'),
('administrateurs', 'admin_GREENBURGER'),
('administrateurs', 'admin_SASHIMI ZEN'),
('administrateurs', 'admin_DOUCEUR SUCREE');


INSERT INTO livreur (nom, prenom, email, tel, zone_geographique, matricule_livreur, date_visite_medicale, client_id)
VALUES 
('Smith', 'Emma', 'livreur1@example@.com', '0612345678', 'Paris', '456829543845', '2023-06-12', 2),
('Johnson', 'Johnson', 'livreur2@example@.com', '0734567890', 'Amsterdam', '985350096648', '2023-08-01', 1),
('Brown', 'Sophia', 'livreur3@example@.com', '0756789012', 'Grenoble', '933251864135', '2023-07-23', 5),
('Davis', 'Jackson', 'livreur4@example@.com', '0799887766', 'Berlin', '2357447963', '2023-11-09', 3), 
('Wilson', 'Olivia', 'livreur5@example@.com', '0655778899', 'Tolyo', '665784448988', '2023-10-25', 7),
('Anderson', 'Noah', 'livreur6@example@.com', '0698765432', 'Mexico', '479631587462', '2023-09-16', 8),
('Martinez', 'Max', 'livreur7@example@.com', '0711223344', 'Bamako', '235547895126', '2023-01-21', 4);

INSERT INTO historique_livraison (livraison, matricule_livreur, restaurant, code_commande, date_livraison, adresse_livraison, prix, nb_km_parcouru)
VALUES
(1, '456829543845', 'AILES CROUSTILLANTES', 'WXYZ1234', '2022-10-15', '333 Rue du Soleil LYON', 12.99, '0.8'),
(2, '985350096648', 'DELARTE', 'UVWX5678', '2020-02-16', '789 Avenue des Étoiles LILLE', 7.99, '1.1'),
(3, '985350096648', 'GREENBURGER', 'TUVW9012', '2020-02-17', '456 Avenue de la Lune NANTE', 19.99, '0.3'),
(4, '2357447963', 'PIZZARELLA DELIZIOSA', 'QRST3456', '2022-10-18', '111 Rue du Ciel BEAUVAIS', 8.49, '2.4'),
(5, '2357447963', 'SALADE SAVOUREUSE', 'PQRS7890', '2022-06-19', '123 Rue de la Mer BEAUVAIS', 14.99, '1.2'),
(6, '2357447963', 'GREENBURGER', 'LMNO1234', '2022-10-20', '1010 Rue du Vent BEAUVAIS', 9.99, '0.6'),
(7, '985350096648', 'TACO FIESTA EXPRESS', 'KLMN5678', '2020-02-21', '222 Rue de la Montagne GENEVE', 24.99, '1.3'),
(8, '479631587462', 'TACO FIESTA EXPRESS', 'ABCD1234', '2020-02-13', '789 Rue des Oliviers PARIS', 15.99, '2.2'),
(9, '456829543845', 'SALADE SAVOUREUSE', 'EFGH5678', '2022-01-14', '567 Avenue du Cheddar LYON', 8.49, '0.2'),
(10, '479631587462', 'PIZZARELLA DELIZIOSA', 'IJKL9012', '2020-02-22', '789 Rue de la Plage LENS', 5.99, '0.3');

-- Ajout des contraintes de clés étrangèes

ALTER TABLE client 
ADD CONSTRAINT fk_client_reduction
FOREIGN KEY (reduction_id) REFERENCES reduction(id_reduction);

ALTER TABLE client 
ADD CONSTRAINT fk_client_commande
FOREIGN KEY (commande_id) REFERENCES commande(id_commande);

ALTER TABLE client 
ADD CONSTRAINT fk_client_historique_commande
FOREIGN KEY (historique_commande_id) REFERENCES historique_commande(id_historique_commande);

ALTER TABLE reduction 
ADD CONSTRAINT fk_reduction_client
FOREIGN KEY (client_id) REFERENCES client(id_client);

ALTER TABLE commande 
ADD CONSTRAINT fk_commande_adresse
FOREIGN KEY (adresse_id) REFERENCES adresse(id_adresse);

ALTER TABLE commande 
ADD CONSTRAINT fk_commande_reservation
FOREIGN KEY (reservation_id) REFERENCES reservation(id_reservation);

ALTER TABLE commande 
ADD CONSTRAINT fk_commande_facture
FOREIGN KEY (facture_id) REFERENCES facture(id_facture);

ALTER TABLE commande 
ADD CONSTRAINT fk_commande_historique_commande
FOREIGN KEY (historique_commande_id) REFERENCES historique_commande(id_historique_commande);

ALTER TABLE facture
ADD CONSTRAINT fk_facture_commande
FOREIGN KEY (commande_id) REFERENCES commande(id_commande);

ALTER TABLE administrateurs 
ADD CONSTRAINT fk_administrateurs_clients
FOREIGN KEY (clients_id) REFERENCES client(id_client);

ALTER TABLE administrateurs
ADD CONSTRAINT fk_administrateurs_restaurant
FOREIGN KEY (restaurant_id) REFERENCES restaurant(id_restaurant);

ALTER TABLE restaurant
ADD CONSTRAINT fk_restaurant_plats
FOREIGN KEY (plats_id) REFERENCES plats(id_plats);

ALTER TABLE restaurant
ADD CONSTRAINT fk_restaurant_formules
FOREIGN KEY (formules_id) REFERENCES formules(id_formules);

ALTER TABLE restaurant
ADD CONSTRAINT fk_restaurant_formules_periode
FOREIGN KEY (formules_periode_id) REFERENCES formules_periode(id_formules_periode);

ALTER TABLE restaurant
ADD CONSTRAINT fk_restaurant_historique_commande
FOREIGN KEY (historique_commande_id) REFERENCES historique_commande(id_historique_commande);

ALTER TABLE livreur
ADD CONSTRAINT fk_livreur_permis
FOREIGN KEY (permis_id) REFERENCES permis(id_permis);

ALTER TABLE livreur
ADD CONSTRAINT fk_livreur_historique_livraison
FOREIGN KEY (historique_livraison_id) REFERENCES historique_livraison(id_historique_livraison);

ALTER TABLE livreur
ADD CONSTRAINT fk_livreur_commande
FOREIGN KEY (commande_id) REFERENCES commande(id_commande);

ALTER TABLE livreur
ADD CONSTRAINT fk_livreur_accident
FOREIGN KEY (accident_id) REFERENCES accident(id_accident);

ALTER TABLE accident
ADD CONSTRAINT fk_accident_livreur
FOREIGN KEY (livreur_id) REFERENCES livreur(id_livreur);    

ALTER TABLE historique_livraison
ADD CONSTRAINT fk_historique_livraison_commande
FOREIGN KEY (commande_id) REFERENCES commande(id_commande);



-- Requêtes SQL : 

-- Question 1 : 

SELECT article AS plat, COUNT(article) AS nombre_de_commandes
FROM commande
WHERE DATE_FORMAT(date_lvr, '%m-%d') BETWEEN '06-22' AND '09-22'
GROUP BY article
ORDER BY nombre_de_commandes DESC
LIMIT 1;


-- question 2 : 

SELECT f.mode_paiement
FROM client AS c
INNER JOIN commande AS co ON c.commande_id = co.id_commande
INNER JOIN adresse AS a ON co.adresse_id = a.id_adresse
INNER JOIN facture AS f ON co.facture_id = f.commande_id
AND a.adresse LIKE '%Paris%'
LIMIT 1;

-- question 3 : 

SELECT SUBSTRING_INDEX(adr_livraison, ', ', -1) AS ville, COUNT(*) AS nombre_de_commandes
FROM commande
GROUP BY ville
ORDER BY nombre_de_commandes DESC
LIMIT 1;

-- question 4 : 

SELECT nom_restaurant, note_restaurant
FROM restaurant
WHERE note_restaurant = (SELECT MAX(note_restaurant) FROM restaurant);

-- question 5 : 

SELECT AVG(age) AS age_moyen FROM client WHERE adresse LIKE '%Beauvais%';

-- question 6 : 

SELECT l.matricule_livreur,l.nom,l.prenom, COUNT(hl.id_historique_livraison) AS nombre_de_livraisons
FROM livreur l
LEFT JOIN historique_livraison hl ON l.matricule_livreur = hl.matricule_livreur
WHERE YEAR(hl.date_livraison) = 2020 AND MONTH(hl.date_livraison) = 02
GROUP BY l.matricule_livreur, l.nom, l.prenom
ORDER BY nombre_de_livraisons DESC;

-- question 7 : 

SELECT l.matricule_livreur, MAX(l.nom) AS nom, MAX(l.prenom) AS prenom, SUM(CAST(hl.nb_km_parcouru AS DECIMAL(10, 2))) AS total_km_parcourus
FROM livreur l
LEFT JOIN historique_livraison hl ON l.matricule_livreur = hl.matricule_livreur
WHERE YEAR(hl.date_livraison) = 2022
GROUP BY l.matricule_livreur;


-- question 8 : 

SELECT AVG(client.age)
FROM client
JOIN commande ON client.commande_id = commande.id_commande
WHERE YEAR(commande.date_lvr) = 2021;

-- question 9 : 

SELECT c.first_name, c.last_name
FROM client AS c
JOIN commande AS co ON c.commande_id = co.id_commande
WHERE YEAR(co.date_lvr) = 2022
GROUP BY c.id_client
ORDER BY COUNT(co.id_commande) DESC
LIMIT 1;

-- question 10 : 

SELECT c.first_name, c.last_name, SUM(f.montant_par_payeur) AS somme_depensee
FROM client AS c
JOIN facture AS f ON c.id_client = f.commande_id
WHERE f.mode_paiement = 'avoir'
GROUP BY c.id_client
ORDER BY somme_depensee DESC
LIMIT 1;

-- question 11

SELECT 
COUNT(*) AS total_clients, 
SUM(CASE WHEN code_parrainage IS NULL THEN 1 ELSE 0 END) AS clients_non_parraines,
(SUM(CASE WHEN code_parrainage IS NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS pourcentage_clients_non_parraines
FROM client;

