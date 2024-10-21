create database lope_de_vega;
delimiter $$
drop procedure if exists lope_de_vega.inicio_curso$$
create procedure lope_de_vega.inicio_curso()
begin
declare contador int default 0;
drop table if exists lope_de_vega.alumnos;
while contador < 11 do
create database if not exists lope_de_vega;
create table if not exists lope_de_vega.alumnos(
dni int auto_increment primary key,
nombre varchar(30),
asignatura varchar(30),
aprobado varchar(30)
);
if mod(contador,2) = 0
then
insert into lope_de_vega.alumnos(nombre,asignatura,aprobado) values("nombre","asignatura","no");
else
insert into lope_de_vega.alumnos(nombre,asignatura,aprobado) values("NOMBRE","ASIGNATURA","SI");
end if;
SET contador = contador +1;
END while;
end;$$

call lope_de_vega.inicio_curso();

select * from lope_de_vega.alumnos;