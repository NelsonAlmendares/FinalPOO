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
