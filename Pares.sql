delimiter $$

drop procedure if exists liga.puntos_pares$$
create procedure liga.puntos_pares()
begin

declare tmp int;
declare salida bool;
declare contador int;

declare cursor_puntos cursor for select puntos_total from liga.jugador;
declare continue handler for not found set salida=1;

set salida=0,contador=0;

open cursor_puntos;
l_cursor: while(salida=0) do
fetch cursor_puntos into tmp;

if tmp%2=0 then
set contador=contador+1;
end if;

if salida=1 then leave l_cursor;

end if;
end while l_cursor;
close cursor_puntos;
select concat ("el numero de jugadores con puntos pares es ", contador);
end;$$

call liga.puntos_pares()$$

select puntos_total from liga.jugador;