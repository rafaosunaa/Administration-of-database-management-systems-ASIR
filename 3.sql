delimiter $$
drop function if exists test.correcto$$
create function test.correcto(palabra char (10))
returns bool
begin
declare respuesta bool;
if palabra = 'Córdoba'then
set respuesta = 1;
else
set respuesta = 0;
end if;
return respuesta;
end;$$
select test.correcto('Córdoba');