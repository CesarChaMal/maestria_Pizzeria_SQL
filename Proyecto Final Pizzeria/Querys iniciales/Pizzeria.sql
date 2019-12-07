DROP DATABASE IF EXISTS Pizzeria;
CREATE DATABASE Pizzeria;

DROP TABLE IF EXISTS Orden;
CREATE TABLE Orden (
	idOrden INTEGER NOT NULL,
	tipo VARCHAR(30) NULL,
	fecha DATE NULL,
	hora TIME NULL,
	idEstado INTEGER NOT NULL,
	idCliente INTEGER NOT NULL,
	idEmpleado INTEGER NOT NULL,
	CONSTRAINT orden_pkey PRIMARY KEY (idOrden)
);

DROP TABLE IF EXISTS Estado;
CREATE TABLE Estado (
	idEstado INTEGER NOT NULL,
	estado VARCHAR(30) NULL,
	CONSTRAINT estado_pkey PRIMARY KEY (idEstado)
);

DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente (
	idCliente INTEGER NOT NULL,
	nombres VARCHAR(60) NOT NULL,  
	apellidos VARCHAR(60) NOT NULL,
	calle CHAR(5) NULL,
	numero CHAR(5) NULL,
	cruzamientos CHAR(10) NULL,
	colonia VARCHAR(30) NULL,
	ciudad VARCHAR(30) NULL,
	estado VARCHAR(30) NULL,
	codPostal INTEGER NOT NULL,
	telefono VARCHAR(15) NOT NULL,
	idZona INTEGER NOT NULL,
	CONSTRAINT cliente_pkey PRIMARY KEY (idCliente)
);

DROP TABLE IF EXISTS Sucursales;
CREATE TABLE Sucursales (
	idSucursal INTEGER NOT NULL,
	nombre VARCHAR(60) NOT NULL,  
	direccion VARCHAR(80) NOT NULL,
	telefono VARCHAR(15) NOT NULL,
	CONSTRAINT sucursales_pkey PRIMARY KEY (idSucursal)
);

-- DROP TABLE Orden CASCADE;
ALTER TABLE Orden 
	ADD CONSTRAINT relOrdenEstado FOREIGN KEY (idEstado) REFERENCES Estado(idEstado),
	ADD CONSTRAINT relOrdenCliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);
	
DROP TABLE IF EXISTS Zona;
CREATE TABLE Zona (
	idZona INTEGER NOT NULL,
	nombre VARCHAR(40) NOT NULL,  
	descripcion VARCHAR(80) NOT NULL,
	CONSTRAINT zona_pkey PRIMARY KEY (idZona)
);

-- DROP TABLE Cliente CASCADE;
ALTER TABLE Cliente 
	ADD CONSTRAINT relClienteZona FOREIGN KEY (idZona) REFERENCES Zona(idZona);

DROP TABLE IF EXISTS Empleados;
CREATE TABLE Empleados (
	idEmpleado INTEGER NOT NULL,
	nombres VARCHAR(60) NOT NULL,  
	apellidos VARCHAR(60) NOT NULL,
	telefono VARCHAR(15) NOT NULL,
	idSucursal INTEGER NOT NULL,
	idPuesto INTEGER NOT NULL,
	CONSTRAINT empleados_pkey PRIMARY KEY (idEmpleado)
);

-- DROP TABLE Empleados CASCADE;
ALTER TABLE Empleados
	ADD CONSTRAINT relEmpleadosSucursales FOREIGN KEY (idSucursal) REFERENCES Sucursales(idSucursal);

DROP TABLE IF EXISTS Puesto;
CREATE TABLE Puesto (
	idPuesto INTEGER NOT NULL,
	nombre VARCHAR(40) NOT NULL,  
	descripcion VARCHAR(80) NOT NULL,
	CONSTRAINT puesto_pkey PRIMARY KEY (idPuesto)
);

-- DROP TABLE Empleados CASCADE;
ALTER TABLE Empleados
	ADD CONSTRAINT relEmpleadosPuesto FOREIGN KEY (idPuesto) REFERENCES Puesto(idPuesto);

DROP TABLE IF EXISTS Pizza;
CREATE TABLE Pizza (
	idPizza INTEGER NOT NULL,
	nombre VARCHAR(60) NOT NULL,  
	CONSTRAINT pizza_pkey PRIMARY KEY (idPizza)
);

DROP TABLE IF EXISTS detallePizzaTamaniosPizza;
CREATE TABLE detallePizzaTamaniosPizza (
	idPizzaGlobal INTEGER NOT NULL,
	idPizza INTEGER NOT NULL,
	idTamanio INTEGER NOT NULL,
	precio FLOAT NOT NULL,
	CONSTRAINT detallePizzaTamaniosPizza_pkey PRIMARY KEY (idPizzaGlobal)
);

DROP TABLE IF EXISTS TamaniosPizza;
CREATE TABLE TamaniosPizza (
	idTamanio INTEGER NOT NULL,
	nombre VARCHAR(60) NOT NULL,  
	CONSTRAINT tamaniosPizza_pkey PRIMARY KEY (idTamanio)
);

-- DROP TABLE detallePizzaTamaniosPizza CASCADE;
ALTER TABLE detallePizzaTamaniosPizza
	ADD CONSTRAINT reldetallePizzaTamaniosPizzaPizza FOREIGN KEY (idPizza) REFERENCES Pizza(idPizza),
	ADD CONSTRAINT reldetallePizzaTamaniosPizzaTamanios FOREIGN KEY (idTamanio) REFERENCES TamaniosPizza(idTamanio);

DROP TABLE IF EXISTS detalleOrdenPizza;
CREATE TABLE detalleOrdenPizza (
	idOrden INTEGER NOT NULL,
	idPizza INTEGER NOT NULL,
	CONSTRAINT detalleOrdenPizza_pkey PRIMARY KEY (idOrden, idPizza)
);

-- DROP TABLE detalleOrdenPizza CASCADE;
ALTER TABLE detalleOrdenPizza
	ADD CONSTRAINT reldetalleOrdenPizzaOrden FOREIGN KEY (idOrden) REFERENCES Orden(idOrden),
	ADD CONSTRAINT reldetalleOrdenPizzadetallePizzaTamaniosPizza FOREIGN KEY (idPizza) REFERENCES detallePizzaTamaniosPizza(idPizzaGlobal);
	
DROP TABLE IF EXISTS Ingrediente;
CREATE TABLE Ingrediente (
	idIngrediente INTEGER NOT NULL,
	nombre VARCHAR(60) NOT NULL,  
	CONSTRAINT ingrediente_pkey PRIMARY KEY (idIngrediente)
);

DROP TABLE IF EXISTS detalleTamaniosPizzaIngrediente;
CREATE TABLE detalleTamaniosPizzaIngrediente (
	idIngredienteGlobal INTEGER NOT NULL,
	idPizza INTEGER NOT NULL,
	idIngrediente INTEGER NOT NULL,
	gramos FLOAT NOT NULL,
	CONSTRAINT detalleTamaniosPizzaIngrediente_pkey PRIMARY KEY (idIngredienteGlobal)
);

-- DROP TABLE detalleTamaniosPizzaIngrediente CASCADE;
ALTER TABLE detalleTamaniosPizzaIngrediente
	ADD CONSTRAINT reldetalleTamaniosPizzaIngredientePizza FOREIGN KEY (idPizza) REFERENCES detallePizzaTamaniosPizza(idPizzaGlobal),
	ADD CONSTRAINT reldetalleTamaniosPizzaIngredienteIngrediente FOREIGN KEY (idIngrediente) REFERENCES Ingrediente(idIngrediente);
	
DROP TABLE IF EXISTS Promocion;
CREATE TABLE Promocion (
	idPromocion INTEGER NOT NULL,
	nombre VARCHAR(60) NOT NULL,  
	fechaInicio DATE NOT NULL,
	fechaFin DATE NOT NULL,
	CONSTRAINT promocionPizza_pkey PRIMARY KEY (idPromocion)
);

DROP TABLE IF EXISTS detallePromocionPizza;
CREATE TABLE detallePromocionPizza (
	idPromocion INTEGER NOT NULL,
	idPizza INTEGER NOT NULL,
	descuento FLOAT NOT NULL,
	CONSTRAINT detallePromocionPizza_pkey PRIMARY KEY (idPromocion, idPizza)
);

-- DROP TABLE detallePromocionPizza CASCADE;
ALTER TABLE detallePromocionPizza
	ADD CONSTRAINT reldetallePromocionPizzaPromocion FOREIGN KEY (idPromocion) REFERENCES Promocion(idPromocion),
	ADD CONSTRAINT reldetallePromocionPizzaPizza FOREIGN KEY (idPizza) REFERENCES detallePizzaTamaniosPizza(idPizzaGlobal);

DROP TABLE IF EXISTS detalleSucursalesPromocion;
CREATE TABLE detalleSucursalesPromocion (
	idSucursal INTEGER NOT NULL,
	idPromocion INTEGER NOT NULL,
	CONSTRAINT detalleSucursalesPromocion_pkey PRIMARY KEY (idSucursal, idPromocion)
);

-- DROP TABLE detalleSucursalesPromocion CASCADE;
ALTER TABLE detalleSucursalesPromocion
	ADD CONSTRAINT reldetalleSucursalPromocionSucursales FOREIGN KEY (idSucursal) REFERENCES Sucursales(idSucursal),
	ADD CONSTRAINT reldetalleSucursalPromocionPromocion FOREIGN KEY (idPromocion) REFERENCES Promocion(idPromocion);

-- DROP TABLE Orden CASCADE;
ALTER TABLE Orden
	ADD CONSTRAINT relOrdenEmpleados FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado);

DROP TABLE IF EXISTS Ventas;
CREATE TABLE Ventas (
	idVenta INTEGER NOT NULL,
	idOrden INTEGER NOT NULL,
	CONSTRAINT ventas_pkey PRIMARY KEY (idVenta, idOrden)
);

-- DROP TABLE Ventas CASCADE;
ALTER TABLE Ventas
	ADD CONSTRAINT relVentasOrden FOREIGN KEY (idOrden) REFERENCES Orden(idOrden);

DROP TABLE IF EXISTS Coordina;
CREATE TABLE Coordina (
	idGerente INTEGER NOT NULL,
	idEmpleado INTEGER NOT NULL,
	CONSTRAINT coordina_pkey PRIMARY KEY (idGerente),
	CONSTRAINT coordina_unique_empleado UNIQUE (idEmpleado)
);

-- DROP TABLE Coordina CASCADE;
ALTER TABLE Coordina
	ADD CONSTRAINT relCoordinaEmpleados FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado);

DROP TABLE IF EXISTS detalleEmpleadosZona;
CREATE TABLE detalleEmpleadosZona (
	idEmpleado INTEGER NOT NULL,
	idZona INTEGER NOT NULL,
	CONSTRAINT detalleEmpleadosZona_pkey PRIMARY KEY (idEmpleado, idZona)
);

-- DROP TABLE detalleEmpleadosZona CASCADE;
ALTER TABLE detalleEmpleadosZona
	ADD CONSTRAINT reldetalleEmpleadosZonaEmpleado FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado),
	ADD CONSTRAINT reldetalleEmpleadosZonaZona FOREIGN KEY (idZona) REFERENCES Zona(idZona);

/*
Catalogo puestos
1 Gerente
2 Telefonista
3 Cajero
4 Repartidor
5 Cocinero

Restricciones
Para cada sucursal  le corresponde 1 gerente, 4 telefonistas, 1 cajero, 5 repartidores y  5 cocineros
*/

/*
ALTER TABLE Empleados
	ADD CONSTRAINT checkNoGerente CHECK (NoSucursal>0 AND NoSucursal<=1000),
	ADD CONSTRAINT checkNoTelefonistas CHECK (NoSucursal>0 AND NoSucursal<=1000),
	ADD CONSTRAINT checkNoCajeros CHECK (NoSucursal>0 AND NoSucursal<=1000),
	ADD CONSTRAINT checkNoRepartidores CHECK (NoSucursal>0 AND NoSucursal<=1000),
	ADD CONSTRAINT checkNoCocineros CHECK (NoSucursal>0 AND NoSucursal<=1000);

SELECT 
	COUNT(*) 
FROM 
	Empleados 
JOIN 
	Sucursales 
ON 
	Empleados.idSucursal = Sucursales.idSucursal
JOIN 
	Puesto 
ON 
	Empleados.idPuesto = Puesto.idPuesto
WHERE
	Empleados.idPuesto = '2'
*/

INSERT INTO Estado (idEstado, estado)
	VALUES (1, 'orden_levantada')
UNION ALL
	VALUES (2, 'proceso_preparacion')
UNION ALL
	VALUES (3, 'proceso_entrega')
UNION ALL
	VALUES (4, 'entregado')
UNION ALL
	VALUES (5, 'no_entregado');

INSERT INTO Zona (idZona, nombre, descripcion) 
	VALUES (1, 'Norte', 'Norte de la ciudad') 
UNION ALL 
	VALUES (2, 'Sur','Sur de la ciudad') 
UNION ALL 
	VALUES (3, 'Este','Este de la ciudad') 
UNION ALL 
	VALUES (4, 'Oeste','Oeste de la ciudad') 
UNION ALL 
	VALUES (5, 'Periferico','Periferico');

INSERT INTO Puesto (idPuesto, nombre, descripcion)
	VALUES (1, 'Gerente', 'Supervisa empleados de determinada sucursal y la coordina')
UNION ALL
	VALUES (2, 'Telefonista', 'Recibe las ordenes de las pizzas por telefono y genera las ordenes de compra')
UNION ALL
	VALUES (3, 'Cajero' , 'Cobra el total a pagar por determinada orden a los clientes de la pizzeria')
UNION ALL
	VALUES (4, 'Repartidor', 'Se encarga de repartir las pizzas y de que lleguen al cliente')
UNION ALL
	VALUES (5, 'Cocinero', 'Se encarga del proceso de elaboracion de la pizza');

INSERT INTO TamaniosPizza (idTamanio, nombre) 
	VALUES (1, 'Chica') 
UNION ALL 
	VALUES (2, 'Mediana') 
UNION ALL 
	VALUES (3, 'Grande');

INSERT INTO Ingrediente (idIngrediente, nombre) 
	VALUES (1, 'Aceitunas') 
UNION ALL 
	VALUES (2, 'Ajo') 
UNION ALL 
	VALUES (3, 'Anchoas') 
UNION ALL 
	VALUES (4, 'Arrachera') 
UNION ALL 
	VALUES (5, 'Atun') 
UNION ALL 
	VALUES (6, 'Camarones') 
UNION ALL 
	VALUES (7, 'Cebolla') 
UNION ALL 
	VALUES (8, 'Champiñones') 
UNION ALL 
	VALUES (9, 'Chorizo') 
UNION ALL 
	VALUES (10, 'Extra Queso') 
UNION ALL 
	VALUES (11, 'Frijoles') 
UNION ALL 
	VALUES (12, 'Jalapeños') 
UNION ALL 
	VALUES (13, 'Jamon') 
UNION ALL 
	VALUES (14, 'Pan Pizza') 
UNION ALL 
	VALUES (15, 'Pastor') 
UNION ALL 
	VALUES (16, 'Pepperoni') 
UNION ALL 
	VALUES (17, 'Pimiento') 
UNION ALL 
	VALUES (18, 'Piña') 
UNION ALL 
	VALUES (19, 'Pollo') 
UNION ALL 
	VALUES (20, 'Salami') 
UNION ALL 
	VALUES (21, 'Salchicha') 
UNION ALL 
	VALUES (22, 'Tocino');

INSERT INTO Promocion (idPromocion, nombre, fechaInicio, fechaFin)
	VALUES (1, 'Navidad', CAST('2008-12-24' AS DATE), CAST('2008-12-26' AS DATE))
UNION ALL
	VALUES (2, 'Año Nuevo', CAST('2008-12-31' AS DATE), CAST('2008-01-01' AS DATE))
UNION ALL
	VALUES (3, 'Dia del niño', CAST('2008-04-30' AS DATE), CAST('2008-05-01' AS DATE));

INSERT INTO Sucursales (idSucursal, nombre, direccion, telefono)
	VALUES (1, 'Prolongacion', 'calle 60 x 18 y 20 Colonia Prolongacion', '9-44-01-77')
UNION ALL
	VALUES (2, 'Fiesta', 'calle 15 x 8 y 10 Colonia Diaz Ordaz', '9-44-01-86')
UNION ALL
	VALUES (3, 'Montecristo', 'calle 10 x 30 Colonia Montecristo', '9-44-01-90');

/*
Catalogo puestos
1 Gerente
2 Telefonista
3 Cajero
4 Repartidor
5 Cocinero

Restricciones
Para cada sucursal  le corresponde 1 gerente, 4 telefonistas, 1 cajero, 5 repartidores y  5 cocineros
*/

INSERT INTO Empleados (idEmpleado, nombres, apellidos, telefono, idSucursal, idPuesto)
	VALUES (1, 'Cesar', 'Chavez', '9-29-30-72', 1, 1)
UNION ALL
	VALUES (2, 'Carlos', 'Perez', '9-44-01-26', 1, 2)
UNION ALL
	VALUES (3, 'Roberto', 'Prado', '9-11-01-16', 1, 2)
UNION ALL
	VALUES (4, 'Karla', 'Alvarez', '9-14-02-16', 1, 2)
UNION ALL
	VALUES (5, 'Sarai', 'Ramirez', '9-19-01-16', 1, 2)
UNION ALL
	VALUES (6, 'Alberto', 'Serrano', '9-15-01-20', 1, 3)
UNION ALL
	VALUES (7, 'Rafael', 'Hernandez', '9-15-01-26', 1, 4)
UNION ALL
	VALUES (8, 'Joel', 'Keb', '9-16-01-18', 1, 4)
UNION ALL
	VALUES (9, 'Felipe', 'Soarez', '9-11-01-11', 1, 4)
UNION ALL
	VALUES (10, 'Jose', 'Martin', '9-11-11-11', 1, 4)
UNION ALL
	VALUES (11, 'Octavio', 'Millan', '9-12-21-26', 1, 4)
UNION ALL
	VALUES (12, 'Sofia', 'Segura', '9-25-21-26', 1, 5)
UNION ALL
	VALUES (13, 'Sergio', 'Sotelo', '9-15-21-26', 1, 5)
UNION ALL
	VALUES (14, 'Gabriela', 'Castillo', '9-35-21-26', 1, 5)
UNION ALL
	VALUES (15, 'Sebastian', 'Cortes', '9-45-21-26', 1, 5)
UNION ALL
	VALUES (16, 'Rodrigo', 'Dogre', '9-55-21-26', 1, 5)
UNION ALL
	VALUES (17, 'Oscar', 'Canche', '9-19-30-72', 2, 1)
UNION ALL
	VALUES (18, 'Carlos', 'Cabrera', '9-44-41-96', 2, 2)
UNION ALL
	VALUES (19, 'Roberto', 'Molina', '9-21-06-16', 2, 2)
UNION ALL
	VALUES (20, 'Alberto', 'Rodriguez', '9-65-01-10', 2, 3)
UNION ALL
	VALUES (21, 'Alonso', 'Hernandez', '9-15-11-06', 2, 4)
UNION ALL
	VALUES (22, 'Patricia', 'Cetina', '9-16-01-18', 2, 4)
UNION ALL
	VALUES (23, 'Enrique', 'Suarez', '9-13-21-11', 2, 4)
UNION ALL
	VALUES (24, 'Hector', 'Enriquez', '9-11-11-16', 2, 5)
UNION ALL
	VALUES (25, 'Jorge', 'Sierra', '9-15-91-96', 2, 5)
UNION ALL
	VALUES (26, 'Maria', 'Cabrera', '9-35-11-16', 2, 5)
UNION ALL
	VALUES (27, 'Manuel', 'Rodriguez', '9-19-30-72', 3, 1)
UNION ALL
	VALUES (28, 'Jonathan', 'Castillo', '9-14-41-16', 3, 2)
UNION ALL
	VALUES (29, 'Jorge', 'Chan', '9-21-36-36', 3, 2)
UNION ALL
	VALUES (30, 'Manuel', 'Sanchez', '9-63-31-23', 3, 3)
UNION ALL
	VALUES (31, 'Cesar', 'Hernandez', '9-25-11-26', 3, 4)
UNION ALL
	VALUES (32, 'Farique', 'Cetina', '9-26-01-28', 3, 4)
UNION ALL
	VALUES (33, 'Enrique', 'Perez', '9-23-21-21', 3, 4)
UNION ALL
	VALUES (34, 'Cesar', 'Garcia', '9-21-11-26', 3, 5)
UNION ALL
	VALUES (35, 'Jorge', 'Perez', '9-25-91-26', 3, 5)
UNION ALL
	VALUES (36, 'Maria', 'Sierra', '9-25-11-26', 3, 5);

INSERT INTO Cliente (idCliente, nombres, apellidos, calle, numero, cruzamientos, colonia, ciudad ,estado, codPostal, telefono, idZona)
	VALUES (1, 'Karla', 'Ricalde', '5a', '201b', '18 y 20', 'Aguilas', 'Merida', 'Yucatan', 97121, '9-29-30-54', 1)
UNION ALL
	VALUES (2, 'Roberto', 'Perez', '8', '100', '17 y 19', 'Morelos', 'Merida', 'Yucatan', 97131, '9-29-30-12', 2)
UNION ALL
	VALUES (3, 'Luis', 'Perez', '12a', '310', '47 y 49', 'Centro', 'Merida', 'Yucatan', 97111, '9-19-30-12', 3)
UNION ALL
	VALUES (4, 'Ernesto', 'Canto', '36', '140', '51 y 53', 'Canto', 'Merida', 'Yucatan', 97121, '9-39-30-12', 4)
UNION ALL
	VALUES (5, 'Carlos', 'Lopez', '42', '220', '25 y 27', 'Madero', 'Merida', 'Yucatan', 97190, '9-49-30-12', 5);

INSERT INTO detalleEmpleadosZona (idEmpleado, idZona)
	VALUES (7, 1)
UNION ALL
	VALUES (8, 2)
UNION ALL
	VALUES (9, 3)
UNION ALL
	VALUES (10, 4)
UNION ALL
	VALUES (11, 5)
UNION ALL
	VALUES (21, 1)
UNION ALL
	VALUES (22, 2)
UNION ALL
	VALUES (23, 3)
UNION ALL
	VALUES (21, 4)
UNION ALL
	VALUES (22, 5)
UNION ALL
	VALUES (31, 1)
UNION ALL
	VALUES (32, 2)
UNION ALL
	VALUES (31, 3)
UNION ALL
	VALUES (32, 4)
UNION ALL
	VALUES (31, 5);

INSERT INTO Coordina (idGerente, idEmpleado)
	VALUES (1, 1)
UNION ALL
	VALUES (2, 17)
UNION ALL
	VALUES (3, 27);

INSERT INTO detalleSucursalesPromocion (idSucursal, idPromocion)
	VALUES (1, 1)
UNION ALL
	VALUES (1, 2)
UNION ALL
	VALUES (1, 3)
UNION ALL
	VALUES (2, 1)
UNION ALL
	VALUES (2, 2)
UNION ALL
	VALUES (2, 3)
UNION ALL
	VALUES (3, 1)
UNION ALL
	VALUES (3, 2)
UNION ALL
	VALUES (3, 3);

INSERT INTO Pizza (idPizza, nombre)
	VALUES (1, 'Al Pastor')
UNION ALL
	VALUES (2, 'Extravaganza')
UNION ALL
	VALUES (3, 'Hawaiana')
UNION ALL
	VALUES (4, 'Mexicana')
UNION ALL
	VALUES (5, 'Pepperoni')
UNION ALL
	VALUES (6, 'Ranchera');

INSERT INTO detallePizzaTamaniosPizza (idPizzaGlobal, idPizza, idTamanio, precio)
	VALUES (1 ,1, 1, 100)
UNION ALL
	VALUES (2, 1, 2, 120)
UNION ALL
	VALUES (3, 1, 3, 150)
UNION ALL
	VALUES (4, 2, 1, 80)
UNION ALL
	VALUES (5, 2, 2, 100)
UNION ALL
	VALUES (6, 2, 3, 120)
UNION ALL
	VALUES (7, 3, 1, 80)
UNION ALL
	VALUES (8, 3, 2, 100)
UNION ALL
	VALUES (9, 3, 3, 120)
UNION ALL
	VALUES (10, 4, 1, 70)
UNION ALL
	VALUES (11, 4, 2, 90)
UNION ALL
	VALUES (12, 4, 3, 110)
UNION ALL
	VALUES (13, 5, 1, 80)
UNION ALL
	VALUES (14, 5, 2, 100)
UNION ALL
	VALUES (15, 5, 3, 120)
UNION ALL
	VALUES (16, 6, 1, 80)
UNION ALL
	VALUES (17, 6, 2, 100)
UNION ALL
	VALUES (18, 6, 3, 120);

INSERT INTO detalleTamaniosPizzaIngrediente (idIngredienteGlobal ,idPizza, idIngrediente, gramos)
	VALUES (1, 1, 14, 20)
UNION ALL
	VALUES (2, 1, 13, 20)
UNION ALL
	VALUES (3, 1, 15, 20)
UNION ALL
	VALUES (4, 1, 7, 20)
UNION ALL
	VALUES (5, 1, 14, 30)
UNION ALL
	VALUES (6, 1, 13, 30)
UNION ALL
	VALUES (7, 1, 15, 30)
UNION ALL
	VALUES (8, 1, 7, 30)
UNION ALL
	VALUES (9, 1, 14, 40)
UNION ALL
	VALUES (10, 1, 13, 40)
UNION ALL
	VALUES (11, 1, 15, 40)
UNION ALL
	VALUES (12, 1, 7, 40)
UNION ALL
	VALUES (13, 2, 14, 20)
UNION ALL
	VALUES (14, 2, 13, 20)
UNION ALL
	VALUES (15, 2, 3, 20)
UNION ALL
	VALUES (16, 2, 4, 20)
UNION ALL
	VALUES (17, 2, 5, 20)
UNION ALL
	VALUES (18, 2, 6, 20)
UNION ALL
	VALUES (19, 2, 14, 30)
UNION ALL
	VALUES (20, 2, 13, 30)
UNION ALL
	VALUES (21, 2, 3, 30)
UNION ALL
	VALUES (22, 2, 4, 30)
UNION ALL
	VALUES (23, 2, 5, 30)
UNION ALL
	VALUES (24, 2, 6, 30)
UNION ALL
	VALUES (25, 2, 14, 40)
UNION ALL
	VALUES (26, 2, 13, 40)
UNION ALL
	VALUES (27, 2, 3, 40)
UNION ALL
	VALUES (28, 2, 4, 40)
UNION ALL
	VALUES (29, 2, 5, 40)
UNION ALL
	VALUES (30, 2, 6, 40)
UNION ALL
	VALUES (31, 3, 14, 20)
UNION ALL
	VALUES (32, 3, 13, 20)
UNION ALL
	VALUES (33, 3, 18, 20)
UNION ALL
	VALUES (34, 3, 19, 20)
UNION ALL
	VALUES (35, 3, 14, 30)
UNION ALL
	VALUES (36, 3, 13, 30)
UNION ALL
	VALUES (37, 3, 18, 30)
UNION ALL
	VALUES (38, 3, 19, 30)
UNION ALL
	VALUES (39, 3, 14, 40)
UNION ALL
	VALUES (40, 3, 13, 40)
UNION ALL
	VALUES (41, 3, 18, 40)
UNION ALL
	VALUES (42, 3, 19, 40)
UNION ALL
	VALUES (43, 4, 14, 20)
UNION ALL
	VALUES (44, 4, 13, 20)
UNION ALL
	VALUES (45, 4, 9, 20)
UNION ALL
	VALUES (46, 4, 17, 20)
UNION ALL
	VALUES (47, 4, 21, 20)
UNION ALL
	VALUES (48, 4, 22, 20)
UNION ALL
	VALUES (49, 4, 14, 30)
UNION ALL
	VALUES (50, 4, 13, 30)
UNION ALL
	VALUES (51, 4, 9, 30)
UNION ALL
	VALUES (52, 4, 17, 30)
UNION ALL
	VALUES (53, 4, 21, 30)
UNION ALL
	VALUES (54, 4, 22, 30)
UNION ALL
	VALUES (55, 4, 14, 40)
UNION ALL
	VALUES (56, 4, 13, 40)
UNION ALL
	VALUES (57, 4, 9, 40)
UNION ALL
	VALUES (58, 4, 17, 40)
UNION ALL
	VALUES (59, 4, 21, 40)
UNION ALL
	VALUES (60, 4, 22, 40)
UNION ALL
	VALUES (61, 5, 14, 20)
UNION ALL
	VALUES (62, 5, 13, 20)
UNION ALL
	VALUES (63, 5, 10, 20)
UNION ALL
	VALUES (64, 5, 16, 20)
UNION ALL
	VALUES (65, 5, 20, 20)
UNION ALL
	VALUES (66, 5, 14, 30)
UNION ALL
	VALUES (67, 5, 13, 30)
UNION ALL
	VALUES (68, 5, 10, 30)
UNION ALL
	VALUES (69, 5, 16, 30)
UNION ALL
	VALUES (70, 5, 20, 30)
UNION ALL
	VALUES (71, 5, 14, 40)
UNION ALL
	VALUES (72, 5, 13, 40)
UNION ALL
	VALUES (73, 5, 10, 40)
UNION ALL
	VALUES (74, 5, 16, 40)
UNION ALL
	VALUES (75, 5, 20, 40)
UNION ALL
	VALUES (76, 6, 14, 20)
UNION ALL
	VALUES (77, 6, 13, 20)
UNION ALL
	VALUES (78, 6, 4, 20)
UNION ALL
	VALUES (79, 6, 9, 20)
UNION ALL
	VALUES (80, 6, 11, 20)
UNION ALL
	VALUES (81, 6, 14, 30)
UNION ALL
	VALUES (82, 6, 13, 30)
UNION ALL
	VALUES (83, 6, 4, 30)
UNION ALL
	VALUES (84, 6, 9, 30)
UNION ALL
	VALUES (85, 6, 1, 30)
UNION ALL
	VALUES (86, 6, 14, 40)
UNION ALL
	VALUES (87, 6, 13, 40)
UNION ALL
	VALUES (88, 6, 4, 40)
UNION ALL
	VALUES (89, 6, 9, 40)
UNION ALL
	VALUES (90, 11, 3, 40);

INSERT INTO detallePromocionPizza (idPromocion, idPizza, descuento)
	VALUES (1, 1, 0.50)
UNION ALL
	VALUES (1, 2, 0.50)
UNION ALL
	VALUES (1, 3, 0.50)
UNION ALL
	VALUES (1, 4, 0.50)
UNION ALL
	VALUES (1, 5, 0.50)
UNION ALL
	VALUES (1, 6, 0.50)
UNION ALL
	VALUES (1, 7, 0.50)
UNION ALL
	VALUES (1, 8, 0.50)
UNION ALL
	VALUES (1, 9, 0.50)
UNION ALL
	VALUES (1, 10, 0.50)
UNION ALL
	VALUES (1, 11, 0.50)
UNION ALL
	VALUES (1, 12, 0.50)
UNION ALL
	VALUES (1, 13, 0.50)
UNION ALL
	VALUES (1, 14, 0.50)
UNION ALL
	VALUES (1, 15, 0.50)
UNION ALL
	VALUES (1, 16, 0.50)
UNION ALL
	VALUES (1, 17, 0.50)
UNION ALL
	VALUES (1, 18, 0.50)
UNION ALL
	VALUES (2, 1, 0.60)
UNION ALL
	VALUES (2, 2, 0.60)
UNION ALL
	VALUES (2, 3, 0.60)
UNION ALL
	VALUES (2, 4, 0.60)
UNION ALL
	VALUES (2, 5, 0.60)
UNION ALL
	VALUES (2, 6, 0.60)
UNION ALL
	VALUES (2, 7, 0.60)
UNION ALL
	VALUES (2, 8, 0.60)
UNION ALL
	VALUES (2, 9, 0.60)
UNION ALL
	VALUES (2, 10, 0.60)
UNION ALL
	VALUES (2, 11, 0.60)
UNION ALL
	VALUES (2, 12, 0.60)
UNION ALL
	VALUES (2, 13, 0.60)
UNION ALL
	VALUES (2, 14, 0.60)
UNION ALL
	VALUES (2, 15, 0.60)
UNION ALL
	VALUES (2, 16, 0.60)
UNION ALL
	VALUES (2, 17, 0.60)
UNION ALL
	VALUES (2, 18, 0.60)
UNION ALL
	VALUES (3, 1, 0.30)
UNION ALL
	VALUES (3, 2, 0.30)
UNION ALL
	VALUES (3, 3, 0.30)
UNION ALL
	VALUES (3, 4, 0.30)
UNION ALL
	VALUES (3, 5, 0.30)
UNION ALL
	VALUES (3, 6, 0.30)
UNION ALL
	VALUES (3, 7, 0.30)
UNION ALL
	VALUES (3, 8, 0.30)
UNION ALL
	VALUES (3, 9, 0.30)
UNION ALL
	VALUES (3, 10, 0.30)
UNION ALL
	VALUES (3, 11, 0.30)
UNION ALL
	VALUES (3, 12, 0.30)
UNION ALL
	VALUES (3, 13, 0.30)
UNION ALL
	VALUES (3, 14, 0.30)
UNION ALL
	VALUES (3, 15, 0.30)
UNION ALL
	VALUES (3, 16, 0.30)
UNION ALL
	VALUES (3, 17, 0.30)
UNION ALL
	VALUES (3, 18, 0.30);

INSERT INTO Orden (idOrden, tipo, fecha, hora, idEstado, idCliente, idEmpleado)
	VALUES (1, 'Local', CAST('2008-12-12' AS DATE), CAST('15:00:00' AS TIME), 4, 1, 2)
UNION ALL
	VALUES (2, 'Llevar', CAST('2008-12-12' AS DATE), CAST('17:00:00' AS TIME), 4, 2, 18)
UNION ALL
	VALUES (3, 'Llevar', CAST('2008-12-13' AS DATE), CAST('20:00:00' AS TIME), 4, 2, 29);

INSERT INTO detalleOrdenPizza (idOrden, idPizza)
	VALUES (1, 18)
UNION ALL
	VALUES (1, 1)
UNION ALL
	VALUES (1, 2)
UNION ALL
	VALUES (2, 18)
UNION ALL
	VALUES (3, 18);

INSERT INTO Ventas (idVenta, idOrden)
	VALUES (1, 1)
UNION ALL
	VALUES (2, 2)
UNION ALL
	VALUES (3, 3);

-- JOINS

-- El precio de la pizza de Pepperoni grande
SELECT 
	p.nombre,t.nombre,det.precio
FROM
	detallePizzaTamaniosPizza det
JOIN 
	Pizza p
ON 
	det.idPizza = p.idPizza
JOIN 
	TamaniosPizza t
ON 
	t.idTamanio = det.idTamanio
WHERE
	p.nombre = 'Pepperoni' 
	AND
	t.nombre = 'Grande'

-- Los empleados de nombre Cesar con el puesto de Gerente
SELECT 
	e.nombres,e.apellidos,e.telefono,p.nombre as "puesto",p.descripcion
FROM
	Empleados e
JOIN
	Puesto p
ON
	e.idPuesto = p.idPuesto
WHERE
	e.nombres = 'Cesar' 
	AND
	p.nombre = 'Gerente'

-- GROUP BY

-- El precio promedio de la pizzas medianas
SELECT 
	AVG(det.precio)
FROM
	detallePizzaTamaniosPizza det
JOIN 
	Pizza p
ON 
	det.idPizza = p.idPizza
JOIN 
	TamaniosPizza t
ON 
	t.idTamanio = det.idTamanio
WHERE
	t.nombre = 'Mediana'
GROUP BY
	det.idTamanio
ORDER BY	
	det.idTamanio
	
-- El numero de repartidores de la sucursal llamada Fiesta
SELECT 
	COUNT(*)
FROM
	Empleados e
JOIN
	Puesto p
ON
	e.idPuesto = p.idPuesto
JOIN
	Sucursales s
ON
	e.idSucursal = s.idSucursal
WHERE
	p.nombre = 'Repartidor'
	AND
	s.nombre = 'Fiesta'
GROUP BY
	e.idPuesto
ORDER BY
	e.idPuesto

-- HAVING

-- Las pizzas grandes que cuesten mas de 120 pesos
SELECT 
	det.idPizzaGlobal,p.nombre
FROM
	detallePizzaTamaniosPizza det
JOIN 
	Pizza p
ON 
	det.idPizza = p.idPizza
JOIN 
	TamaniosPizza t
ON 
	t.idTamanio = det.idTamanio
WHERE
	t.nombre = 'Grande'			
GROUP BY
	det.idPizzaGlobal,p.nombre
HAVING
	SUM(det.precio) > 120
ORDER BY	
	det.idPizzaGlobal


-- El numero de repartidores y nombre de la sucursal donde exceda al numero de empleados gerentes de todo las empresa
SELECT 
	COUNT(*),s.nombre
FROM
	Empleados e
JOIN
	Puesto p
ON
	e.idPuesto = p.idPuesto
JOIN
	Sucursales s
ON
	e.idSucursal = s.idSucursal
WHERE
	p.nombre = 'Repartidor'
GROUP BY
	e.idPuesto,e.idSucursal,s.nombre
HAVING 
	COUNT(*) > (SELECT 
			COUNT(*)
		FROM
			Empleados e
		JOIN
			Puesto p
		ON
			e.idPuesto = p.idPuesto
		JOIN
			Sucursales s
		ON
			e.idSucursal = s.idSucursal
		WHERE
			p.nombre = 'Gerente')
ORDER BY
	e.idPuesto


