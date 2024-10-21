create table test.player(
id int auto_increment primary key,
nombre varchar(30),
calidad varchar(30)
);
insert into test.player(nombre,calidad) values("carlos","malo");
select * from test.player;
drop table test.player;

delimiter $$
drop procedure if exists test.metersolo$$
create procedure test.metersolo()
begin
declare contador int default 1;
while contador <= 11 do
if mod(contador,2) = 0
then
insert into test.player(nombre,calidad) values (concat("nombre",contador),"bueno");
set contador = contador + 1;
else
insert into test.player(nombre,calidad) values (concat("nombre",contador),"malo");
set contador = contador + 1;
end if;
end while;
end;$$

call test.metersolo();