#5.Sobre la base de datos test, crea un procedimiento que 
#cree una tabla llamada 
#player que cont
#enga un id_num 
#de clave primaria y un campo nombre.
#Queremos que una vez se cree la tabla se introduzcan 
#automáticamente los 11 jugadores de un equipo de 
#fútbol (realiza este proceso mediante bucles). Al 
#finalizar el proceso, muestra al usuario un mensaje 
#de 
#“Tabla creada satisfactoriamente” y “Equipo inscrito 
#satisfactoriamente”.
use test;
delimiter $$
drop procedure if exists test.equipo $$
create procedure equipo ()
begin
declare contador int;
set contador=1;
loop1:while contador < 12 do
insert into test.player values (contador,concat("nombre_jugador",contador));
set contador=contador+1;
end while loop1;
end;$$

call test.equipo ();
select * from test.player;