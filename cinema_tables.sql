-- CREATE DATABASE cinema CHARACTER SET 'utf8';
set foreign_key_checks=0;

CREATE TABLE Client(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  client_nom VARCHAR(20) NOT NULL,
  client_prenom VARCHAR(20) NOT NULL,
  client_date_de_naissance DATE,
  client_telephone CHAR(10),
  client_email VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
  )ENGINE=InnoDB;
   
CREATE TABLE Seance(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  debut_seance DATETIME,
  idFilm INT UNSIGNED,
  idSalle INT UNSIGNED,
  CONSTRAINT fk_FilmSeance FOREIGN KEY (idFilm) REFERENCES Film(id),
  CONSTRAINT fk_SalleSeance FOREIGN KEY (idSalle) REFERENCES Salle(id),
  PRIMARY KEY (id)
   )ENGINE=InnoDB;
   
CREATE TABLE Film(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  film_titre VARCHAR(30),
  film_duree TIME,
  salle VARCHAR(20), -- à revoir
  film_genre VARCHAR(50),
  film_realisateur VARCHAR(30),
  film_annee_sortie YEAR,
  film_description VARCHAR(100),
  PRIMARY KEY (id)
  )ENGINE=InnoDB;
  
CREATE TABLE Salle(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  salle_numero CHAR(10),
  salle_nombre_sieges SMALLINT,
  PRIMARY KEY (id)
   )ENGINE=InnoDB;
   
CREATE TABLE Siege(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nom_allee CHAR(2),
  numero_siege CHAR(3),
  siege_disponible BIT,
  idSalle INT UNSIGNED,
  CONSTRAINT fk_SalleSiege FOREIGN KEY (idSalle) REFERENCES Salle(id),
  PRIMARY KEY (id)
)ENGINE=InnoDB;
    
CREATE TABLE Ticket(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  idClient INT UNSIGNED,
  idSeance INT UNSIGNED,
  idSiege INT UNSIGNED,
  CONSTRAINT fk_ClientTicket FOREIGN KEY (idClient) REFERENCES Client(id),
  CONSTRAINT fk_SeanceTicket FOREIGN KEY (idSeance) REFERENCES Seance(id),
  CONSTRAINT fk_SiegeTicket FOREIGN KEY (idSiege) REFERENCES Siege(id),
  PRIMARY KEY (id)
)ENGINE=InnoDB;


-- Insert data into the tables
INSERT INTO Client(client_nom, client_prenom, client_date_de_naissance, client_telephone, client_email)
VALUES ("Bergès","Léo","1996-12-10","0655443322","watiwok@hotmail.fr"),
("Bergès", "Arthur", "1995-12-10","0677889900","art31@hotmail.fr"),
("Tomassin", "Bertrand", "1961-10-12","0756789900","gogo@gmail.fr"),
("Daramy","Didier","1961-06-15","0786009614","didier.daramy@yahoo.fr"),
("Julien","Eric","1973-05-06","0755443482","ejulien@hotmail.fr");

INSERT INTO Ticket(idClient, idSeance, idSiege)
VALUES (1, 1, 1),
(2, 1, 5),
(3, 1, 8),
(4, 2, 3),
(5, 2, 1);

INSERT INTO Seance (debut_seance, idFilm, idSalle)
VALUES
("18-06-15 10:00:00", 1, 1),
("18-06-14 12:00:00", 2, 1),
("18-06-13 15:00:00", 3, 1),
("18-06-12 19:00:00", 4, 1),
("18-06-11 22:00:00", 1, 1);

INSERT INTO Film (film_titre, film_duree, salle, film_genre, film_realisateur, film_annee_sortie)
VALUES
("Avengers","1:55","1","Fantasy","Antony Russo","2018"),
("Solo","2:15","2","Science Fiction","Ron Howard","2018"),
("les indestructibles 2","2:05","3","Science fiction Action","Brad Bird","2018"),
("Tomb Raider","2:30","4","Aventure","Roar Uthaug","2018"),
("Oceans 8", "2:00","5","Policier","Garry Ross","2018");

INSERT INTO Salle (salle_numero, salle_nombre_sieges)
VALUES
("1","230"),
("2","200"),
("3","180"),
("4","230"),
("5","200");

INSERT INTO Siege (nom_allee, numero_siege, idSalle)
VALUES
("A","1", 1),
("A","2", 1),
("A","3", 1),
("A","4", 1),
("A","5", 1),
("A","6", 1),
("A","7", 1),
("A","8", 1),
("A","9", 1),
("A","10", 1),
("B","1", 1),
("B","2", 1),
("B","3", 1),
("B","4", 1),
("B","5", 1),
("B","6", 1),
("B","7", 1),
("B","8", 1),
("B","9", 1),
("B","10", 1),
("C","1", 1),
("C","2", 1),
("C","3", 1),
("C","4", 1),
("C","5", 1),
("C","6", 1),
("C","7", 1),
("C","8", 1),
("C","9", 1),
("C","10", 1),
("D","1", 1),
("D","2", 1),
("D","3", 1),
("D","4", 1),
("D","5", 1),
("D","6", 1),
("D","7", 1),
("D","8", 1),
("D","9", 1),
("D","10", 1),
("E","1", 1),
("E","2", 1),
("E","3", 1),
("E","4", 1),
("E","5", 1),
("E","6", 1),
("E","7", 1),
("E","8", 1),
("E","9", 1),
("E","10", 1);
