delimiter $$
create trigger mediaserver.eliminar_usuario after delete on mediaserver.usuario
for each row
set @cuota_total = @cuota_total - old.cuota;

delete from mediaserver.usuario where id_usuario = 9;
select @cuota_total

#Si el usuario es eliminado, la cuota total va a serguir de la mismo forma. Entonces vamos a crear un disparador que cuando
#se elimine el usuario va a restar a la cuota total, la cuota vieja.
