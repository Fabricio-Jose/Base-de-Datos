CREATE DATABASE Empresa;
DROP DATABASE Empresa
USE Empresa;

CREATE TABLE Cliente (
	Codigo INTEGER PRIMARY KEY,
    Nombre VARCHAR(50),
    Direccion VARCHAR(50),
    Telefono INTEGER,
    Estado VARCHAR(10),
    Correo_electronico VARCHAR(50),
    Edad INTEGER,
    Limite_credito INTEGER,
    Empresa_id INTEGER
);

CREATE TABLE Empresa(
	id INTEGER PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE Producto(
	Codigo INTEGER PRIMARY KEY,
    Categoria VARCHAR(50),
    Nombre VARCHAR(50),
    Precio DECIMAL(6,2),
    Pedido_numero INTEGER,
    Empresa_id INTEGER
);

CREATE TABLE Producto_Pedido(
	Pedido_numero INTEGER,
    Producto_codigo INTEGER,
    Cantidad INTEGER,
    PRIMARY KEY (Pedido_numero, Producto_codigo)
);

CREATE TABLE Pedido(
	Numero INTEGER PRIMARY KEY,
    Fecha DATE,
    Cliente_codigo INTEGER,
    Producto_codigo INTEGER
);

INSERT INTO Empresa VALUES(1,"Empresa_limpieza");

INSERT INTO Cliente VALUES(1, "Juan", "Av. Lima 104", 999654111, "bueno","juan@hotmail.com", 38, 3000, 1);
INSERT INTO Cliente VALUES(2, "Maria", "Av. Arequipa 404", 997674111, "regular","maria@hotmail.com", 31, 2000, 1);
INSERT INTO Cliente VALUES(3, "Laura", "Av. Brasil 204", 994434111, "regular","laura@hotmail.com", 28, 2000, 1);
INSERT INTO Cliente VALUES(4, "Jose", "Av. Argentina 101", 999621211, "malo", "jose@hotmail.com", 20, 400, 1);

INSERT INTO Pedido VALUES(101, "10-12-20", 1, 1001);
INSERT INTO Pedido VALUES(102, "11-12-20", 2, 1003);
INSERT INTO Pedido VALUES(103, "11-12-20", 2, 1005);
INSERT INTO Pedido VALUES(104, "12-12-20", 3, 1006);
INSERT INTO Pedido VALUES(105, "12-12-20", 4, 1007);
INSERT INTO Pedido VALUES(106, "13-12-20", 4, 1008);

INSERT INTO Producto VALUES(1001, "lavanderia", "Detergente X", 19.9, 101, 1);
INSERT INTO Producto VALUES(1002, "lavanderia", "Jaboncillo X", 3.9, 101, 1);
INSERT INTO Producto VALUES(1003, "lavanderia", "Jabon X", 4.9, 101, 1);
INSERT INTO Producto VALUES(1004, "quimicos", "Lejia X", 10.9, 102, 1);
INSERT INTO Producto VALUES(1005, "quimicos", "Limpiatodo X", 12.9, 102, 1);
INSERT INTO Producto VALUES(1006, "proteccion", "Guantes X", 8.9, 102, 1);
INSERT INTO Producto VALUES(1007, "proteccion", "Mandil X", 10.9, 103, 1);
INSERT INTO Producto VALUES(1008, "proteccion", "Mascarilla X", 4.9, 103, 1);

INSERT INTO Producto_Pedido VALUES(101, 1001, 150);
INSERT INTO Producto_Pedido VALUES(102, 1003, 1000);
INSERT INTO Producto_Pedido VALUES(103, 1005, 200);
INSERT INTO Producto_Pedido VALUES(104, 1006, 400);
INSERT INTO Producto_Pedido VALUES(105, 1007, 20);
INSERT INTO Producto_Pedido VALUES(106, 1008, 30);

ALTER TABLE Cliente ADD FOREIGN KEY (Empresa_id) REFERENCES Empresa (id);
ALTER TABLE Producto ADD FOREIGN KEY (Empresa_id) REFERENCES Empresa (id);
ALTER TABLE Producto ADD FOREIGN KEY (Pedido_numero) REFERENCES Producto_Pedido(Pedido_numero);
ALTER TABLE Producto_Pedido ADD FOREIGN KEY(Producto_codigo) REFERENCES Producto(Codigo);
ALTER TABLE Producto_Pedido ADD FOREIGN KEY(Pedido_numero) REFERENCES Pedido(Numero);
ALTER TABLE Pedido ADD FOREIGN KEY(Producto_codigo) REFERENCES Producto_Pedido(Producto_codigo);
ALTER TABLE Pedido ADD FOREIGN KEY (Cliente_codigo) REFERENCES Cliente (Codigo);

SELECT * FROM Empresa;
SELECT * FROM Cliente;
SELECT * FROM Producto;
SELECT * FROM Pedido;
SELECT * FROM Producto_Pedido;

SELECT codigo, nombre, categoria
FROM Producto
WHERE categoria LIKE 'L%' or categoria LIKE 'Q%';

SELECT c.codigo, c.nombre, SUM(pp.cantidad) as 'Cantidad de Pedidos en total'
FROM Pedido p
INNER JOIN producto_pedido pp ON p.numero = pp.pedido_numero
INNER JOIN Cliente c ON  p.cliente_codigo = c.codigo
GROUP BY c.Codigo

SELECT p.numero, c.nombre
FROM Pedido p
INNER JOIN producto_pedido pp ON p.numero = pp.pedido_numero
INNER JOIN Cliente c ON  p.cliente_codigo = c.codigo
GROUP BY c.codigo
HAVING COUNT(p.producto_codigo) > 1;
