delimiter $$
create trigger comprobacion_saldo before update on ebanca.movimientos
for each row
begin
if new.cantidad < 0 then
set new.cantidad = 0;
elseif new.cantidad > 100 then
set new.cantidad = 100;
end if;
end; $$

update ebanca.movimientos set cantidad = 1000 where id_movimiento = 47;