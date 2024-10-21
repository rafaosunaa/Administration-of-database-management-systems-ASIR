DELIMITER //
DROP FUNCTION IF EXISTS 2asir.existen//
CREATE FUNCTION 2asir.existen(nomb VARCHAR(50),cod VARCHAR(25))
RETURNS VARCHAR(100)
BEGIN
DECLARE sacaralumnos VARCHAR(50);
DECLARE mensaje BOOL DEFAULT 0;
SET sacaralumnos=(SELECT nombre FROM 2asir.alumnos WHERE nombre like nomb and id like cod);
IF sacaralumnos=nomb  THEN
SET mensaje = 1;
ELSE
SET mensaje = 0;
END IF;
RETURN (mensaje);
END;//
SELECT 2asir.existen('Manuel','1a');

DELIMITER //
DROP PROCEDURE IF EXISTS 2asir.medias//
CREATE PROCEDURE 2asir.medias(IN enomb VARCHAR(50),IN ecod VARCHAR(50))
BEGIN
DECLARE manejador BOOL DEFAULT 0;
DECLARE recuperacion INT DEFAULT 0;
DECLARE notaBase FLOAT DEFAULT 0;
DECLARE notaASO FLOAT DEFAULT 0;
DECLARE notaSRI FLOAT DEFAULT 0;
DECLARE notaSeguridad FLOAT DEFAULT 0;
DECLARE notaAplicaciones FLOAT DEFAULT 0;
DECLARE notaEmpresas FLOAT DEFAULT 0;
DECLARE notaLibre FLOAT DEFAULT 0;
DECLARE mediaAlumno FLOAT DEFAULT 0;
DECLARE nota_concreta FLOAT;
DECLARE micursor CURSOR FOR SELECT asig_aprobadas FROM 2asir.alumnos WHERE nombre like enomb and id like ecod;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET manejador = 1;
OPEN micursor;
miBucle:LOOP
FETCH micursor INTO recuperacion;
IF manejador = 1 THEN
LEAVE miBucle;
END IF;
IF (2asir.existen(enomb,ecod)=1) THEN 
SET notaBase=(SELECT nota_asgbd FROM 2asir.alumnos WHERE nombre like enomb and id like ecod);
SET notaASO=(SELECT nota_aso FROM 2asir.alumnos WHERE nombre like enomb and id like ecod);
SET notaSRI=(SELECT nota_sri FROM 2asir.alumnos WHERE nombre like enomb and id like ecod);
SET notaSeguridad=(SELECT nota_seguridad FROM 2asir.alumnos WHERE nombre like enomb and id like ecod);
SET notaAplicaciones=(SELECT nota_aplicaciones FROM 2asir.alumnos WHERE nombre like enomb and id like ecod);
SET notaEmpresas=(SELECT nota_empresas FROM 2asir.alumnos WHERE nombre like enomb and id like ecod);
SET notaLibre=(SELECT nota_libre FROM 2asir.alumnos WHERE nombre like enomb and id like ecod);

SET mediaAlumno = (notaBase+notaASO+notaSRI+notaSeguridad+notaAplicaciones+notaEmpresas+notaLibre)/7;
END IF;
SELECT CONCAT("La media del alumno ",enomb," es ",mediaAlumno);
END LOOP miBucle;
CLOSE micursor;
END;//

CALL 2asir.medias("Manuel","1a")