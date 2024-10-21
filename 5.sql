delimiter $$
drop procedure if exists mediaserver.errores$$
create procedure mediaserver.errores(idd_usuario int, idnombre char(20),idcorreo char(20),idregistrado int,
 idfechaalta date, idcuota int, out salida char(10))
begin
declare continue handler for 1062 set salida = "DUPLICADO";
set salida ="No Duplicado";
insert into mediaserver.usuario values (idd_usuario,idnombre,idcorreo,idregistrado,idfechaalta,idcuota);
if salida = "Duplicado" then
select "Entrada duplicada";
else
select "Insertado Correctamente";
end if;
end;$$
call mediaserver.errores(2,'titi','erpapa@gmail.com',4,'2018-03-03',10,@salida);
select * from mediaserver.usuario;

show events;