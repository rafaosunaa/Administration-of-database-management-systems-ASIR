delimiter $$
drop procedure if exists test.equipo$$
create procedure test.equipo()
begin
declare contador int;
drop table if exists test.equipo;
create table test.equipo (id_jugador int,nombre char (20));
set contador = 1;
bucle: while contador<=11 do
insert into test.equipo values (contador, concat("nombre",contador));
set contador = contador + 1;
end while bucle;
end;$$
call test.equipo();
select * from test.equipo;            