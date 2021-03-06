CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE libro (
	ISBN VARCHAR(30) PRIMARY KEY,
    Titulo_Español VARCHAR(30),
    Titulo_Ingles VARCHAR(30),
    Año_Publicacion DATE,
    Autor_DNI INTEGER,
    Categoria_codigo INTEGER
);

CREATE TABLE categoria(
	Codigo_Categoria INTEGER PRIMARY KEY,
    Descripcion VARCHAR(100)
);

CREATE TABLE autor(
	DNI INTEGER PRIMARY KEY,
    Nacionalidad VARCHAR(30),
    Nombre VARCHAR(50),
    Libro_ISBN VARCHAR(30)
);

ALTER TABLE libro ADD FOREIGN KEY (Autor_DNI) REFERENCES autor (DNI);
ALTER TABLE libro ADD FOREIGN KEY (Categoria_codigo) REFERENCES categoria (Codigo_Categoria);
ALTER TABLE autor ADD FOREIGN KEY (Libro_ISBN) REFERENCES libro (ISBN);


