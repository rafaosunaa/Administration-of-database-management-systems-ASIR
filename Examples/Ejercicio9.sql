use test;
drop procedure if exists test.provincia1;
delimiter $$
create procedure test.provincia1 (in iprovincia varchar(25))
begin
if (provincia(iprovincia))then
select concat(iprovincia," es una provincia de Andalucía");
else
select concat(iprovincia," no es una provincia de Andalucía");
end if;
end;$$

call test.provincia1('Cataluña')$$