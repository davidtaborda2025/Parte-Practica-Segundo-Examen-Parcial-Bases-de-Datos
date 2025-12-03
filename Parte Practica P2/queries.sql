-- Primera consulta para la superficie de cada continente.
SELECT NAME, AREA FROM CONTINENT;

-- Segunda consulta para la superficie y la profundidad del Lago Malawi (Lake Malawi).
SELECT NAME, AREA, DEPTH FROM LAKE WHERE NAME = 'Lake Malawi';

-- Tercera consulta para ordenar los lugares por profundidad, de manera descendente.
SELECT NAME, AREA, DEPTH FROM LAKE ORDER BY DEPTH DESC;

-- Consulta alternativa a la tercera, ordenando por profundidad solo los lugares que tienen profundidad definida, es
-- decir, sin valores nulos (NULL).
SELECT NAME, AREA, DEPTH FROM LAKE WHERE DEPTH IS NOT NULL
ORDER BY DEPTH DESC;

-- Cuarta consulta para el nombre de los países cuyo porcentaje de PIB es al menos un 50% en agricultura (interpretado
-- como porcentaje mayor o igual a 50%), mediante un INNER JOIN entre la tabla COUNTRY y la tabla ECONOMY.
SELECT NAME, ECONOMY.AGRICULTURE FROM COUNTRY INNER JOIN ECONOMY ON COUNTRY.CODE = ECONOMY.COUNTRY
WHERE ECONOMY.AGRICULTURE >= 50;

-- Quinta consulta para el nombre del río más largo registrado, usando una subconsulta.
SELECT NAME FROM RIVER WHERE LENGTH = (SELECT MAX(LENGTH) FROM RIVER);