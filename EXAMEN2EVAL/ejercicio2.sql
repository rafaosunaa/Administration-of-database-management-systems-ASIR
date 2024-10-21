DELIMITER $$
DROP FUNCTION IF EXISTS ebanca.incrementar_saldo$$
CREATE FUNCTION ebanca.incrementar_saldo(saldo INT, porcent INT)
RETURNS INT

DETERMINISTIC

BEGIN
DECLARE valor INT;
DECLARE valor2 INT;

SET valor=saldo*((porcent/100)+1);

IF saldo<0 THEN
set valor=saldo-valor;
set valor=saldo+valor;
END IF;

RETURN(valor);

END; $$

SELECT ebanca.incrementar_saldo(-200,100);


DELIMITER $$
DROP PROCEDURE IF EXISTS ebanca.feliz_cumple$$
CREATE PROCEDURE ebanca.feliz_cumple(IN cod_cli INT, porcent INT)
BEGIN

DECLARE MANEJADOR INT;
DECLARE vsaldo INT;
DECLARE vcuenta INT;
DECLARE vvalor INT;
DECLARE vcli INT;
DECLARE cursor1 CURSOR FOR SELECT saldo,cod_cuenta,cod_cliente FROM ebanca.cuentas WHERE cod_cliente=cod_cli;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET MANEJADOR=1;
SET MANEJADOR=0;

OPEN cursor1;
l_cursor: LOOP
FETCH cursor1 INTO vsaldo,vcuenta,vcli;
IF MANEJADOR=1 THEN
LEAVE l_cursor;
END IF;
SET vvalor=ebanca.incrementar_saldo(vsaldo,porcent);
UPDATE ebanca.cuentas SET saldo=vvalor where cod_cliente=vcli and cod_cuenta=vcuenta;
END LOOP l_cursor;
SELECT "Se ha actualizado la tabla correctamente";
CLOSE cursor1;

END; $$

CALL ebanca.feliz_cumple(9,50);

select * from ebanca.cuentas;


