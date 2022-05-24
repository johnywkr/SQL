
create schema form;

use form;

create table cliente(
	cpf varchar(11) primary key,
    nome varchar(40),
    email varchar(60),
    sexo enum ('m','f'),
    datanasc date
    );
    
    select * from cliente;