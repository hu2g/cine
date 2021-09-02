use cine;

-- Peliculas en cartelera
CREATE OR ALTER PROCEDURE GET_CARTELERA 
AS
BEGIN
	SELECT DISTINCT M.id_movie, M.name, M.description
	FROM Functionc FC, Movie M
	WHERE FC.time >= GETDATE()
	AND FC.Movie_id_movie = M.id_movie;
END;
EXECUTE GET_CARTELERA;


-- Informacion una la funcion en base al id de la pelicula
CREATE OR ALTER PROCEDURE FUNCTION_DETAIL (@ID_MOVIE INTEGER)
AS
BEGIN
	SELECT F.id_functionC, F.time, F.Movie_id_movie, F.Type_Function_id_typefunction, TF.name
	FROM Functionc F, Type_Function TF
	WHERE F.Movie_id_movie = @ID_MOVIE
	AND F.Type_Function_id_typefunction = TF.id_typefunction;
END;
EXECUTE FUNCTION_DETAIL 9;


-- Asientos ocupados en la funcion
CREATE OR ALTER PROCEDURE OCCUPIED_SEATS (@ID_FUNCTION INTEGER)
AS
BEGIN
	SELECT S.id_seat, S.row, S."column", F.Cinema_id_cinema 
	FROM Seat S, Functionc F, Ticket T
	WHERE F.id_functionC = @ID_FUNCTION
	AND F.id_functionC = T.Functionc_id_functionC
	AND T.Seat_id_seat = S.id_seat;
END;
EXECUTE OCCUPIED_SEATS 2;


-- Todos los Asientos en la sala
CREATE OR ALTER PROCEDURE ALL_SEAT_CINEMA (@ID_CINEMA INTEGER)
AS
BEGIN
	SELECT S.id_seat, S.row, S."column" 
	FROM Seat S
	WHERE S.Cinema_id_cinema = @ID_CINEMA;
END;
EXEC ALL_SEAT_CINEMA 3;

