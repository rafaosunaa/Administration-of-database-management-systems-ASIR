use liga;
delimiter $$
drop procedure if exists liga.minutos$$
create procedure liga.minutos(in iminutos int)
begin
declare tmp int;
declare salida bool;
declare jugadores int;
declare suma int;
declare cursor1 cursor for select minutos from liga.jugador where minutos > iminutos;
declare continue handler for not found set salida=1;
set salida = 0, jugadores = 0, suma = 0;
open cursor1;
bucle1:loop
fetch cursor1 into tmp;
if salida = 1 then
leave bucle1;
end if;

set jugadores=jugadores+1;
set suma=suma+tmp;

end loop bucle1;
close cursor1;
select concat("hay un total de ",jugadores,"jugadores y los minutos totales son ",suma);
end; $$

call liga.minutos(300);