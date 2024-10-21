DELIMITER $$
DROP TRIGGER IF EXISTS ebanca.ejercicio3$$
CREATE TRIGGER ebanca.ejercicio3 BEFORE INSERT ON ebanca.cuentas
FOR EACH ROW
BEGIN
	IF ( NEW.saldo > 50000 ) THEN
		SET NEW.saldo = 50000;
	END IF;
END;$$

DROP TRIGGER IF EXISTS ebanca.ejercicio3_2$$
CREATE TRIGGER ebanca.ejercicio3_2 BEFORE UPDATE ON ebanca.cuentas
FOR EACH ROW
BEGIN
	IF ( NEW.saldo > 50000 ) THEN
		SET NEW.saldo = 50000;
	END IF;
END;$$
