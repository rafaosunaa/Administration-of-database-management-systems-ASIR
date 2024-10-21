#4.Sobre la base de datos test, crea un procedimiento 
#llamado restar_decena que en su interior modifique el 
#valor de la variable restándole 10.
use test;
delimiter $$
drop procedure if exists test.restar_decena $$
create procedure test.restar_decena(inout restar_decena int)
begin

set restar_decena=restar_decena-10;

end;$$

set @restar_decena=20;
call test.restar_decena(@restar_decena)$$
select @restar_decena$$