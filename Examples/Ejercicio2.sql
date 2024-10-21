#2.Sobre la base de datos test, crea un procedimiento 
#llamado “números_ordenados” en el que se le pase 3 
#números. Como resultado mostrará un mensaje con los 
#números ordenados.
use test;
delimiter $$
drop procedure if exists test.numero_ordenados $$
create procedure test.numero_ordenados(in numero1 int, in numero2 int, in numero3 int)
begin
if numero1 > numero2 and numero1 > numero3 then
if numero2 > numero3 then
select concat(numero1,",",numero2,",",numero3);
else
select concat(numero1,",",numero3,",",numero2);
end if;
end if;
if numero2 > numero1 and numero2 > numero3 then
if numero1 > numero3 then
select concat(numero2,",",numero1,",",numero3);
else
select concat(numero2,",",numero3,",",numero1);
end if;
end if;
if numero3 > numero2 and numero3 > numero1 then
if numero2 > numero1 then
select concat(numero3,",",numero2,",",numero1);
else
select concat(numero3,",",numero1,",",numero2);
end if;
end if;
end;$$
call test.numero_ordenados(4,7,2);