delimiter $$
drop procedure if exists test.si$$
create procedure test.si(ciudad char (10))
begin 
if (test.correcto(ciudad)) = 1 then
select "SI";
else
select "NO";
end if;
end;$$
call test.si('Córdoba');