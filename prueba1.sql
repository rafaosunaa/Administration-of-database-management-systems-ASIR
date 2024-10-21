delimiter $$
drop procedure if exists liga.cursor1$$
create procedure liga.cursor1(iminutos int)
begin
declare tiempo int;
declare temp int;
declare fila int;
declare salida bool;
declare cursor1 cursor for select minutos from liga.jugador where minutos>iminutos;
declare continue handler for not found set salida=1;
set salida=0,fila=0,tiempo=0;
open cursor1;
bucle: while salida=0 do
fetch cursor1 into temp;
if salida=1 then
leave bucle;
end if;
set tiempo=tiempo+temp;
set fila=fila+1;
end while bucle;
close cursor1;
select fila;
select tiempo;
end;$$
call liga.cursor1(200);
select * from liga.jugador;