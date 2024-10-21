set global event_scheduler = on;
use mediaserver;

delimiter $$
drop event if exists resetear_cuota$$
create event resetear_cuota on schedule every 1 day
starts '2018-02-10 23:59:00' enable do
begin

update mediaserver.usuario set cuota=0;

end;$$

select * from mediaserver.usuario;