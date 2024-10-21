delimiter $$
drop function if exists demosueldo.existe$$
create function demosueldo.existe(inombre varchar(30),isexo varchar(69))
returns varchar(69)
begin
declare resultado int default 0;
declare trabajador varchar(30);
set trabajador = (select nombre from demosueldo.salarios where nombre = inombre and sexo = isexo);
if trabajador = inombre 
then
set resultado = 1;
else
set resultado = 0;
end if;
return resultado;
end;$$
select demosueldo.existe("Pablo Castillejo Montero","H");

delimiter $$
drop procedure if exists demosueldo.media$$
create procedure demosueldo.media(iinombre varchar(30),iisexo varchar(1))
begin
declare terminar int default 0;
declare genero float default 0;
declare sumasueldo float default 0;
declare media float default 0;
declare contador int default 0;
declare sacar_sueldo float default 0;
declare cursor1 cursor for select sueldo from demosueldo.salarios where sexo like iisexo;
declare continue handler for not found set terminar=1;
open cursor1;
bucle: loop
fetch cursor1 into genero;
if terminar=1
then
leave bucle;
end if;
set contador = contador +1;
set sumasueldo = sumasueldo + genero;
set media = sumasueldo/contador;
set sacar_sueldo = (select sueldo from demosueldo.salarios where nombre like iinombre and sexo like iisexo);
end loop bucle;
if (demosueldo.existe(iinombre,iisexo)=1) then
if sacar_sueldo>media 
then
select concat("El trabajador ",iinombre," gana ",sacar_sueldo," y esta por encima de la media que es ",media);
else
select concat("El trabajador ",iinombre," gana ",sacar_sueldo," y esta por debajo de la media que es ",media);
end if;
end if;
close cursor1;
end;$$

call demosueldo.media("Joaquin Jimenez Alcaide","H");

select * from demosueldo.salarios;