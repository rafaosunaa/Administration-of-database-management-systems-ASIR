select * from liga.equipo;
delimiter $$
drop function if exists liga.puntos$$
create function liga.puntos(puntos_ganados int, puntos_perdidos int)
returns int
begin
declare resultado int default 0;
declare variable int default 0;
set resultado = puntos_ganados - puntos_perdidos;
if resultado>0
then
set variable = 1;
else
set variable = 0;
end if;
return (variable);
end;$$
select liga.puntos(10,0);

delimiter $$
drop procedure if exists liga.equipos$$
create procedure liga.equipos(equipo varchar(30))
begin
declare p_ganados int default 0;
declare p_perdidos int default 0;
declare iequipo varchar(30);
set p_ganados = (select pg from liga.equipo where nombre = equipo);
set p_perdidos = (select pp from liga.equipo where nombre = equipo);
set iequipo = (select nombre from liga.equipo where nombre = equipo);

if (liga.puntos(p_ganados,p_perdidos)=1)
then
select concat("El ",iequipo," es buen equipo");
else 
select concat("El ",iequipo," es mal equipo");
end if;
end;$$

call liga.equipos("bar");