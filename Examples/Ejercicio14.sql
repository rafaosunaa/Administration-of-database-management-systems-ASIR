use mediaserver;
drop trigger if exists cuota_modificar;

delimiter $$
create trigger cuota_modificar after update on mediaserver.usuario
for each row
begin

set @cuota_total= @cuota_total - OLD.cuota;
set @cuota_total = @cuota_total + new.cuota;
end;$$

update mediaserver.usuario set cuota=600 where id_usuario=9;
select @cuota_total;
select * from mediaserver.usuario;