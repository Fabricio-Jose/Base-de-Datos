CREATE DATABASE Examen2;

USE Examen2;

CREATE TABLE Persona (
	DNI INTEGER PRIMARY KEY,
    nombres VARCHAR(50),
    primer_apellido VARCHAR(50),
    segundo_apellido VARCHAR(50),
    Sexo CHAR
);

CREATE TABLE Empleado(
	DNI INTEGER PRIMARY KEY,
    Salario DOUBLE
);

CREATE TABLE Empleado_correo(
	DNI INTEGER PRIMARY KEY,
    correo_electronico VARCHAR(100)
);

CREATE TABLE Empleado_numero_contacto(
	DNI INTEGER PRIMARY KEY,
    numero_contacto INTEGER
);

CREATE TABLE Dependiente(
	codigo INTEGER,
    DNI INTEGER,
    nombre VARCHAR(100),
    parentesco VARCHAR(50),
    PRIMARY KEY (codigo, DNI)
);

CREATE TABLE Paciente(
	DNI INTEGER PRIMARY KEY
);

CREATE TABLE Doctor(
	DNI INTEGER PRIMARY KEY,
    especialidad VARCHAR(50)
);

CREATE TABLE Enfermera(
	DNI INTEGER PRIMARY KEY
);

CREATE TABLE Recepcionista(
	DNI INTEGER PRIMARY KEY
);

CREATE TABLE Visitante(
	DNI INTEGER PRIMARY KEY,
    hospital_origen VARCHAR(100)
);

CREATE TABLE Permanente(
	DNI INTEGER PRIMARY KEY,
    numero_contrato INTEGER
);

CREATE TABLE doctor_atiende_paciente(
	DNI_doctor INTEGER,
    DNI_paciente INTEGER,
    fecha DATE,
    diagnostico VARCHAR(200),
	PRIMARY KEY (DNI_doctor, DNI_paciente)
);

CREATE TABLE Cuarto(
	codigo INTEGER PRIMARY KEY,
    area INTEGER,
    DNI_paciente INTEGER,
    DNI_enfermera INTEGER
    );

CREATE TABLE Supervisa(
	DNI_1 INTEGER,
    DNI_2 INTEGER,
    PRIMARY KEY (DNI_1, DNI_2)
);

CREATE TABLE Historial(
	codigo INTEGER PRIMARY KEY,
    fecha DATE,
    descripcion VARCHAR(200),
    DNI_recepcionista INTEGER,
    DNI_paciente INTEGER
);

CREATE TABLE Pedido(
	codigo INTEGER PRIMARY KEY,
    DNI_paciente INTEGER
);

CREATE TABLE Pedido_Medicamento(
	codigo_pedido INTEGER,
    codigo_medicamento INTEGER,
    PRIMARY KEY(codigo_pedido, codigo_medicamento)
);

CREATE TABLE Medicamento(
	codigo INTEGER PRIMARY KEY,
    categoria VARCHAR(50),
    codigo_farmacia INTEGER
);

CREATE TABLE Farmacia(
	codigo INTEGER PRIMARY KEY,
    direccion VARCHAR(100)
);

ALTER TABLE Empleado ADD FOREIGN KEY (DNI) REFERENCES Persona(DNI);
ALTER TABLE Paciente ADD FOREIGN KEY (DNI) REFERENCES Persona(DNI);
ALTER TABLE Doctor ADD FOREIGN KEY (DNI) REFERENCES Empleado(DNI);
ALTER TABLE Enfermera ADD FOREIGN KEY (DNI) REFERENCES Empleado(DNI);
ALTER TABLE Recepcionista ADD FOREIGN KEY (DNI) REFERENCES Empleado(DNI);
ALTER TABLE Visitante ADD FOREIGN KEY (DNI) REFERENCES Doctor(DNI);
ALTER TABLE Permanente ADD FOREIGN KEY (DNI) REFERENCES Doctor(DNI);
ALTER TABLE Dependiente ADD FOREIGN KEY (DNI) REFERENCES Empleado(DNI);
ALTER TABLE Empleado_correo ADD FOREIGN KEY (DNI) REFERENCES Empleado(DNI);
ALTER TABLE Empleado_numero_contacto ADD FOREIGN KEY (DNI) REFERENCES Empleado(DNI);
ALTER TABLE Supervisa ADD FOREIGN KEY (DNI_1) REFERENCES Enfermera(DNI);
ALTER TABLE Supervisa ADD FOREIGN KEY (DNI_2) REFERENCES Enfermera(DNI);
ALTER TABLE Historial ADD FOREIGN KEY (DNI_recepcionista) REFERENCES Recepcionista(DNI);
ALTER TABLE Historial ADD FOREIGN KEY (DNI_paciente) REFERENCES Paciente(DNI);
ALTER TABLE Cuarto ADD FOREIGN KEY (DNI_paciente) REFERENCES Paciente(DNI);
ALTER TABLE Cuarto ADD FOREIGN KEY (DNI_enfermera) REFERENCES Enfermera(DNI);
ALTER TABLE doctor_atiende_paciente ADD FOREIGN KEY (DNI_doctor) REFERENCES Doctor(DNI);
ALTER TABLE doctor_atiende_paciente ADD FOREIGN KEY (DNI_paciente) REFERENCES Paciente(DNI);
ALTER TABLE Pedido ADD FOREIGN KEY (DNI_paciente) REFERENCES Paciente(DNI);
ALTER TABLE Pedido_Medicamento ADD FOREIGN KEY (codigo_pedido) REFERENCES Pedido(codigo);
ALTER TABLE Pedido_Medicamento ADD FOREIGN KEY (codigo_medicamento) REFERENCES Medicamento(codigo);
ALTER TABLE Medicamento ADD FOREIGN KEY (codigo_farmacia) REFERENCES Farmacia(codigo);