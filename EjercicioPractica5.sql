delimiter $$
drop function if exists liga.puntoswl$$
create function liga.puntoswl(puntos_win int, puntos_lose int)
returns int
begin
declare resultado int default 0;
declare booleano int default 0;
set resultado=puntos_win-puntos_lose;
if resultado>0 
then
set booleano = 1;
else
set booleano = 0;
end if;
return booleano;
end;$$

delimiter $$
drop procedure if exists liga.punto_equipo$$
create procedure liga.punto_equipo(nombre_equipo varchar(30))
begin

select pg into @x from liga.equipo where nombre=nombre_equipo;
select pp into @y from liga.equipo where nombre=nombre_equipo;

if (liga.puntoswl(@x,@y)=1) 
then
select "Buen equipo";
else 
select "Mal equipo";
end if;
end;$$
call liga.punto_equipo("cai");