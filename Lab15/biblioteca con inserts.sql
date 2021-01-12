
CREATE DATABASE biblioteca;
USE biblioteca;
DROP DATABASE biblioteca;
CREATE TABLE libro (
	ISBN VARCHAR(50) PRIMARY KEY,
    Titulo_Español VARCHAR(50),
    Titulo_Ingles VARCHAR(50),
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

INSERT INTO categoria VALUES (1, 'Horror');
INSERT INTO categoria VALUES (2, 'Romance');
INSERT INTO categoria VALUES (3, 'Drama');
INSERT INTO categoria VALUES (4, 'Accion');

INSERT INTO autor VALUES (14177489, 'Paraguayo', 'Rafael', 'CodigoISBN1');
INSERT INTO autor VALUES (14177488, 'Peruano', 'Jose', 'CodigoISBN2');
INSERT INTO autor VALUES (14177487, 'Boliviano', 'Pedro', 'CodigoISBN3');
INSERT INTO autor VALUES (14177486, 'Uruguayo', 'Raul', 'CodigoISBN4');
INSERT INTO autor VALUES (14177485, 'Brasilero', 'Antonio', 'CodigoISBN5');

INSERT INTO libro VALUES('CodigoISBN1', 'Harry Potter y la piedra filosofal', 'Harry potter and the Philosophers Stone', '1995-01-29', 14177489, 1);
INSERT INTO libro VALUES('CodigoISBN2', 'Harry Potter y la cámara secreta', 'Harry Potter and the Chamber of Secrets', '1996-02-29', 14177489, 3);
INSERT INTO libro VALUES('CodigoISBN3', 'Harry Potter y el prisionero de Azkaban', 'Harry Potter and the Prisoner of Azkaban', '1997-03-29', 14177488, 4);
INSERT INTO libro VALUES('CodigoISBN4', 'Harry Potter y el cáliz de fuego', 'Harry Potter and the Goblet of Fire', '1998-04-29', 14177487, 3);
INSERT INTO libro VALUES('CodigoISBN5', 'Harry Potter y la Orden del Fénix', 'Harry Potter and the Order of the Phoenix', '1999-05-29', 14177486, 2);
INSERT INTO libro VALUES('CodigoISBN6', 'Harry Potter y el misterio del príncipe', 'Harry Potter and the Half-Blood Prince', '2000-06-29', 14177485, 2);
INSERT INTO libro VALUES('CodigoISBN7', 'Harry Potter y las reliquias de la Muerte', 'Harry Potter and the Deathly Hallows', '2001-07-29', 14177485, 4);

select * from libro;
select * from autor;

select l.ISBN, l.Titulo_Español, c.descripcion 
from libro l
INNER JOIN
categoria c 
ON l.Categoria_codigo = c.Codigo_Categoria
ORDER BY l.Titulo_Español;

select Titulo_Español, Autor_DNI AS Cantidad_Autores
from libro;

SELECT COUNT(a.DNI) "Cantidad de Autores", l.Titulo_Español   
FROM autor a
RIGHT JOIN libro l
ON l.Autor_DNI = a.DNI
GROUP BY a.DNI;

SELECT COUNT(a.DNI) "Cantidad de Libros", a.Nombre
FROM autor a
RIGHT JOIN libro l
ON l.Autor_DNI = a.DNI
GROUP BY a.DNI
HAVING COUNT(a.DNI) >= 2;