delimiter $$
drop procedure if exists lope_de_vega.estadistica$$
create procedure lope_de_vega.estadistica()
begin
declare terminar int default 0;
declare total int default 0;
declare contador_si int default 0;
declare contador_no int default 0;
declare porcentaje int default 0;
declare alumnos_aprobados varchar (30);
declare cursor1 cursor for select aprobado from lope_de_vega.alumnos;
declare continue handler for not found set terminar = 1;
open cursor1;
bucle: loop
fetch cursor1 into alumnos_aprobados;
if terminar=1 then
leave bucle;
end if;
set total = total + 1;
if alumnos_aprobados = "SI" 
then
set contador_si = contador_si + 1;
end if;
set porcentaje = (contador_si * 100)/ total;
set contador_no = 100 - porcentaje;
end loop bucle;
select concat("EL porcentaje de aprobados son ",porcentaje," y el porcentaje de suspensos seran ",contador_no);
close cursor1;
end;$$

call lope_de_vega.estadistica();

select * from lope_de_vega.alumnos;