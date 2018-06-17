-- SELECT * FROM Salle

--    Comment récupérer la liste des clients?
 SELECT client_nom, client_prenom FROM Client

--    Comment récupérer la liste des films?
SELECT film_titre FROM Film

--    Comment récupérer la liste des clients qui ont vu un film donné?
SELECT Client.id, client_nom, client_prenom, film_titre FROM Client
	INNER JOIN Ticket
		ON Client.id = Ticket.idClient
	INNER JOIN Seance
    	ON Ticket.idSeance = Seance.id
    INNER JOIN Film
    	ON Seance.idFilm = Film.id
WHERE film_titre = "Avengers";

--    Comment récupérer la liste des clients qui ont vu un film cette semaine?
SELECT Client.id, client_nom, client_prenom, film_titre FROM Client
	INNER JOIN Ticket
		ON Client.id = Ticket.idClient
	INNER JOIN Seance
    	ON Ticket.idSeance = Seance.id
    INNER JOIN Film
    	ON Seance.idFilm = Film.id
WHERE film_titre = "Avengers" AND debut_seance BETWEEN "18-06-11" AND "18-06-18";

--    Comment savoir si une salle est pleine?
SELECT * FROM Ticket
	RIGHT JOIN Siege
		ON Ticket.idSiege = Siege.id
WHERE idSalle = 1 AND (idSiege IS NULL OR idSeance != 1);
