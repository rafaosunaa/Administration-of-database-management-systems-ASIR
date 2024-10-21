delimiter $$
drop procedure if exists concierto.fecha$$
create procedure concierto.fecha(ifecha char(30))
begin
declare terminar int default 0;
declare lista_fecha varchar(30);
declare mievento varchar(30);
declare cursor1 cursor for select fecha from concierto.eventos where fecha like ifecha;
declare continue handler for not found set terminar=1;
open cursor1;
bucle: loop
fetch cursor1 into lista_fecha;
if terminar=1
then
select "Salida del bucle";
leave bucle;
end if;
if lista_fecha = ifecha then
#set mievento=(select lugar from concierto.eventos where fecha like ifecha);
select lugar into mievento from concierto.eventos where fecha = ifecha;
select "El evento existe";
select concat("el concierto es el dia ",ifecha," Es en ",mievento);
else
select concat("El ",mievento," no existe");
end if;
end loop bucle;
close cursor1;
end;$$

call concierto.fecha("2018-03-04");