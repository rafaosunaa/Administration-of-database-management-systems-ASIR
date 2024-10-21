select * from lope_de_vega.alumnos;
drop table lope_de_vega.alumnos;
create table lope_de_vega.alumnos(
id int auto_increment primary key,
nombre varchar (30),
asignatura varchar (30),
aprobados varchar (30)
)

delimiter $$
drop procedure if exists lope_de_vega.vansolos$$
create procedure lope_de_vega.vansolos()
begin
declare contador int default 0;
while contador <= 11 do
if contador%2=0
then
insert into lope_de_vega.alumnos (nombre,asignatura,aprobados) values (concat("alumno",contador),concat("asignatura",contador),"si");
else
insert into lope_de_vega.alumnos (nombre,asignatura,aprobados) values (concat("ALUMNO",contador),concat("ASIGNATURA",contador),"NO");
end if;
set contador = contador + 1;
end while;
end;$$

call lope_de_vega.vansolos();
select * from lope_de_vega.alumnos;
