-- DROP DATABASE IF EXISTS Pizzeria;
-- SET ANSI_WARNINGS OFF
CREATE DATABASE Pizzeria;
-- USE Pizzeria;
-- SET ANSI_WARNINGS OFF

-- DROP TABLE IF EXISTS Orden;
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

-- DROP TABLE IF EXISTS Estado;
CREATE TABLE Estado (
	idEstado INTEGER NOT NULL,
	estado VARCHAR(30) NULL,
	CONSTRAINT estado_pkey PRIMARY KEY (idEstado)
);

-- DROP TABLE IF EXISTS Cliente;
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

-- DROP TABLE IF EXISTS Sucursales;
CREATE TABLE Sucursales (
	idSucursal INTEGER NOT NULL,
	nombre VARCHAR(60) NOT NULL,  
	direccion VARCHAR(80) NOT NULL,
	telefono VARCHAR(15) NOT NULL,
	CONSTRAINT sucursales_pkey PRIMARY KEY (idSucursal)
);

-- DROP TABLE Orden CASCADE;
ALTER TABLE Orden 
	ADD CONSTRAINT relOrdenEstado FOREIGN KEY (idEstado) REFERENCES Estado(idEstado);
ALTER TABLE Orden 
	ADD CONSTRAINT relOrdenCliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);
	
-- DROP TABLE IF EXISTS Zona;
CREATE TABLE Zona (
	idZona INTEGER NOT NULL,
	nombre VARCHAR(40) NOT NULL,  
	descripcion VARCHAR(80) NOT NULL,
	CONSTRAINT zona_pkey PRIMARY KEY (idZona)
);

-- DROP TABLE Cliente CASCADE;
ALTER TABLE Cliente 
	ADD CONSTRAINT relClienteZona FOREIGN KEY (idZona) REFERENCES Zona(idZona);

-- DROP TABLE IF EXISTS Empleados;
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

-- DROP TABLE IF EXISTS Puesto;
CREATE TABLE Puesto (
	idPuesto INTEGER NOT NULL,
	nombre VARCHAR(40) NOT NULL,  
	descripcion VARCHAR(80) NOT NULL,
	CONSTRAINT puesto_pkey PRIMARY KEY (idPuesto)
);

-- DROP TABLE Empleados CASCADE;
ALTER TABLE Empleados
	ADD CONSTRAINT relEmpleadosPuesto FOREIGN KEY (idPuesto) REFERENCES Puesto(idPuesto);

-- DROP TABLE IF EXISTS Pizza;
CREATE TABLE Pizza (
	idPizza INTEGER NOT NULL,
	nombre VARCHAR(60) NOT NULL,  
	CONSTRAINT pizza_pkey PRIMARY KEY (idPizza)
);

-- DROP TABLE IF EXISTS detallePizzaTamaniosPizza;
CREATE TABLE detallePizzaTamaniosPizza (
	idPizzaGlobal INTEGER NOT NULL,
	idPizza INTEGER NOT NULL,
	idTamanio INTEGER NOT NULL,
	precio FLOAT NOT NULL,
	CONSTRAINT detallePizzaTamaniosPizza_pkey PRIMARY KEY (idPizzaGlobal)
);

-- DROP TABLE IF EXISTS TamaniosPizza;
CREATE TABLE TamaniosPizza (
	idTamanio INTEGER NOT NULL,
	nombre VARCHAR(60) NOT NULL,  
	CONSTRAINT tamaniosPizza_pkey PRIMARY KEY (idTamanio)
);

-- DROP TABLE detallePizzaTamaniosPizza CASCADE;
ALTER TABLE detallePizzaTamaniosPizza
	ADD CONSTRAINT reldetallePizzaTamaniosPizzaPizza FOREIGN KEY (idPizza) REFERENCES Pizza(idPizza);
ALTER TABLE detallePizzaTamaniosPizza
	ADD CONSTRAINT reldetallePizzaTamaniosPizzaTamanios FOREIGN KEY (idTamanio) REFERENCES TamaniosPizza(idTamanio);

-- DROP TABLE IF EXISTS detalleOrdenPizza;
CREATE TABLE detalleOrdenPizza (
	idOrden INTEGER NOT NULL,
	idPizza INTEGER NOT NULL,
	CONSTRAINT detalleOrdenPizza_pkey PRIMARY KEY (idOrden, idPizza)
);

-- DROP TABLE detalleOrdenPizza CASCADE;
ALTER TABLE detalleOrdenPizza
	ADD CONSTRAINT reldetalleOrdenPizzaOrden FOREIGN KEY (idOrden) REFERENCES Orden(idOrden);
ALTER TABLE detalleOrdenPizza
	ADD CONSTRAINT reldetalleOrdenPizzadetallePizzaTamaniosPizza FOREIGN KEY (idPizza) REFERENCES detallePizzaTamaniosPizza(idPizzaGlobal);
	
-- DROP TABLE IF EXISTS Ingrediente;
CREATE TABLE Ingrediente (
	idIngrediente INTEGER NOT NULL,
	nombre VARCHAR(60) NOT NULL,  
	CONSTRAINT ingrediente_pkey PRIMARY KEY (idIngrediente)
);

-- DROP TABLE IF EXISTS detalleTamaniosPizzaIngrediente;
CREATE TABLE detalleTamaniosPizzaIngrediente (
	idIngredienteGlobal INTEGER NOT NULL,
	idPizza INTEGER NOT NULL,
	idIngrediente INTEGER NOT NULL,
	gramos FLOAT NOT NULL,
	CONSTRAINT detalleTamaniosPizzaIngrediente_pkey PRIMARY KEY (idIngredienteGlobal)
);

-- DROP TABLE detalleTamaniosPizzaIngrediente CASCADE;
ALTER TABLE detalleTamaniosPizzaIngrediente
	ADD CONSTRAINT reldetalleTamaniosPizzaIngredientePizza FOREIGN KEY (idPizza) REFERENCES detallePizzaTamaniosPizza(idPizzaGlobal);
ALTER TABLE detalleTamaniosPizzaIngrediente
	ADD CONSTRAINT reldetalleTamaniosPizzaIngredienteIngrediente FOREIGN KEY (idIngrediente) REFERENCES Ingrediente(idIngrediente);
	
-- DROP TABLE IF EXISTS Promocion;
CREATE TABLE Promocion (
	idPromocion INTEGER NOT NULL,
	nombre VARCHAR(60) NOT NULL,  
	fechaInicio DATE NOT NULL,
	fechaFin DATE NOT NULL,
	CONSTRAINT promocionPizza_pkey PRIMARY KEY (idPromocion)
);

-- DROP TABLE IF EXISTS detallePromocionPizza;
CREATE TABLE detallePromocionPizza (
	idPromocion INTEGER NOT NULL,
	idPizza INTEGER NOT NULL,
	descuento FLOAT NOT NULL,
	CONSTRAINT detallePromocionPizza_pkey PRIMARY KEY (idPromocion, idPizza)
);

-- DROP TABLE detallePromocionPizza CASCADE;
ALTER TABLE detallePromocionPizza
	ADD CONSTRAINT reldetallePromocionPizzaPromocion FOREIGN KEY (idPromocion) REFERENCES Promocion(idPromocion);
ALTER TABLE detallePromocionPizza
	ADD CONSTRAINT reldetallePromocionPizzaPizza FOREIGN KEY (idPizza) REFERENCES detallePizzaTamaniosPizza(idPizzaGlobal);

-- DROP TABLE IF EXISTS detalleSucursalesPromocion;
CREATE TABLE detalleSucursalesPromocion (
	idSucursal INTEGER NOT NULL,
	idPromocion INTEGER NOT NULL,
	CONSTRAINT detalleSucursalesPromocion_pkey PRIMARY KEY (idSucursal, idPromocion)
);

-- DROP TABLE detalleSucursalesPromocion CASCADE;
ALTER TABLE detalleSucursalesPromocion
	ADD CONSTRAINT reldetalleSucursalPromocionSucursales FOREIGN KEY (idSucursal) REFERENCES Sucursales(idSucursal);
ALTER TABLE detalleSucursalesPromocion
	ADD CONSTRAINT reldetalleSucursalPromocionPromocion FOREIGN KEY (idPromocion) REFERENCES Promocion(idPromocion);

-- DROP TABLE Orden CASCADE;
ALTER TABLE Orden
	ADD CONSTRAINT relOrdenEmpleados FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado);

-- DROP TABLE IF EXISTS Ventas;
CREATE TABLE Ventas (
	idVenta INTEGER NOT NULL,
	idOrden INTEGER NOT NULL,
	CONSTRAINT ventas_pkey PRIMARY KEY (idVenta, idOrden)
);

-- DROP TABLE Ventas CASCADE;
ALTER TABLE Ventas
	ADD CONSTRAINT relVentasOrden FOREIGN KEY (idOrden) REFERENCES Orden(idOrden);

-- DROP TABLE IF EXISTS Coordina;
CREATE TABLE Coordina (
	idGerente INTEGER NOT NULL,
	idEmpleado INTEGER NOT NULL,
	CONSTRAINT coordina_pkey PRIMARY KEY (idGerente),
	CONSTRAINT coordina_unique_empleado UNIQUE (idEmpleado)
);

-- DROP TABLE Coordina CASCADE;
ALTER TABLE Coordina
	ADD CONSTRAINT relCoordinaEmpleados FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado);

-- DROP TABLE IF EXISTS detalleEmpleadosZona;
CREATE TABLE detalleEmpleadosZona (
	idEmpleado INTEGER NOT NULL,
	idZona INTEGER NOT NULL,
	CONSTRAINT detalleEmpleadosZona_pkey PRIMARY KEY (idEmpleado, idZona)
);

-- DROP TABLE detalleEmpleadosZona CASCADE;
ALTER TABLE detalleEmpleadosZona
	ADD CONSTRAINT reldetalleEmpleadosZonaEmpleado FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado);
ALTER TABLE detalleEmpleadosZona
	ADD CONSTRAINT reldetalleEmpleadosZonaZona FOREIGN KEY (idZona) REFERENCES Zona(idZona);
