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
	t.nombre = 'Grande';

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
	p.nombre = 'Gerente';

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
	det.idTamanio;
	
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
	e.idPuesto;

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
	det.idPizzaGlobal;


-- El numero de repartidores y nombre de la sucursal de estos donde exceda al numero de empleados gerentes de todo las empresa
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
	e.idPuesto;


