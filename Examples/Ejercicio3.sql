#3.Sobre la base de datos test, crea un procedimiento 
#llamado “suma_numeros” en el que se le pase 2 
#números y una variable que a su salida tendrá la suma 
#de los 2 números.
use test;
delimiter $$
drop procedure if exists test.suma_numeros $$
create procedure test.suma_numeros(in numero1 int, in numero2 int,out salida int)
begin
set salida=numero1+numero2;
end;$$
call test.suma_numeros(3,4,@salida)$$
select @salida$$