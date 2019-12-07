INSERT INTO Estado (idEstado, estado)
	SELECT 1, 'orden_levantada'
UNION ALL
	SELECT 2, 'proceso_preparacion'
UNION ALL
	SELECT 3, 'proceso_entrega'
UNION ALL
	SELECT 4, 'entregado'
UNION ALL
	SELECT 5, 'no_entregado';

INSERT INTO Zona (idZona, nombre, descripcion)
	SELECT 1, 'Norte', 'Norte de la ciudad' 
UNION ALL 
	SELECT 2, 'Sur','Sur de la ciudad' 
UNION ALL 
	SELECT 3, 'Este','Este de la ciudad' 
UNION ALL 
	SELECT 4, 'Oeste','Oeste de la ciudad' 
UNION ALL 
	SELECT 5, 'Periferico','Periferico';

INSERT INTO Puesto (idPuesto, nombre, descripcion)
	SELECT 1, 'Gerente', 'Supervisa empleados de determinada sucursal y la coordina'
UNION ALL
	SELECT 2, 'Telefonista', 'Recibe las ordenes de las pizzas por telefono y genera las ordenes de compra'
UNION ALL
	SELECT 3, 'Cajero' , 'Cobra el total a pagar por determinada orden a los clientes de la pizzeria'
UNION ALL
	SELECT 4, 'Repartidor', 'Se encarga de repartir las pizzas y de que lleguen al cliente'
UNION ALL
	SELECT 5, 'Cocinero', 'Se encarga del proceso de elaboracion de la pizza';

INSERT INTO TamaniosPizza (idTamanio, nombre)
	SELECT 1, 'Chica' 
UNION ALL 
	SELECT 2, 'Mediana' 
UNION ALL 
	SELECT 3, 'Grande';

INSERT INTO Ingrediente (idIngrediente, nombre) 
	SELECT 1, 'Aceitunas' 
UNION ALL 
	SELECT 2, 'Ajo' 
UNION ALL 
	SELECT 3, 'Anchoas' 
UNION ALL 
	SELECT 4, 'Arrachera' 
UNION ALL 
	SELECT 5, 'Atun' 
UNION ALL 
	SELECT 6, 'Camarones' 
UNION ALL 
	SELECT 7, 'Cebolla' 
UNION ALL 
	SELECT 8, 'Champiñones' 
UNION ALL 
	SELECT 9, 'Chorizo' 
UNION ALL 
	SELECT 10, 'Extra Queso' 
UNION ALL 
	SELECT 11, 'Frijoles' 
UNION ALL 
	SELECT 12, 'Jalapeños' 
UNION ALL 
	SELECT 13, 'Jamon' 
UNION ALL 
	SELECT 14, 'Pan Pizza' 
UNION ALL 
	SELECT 15, 'Pastor' 
UNION ALL 
	SELECT 16, 'Pepperoni' 
UNION ALL 
	SELECT 17, 'Pimiento' 
UNION ALL 
	SELECT 18, 'Piña' 
UNION ALL 
	SELECT 19, 'Pollo' 
UNION ALL 
	SELECT 20, 'Salami' 
UNION ALL 
	SELECT 21, 'Salchicha' 
UNION ALL 
	SELECT 22, 'Tocino';

INSERT INTO Promocion (idPromocion, nombre, fechaInicio, fechaFin)
	SELECT 1, 'Navidad', CAST('2008-12-24' AS DATE), CAST('2008-12-26' AS DATE)
UNION ALL
	SELECT 2, 'Año Nuevo', CAST('2008-12-31' AS DATE), CAST('2008-01-01' AS DATE)
UNION ALL
	SELECT 3, 'Dia del niño', CAST('2008-04-30' AS DATE), CAST('2008-05-01' AS DATE);

INSERT INTO Sucursales (idSucursal, nombre, direccion, telefono)
	SELECT 1, 'Prolongacion', 'calle 60 x 18 y 20 Colonia Prolongacion', '9-44-01-77'
UNION ALL
	SELECT 2, 'Fiesta', 'calle 15 x 8 y 10 Colonia Diaz Ordaz', '9-44-01-86'
UNION ALL
	SELECT 3, 'Montecristo', 'calle 10 x 30 Colonia Montecristo', '9-44-01-90';

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
	SELECT 1, 'Cesar', 'Chavez', '9-29-30-72', 1, 1
UNION ALL
	SELECT 2, 'Carlos', 'Perez', '9-44-01-26', 1, 2
UNION ALL
	SELECT 3, 'Roberto', 'Prado', '9-11-01-16', 1, 2
UNION ALL
	SELECT 4, 'Karla', 'Alvarez', '9-14-02-16', 1, 2
UNION ALL
	SELECT 5, 'Sarai', 'Ramirez', '9-19-01-16', 1, 2
UNION ALL
	SELECT 6, 'Alberto', 'Serrano', '9-15-01-20', 1, 3
UNION ALL
	SELECT 7, 'Rafael', 'Hernandez', '9-15-01-26', 1, 4
UNION ALL
	SELECT 8, 'Joel', 'Keb', '9-16-01-18', 1, 4
UNION ALL
	SELECT 9, 'Felipe', 'Soarez', '9-11-01-11', 1, 4
UNION ALL
	SELECT 10, 'Jose', 'Martin', '9-11-11-11', 1, 4
UNION ALL
	SELECT 11, 'Octavio', 'Millan', '9-12-21-26', 1, 4
UNION ALL
	SELECT 12, 'Sofia', 'Segura', '9-25-21-26', 1, 5
UNION ALL
	SELECT 13, 'Sergio', 'Sotelo', '9-15-21-26', 1, 5
UNION ALL
	SELECT 14, 'Gabriela', 'Castillo', '9-35-21-26', 1, 5
UNION ALL
	SELECT 15, 'Sebastian', 'Cortes', '9-45-21-26', 1, 5
UNION ALL
	SELECT 16, 'Rodrigo', 'Dogre', '9-55-21-26', 1, 5
UNION ALL
	SELECT 17, 'Oscar', 'Canche', '9-19-30-72', 2, 1
UNION ALL
	SELECT 18, 'Carlos', 'Cabrera', '9-44-41-96', 2, 2
UNION ALL
	SELECT 19, 'Roberto', 'Molina', '9-21-06-16', 2, 2
UNION ALL
	SELECT 20, 'Alberto', 'Rodriguez', '9-65-01-10', 2, 3
UNION ALL
	SELECT 21, 'Alonso', 'Hernandez', '9-15-11-06', 2, 4
UNION ALL
	SELECT 22, 'Patricia', 'Cetina', '9-16-01-18', 2, 4
UNION ALL
	SELECT 23, 'Enrique', 'Suarez', '9-13-21-11', 2, 4
UNION ALL
	SELECT 24, 'Hector', 'Enriquez', '9-11-11-16', 2, 5
UNION ALL
	SELECT 25, 'Jorge', 'Sierra', '9-15-91-96', 2, 5
UNION ALL
	SELECT 26, 'Maria', 'Cabrera', '9-35-11-16', 2, 5
UNION ALL
	SELECT 27, 'Manuel', 'Rodriguez', '9-19-30-72', 3, 1
UNION ALL
	SELECT 28, 'Jonathan', 'Castillo', '9-14-41-16', 3, 2
UNION ALL
	SELECT 29, 'Jorge', 'Chan', '9-21-36-36', 3, 2
UNION ALL
	SELECT 30, 'Manuel', 'Sanchez', '9-63-31-23', 3, 3
UNION ALL
	SELECT 31, 'Cesar', 'Hernandez', '9-25-11-26', 3, 4
UNION ALL
	SELECT 32, 'Farique', 'Cetina', '9-26-01-28', 3, 4
UNION ALL
	SELECT 33, 'Enrique', 'Perez', '9-23-21-21', 3, 4
UNION ALL
	SELECT 34, 'Cesar', 'Garcia', '9-21-11-26', 3, 5
UNION ALL
	SELECT 35, 'Jorge', 'Perez', '9-25-91-26', 3, 5
UNION ALL
	SELECT 36, 'Maria', 'Sierra', '9-25-11-26', 3, 5;

INSERT INTO Cliente (idCliente, nombres, apellidos, calle, numero, cruzamientos, colonia, ciudad ,estado, codPostal, telefono, idZona)
	SELECT 1, 'Karla', 'Ricalde', '5a', '201b', '18 y 20', 'Aguilas', 'Merida', 'Yucatan', 97121, '9-29-30-54', 1
UNION ALL
	SELECT 2, 'Roberto', 'Perez', '8', '100', '17 y 19', 'Morelos', 'Merida', 'Yucatan', 97131, '9-29-30-12', 2
UNION ALL
	SELECT 3, 'Luis', 'Perez', '12a', '310', '47 y 49', 'Centro', 'Merida', 'Yucatan', 97111, '9-19-30-12', 3
UNION ALL
	SELECT 4, 'Ernesto', 'Canto', '36', '140', '51 y 53', 'Canto', 'Merida', 'Yucatan', 97121, '9-39-30-12', 4
UNION ALL
	SELECT 5, 'Carlos', 'Lopez', '42', '220', '25 y 27', 'Madero', 'Merida', 'Yucatan', 97190, '9-49-30-12', 5;

INSERT INTO detalleEmpleadosZona (idEmpleado, idZona)
	SELECT 7, 1
UNION ALL
	SELECT 8, 2
UNION ALL
	SELECT 9, 3
UNION ALL
	SELECT 10, 4
UNION ALL
	SELECT 11, 5
UNION ALL
	SELECT 21, 1
UNION ALL
	SELECT 22, 2
UNION ALL
	SELECT 23, 3
UNION ALL
	SELECT 21, 4
UNION ALL
	SELECT 22, 5
UNION ALL
	SELECT 31, 1
UNION ALL
	SELECT 32, 2
UNION ALL
	SELECT 31, 3
UNION ALL
	SELECT 32, 4
UNION ALL
	SELECT 31, 5;

INSERT INTO Coordina (idGerente, idEmpleado)
	SELECT 1, 1
UNION ALL
	SELECT 2, 17
UNION ALL
	SELECT 3, 27;

INSERT INTO detalleSucursalesPromocion (idSucursal, idPromocion)
	SELECT 1, 1
UNION ALL
	SELECT 1, 2
UNION ALL
	SELECT 1, 3
UNION ALL
	SELECT 2, 1
UNION ALL
	SELECT 2, 2
UNION ALL
	SELECT 2, 3
UNION ALL
	SELECT 3, 1
UNION ALL
	SELECT 3, 2
UNION ALL
	SELECT 3, 3;

INSERT INTO Pizza (idPizza, nombre)
	SELECT 1, 'Al Pastor'
UNION ALL
	SELECT 2, 'Extravaganza'
UNION ALL
	SELECT 3, 'Hawaiana'
UNION ALL
	SELECT 4, 'Mexicana'
UNION ALL
	SELECT 5, 'Pepperoni'
UNION ALL
	SELECT 6, 'Ranchera';

INSERT INTO detallePizzaTamaniosPizza (idPizzaGlobal, idPizza, idTamanio, precio)
	SELECT 1 ,1, 1, 100
UNION ALL
	SELECT 2, 1, 2, 120
UNION ALL
	SELECT 3, 1, 3, 150
UNION ALL
	SELECT 4, 2, 1, 80
UNION ALL
	SELECT 5, 2, 2, 100
UNION ALL
	SELECT 6, 2, 3, 120
UNION ALL
	SELECT 7, 3, 1, 80
UNION ALL
	SELECT 8, 3, 2, 100
UNION ALL
	SELECT 9, 3, 3, 120
UNION ALL
	SELECT 10, 4, 1, 70
UNION ALL
	SELECT 11, 4, 2, 90
UNION ALL
	SELECT 12, 4, 3, 110
UNION ALL
	SELECT 13, 5, 1, 80
UNION ALL
	SELECT 14, 5, 2, 100
UNION ALL
	SELECT 15, 5, 3, 120
UNION ALL
	SELECT 16, 6, 1, 80
UNION ALL
	SELECT 17, 6, 2, 100
UNION ALL
	SELECT 18, 6, 3, 120;

INSERT INTO detalleTamaniosPizzaIngrediente (idIngredienteGlobal ,idPizza, idIngrediente, gramos)
	SELECT 1, 1, 14, 20
UNION ALL
	SELECT 2, 1, 13, 20
UNION ALL
	SELECT 3, 1, 15, 20
UNION ALL
	SELECT 4, 1, 7, 20
UNION ALL
	SELECT 5, 1, 14, 30
UNION ALL
	SELECT 6, 1, 13, 30
UNION ALL
	SELECT 7, 1, 15, 30
UNION ALL
	SELECT 8, 1, 7, 30
UNION ALL
	SELECT 9, 1, 14, 40
UNION ALL
	SELECT 10, 1, 13, 40
UNION ALL
	SELECT 11, 1, 15, 40
UNION ALL
	SELECT 12, 1, 7, 40
UNION ALL
	SELECT 13, 2, 14, 20
UNION ALL
	SELECT 14, 2, 13, 20
UNION ALL
	SELECT 15, 2, 3, 20
UNION ALL
	SELECT 16, 2, 4, 20
UNION ALL
	SELECT 17, 2, 5, 20
UNION ALL
	SELECT 18, 2, 6, 20
UNION ALL
	SELECT 19, 2, 14, 30
UNION ALL
	SELECT 20, 2, 13, 30
UNION ALL
	SELECT 21, 2, 3, 30
UNION ALL
	SELECT 22, 2, 4, 30
UNION ALL
	SELECT 23, 2, 5, 30
UNION ALL
	SELECT 24, 2, 6, 30
UNION ALL
	SELECT 25, 2, 14, 40
UNION ALL
	SELECT 26, 2, 13, 40
UNION ALL
	SELECT 27, 2, 3, 40
UNION ALL
	SELECT 28, 2, 4, 40
UNION ALL
	SELECT 29, 2, 5, 40
UNION ALL
	SELECT 30, 2, 6, 40
UNION ALL
	SELECT 31, 3, 14, 20
UNION ALL
	SELECT 32, 3, 13, 20
UNION ALL
	SELECT 33, 3, 18, 20
UNION ALL
	SELECT 34, 3, 19, 20
UNION ALL
	SELECT 35, 3, 14, 30
UNION ALL
	SELECT 36, 3, 13, 30
UNION ALL
	SELECT 37, 3, 18, 30
UNION ALL
	SELECT 38, 3, 19, 30
UNION ALL
	SELECT 39, 3, 14, 40
UNION ALL
	SELECT 40, 3, 13, 40
UNION ALL
	SELECT 41, 3, 18, 40
UNION ALL
	SELECT 42, 3, 19, 40
UNION ALL
	SELECT 43, 4, 14, 20
UNION ALL
	SELECT 44, 4, 13, 20
UNION ALL
	SELECT 45, 4, 9, 20
UNION ALL
	SELECT 46, 4, 17, 20
UNION ALL
	SELECT 47, 4, 21, 20
UNION ALL
	SELECT 48, 4, 22, 20
UNION ALL
	SELECT 49, 4, 14, 30
UNION ALL
	SELECT 50, 4, 13, 30
UNION ALL
	SELECT 51, 4, 9, 30
UNION ALL
	SELECT 52, 4, 17, 30
UNION ALL
	SELECT 53, 4, 21, 30
UNION ALL
	SELECT 54, 4, 22, 30
UNION ALL
	SELECT 55, 4, 14, 40
UNION ALL
	SELECT 56, 4, 13, 40
UNION ALL
	SELECT 57, 4, 9, 40
UNION ALL
	SELECT 58, 4, 17, 40
UNION ALL
	SELECT 59, 4, 21, 40
UNION ALL
	SELECT 60, 4, 22, 40
UNION ALL
	SELECT 61, 5, 14, 20
UNION ALL
	SELECT 62, 5, 13, 20
UNION ALL
	SELECT 63, 5, 10, 20
UNION ALL
	SELECT 64, 5, 16, 20
UNION ALL
	SELECT 65, 5, 20, 20
UNION ALL
	SELECT 66, 5, 14, 30
UNION ALL
	SELECT 67, 5, 13, 30
UNION ALL
	SELECT 68, 5, 10, 30
UNION ALL
	SELECT 69, 5, 16, 30
UNION ALL
	SELECT 70, 5, 20, 30
UNION ALL
	SELECT 71, 5, 14, 40
UNION ALL
	SELECT 72, 5, 13, 40
UNION ALL
	SELECT 73, 5, 10, 40
UNION ALL
	SELECT 74, 5, 16, 40
UNION ALL
	SELECT 75, 5, 20, 40
UNION ALL
	SELECT 76, 6, 14, 20
UNION ALL
	SELECT 77, 6, 13, 20
UNION ALL
	SELECT 78, 6, 4, 20
UNION ALL
	SELECT 79, 6, 9, 20
UNION ALL
	SELECT 80, 6, 11, 20
UNION ALL
	SELECT 81, 6, 14, 30
UNION ALL
	SELECT 82, 6, 13, 30
UNION ALL
	SELECT 83, 6, 4, 30
UNION ALL
	SELECT 84, 6, 9, 30
UNION ALL
	SELECT 85, 6, 1, 30
UNION ALL
	SELECT 86, 6, 14, 40
UNION ALL
	SELECT 87, 6, 13, 40
UNION ALL
	SELECT 88, 6, 4, 40
UNION ALL
	SELECT 89, 6, 9, 40
UNION ALL
	SELECT 90, 11, 3, 40;

INSERT INTO detallePromocionPizza (idPromocion, idPizza, descuento)
	SELECT 1, 1, 0.50
UNION ALL
	SELECT 1, 2, 0.50
UNION ALL
	SELECT 1, 3, 0.50
UNION ALL
	SELECT 1, 4, 0.50
UNION ALL
	SELECT 1, 5, 0.50
UNION ALL
	SELECT 1, 6, 0.50
UNION ALL
	SELECT 1, 7, 0.50
UNION ALL
	SELECT 1, 8, 0.50
UNION ALL
	SELECT 1, 9, 0.50
UNION ALL
	SELECT 1, 10, 0.50
UNION ALL
	SELECT 1, 11, 0.50
UNION ALL
	SELECT 1, 12, 0.50
UNION ALL
	SELECT 1, 13, 0.50
UNION ALL
	SELECT 1, 14, 0.50
UNION ALL
	SELECT 1, 15, 0.50
UNION ALL
	SELECT 1, 16, 0.50
UNION ALL
	SELECT 1, 17, 0.50
UNION ALL
	SELECT 1, 18, 0.50
UNION ALL
	SELECT 2, 1, 0.60
UNION ALL
	SELECT 2, 2, 0.60
UNION ALL
	SELECT 2, 3, 0.60
UNION ALL
	SELECT 2, 4, 0.60
UNION ALL
	SELECT 2, 5, 0.60
UNION ALL
	SELECT 2, 6, 0.60
UNION ALL
	SELECT 2, 7, 0.60
UNION ALL
	SELECT 2, 8, 0.60
UNION ALL
	SELECT 2, 9, 0.60
UNION ALL
	SELECT 2, 10, 0.60
UNION ALL
	SELECT 2, 11, 0.60
UNION ALL
	SELECT 2, 12, 0.60
UNION ALL
	SELECT 2, 13, 0.60
UNION ALL
	SELECT 2, 14, 0.60
UNION ALL
	SELECT 2, 15, 0.60
UNION ALL
	SELECT 2, 16, 0.60
UNION ALL
	SELECT 2, 17, 0.60
UNION ALL
	SELECT 2, 18, 0.60
UNION ALL
	SELECT 3, 1, 0.30
UNION ALL
	SELECT 3, 2, 0.30
UNION ALL
	SELECT 3, 3, 0.30
UNION ALL
	SELECT 3, 4, 0.30
UNION ALL
	SELECT 3, 5, 0.30
UNION ALL
	SELECT 3, 6, 0.30
UNION ALL
	SELECT 3, 7, 0.30
UNION ALL
	SELECT 3, 8, 0.30
UNION ALL
	SELECT 3, 9, 0.30
UNION ALL
	SELECT 3, 10, 0.30
UNION ALL
	SELECT 3, 11, 0.30
UNION ALL
	SELECT 3, 12, 0.30
UNION ALL
	SELECT 3, 13, 0.30
UNION ALL
	SELECT 3, 14, 0.30
UNION ALL
	SELECT 3, 15, 0.30
UNION ALL
	SELECT 3, 16, 0.30
UNION ALL
	SELECT 3, 17, 0.30
UNION ALL
	SELECT 3, 18, 0.30;

INSERT INTO Orden (idOrden, tipo, fecha, hora, idEstado, idCliente, idEmpleado)
	SELECT 1, 'Local', CAST('2008-12-12' AS DATE), CAST('15:00:00' AS TIME), 4, 1, 2
UNION ALL
	SELECT 2, 'Llevar', CAST('2008-12-12' AS DATE), CAST('17:00:00' AS TIME), 4, 2, 18
UNION ALL
	SELECT 3, 'Llevar', CAST('2008-12-13' AS DATE), CAST('20:00:00' AS TIME), 4, 2, 29;

INSERT INTO detalleOrdenPizza (idOrden, idPizza)
	SELECT 1, 18
UNION ALL
	SELECT 1, 1
UNION ALL
	SELECT 1, 2
UNION ALL
	SELECT 2, 18
UNION ALL
	SELECT 3, 18;

INSERT INTO Ventas (idVenta, idOrden)
	SELECT 1, 1
UNION ALL
	SELECT 2, 2
UNION ALL
	SELECT 3, 3;
