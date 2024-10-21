use mediaserver;
drop trigger if exists cuota_usuario;
create trigger cuota_usuario after insert on mediaserver.usuario
for each row set @cuota_total=@cuota_total+new.cuota;
set @cuota_total=0;
insert into mediaserver.usuario values (9,"pablo","pablocastillejo9@gmail.com",1,null,400);

select @cuota_total;