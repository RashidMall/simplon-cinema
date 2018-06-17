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
  idSalle INT UNSIGNED,
  CONSTRAINT fk_SalleSiege FOREIGN KEY (idSalle) REFERENCES Salle(id),
  PRIMARY KEY (id)
)ENGINE=InnoDB;
    
CREATE TABLE Ticket(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  idClient INT UNSIGNED,
  idSeance INT UNSIGNED,
  CONSTRAINT fk_ClientTicket FOREIGN KEY (idClient) REFERENCES Client(id),
  CONSTRAINT fk_SeanceTicket FOREIGN KEY (idSeance) REFERENCES Seance(id),
  PRIMARY KEY (id)
)ENGINE=InnoDB;

-- Insert data into the tables
INSERT INTO Client(client_nom, client_prenom, client_date_de_naissance, client_telephone, client_email)
VALUES ("Bergès","Léo","1996-12-10","0655443322","watiwok@hotmail.fr"),
("Bergès", "Arthur", "1995-12-10","0677889900","art31@hotmail.fr"),
("Tomassin", "Bertrand", "1961-10-12","0756789900","gogo@gmail.fr"),
("Daramy","Didier","1961-06-15","0786009614","didier.daramy@yahoo.fr"),
("Julien","Eric","1973-05-06","0755443482","ejulien@hotmail.fr");

INSERT INTO Seance (debut_seance)
VALUES
("18-06-15 10:00:00"),
("18-06-14 12:00:00"),
("18-06-13 15:00:00"),
("18-06-12 19:00:00"),
("18-06-11 22:00:00");

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

INSERT INTO Siege (nom_allee, numero_siege)
VALUES
("A","1"),
("A","2"),
("A","3"),
("A","4"),
("A","5"),
("A","6"),
("A","7"),
("A","8"),
("A","9"),
("A","10"),
("B","1"),
("B","2"),
("B","3"),
("B","4"),
("B","5"),
("B","6"),
("B","7"),
("B","8"),
("B","9"),
("B","10"),
("C","1"),
("C","2"),
("C","3"),
("C","4"),
("C","5"),
("C","6"),
("C","7"),
("C","8"),
("C","9"),
("C","10"),
("D","1"),
("D","2"),
("D","3"),
("D","4"),
("D","5"),
("D","6"),
("D","7"),
("D","8"),
("D","9"),
("D","10"),
("E","1"),
("E","2"),
("E","3"),
("E","4"),
("E","5"),
("E","6"),
("E","7"),
("E","8"),
("E","9"),
("E","10");