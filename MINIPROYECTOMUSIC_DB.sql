-- ==================================================
-- CREACIÓN DE BASE DE DATOS: Plataforma de Streaming
-- ==================================================

DROP DATABASE IF EXISTS streaming_musical;
CREATE DATABASE streaming_musical;
USE streaming_musical;

-- ===================
-- TABLA: Usuarios
-- ===================
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    pais VARCHAR(50),
    fecha_registro DATE
);

INSERT INTO usuarios (nombre, email, pais, fecha_registro) VALUES
('Ana López', 'ana@example.com', 'México', '2022-01-10'),
('Carlos Ruiz', 'carlos@example.com', 'España', '2022-02-14'),
('María Gómez', 'maria@example.com', 'Colombia', '2021-12-01'),
('Pedro Sánchez', 'pedro@example.com', 'México', '2022-05-03'),
('Lucía Torres', 'lucia@example.com', 'Argentina', '2022-06-12'),
('Diego Ramírez', 'diego@example.com', 'Chile', '2022-03-08'),
('Elena Fernández', 'elena@example.com', 'Perú', '2022-07-19'),
('Jorge Medina', 'jorge@example.com', 'España', '2021-11-25'),
('Paula Herrera', 'paula@example.com', 'México', '2022-04-17'),
('Luis Martínez', 'luis@example.com', 'Argentina', '2022-08-09'),
('Sofía Díaz', 'sofia@example.com', 'Colombia', '2022-02-27'),
('Fernando Castro', 'fernando@example.com', 'Chile', '2022-09-01'),
('Marta Jiménez', 'marta@example.com', 'Perú', '2022-01-30'),
('Ricardo Romero', 'ricardo@example.com', 'España', '2022-10-10'),
('Camila Silva', 'camila@example.com', 'México', '2022-03-15');

-- ===================
-- TABLA: Planes
-- ===================
CREATE TABLE planes (
    id_plan INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(6,2),
    descripcion VARCHAR(255)
);

INSERT INTO planes (nombre, precio, descripcion) VALUES
('Gratis', 0.00, 'Plan básico con anuncios'),
('Individual', 9.99, 'Plan premium individual sin anuncios'),
('Duo', 12.99, 'Plan para dos personas'),
('Familiar', 14.99, 'Hasta 6 cuentas premium'),
('Estudiante', 4.99, 'Descuento especial para estudiantes'),
('Pro', 19.99, 'Acceso anticipado a lanzamientos'),
('VIP', 29.99, 'Experiencia completa con beneficios exclusivos');

-- ===================
-- TABLA: Suscripciones
-- ===================
CREATE TABLE suscripciones (
    id_suscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_plan INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(20),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_plan) REFERENCES planes(id_plan)
);

INSERT INTO suscripciones (id_usuario, id_plan, fecha_inicio, fecha_fin, estado) VALUES
(1, 2, '2022-01-10', '2023-01-10', 'Activa'),
(2, 1, '2022-02-14', NULL, 'Activa'),
(3, 3, '2021-12-01', '2022-12-01', 'Vencida'),
(4, 5, '2022-05-03', '2023-05-03', 'Activa'),
(5, 2, '2022-06-12', '2023-06-12', 'Activa'),
(6, 4, '2022-03-08', '2023-03-08', 'Activa'),
(7, 6, '2022-07-19', '2023-07-19', 'Activa'),
(8, 2, '2021-11-25', '2022-11-25', 'Vencida'),
(9, 1, '2022-04-17', NULL, 'Activa'),
(10, 3, '2022-08-09', '2023-08-09', 'Activa'),
(11, 5, '2022-02-27', '2023-02-27', 'Activa'),
(12, 7, '2022-09-01', '2023-09-01', 'Activa'),
(13, 2, '2022-01-30', '2023-01-30', 'Activa'),
(14, 1, '2022-10-10', NULL, 'Activa'),
(15, 4, '2022-03-15', '2023-03-15', 'Activa');

-- ===================
-- TABLA: Artistas
-- ===================
CREATE TABLE artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    pais VARCHAR(50),
    genero VARCHAR(50)
);

INSERT INTO artistas (nombre, pais, genero) VALUES
('Shakira', 'Colombia', 'Pop'),
('Bad Bunny', 'Puerto Rico', 'Reguetón'),
('Dua Lipa', 'Reino Unido', 'Pop'),
('Coldplay', 'Reino Unido', 'Rock'),
('Maluma', 'Colombia', 'Reguetón'),
('Adele', 'Reino Unido', 'Soul'),
('BTS', 'Corea del Sur', 'K-Pop'),
('Karol G', 'Colombia', 'Reguetón'),
('Ed Sheeran', 'Reino Unido', 'Pop'),
('Taylor Swift', 'EEUU', 'Pop'),
('Rosalía', 'España', 'Flamenco Urbano'),
('The Weeknd', 'Canadá', 'R&B'),
('Maná', 'México', 'Rock'),
('Daddy Yankee', 'Puerto Rico', 'Reguetón'),
('Camila Cabello', 'Cuba', 'Pop');

-- ===================
-- TABLA: Álbumes
-- ===================
CREATE TABLE albumes (
    id_album INT AUTO_INCREMENT PRIMARY KEY,
    id_artista INT,
    titulo VARCHAR(100),
    fecha_lanzamiento DATE,
    genero VARCHAR(50),
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
);

INSERT INTO albumes (id_artista, titulo, fecha_lanzamiento, genero) VALUES
(1, 'Laundry Service', '2001-11-13', 'Pop'),
(2, 'YHLQMDLG', '2020-02-29', 'Reguetón'),
(3, 'Future Nostalgia', '2020-03-27', 'Pop'),
(4, 'Parachutes', '2000-07-10', 'Rock'),
(5, 'F.A.M.E.', '2018-05-18', 'Reguetón'),
(6, '25', '2015-11-20', 'Soul'),
(7, 'Map of the Soul: 7', '2020-02-21', 'K-Pop'),
(8, 'KG0516', '2021-03-25', 'Reguetón'),
(9, 'Divide', '2017-03-03', 'Pop'),
(10, '1989', '2014-10-27', 'Pop'),
(11, 'El Mal Querer', '2018-11-02', 'Flamenco Urbano'),
(12, 'After Hours', '2020-03-20', 'R&B'),
(13, 'Sueños Líquidos', '1997-10-14', 'Rock'),
(14, 'Barrio Fino', '2004-07-13', 'Reguetón'),
(15, 'Camila', '2018-01-12', 'Pop');

-- ===================
-- TABLA: Canciones
-- ===================
CREATE TABLE canciones (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    id_album INT,
    titulo VARCHAR(100),
    duracion TIME,
    reproducciones INT,
    FOREIGN KEY (id_album) REFERENCES albumes(id_album)
);

INSERT INTO canciones (id_album, titulo, duracion, reproducciones) VALUES
(1, 'Whenever, Wherever', '00:03:17', 500000),
(2, 'Safaera', '00:04:56', 1200000),
(3, 'Don’t Start Now', '00:03:03', 900000),
(4, 'Yellow', '00:04:29', 800000),
(5, 'Felices los 4', '00:03:49', 600000),
(6, 'Hello', '00:04:55', 1500000),
(7, 'ON', '00:04:06', 2000000),
(8, 'Bichota', '00:03:05', 1100000),
(9, 'Shape of You', '00:03:53', 3000000),
(10, 'Blank Space', '00:03:51', 2200000),
(11, 'Malamente', '00:02:29', 700000),
(12, 'Blinding Lights', '00:03:20', 3500000),
(13, 'Clavado en un Bar', '00:04:36', 400000),
(14, 'Gasolina', '00:03:12', 2500000),
(15, 'Havana', '00:03:37', 1800000);

-- ===================
-- TABLA: Playlists
-- ===================
CREATE TABLE playlists (
    id_playlist INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    nombre VARCHAR(100),
    fecha_creacion DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO playlists (id_usuario, nombre, fecha_creacion) VALUES
(1, 'Favoritas de Ana', '2022-02-01'),
(2, 'Reguetón Mix', '2022-03-01'),
(3, 'Clásicos de María', '2022-01-15'),
(4, 'Pedro Rock', '2022-05-10'),
(5, 'Lucía Chill', '2022-06-20'),
(6, 'Diego Party', '2022-03-20'),
(7, 'Elena Soul', '2022-07-25'),
(8, 'Lo mejor de Jorge', '2021-12-01'),
(9, 'Paula Mix', '2022-04-25'),
(10, 'Luis Workout', '2022-08-15'),
(11, 'Sofía Pop', '2022-03-05'),
(12, 'Fernando Vibes', '2022-09-10'),
(13, 'Marta Relax', '2022-02-10'),
(14, 'Ricardo Éxitos', '2022-10-15'),
(15, 'Camila Latina', '2022-03-20');

-- ===================
-- TABLA: Historial de Reproducción
-- ===================
CREATE TABLE historial_reproduccion (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_cancion INT,
    fecha_reproduccion DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion)
);

INSERT INTO historial_reproduccion (id_usuario, id_cancion, fecha_reproduccion) VALUES
(1, 9, '2022-02-01'),
(2, 14, '2022-03-02'),
(3, 6, '2022-01-16'),
(4, 4, '2022-05-11'),
(5, 8, '2022-06-21'),
(6, 2, '2022-03-21'),
(7, 12, '2022-07-26'),
(8, 13, '2021-12-02'),
(9, 15, '2022-04-26'),
(10, 10, '2022-08-16'),
(11, 3, '2022-03-06'),
(12, 7, '2022-09-11'),
(13, 1, '2022-02-11'),
(14, 11, '2022-10-16'),
(15, 5, '2022-03-21');

-- ===================
-- TABLA: Likes
-- ===================
CREATE TABLE likes (
    id_like INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_cancion INT,
    fecha_like DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion)
);

INSERT INTO likes (id_usuario, id_cancion, fecha_like) VALUES
(1, 12, '2022-02-02'),
(2, 9, '2022-03-03'),
(3, 6, '2022-01-17'),
(4, 14, '2022-05-12'),
(5, 8, '2022-06-22'),
(6, 2, '2022-03-22'),
(7, 7, '2022-07-27'),
(8, 13, '2021-12-03'),
(9, 15, '2022-04-27'),
(10, 10, '2022-08-17'),
(11, 3, '2022-03-07'),
(12, 5, '2022-09-12'),
(13, 1, '2022-02-12'),
(14, 11, '2022-10-17'),
(15, 4, '2022-03-22');

-- ===================
-- TABLA INTERMEDIA: Playlist ↔ Canciones
-- ===================
CREATE TABLE playlist_canciones (
  id_playlist INT NOT NULL,
  id_cancion  INT NOT NULL,
  fecha_agregado DATE NOT NULL,
  PRIMARY KEY (id_playlist, id_cancion),
  FOREIGN KEY (id_playlist) REFERENCES playlists(id_playlist),
  FOREIGN KEY (id_cancion)  REFERENCES canciones(id_cancion)
);

INSERT INTO playlist_canciones (id_playlist, id_cancion, fecha_agregado) VALUES
(1, 9,  '2022-02-01'),
(1, 12, '2022-02-02'),
(1, 3,  '2022-02-03'),
(2, 2,  '2022-03-02'),
(2, 8,  '2022-03-03'),
(2, 14, '2022-03-04'),
(3, 6,  '2022-01-16'),
(3, 1,  '2022-01-17'),
(4, 4,  '2022-05-11'),
(4, 13, '2022-05-12'),
(5, 8,  '2022-06-21'),
(5, 5,  '2022-06-22'),
(6, 2,  '2022-03-21'),
(6, 7,  '2022-03-22'),
(7, 12, '2022-07-26'),
(7, 6,  '2022-07-27'),
(8, 13, '2021-12-02'),
(8, 4,  '2021-12-03'),
(9, 15, '2022-04-26'),
(9, 9,  '2022-04-27'),
(10, 10,'2022-08-16'),
(10, 14,'2022-08-17'),
(11, 3, '2022-03-06'),
(11, 10,'2022-03-07'),
(12, 7, '2022-09-11'),
(12, 5, '2022-09-12'),
(13, 1, '2022-02-11'),
(13, 11,'2022-02-12'),
(14, 11,'2022-10-16'),
(14, 12,'2022-10-17'),
(15, 5, '2022-03-21'),
(15, 15,'2022-03-22');


SELECT * FROM albumes;
SELECT * FROM artistas;
SELECT * FROM canciones; 
SELECT * FROM historial_reproduccion;
SELECT * FROM likes;
SELECT * FROM planes;
SELECT * FROM planes;
SELECT * FROM playlists;
SELECT * FROM suscripciones;
SELECT * FROM usuarios;
