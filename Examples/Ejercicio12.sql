use liga;
drop procedure if exists liga.insertar_o_modificar_usuario;
delimiter $$
create procedure liga.insertar_o_modificar_usuario()
begin
declare contador int;
set contador = 1;
call insertar_usuario('aaa',20,40,500,'rae',@registro_repetido);
if @registro_repetido = 0 then
select "El registro se ha introducido correctamente";
else

loop1: while @registro_repetido=1 do
call insertar_usuario(concat('aaa',contador),20,30,400,'rae',@registro_repetido);
select concat("El registro esta repetido, el registro ha sido modificado por su nombre + ",contador);
end while loop1;
end if;
end;$$

call insertar_o_modificar_usuario()$$