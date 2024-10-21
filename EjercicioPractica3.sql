delimiter $$
drop trigger if exists concierto.sueldo1$$
create trigger concierto.sueldo1 before insert on concierto.sueldo
for each row
begin
if (new.pago<250) then
set new.pago=250;
end if;
end;$$
insert into concierto.sueldo values(2,"pablo","2018-03-05",100);

select * from concierto.sueldo;