use test;
drop procedure if exists test.borrar_jugador;
delimiter $$
create procedure test.borrar_jugador (in idd_jugador int)
begin

delete from test.player where id_jugador = idd_jugador;

end;$$

call test.borrar_jugador (5)$$
select * from test.player$$
