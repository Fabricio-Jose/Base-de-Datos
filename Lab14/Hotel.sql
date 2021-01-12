CREATE DATABASE Hotel;
DROP DATABASE Hotel
USE Hotel;

CREATE TABLE Hotel (
	Codigo INTEGER PRIMARY KEY,
    Nombre VARCHAR(50),
    Direccion VARCHAR(50),
    Codigo_Departamento INTEGER
);

CREATE TABLE Departamento(
	Codigo INTEGER PRIMARY KEY,
    Nombre VARCHAR(50)
);

CREATE TABLE Cuarto(
	Piso INTEGER,
    Numero INTEGER,
    Numero_camas INTEGER,
    Valor_dia INTEGER,
    Amenidades Varchar(30),
    Codigo_hotel INTEGER,
    PRIMARY KEY (Piso, Numero)
);

CREATE TABLE Estandar(
	Piso INTEGER,
    Numero INTEGER,
    PRIMARY KEY (Piso, Numero)
);

CREATE TABLE Lujo(
	Piso INTEGER,
    Numero INTEGER,
    Tarifa_anticipada INTEGER,
    PRIMARY KEY (Piso, Numero)
);

CREATE TABLE SuperLujo(
	Piso INTEGER,
    Numero INTEGER,
    Tarifa_anticipada INTEGER,
    Balcon_privado BOOL,
    PRIMARY KEY (Piso, Numero)
);

CREATE TABLE Huesped(
	Codigo_hotel INTEGER PRIMARY KEY,
    Nombres VARCHAR(50),
    Primer_apellido VARCHAR(50),
    Segundo_apellido VARCHAR(50),
    Correo_electronico VARCHAR(50)
);

CREATE TABLE Extranjero(
	Codigo_hotel INTEGER,
    Pasaporte VARCHAR(50),
    Pais_procedencia VARCHAR(50),
    PRIMARY KEY (Codigo_hotel, Pasaporte)
    );

CREATE TABLE Nacional(
	Codigo_hotel INTEGER,
    DNI INTEGER,
    PRIMARY KEY (Codigo_hotel, DNI)
);

CREATE TABLE Cuarto_Huesped_reservado(
	Piso INTEGER,
    Numero INTEGER,
    Codigo_hotel INTEGER,
    Fecha_inicio DATE,
    Cantidad_dias INTEGER,
    Fecha_reserva DATE,
    PRIMARY KEY (Piso, Numero, Codigo_hotel)
);

CREATE TABLE Cuarto_Huesped_alquilado(
	Piso INTEGER,
    Numero INTEGER,
    Codigo_hotel INTEGER,
    Fecha_entrada DATE,
    Hora_entrada INTEGER,
    Hora_salida INTEGER,
    Valor_pagado INTEGER,
    PRIMARY KEY (Piso, Numero, Codigo_hotel)
);


SELECT * FROM Hotel
SELECT * FROM Departamento
SELECT * FROM Cuarto
SELECT * FROM Estandar
SELECT * FROM Lujo
SELECT * FROM SuperLujo
SELECT * FROM Huesped
SELECT * FROM Extranjero
SELECT * FROM Nacional
SELECT * FROM Cuarto_Huesped_reservado
SELECT * FROM Cuarto_Huesped_alquilado

INSERT INTO Hotel VALUES(1, "HOTEL 1", "Av. Los Girasoles 140", 1);
INSERT INTO Hotel VALUES(2, "HOTEL 2", "Av. Los Tulipanes 420", 2);
INSERT INTO Hotel VALUES(3, "HOTEL 3", "Av. LAS Orquideas 220", 1);

INSERT INTO Departamento VALUES(1, "Arequipa");
INSERT INTO Departamento VALUES(2, "Lima");

INSERT INTO Cuarto VALUES(1, 101, 2, 50, "TV", 1);
INSERT INTO Cuarto VALUES(2, 201, 1, 40, "TV", 1);
INSERT INTO Cuarto VALUES(3, 301, 1, 60, "JACUSSI", 1);
INSERT INTO Cuarto VALUES(1, 11, 2, 50, "TV", 2);
INSERT INTO Cuarto VALUES(2, 21, 1, 40, "TV", 2);
INSERT INTO Cuarto VALUES(3, 31, 1, 70, "JACUSSI", 2);

INSERT INTO Estandar VALUES(1, 101);
INSERT INTO Estandar VALUES(1, 11);
INSERT INTO Lujo VALUES(2, 201, 20);
INSERT INTO Lujo VALUES(2, 21, 20);
INSERT INTO SuperLujo VALUES(3, 301, 20, TRUE);
INSERT INTO SuperLujo VALUES(3, 31, 20, FALSE);

INSERT INTO Huesped VALUES(1, "Julio", "Galvez", "Montenegro", "julio@gmail.com");
INSERT INTO Huesped VALUES(2, "Gabriel", "Roman", "Flores", "gabriel@gmail.com");
INSERT INTO Huesped VALUES(3, "Adrian", "Alvarez", "Salas", "adrian@gmail.com");
INSERT INTO Huesped VALUES(4, "Roberto", "Ordoñez", "Chavez", "roberto@gmail.com");
INSERT INTO Huesped VALUES(5, "Francisco", "Ferro", "Nuñez", "francisco@gmail.com");
INSERT INTO Huesped VALUES(6, "Rodrigo", "Parravidino", "Arroé", "rodrigo@gmail.com");

INSERT INTO Extranjero VALUES(1, 103201526, "Colombia");
INSERT INTO Extranjero VALUES(2, 205241554, "Bolivia");
INSERT INTO Extranjero VALUES(2, 303251576, "Brasil");

INSERT INTO Nacional VALUES(1, 74477884);
INSERT INTO Nacional VALUES(1, 35599874);
INSERT INTO Nacional VALUES(2, 48874599);

INSERT INTO Cuarto_Huesped_reservado VALUES(1, 101, 1, "18-12-20", 5, "15-12-20");
INSERT INTO Cuarto_Huesped_reservado VALUES(2, 201, 1, "15-12-20", 5, "11-12-20");
INSERT INTO Cuarto_Huesped_reservado VALUES(3, 301, 1, "14-12-20", 5, "10-12-20");
INSERT INTO Cuarto_Huesped_reservado VALUES(1, 11, 2, "18-12-20", 5, "16-12-20");
INSERT INTO Cuarto_Huesped_reservado VALUES(2, 21, 2, "15-12-20", 5, "13-12-20");
INSERT INTO Cuarto_Huesped_reservado VALUES(3, 31, 2, "16-12-20", 5, "12-12-20");

INSERT INTO Cuarto_Huesped_alquilado VALUES(1, 101, 1, "18-12-20", 9, 9, 250);
INSERT INTO Cuarto_Huesped_alquilado VALUES(2, 201, 1, "15-12-20", 11, 11, 200);
INSERT INTO Cuarto_Huesped_alquilado VALUES(3, 301, 1, "14-12-20", 14, 14, 300);
INSERT INTO Cuarto_Huesped_alquilado VALUES(1, 11, 2, "18-12-20", 14, 14, 250);
INSERT INTO Cuarto_Huesped_alquilado VALUES(2, 21, 2, "15-12-20", 15, 15, 200);
INSERT INTO Cuarto_Huesped_alquilado VALUES(3, 31, 2, "16-12-20", 10, 10, 350);

ALTER TABLE Hotel ADD FOREIGN KEY (Codigo_Departamento) REFERENCES Departamento(Codigo);
ALTER TABLE Cuarto ADD FOREIGN KEY (Codigo_Hotel) REFERENCES Hotel(Codigo);
ALTER TABLE Estandar ADD FOREIGN KEY (Piso, Numero) REFERENCES Cuarto(Piso, Numero);
ALTER TABLE Lujo ADD FOREIGN KEY (Piso, Numero) REFERENCES Cuarto(Piso, Numero);
ALTER TABLE SuperLujo ADD FOREIGN KEY (Piso, Numero) REFERENCES Cuarto(Piso, Numero);
ALTER TABLE Cuarto_Huesped_reservado ADD FOREIGN KEY (Piso, Numero) REFERENCES Cuarto(Piso, Numero);
ALTER TABLE Cuarto_Huesped_reservado ADD FOREIGN KEY (Codigo_hotel) REFERENCES Huesped(Codigo_hotel);
ALTER TABLE Cuarto_Huesped_alquilado ADD FOREIGN KEY (Piso, Numero) REFERENCES Cuarto(Piso, Numero);
ALTER TABLE Cuarto_Huesped_alquilado ADD FOREIGN KEY (Codigo_hotel) REFERENCES Huesped(Codigo_hotel);
ALTER TABLE Extranjero ADD FOREIGN KEY (Codigo_hotel) REFERENCES Huesped(Codigo_hotel);
ALTER TABLE Nacional ADD FOREIGN KEY (Codigo_hotel) REFERENCES Huesped(Codigo_hotel);

SELECT COUNT(h.codigo_departamento),  d.nombre
FROM hotel h
LEFT JOIN departamento d ON d.codigo = h.codigo_departamento
GROUP BY d.nombre

•Muestre el código del cliente, nombre del cliente, hotel ycuarto que reservó, siempre ycuando sea un cliente nacional.

SELECT n.dni, CONCAT(h.nombres," ", h.primer_apellido, " ", h.segundo_apellido) as "Nombre del Huésped",
ho.nombre, r.piso, r.numero
from huesped h
INNER JOIN nacional n ON h.codigo_hotel = n.codigo_hotel
INNER JOIN hotel ho ON ho.codigo = h.codigo_hotel
INNER JOIN Cuarto_Huesped_reservado r ON r.codigo_hotel=ho.codigo
INNER JOIN cuarto c ON c.piso=r.piso and c.numero=r.numero
GROUP BY h.nombres

SELECT e.pasaporte, CONCAT(h.nombres," ", h.primer_apellido, " ", h.segundo_apellido) as "Nombre del Huésped",
ho.nombre, r.piso, r.numero
from huesped h
INNER JOIN extranjero e ON h.codigo_hotel = e.codigo_hotel
INNER JOIN hotel ho ON ho.codigo = h.codigo_hotel
INNER JOIN Cuarto_Huesped_reservado r ON r.codigo_hotel=ho.codigo
INNER JOIN cuarto c ON c.piso=r.piso and c.numero=r.numero
GROUP BY h.nombres

