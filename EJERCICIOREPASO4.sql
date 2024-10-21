select * from liga.jugador;
delimiter $$
drop trigger if exists liga.tigrebengala$$
create trigger liga.tigrebengala before insert on liga.jugador
for each row
begin

if new.minutos > 500 then
set new.puntos_total = new.puntos_total + 100;
end if;
end;$$

insert into liga.jugador values("pab",200,560,80,"pab");

delimiter $$
drop trigger if exists liga.tigrebengala2$$
create trigger liga.tigrebengala2 before update on liga.jugador
for each row
begin
if new.minutos > 500 then
set new.puntos_total = new.puntos_total + 100;
end if;
end;$$

update liga.jugador set minutos = 700 where id_jugador = "pab";