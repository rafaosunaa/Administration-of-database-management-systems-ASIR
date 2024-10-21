set global event_scheduler = on;
delimiter $$
drop event if exists mediaserver.usuario$$
create event mediaserver.usuario on schedule every 1 second
starts '2018-02-21 23:01:00' do
begin

delete from mediaserver.usuario where fecha_alta> date_sub(current_date(),interval 1 day);

end;$$

select * from mediaserver.usuario;

drop event mediaserver;