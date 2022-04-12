create schema Banco_de_Brasilia; 

use Banco_de_Brasilia;

create table usuario(
	id int primary key not null auto_increment,
    nome varchar(20) not null,
    idade int 
);

drop table usuario;

select * from usuario;

insert usuario (nome,idade)
values("Mateus prof",5);

update usuario set nome= "jack chinn" where id=2;

delete from usuario where id=1;


