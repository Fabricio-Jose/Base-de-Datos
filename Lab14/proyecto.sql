CREATE DATABASE Proyecto;
DROP DATABASE Proyecto
USE Proyecto;

CREATE TABLE Profesor (
	DNI INTEGER PRIMARY KEY,
    Especialidad_investigacion VARCHAR(50),
    Codigo_Proy INTEGER
);

CREATE TABLE Persona(
	DNI INTEGER PRIMARY KEY,
    Nombres VARCHAR(50),
    Primer_apellido VARCHAR(50),
    Segundo_apellido VARCHAR(50),
    Fec_nac DATE
);

CREATE TABLE Alumno(
	DNI INTEGER PRIMARY KEY
);

CREATE TABLE Becario(
	DNI INTEGER PRIMARY KEY,
    DNI_Profesor INTEGER
);

CREATE TABLE No_Becario(
	DNI INTEGER PRIMARY KEY
);

CREATE TABLE Alumno_No_Becario(
	DNI_Alumno INTEGER,
    DNI_No_Becario INTEGER,
    PRIMARY KEY (DNI_Alumno, DNI_No_Becario)
);

CREATE TABLE Profesor_Becario_ProyectoInv(
	DNI_Profesor INTEGER,
    DNI_Becario INTEGER,
    Codigo_Proyecto INTEGER,
    PRIMARY KEY (DNI_Profesor, DNI_Becario, Codigo_Proyecto)
);

CREATE TABLE Proyecto_Investigacion(
	Codigo INTEGER PRIMARY KEY,
    Presupuesto VARCHAR(50),
    Fec_inicio DATE,
    Fec_fin DATE
);

CREATE TABLE Investigacion_Basica(
	Codigo_proy INTEGER PRIMARY KEY,
    Nom_Universidad VARCHAR(50)
    );

CREATE TABLE Investigacion_Aplicada(
	Codigo_proy INTEGER PRIMARY KEY,
    Nom_Empresa VARCHAR(50)
);

CREATE TABLE Hito(
	Numero INTEGER PRIMARY KEY,
    Objetivo VARCHAR(50),
    Fec_inicio DATE,
    Fec_fin DATE,
    Codigo_Proyecto INTEGER
);

SELECT * FROM Profesor;
SELECT * FROM Persona;
SELECT * FROM Alumno;
SELECT * FROM Becario;
SELECT * FROM No_Becario;
SELECT * FROM Alumno_No_Becario;
SELECT * FROM Profesor_Becario_ProyectoInv;
SELECT * FROM Proyecto_Investigacion;
SELECT * FROM Investigacion_Basica;
SELECT * FROM Investigacion_Aplicada;
SELECT * FROM Hito;

INSERT INTO Profesor VALUES(12345671, "Psicologia", 1);
INSERT INTO Profesor VALUES(12345672, "Ingenieria", 2);
INSERT INTO Profesor VALUES(12345673, "Biologia", 3);
INSERT INTO Profesor VALUES(12345674, "Construccion", 4);
INSERT INTO Profesor VALUES(12345675, "Mecanica", 5);

INSERT INTO Persona VALUES(12345671, "Raul", "Sanchez", "Portugal", "1980-04-03");
INSERT INTO Persona VALUES(12345672, "Julio", "Galvez", "Montenegro", "1988-04-05");
INSERT INTO Persona VALUES(12345673, "Gabriel", "Roman", "Flores", "1985-08-07");
INSERT INTO Persona VALUES(12345674, "Adrian", "Alvarez", "Salas", "1977-11-07");
INSERT INTO Persona VALUES(12345675, "Roberto", "Ordoñez", "Chavez", "1989-08-09");

INSERT INTO Persona VALUES(12345676, "Francisco", "Ferro", "Nuñez", "1989-10-19");
INSERT INTO Persona VALUES(12345677, "Rodrigo", "Parravidino", "Arroé", "1986-06-12");
INSERT INTO Persona VALUES(12345678, "Bianca", "Mamani", "Quispe", "1983-02-14");
INSERT INTO Persona VALUES(12345679, "Maria", "Valderrama", "Rodriguez", "1984-02-09");
INSERT INTO Persona VALUES(12345610, "Silvia", "Paredes", "Gonzales", "1985-08-22");
INSERT INTO Persona VALUES(12345611, "Julia", "Gutierrez", "Huanca", "1988-07-18");
INSERT INTO Persona VALUES(12345612, "Jacinto", "Chavez", "Fuentes", "1986-10-17");

INSERT INTO Alumno VALUES(12345676);
INSERT INTO Alumno VALUES(12345677);
INSERT INTO Alumno VALUES(12345678);
INSERT INTO Alumno VALUES(12345679);
INSERT INTO Alumno VALUES(12345610);
INSERT INTO Alumno VALUES(12345611);
INSERT INTO Alumno VALUES(12345612);

INSERT INTO Becario VALUES(12345676, 12345671);
INSERT INTO Becario VALUES(12345677, 12345672);
INSERT INTO Becario VALUES(12345678, 12345673);
INSERT INTO Becario VALUES(12345679, 12345674);

INSERT INTO No_Becario VALUES(12345610);
INSERT INTO No_Becario VALUES(12345611);
INSERT INTO No_Becario VALUES(12345612);

INSERT INTO Alumno_No_Becario VALUES(12345610, 12345610);
INSERT INTO Alumno_No_Becario VALUES(12345611, 12345611);
INSERT INTO Alumno_No_Becario VALUES(12345612, 12345612);

INSERT INTO Profesor_Becario_ProyectoInv VALUES(12345671, 12345676, 1);
INSERT INTO Profesor_Becario_ProyectoInv VALUES(12345672, 12345677, 2);
INSERT INTO Profesor_Becario_ProyectoInv VALUES(12345673, 12345678, 3);
INSERT INTO Profesor_Becario_ProyectoInv VALUES(12345674, 12345679, 4);

INSERT INTO Proyecto_Investigacion VALUES(1, 1000, "20-12-20", "20-12-21");
INSERT INTO Proyecto_Investigacion VALUES(2, 3000, "09-12-20", "08-12-22");
INSERT INTO Proyecto_Investigacion VALUES(3, 5000, "08-12-20", "14-12-22");
INSERT INTO Proyecto_Investigacion VALUES(4, 8000, "07-12-20", "10-10-24");
INSERT INTO Proyecto_Investigacion VALUES(5, 2000, "04-05-20", "04-05-24");

INSERT INTO Investigacion_Basica VALUES(1, "UNSA");
INSERT INTO Investigacion_Basica VALUES(2, "UCSP");

INSERT INTO Investigacion_Aplicada VALUES(3, "Empresa1");
INSERT INTO Investigacion_Aplicada VALUES(4, "Empresa2");

INSERT INTO Hito VALUES(1, "Objetivo1", "10-12-20", "10-12-21", 1);
INSERT INTO Hito VALUES(2, "Objetivo2", "04-07-20", "04-07-21", 1);
INSERT INTO Hito VALUES(3, "Objetivo3", "08-09-20", "08-09-21", 1);
INSERT INTO Hito VALUES(4, "Objetivo4", "14-01-20", "14-01-21", 1);

ALTER TABLE Profesor ADD FOREIGN KEY (DNI) REFERENCES Persona(DNI);

ALTER TABLE Becario ADD FOREIGN KEY (DNI_Profesor) REFERENCES Profesor(DNI);
ALTER TABLE Becario ADD FOREIGN KEY (DNI) REFERENCES Alumno(DNI);
ALTER TABLE Alumno ADD FOREIGN KEY (DNI) REFERENCES Persona(DNI);
ALTER TABLE No_Becario ADD FOREIGN KEY (DNI) REFERENCES Alumno(DNI);
ALTER TABLE Alumno_No_Becario ADD FOREIGN KEY (DNI_Alumno) REFERENCES Alumno(DNI);
ALTER TABLE Alumno_No_Becario ADD FOREIGN KEY (DNI_No_Becario) REFERENCES No_Becario(DNI);
ALTER TABLE Investigacion_Basica ADD FOREIGN KEY (Codigo_Proy) REFERENCES Proyecto_Investigacion(Codigo);
ALTER TABLE Investigacion_Aplicada ADD FOREIGN KEY (Codigo_Proy) REFERENCES Proyecto_Investigacion(Codigo);
ALTER TABLE Hito ADD FOREIGN KEY (Codigo_Proyecto) REFERENCES Proyecto_Investigacion(Codigo);
ALTER TABLE Profesor_Becario_ProyectoInv ADD FOREIGN KEY (DNI_Profesor) REFERENCES Profesor(DNI);
ALTER TABLE Profesor_Becario_ProyectoInv ADD FOREIGN KEY (DNI_Becario) REFERENCES Becario(DNI);
ALTER TABLE Profesor_Becario_ProyectoInv ADD FOREIGN KEY (Codigo_Proyecto) REFERENCES Proyecto_Investigacion(Codigo);
ALTER TABLE Profesor ADD FOREIGN KEY (Codigo_Proy) REFERENCES Proyecto_Investigacion(Codigo);

- Muestre el código del profesor, nombre del profesor, código del alumno ynombre del alumno siempre ycuando
el profesor sea su tutor.

SELECT pr.dni, CONCAT(p.nombres, " ", p.primer_apellido," ",p.segundo_apellido) AS "Nombres del Profesor"
FROM persona p
RIGHT JOIN profesor pr ON pr.dni=p.dni

SELECT a.dni, CONCAT(p.nombres, " ", p.primer_apellido," ",p.segundo_apellido) AS "Nombres del Alumno"
FROM persona p
RIGHT JOIN alumno a ON a.dni=p.dni




• Muestre el código del proyecto, código del profesor ynombre del profesor del investigador principal.

SELECT pbp.codigo_proyecto, p.dni, CONCAT(p.nombres, " ", p.primer_apellido," ",p.segundo_apellido) AS "Nombres del Profesor"
FROM persona p
INNER JOIN Profesor_Becario_ProyectoInv pbp ON pbp.dni_profesor=p.dni
INNER JOIN Proyecto_Investigacion pi ON pi.codigo=pbp.codigo_proyecto

• Muestre la suma del presupuesto de todos los proyectos.
SELECT SUM(presupuesto)
FROM Proyecto_investigacion

