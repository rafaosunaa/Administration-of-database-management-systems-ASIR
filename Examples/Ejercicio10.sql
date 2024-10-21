use test;
drop function if exists test.impar;
delimiter $$
create function test.impar(inumero int)
returns int
begin

declare imp int;
if mod(inumero,2) = 0 then
set imp = true;
else
set imp = false;
end if;

return (imp);
end;$$

select test.impar(3);