CREATE DATABASE Reservaciones;
USE Reservaciones;

CREATE TABLE Reserva (
	id_reserva INT NOT NULL AUTO_INCREMENT,
    horario VARCHAR(20) NOT NULL,
    horas_reserva INT NOT NULL,
    artista VARCHAR (35),
    distribucion VARCHAR (30),
    precio_total DOUBLE,
    PRIMARY KEY (id_reserva)
);
SELECT * FROM Reserva;

CREATE TABLE Locales (
	id_Locales INT NOT NULL AUTO_INCREMENT,
    disponibilidad VARCHAR (30),
    direccion VARCHAR (70),
    capacidad INT,
    PRIMARY KEY (id_Locales)
);
SELECT * FROM Locales;

CREATE TABLE Equipo (
	id_Equipo INT NOT NULL AUTO_INCREMENT,
    nombre_Equipo VARCHAR (35) NOT NULL,
    PRIMARY KEY (id_Equipo)
);
SELECT * FROM Equipo;

SELECT id_reserva AS ID, CONCAT (nombre_Usuario, ' ', apellido_Usuario) AS Cliente, nombre_Estado AS Estado, horario AS Horario,
		CONCAT(horas_reserva, ' Horas') AS Horas, distribucion, nombre_local AS 'Nombre del Local', direccion ,artista,
		distribucion, CONCAT('$ ', precio_base) AS Precio, nombre_Equipo AS Equipo,
		CONCAT(capacidad, ' Personas') AS Capacidad, 
        
        TIMESTAMPDIFF(HOUR, '00:00:00', hora_fin) AS horas_medianoche,
        IF(hora_inicio <= '06:00:00', ((precio_base * horas_reserva) * 
        (TIMESTAMPDIFF(HOUR, '00:00:00', hora_fin) * 500)), IF(hora_fin >= '00:00:00', (precio_base * horas_reserva), 'Hola')) AS Total, 
		TIMESTAMPDIFF(HOUR, hora_inicio, hora_fin) AS horas_transcurridas
		FROM Reserva RS
        
		INNER JOIN Locales LO ON RS.id_local = LO.id_Locales
		LEFT JOIN Equipo EQ ON LO.id_equipo = EQ.id_Equipo
		INNER JOIN Usuarios US ON RS.id_usuario = US.id_Usuario
		INNER JOIN EstadoReserva ER ON RS.estado_reserva = ER.id_EstadoReserva
        WHERE id_reserva = 7;