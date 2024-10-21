select * from concierto.sueldo;
delimiter $$
drop trigger if exists concierto.sueldo2$$
create trigger concierto.sueldo2 before insert on concierto.sueldo
for each row
begin
if new.pago<250 
then
set new.pago = 250;
end if;
end;$$
insert into concierto.sueldo values(6,"magnatess","2018-03-07",500);

delimiter $$
drop trigger if exists concierto.sueldo3$$
create trigger concierto.sueldo3 before update on concierto.sueldo
for each row
begin
if new.fecha = " "
then
set new.fecha = current_date();
end if;
end;$$

update concierto.sueldo set fecha = " " where id = 1;