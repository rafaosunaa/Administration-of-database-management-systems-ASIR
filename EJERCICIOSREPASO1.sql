select * from liga.jugador;
delimiter $$
drop procedure if exists liga.cambiar$$
create procedure liga.cambiar()
begin
declare terminar int default 0;
declare recorrer varchar (30);
declare recorrer1 varchar (30);
declare cursor1 cursor for select id_jugador,equipo from liga.jugador;
declare continue handler for not found  set terminar = 1;
open cursor1;
bucle: loop
fetch cursor1 into recorrer1,recorrer;
if terminar = 1 
then
leave bucle;
end if;
if recorrer = "cai"
then
update liga.jugador set equipo = "mad" where id_jugador = recorrer1;
end if;
if recorrer = "mad"
then
update liga.jugador set equipo = "cai" where id_jugador = recorrer1;
end if;
end loop bucle;
close cursor1;
end;$$

call liga.cambiar();