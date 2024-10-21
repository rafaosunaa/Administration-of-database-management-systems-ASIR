delimiter $$
drop procedure if exists mediasever.cuota3$$
create procedure mediaserver.cuota3()
begin
declare temp int;
declare salida bool;
declare cuo int;
declare fila int;
declare curs cursor for select cuota from mediaserver.usuario;
declare continue handler for not found set salida=1;
set salida=0;
set temp=0;
set cuo=0;
set fila=0;
open curs;
bucle: while salida=0 do
fetch curs into temp;
if salida=1 then
leave bucle;
end if;
set cuo=cuo+temp;
set fila=fila+1;
end while bucle;
close curs;
select cuo;
end;$$
call mediaserver.cuota3();