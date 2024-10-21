delimiter $$
drop trigger if exists lope_de_vega.errorr$$
create trigger lope_de_vega.errorr before insert on lope_de_vega.alumnos
for each row
begin
declare contar int default 0;
if (new.aprobado != "SI") or (new.aprobado != "NO") 
then
set new.aprobado = " ";
set new.nombre = " ";
set new.asignatura = " ";
end if;
end;$$

insert into lope_de_vega.alumnos values(25,"MIGUEL CASTRO","BASE DE DATOS","SI");

select * from lope_de_vega.alumnos;