CREATE schema musicview;

USE musicview;

CREATE TABLE usuario (
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(200) NOT NULL,
email VARCHAR(200) NOT NULL,
contraseña VARCHAR(250) NOT NULL,
fecha_usuario TIMESTAMP NOT NULL
);

INSERT INTO usuario (nombre, email, contraseña, fecha_usuario) VALUES
('Juan Pérez', 'juanp@gmail.com', '1234', '2024-01-01 10:00:00'),
('María Gómez', 'mariag@gmail.com', 'abcd', '2023-05-05 15:10:00'),
('Carlos López', 'carlosl@gmail.com', '4567', '2024-02-01 22:35:00'),
('Ana Torres', 'anatorres@gmail.com', 'pass1',  '2024-01-03 15:45:00'),
('Pedro Sánchez', 'pedros@gmail.com', 'contraseña', '2023-12-30 11:25:00'),
('Elena Ruiz', 'elena.ruiz@gmail.com', 'segura', '2024-07-29 20:15:00'),
('Roberto Díaz', 'robertd@gmail.com', 'clave123', '2023-01-25 17:00:00'),
('Laura Fernández', 'laura.fz@gmail.com', 'passwrd', '2024-03-28 20:33:00'),
('Sofía Martín', 'sofia.martin@gmail.com', 'sofia123', '2023-11-15 08:30:00' ),
('David Castro', 'davidc@gmail.com', 'cat1985', '2024-11-27 12:54:00');

CREATE TABLE artista (
id_artista INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (200) NOT NULL,
nacionalidad VARCHAR (100),
fecha_nacimiento DATE,
description TEXT
); 

INSERT INTO artista (nombre, nacionalidad, fecha_nacimiento, description) VALUES
('The Beatles', 'Reino Unido', '1960-01-01', 'Banda de rock icónica de Liverpool, con influencia en múltiples generos musicales y una gran cantidad de éxitos.'),
('Queen', 'Reino Unido', '1970-01-01', 'Banda britanica de rock formada en 1970 en Londres. Se caracterizó por su estilo único, su experimentación con otros géneros y sus conciertos llamativos'),
(' The Rolling Stones', 'Reino Unido', '1962-01-01', 'Banda de rock, considerada una de las más grandes e influyentes de la historia del rock.'),
('Donny Hathaway', 'EE.UU', '1945-10-01', 'Cantante, pianista, compositor, teclista, corista y arreglista estadounidense de soul.'),
('Kendrick Lamar', 'EE.UU', '1987-06-17', 'Rapero, compositor y productor estadounidense, considerado uno de los mejores raperos de su generación y uno de los artistas más influyentes de la música contemporánea'),
('Frank Ocean', 'EE.UU.', '1987-10-28', 'Cantautor estadounidense conocido por su estilo vanguardista y sus letras introspectivas.'),
('Amy Winehouse', 'Reino Unido', '1983-09-14', 'Cantante, compositora y multiinstrumentista británica. Se la conoce por su voz de contralto y su estilo ecléctico, que incluía jazz, R&B, soul y ritmos caribeños.'),
('Daft Punk', 'Francia', '1993-01-01', 'Dúo francés de música electrónica formado por Thomas Bangalter y Guy-Manuel de Homem-Christo'),
('Eminem', 'EE.UU.', '1972-10-17', 'Rapero, productor discográfico, actor y compositor estadounidense. Es considerado uno de los raperos más exitosos de todos los tiempos.'),
('Beyoncé', 'EE.UU.', '1981-09-04', 'Cantante, compositora, bailarina, actriz, productora, empresaria y directora estadounidense. Es considerada un icono pop del siglo XXI.');

CREATE TABLE album (
id_album INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR (200) NOT NULL,
id_artista INT NOT NULL, 
año INT NOT NULL,
duracion INT,
description TEXT,
puntuacion_promedio DECIMAL CHECK (puntuacion_promedio BETWEEN 1 AND 10)
);

INSERT INTO album (titulo, id_artista, año, duracion, description, puntuacion_promedio) VALUES
('Abbey Road', 1, 1969, 47, 'Último álbum de The Beatles.', 9.5),
('A Night at the Opera', 2, 1975, 43, 'Incluye Bohemian Rhapsody.', 9.3),
('Let It Bleed', 3, 1969, 42, 'Octavo Album de la banda The Rolling Stones.', 9.1),
('Extension of A Man', 4, 1973, 43, 'Ultimo Album de Donny Hathaway en solitario.', 8.7),
('To Pimp A Butterfly', 5, 2015, 78, 'Tercer Album de Kendrick Lamar.', 9.5),
('Blond', 6, 2016, 60, 'Tercer album de Fran Ocean y el mas exitoso.', 9.2),
('Frank', 7, 2003, 58, 'Primer Album de Amy winehouse.', 8.6),
('Discovery', 8, 2001, 60, 'Clásico de la electrónica.', 9.0),
('The Eminem Show', 9, 2002, 77, 'Uno de los mejores álbumes de Eminem.', 8.8),
('Lemonade', 10, 2016, 45, 'Álbum visual de Beyoncé.', 9.4);

CREATE TABLE genero (
id_generos INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (100) NOT NULL
);

INSERT INTO genero (nombre) VALUES
('Rock'),
('Pop'),
('Hip Hop'),
('R&B'),
('Electrónica'),
('Latino'),
('Indie'),
('Jazz'),
('Metal'),
('Reggae');

CREATE TABLE reseña (
id_reseña INT PRIMARY KEY AUTO_INCREMENT,
id_usuario INT NOT NULL,
id_album INT NOT NULL,
puntuacion INT CHECK (puntuacion BETWEEN 1 AND 10),
description TEXT, 
fecha TIMESTAMP
);

INSERT INTO reseña (id_usuario, id_album, puntuacion, description) VALUES
(1, 1, 10, 'Un clasico atemporal.'),
(2, 2, 9, 'Bohemian Rhapsody es increible.'),
(3, 3, 8, 'El mejor Album de los Stones.'),
(4, 4, 10, 'Donny Hathaway es un artista infravalorado.'),
(5, 5, 9, 'Un Album que te deja pensando.'),
(6, 6, 10, 'Todas las canciones de este Album son un 10.'),
(7, 7, 8, 'Amy en su momento mas talentoso.'),
(8, 8, 9, 'Daft Punk redefiniendo la música.'),
(9, 9, 9, 'Eminem en su peak.'),
(10, 10, 10, 'Una obra de arte.');

CREATE TABLE lista (
id_lista INT PRIMARY KEY AUTO_INCREMENT,
id_usuario INT NOT NULL,
nombre VARCHAR(150) NOT NULL,
description TEXT,
fecha_de_creacion TIMESTAMP
);

INSERT INTO lista (id_usuario, nombre, description) VALUES
(1, 'Favoritos de Rock', 'Los mas escuchados.'),
(2, 'Clásicos del Pop', 'Pop de los 80s, 90s y 2000s.'),
(3, 'Rap Latino', 'Los mejores álbumes de hip-hop.'),
(4, 'Música LoFi', 'Relajante e inspiradora.'),
(5, 'Fiesta House', 'Reggaetón, salsa y más.'),
(6, 'Indie vibes', 'Canciones emotivas.'),
(7, 'Música electrónica', 'Desde Daft Punk hasta lo más reciente.'),
(8, 'Lo mejor de Beyoncé', 'Hits de los 2010s.'),
(9, 'Baladas y más', 'Nostalgia.'),
(10, 'Metal Forever', 'Lo mejor del metal.');

ALTER TABLE album ADD CONSTRAINT fk_album_artista 
FOREIGN KEY (id_artista) REFERENCES artista (id_artista);

ALTER TABLE reseña ADD CONSTRAINT fk_reseña_usuario 
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);

ALTER TABLE reseña ADD CONSTRAINT fk_reseña_album
FOREIGN KEY (id_album) REFERENCES album (id_album);

ALTER TABLE lista ADD CONSTRAINT fk_lista_usuario
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);

CREATE VIEW vw_album_artista AS
SELECT Album.titulo, Artista.nombre AS artista, Album.año, Album.puntuacion_promedio
FROM Album
JOIN Artista ON Album.id_artista = Artista.id_artista;

CREATE VIEW vw_reseña_usuario AS
SELECT Usuario.nombre AS usuario, Album.titulo AS album, Reseña.puntuacion
FROM Reseña
JOIN Usuario ON Reseña.id_usuario = Usuario.id_usuario
JOIN Album ON Reseña.id_album = Album.id_album;

CREATE VIEW vw_usuario_album_puntuacion AS
SELECT Usuario.nombre AS usuario, Album.titulo AS album, Reseña.puntuacion
FROM Reseña
JOIN Usuario ON Reseña.id_usuario = Usuario.id_usuario
JOIN Album ON Reseña.id_album = Album.id_album;

DELIMITER //
CREATE FUNCTION fn_puntuacion_promedio_album(album_id INT) RETURNS DECIMAL(3,1) DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(3,1);
    SELECT AVG(puntuacion) INTO promedio FROM Reseña WHERE id_album = album_id;
    RETURN IFNULL(promedio, 0);
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION fn_total_reseña_usuario(usuario_id INT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM Reseña WHERE id_usuario = usuario_id;
    RETURN total;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION fn_album_mas_puntuado() RETURNS VARCHAR(200) DETERMINISTIC
BEGIN
    DECLARE album_max VARCHAR(200);
    SELECT titulo INTO album_max FROM Album ORDER BY puntuacion_promedio DESC LIMIT 1;
    RETURN album_max;
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE Obtener_Albumes_De_Artista(IN artista_id INT)
BEGIN
    SELECT a.titulo, a.año, a.duracion, a.description, a.puntuacion_promedio
    FROM album a
    WHERE a.id_artista = artista_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE Obtener_Reseñas_De_Usuario(IN usuario_id INT)
BEGIN
    SELECT r.puntuacion, r.description, r.fecha, al.titulo AS album
    FROM reseña r
    JOIN album al ON r.id_album = al.id_album
    WHERE r.id_usuario = usuario_id;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER actualizar_fecha_usuario
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
    IF NEW.fecha_usuario IS NULL THEN
        SET NEW.fecha_usuario = NOW();
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER actualizar_puntuacion_promedio
AFTER INSERT ON reseña
FOR EACH ROW
BEGIN
    DECLARE nuevo_promedio DECIMAL(3,2);
    
    -- Calcular el nuevo promedio
    SELECT AVG(puntuacion) INTO nuevo_promedio
    FROM reseña
    WHERE id_album = NEW.id_album;
    
    -- Actualizar el álbum con el nuevo promedio
    UPDATE album
    SET puntuacion_promedio = nuevo_promedio
    WHERE id_album = NEW.id_album;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER eliminar_reseñas_tras_eliminar_album
AFTER DELETE ON album
FOR EACH ROW
BEGIN
    DELETE FROM reseña
    WHERE id_album = OLD.id_album;
END //

DELIMITER ;






