delimiter $$
drop procedure if exists liga.cambio_de_equipo$$
create procedure liga.cambio_de_equipo()
begin
declare terminar int default 0;
declare iequipos varchar(5);
declare iidjugador varchar(5); 
declare cursor1 cursor for select id_jugador,equipo from liga.jugador;
declare continue handler for not found set terminar=1;
open cursor1;
bucle: loop
fetch cursor1 into iidjugador,iequipos;
if iequipos="cai" then
update liga.jugador set equipo="mad" where id_jugador=iidjugador;
end if;
if iequipos="mad" then
update liga.jugador set equipo="cai" where id_jugador=iidjugador;
end if;
if terminar=1
then
select "Salida bucle";
leave bucle;
end if;
end loop bucle;
close cursor1; 
end;$$

call liga.cambio_de_equipo();

select * from liga.jugador;