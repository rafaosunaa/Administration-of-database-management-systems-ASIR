delimiter $$
create procedure insertar_o_modificar(in_dni int, in_nombre char(40),in_codigo_cliente int, in_apellido1 varchar(20), in_direccion1 varchar(20),out in_estado int)
begin
call ebanca.cliente(in_dni,in_nombre,in_codigo_cliente_in_apellido1,in_direccion,in_region,@estado)
if estado=1 then








end;$$
