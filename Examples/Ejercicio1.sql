#1.En la base de datos test, crea un procedimiento donde 
#le pases como parámetros tu nombre, primer apellido y 
#segundo apellido. Como resultado dará un mensaje por 
#terminal de la siguiente forma: 
#“HOLA MIGUEL CASTRO ORTIZ”
use test;
delimiter $$
drop procedure if exists nombre_completo $$
create procedure test.nombre_completo(in nombre varchar(20),in apellido1 varchar(20),in apellido2 varchar(20))
begin
select concat(nombre," ",apellido1," ",apellido2);
end;$$
call test.nombre_completo('Miguel','Castro','Ortiz');