delimiter $$
drop procedure if exists test.contar$$
create procedure test.contar(out resultado int)
begin
declare salida bool;
declare temp int;
declare contador int;
declare cursor1 cursor for select id_jugador from test.equipo;
declare continue handler for not found set salida = 1;
set salida = 0, temp = 0, contador = 0;
open cursor1;
bucle: loop
fetch cursor1 into temp;
if salida=1 then
leave bucle;
end if;
set contador = contador + 1;
end loop bucle;
close cursor1;
set resultado = contador;
end;$$
call test.contar(@resultado);
select @resultado;