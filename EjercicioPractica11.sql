delimiter $$
drop trigger if exists concierto.anonimo$$
create trigger concierto.anonimo before insert on concierto.sueldo
for each row
begin
if new.nombre = " " 
then
set new.nombre = "Anonimo";
end if;
end;$$

insert into concierto.sueldo values(3," ","2018-03-07",270);

select * from concierto.sueldo;

delimiter $$
drop trigger if exists concierto.anonimo2$$
create trigger concierto.anonimo2 before update on concierto.sueldo
for each row
begin
if new.nombre = " " 
then
set new.nombre = "Anonimo";
end if;
end;$$
update concierto.sueldo set nombre = " " where id = 1;