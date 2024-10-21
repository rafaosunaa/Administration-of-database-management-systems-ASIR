delimiter $$
drop procedure if exists liga.insertar_usuario$$
create procedure liga.insertar_usuario(in iid varchar(5), in ipuntos int,in iminutos int, in ialtura int,
in iequipo varchar(10), out registro_repetido int)
modifies sql data
begin
declare continue handler for 1062 set registro_repetido=1;
set registro_repetido=0;
insert into liga.jugador values (iid ,ipuntos,iminutos,ialtura,iequipo);
end;$$
call liga.insertar_usuario('aaa',20,30,400,'rae',@registro_repetido) $$
select @registro_repetido $$