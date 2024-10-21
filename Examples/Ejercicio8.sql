use test;
drop function if exists test.provincia;
delimiter $$
create function test.provincia(provincia varchar(25))
returns int
begin

declare variable int;
if provincia='Cordoba' or provincia='Sevilla' or provincia='Malaga' or provincia='Cadiz' or provincia='Jaen'
or provincia='Granada' or provincia='Almeria' or provincia='Huelva' then
set variable=true;
else
set variable=false;
end if;
return (variable);
end;$$
select provincia('Madrid')$$