create database ejercicio2;

use ejercicio2;

-- DLL
CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo_cliente VARCHAR(50)
);

CREATE TABLE Edificio (
    id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Medidor (
    id INT PRIMARY KEY,
    cliente_id INT,
    edificio_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (edificio_id) REFERENCES Edificio(id)
);

CREATE TABLE Lectura (
    id INT PRIMARY KEY,
    medidor_id INT,
    fecha DATE,
    lectura_inicial DECIMAL(10,2),
    lectura_final DECIMAL(10,2),
    FOREIGN KEY (medidor_id) REFERENCES Medidor(id)
);

CREATE TABLE Tarifa (
    id INT PRIMARY KEY,
    tipo_cliente VARCHAR(50),
    tarifa DECIMAL(10,2)
);

CREATE TABLE Factura (
    id INT PRIMARY KEY,
    medidor_id INT,
    fecha_emision DATE,
    fecha_limite_pago DATE,
    monto_total DECIMAL(10,2),
    pagado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (medidor_id) REFERENCES Medidor(id)
);

--  DML

INSERT INTO Cliente (id, nombre, tipo_cliente) VALUES (1, 'Cliente A', 'Bajo Consumidor');
INSERT INTO Cliente (id, nombre, tipo_cliente) VALUES (2, 'Cliente B', 'Medio Consumidor');
INSERT INTO Cliente (id, nombre, tipo_cliente) VALUES (3, 'Cliente C', 'Alto Consumidor');

INSERT INTO Edificio (id, nombre) VALUES (1, 'Edificio A');
INSERT INTO Edificio (id, nombre) VALUES (2, 'Edificio A');
INSERT INTO Edificio (id, nombre) VALUES (3, 'Edificio A');

INSERT INTO Medidor (id, cliente_id, edificio_id) VALUES (1, 1, 1);
INSERT INTO Medidor (id, cliente_id, edificio_id) VALUES (2, 2, 2);
INSERT INTO Medidor (id, cliente_id, edificio_id) VALUES (3, 3, 3);

INSERT INTO Tarifa (id, tipo_cliente, tarifa) VALUES (1, 'Bajo Consumidor', 0.15);
INSERT INTO Tarifa (id, tipo_cliente, tarifa) VALUES (2, 'Medio Consumidor', 0.20);
INSERT INTO Tarifa (id, tipo_cliente, tarifa) VALUES (3, 'Alto Consumidor', 0.25);
