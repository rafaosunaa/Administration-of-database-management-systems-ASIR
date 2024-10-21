DELIMITER $$
DROP PROCEDURE IF EXISTS liga.mas_o_menos_que_la_media$$
CREATE PROCEDURE liga.mas_o_menos_que_la_media(IN id_jug CHAR(8))
BEGIN

DECLARE MANEJADOR INT;
DECLARE CONTADOR INT;
DECLARE TOTAL_ALT INT;
DECLARE MEDIA INT;
DECLARE valt int;
DECLARE valt2 int;

DECLARE cursor1 CURSOR FOR SELECT altura FROM liga.jugador;
DECLARE cursor2 CURSOR FOR SELECT altura FROM liga.jugador where id_jugador=id_jug;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET MANEJADOR=1;
SET MANEJADOR=0,CONTADOR=0,TOTAL_ALT=0,MEDIA=0;

OPEN cursor1;
l_cursor: LOOP
FETCH cursor1 INTO valt;
IF MANEJADOR=1 THEN
LEAVE l_cursor;
END IF;
SET CONTADOR=CONTADOR+1;
SET TOTAL_ALT=TOTAL_ALT+valt;
SET MEDIA=TOTAL_ALT/CONTADOR;
END LOOP l_cursor;
CLOSE cursor1;

SET MANEJADOR=0;
OPEN cursor2;
l_cursor2: LOOP
FETCH cursor2 INTO valt2;
IF MANEJADOR=1 THEN
LEAVE l_cursor2;
END IF;
IF valt2 > MEDIA THEN
SELECT CONCAT("Altura jugador ",id_jug,": ",valt2," - Media jugadores: ",MEDIA," - El jugador ",id_jug," está por encima de la media en altura");
ELSE
SELECT CONCAT("Altura jugador",id_jug,": ",valt2," - Media jugadores: ",MEDIA," - El jugador ",id_jug," está por debajo de la media en altura");
END IF;
END LOOP l_cursor2;
CLOSE cursor2;



END; $$

CALL liga.mas_o_menos_que_la_media('ant');

