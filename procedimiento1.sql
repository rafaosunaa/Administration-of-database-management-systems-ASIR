use ebanca;
select * from clientes;
select * from movimientos;
delimiter $$
drop procedure if exists ebanca.insertar $$
create procedure ebanca.insertar (in_dni int, in_nombre char(40),in_codigo_cliente int, in_apellido1 varchar(20), in_direccion1 varchar(20),out estado int)
begin
declare continue handler for 1062 set estado=1;
insert into ebanca.clientes (dni,nombre,codigo_cliente,apellido1,direccion) values (in_dni,in_nombre,in_codigo_cliente,in_apellido1,in_direccion1);
set estado=0;
end;$$

select * from ebanca.clientes;
call ebanca.insertar(23523563, 'pablo', 878574768, 'montero', 'julio', @estado);