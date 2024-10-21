set global event_scheduler = on;
use mediaserver;
drop event if exists borrar_usuarios;
delimiter $$
create event borrar_usuarios on schedule every 1 day starts '2018-03-01 10:00:00' enable do
begin

delete from ebanca.movimientos where fecha_hora < date_sub(current_date(),interval 30 day);

end;$$

select * from ebanca.movimientos;