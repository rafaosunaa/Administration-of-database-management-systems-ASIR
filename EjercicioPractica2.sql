delimiter $$
drop function if exists concierto.ejer2$$
create function concierto.ejer2(ifecha varchar(30))
returns int
begin 
declare fechaactual varchar (30);
declare fechaconcierto varchar (30);
declare mensaje int default 0;
set fechaactual=(select fecha from concierto.eventos where fecha like current_date());
set fechaconcierto=(select fecha from concierto.eventos where fecha like ifecha);
if fechaactual=fechaconcierto then
set mensaje=1;
else
set mensaje=0;
end if;
return (mensaje);
end;$$

select concierto.ejer2("2018-03-05");
delimiter $$
drop procedure if exists concierto.ejer21$$
create procedure concierto.ejer21(ifecha varchar(30))
begin
if (concierto.ejer2(ifecha)=0)then
select "Las fechas no coinciden, se van a actualizar";
update concierto.eventos set fecha=ifecha where fecha like current_date();
select "Se ha actualizado la fecha";
end if;
end;$$
call concierto.ejer21("2018-03-20");
select * from concierto.eventos;