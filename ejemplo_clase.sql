use ebanca;


delimiter $$

drop procedure if exists ebanca.numeronombres$$

create procedure ebanca.numeronombres(in nombreentrada varchar(30))

BEGIN

DECLARE contador INT;
DECLARE salida BOOL;
DECLARE nombre VARCHAR(30);


DECLARE cursor1 CURSOR FOR select nombre from ebanca.clientes;

DECLARE continue HANDLER FOR NOT FOUND SET salida=1;

SET salida=0, contador=0;



OPEN cursor1;


lcursor: WHILE (salida=0) DO

FETCH cursor1 into nombre;




IF nombre like nombreentrada THEN
SET contador=contador+1;
END IF;


IF salida=1 THEN LEAVE lcursor;
END IF;



END WHILE lcursor;

CLOSE cursor1;

SELECT contador;

end; $$



CALL numeronombres('pilar');


SHOW VARIABLES like '%increment%';


use liga;

select * from jugador;


DELIMITER $$

DROP PROCEDURE IF EXISTS liga.insertar_jugador$$

create procedure liga.insertar_jugador (in_id VARCHAR(8), in_puntos int, in_minutos int, in_altura int, in_equipo varchar(8))
MODIFIES SQL DATA
BEGIN

DECLARE registro_repetido INT DEFAULT 0;

DECLARE CONTINUE HANDLER FOR 1062 SET registro_repetido=1;

INSERT INTO liga.jugador VALUES (in_id, in_puntos, in_minutos, in_altura, in_equipo);

IF registro_repetido=1 THEN
SELECT "Error registro repetido";
ELSE
SELECT "Registro insertado correctamente";
END IF;

END;$$






call liga.insertar_jugador ('aaa',20,40,500,'cai');

select * from liga.jugador;


call liga.insertar_jugador ('aaa',20,40,500,'cai');



use ebanca;

select * from movimientos;


select * from cuentas;

select * from cuentas;


select * from clientes;


select now();




DELIMITER $$

CREATE EVENT bonificaciones
ON SCHEDULE EVERY 1 DAY
STARTS NOW() ENABLE
DO
UPDATE ebanca.cuentas set saldo=0 where fecha_creacion between now() and date_add(now(), interval -9 year);$$


show events;

select now();


select * from ebanca.cuentas;

drop event bonificacion;
drop event bonificaciones;









use liga;

select * from jugador;


DELIMITER $$

DROP PROCEDURE IF EXISTS liga.puntos_pares$$


CREATE PROCEDURE liga.puntos_pares()
BEGIN

DECLARE tmp int;
DECLARE salida bool;
DECLARE contador int;


DECLARE cursor_puntos CURSOR for SELECT puntos_total from liga.jugador;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET salida=1;


SET salida=0, contador=0;


OPEN cursor_puntos;


l_cursor: WHILE (salida=0) DO

FETCH cursor_puntos INTO tmp;



IF tmp%2=0 THEN
SET contador=contador+1;
END IF;


IF salida=1 THEN 
IF tmp%2=0 THEN
SET contador=contador-1;
END IF;
LEAVE l_cursor;
END IF;

END WHILE l_cursor;

CLOSE cursor_puntos;

SELECT concat ("EL NÚMERO DE JUGADORES CON PUNTOS PARES ES ", contador);

END;$$




CALL liga.puntos_pares();


select puntos_total from liga.jugador;


use ebanca;

select * from clientes;

select * from movimientos;




DELIMITER $$

DROP PROCEDURE IF EXISTS ebanca.insertar_cliente $$


CREATE PROCEDURE ebanca.insertar_cliente (in_codigo_cliente INT, in_dni INT, in_nombre CHAR(20), in_apellido1 CHAR(20), in_apellido2 CHAR(20), in_direccion CHAR(20), in_region VARCHAR(45), OUT estado INT)
BEGIN

DECLARE CONTINUE HANDLER FOR 1062 SET estado=1;

SET estado=0;

INSERT INTO ebanca.clientes (codigo_cliente, dni, nombre, apellido1, apellido2, direccion, region) VALUES (in_codigo_cliente, in_dni, in_nombre, in_apellido1, in_apellido2, in_direccion, in_region);

END;$$

DELIMITER $$

DROP PROCEDURE IF EXISTS ebanca.insertar_o_modificar_cliente $$

CREATE PROCEDURE ebanca.insertar_o_modificar_cliente (in_codigo_cliente INT, 
in_dni INT, in_nombre CHAR(20), in_apellido1 CHAR(20), in_apellido2 CHAR(20), 
in_direccion CHAR(20), in_region VARCHAR(45))
BEGIN

DECLARE estado INT;

CALL ebanca.insertar_cliente (in_codigo_cliente, in_dni, in_nombre, in_apellido1, 
in_apellido2, in_direccion, in_region, estado);


if estado=1 THEN

UPDATE ebanca.clientes set nombre=in_nombre, apellido1=in_apellido1, 
apellido2=in_apellido2, direccion=in_direccion, region=in_region 
where codigo_cliente=in_codigo_cliente and dni=in_dni;
SELECT "REGISTRO MODIFICADO CORRECTAMENTE";
else
SELECT "REGISTRO INSERTADO CORRECTAMENTE";

END IF;

END;$$



select * from ebanca.clientes;




CALL ebanca.insertar_o_modificar_cliente (22, 98778900, "pepe", "perez", "ortiz", "rj", "andalucia");




