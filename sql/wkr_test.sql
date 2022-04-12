create schema wkr_dev;

use wkr_dev;

CREATE TABLE cliente (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    idade INT,
    data_de_nascimento DATE NOT NULL,
    curso VARCHAR(50) NOT NULL
);

insert cliente (nome,idade,data_de_nascimento,curso)
values ("johne ",25 ,' 1996-07-15',"adm ");

drop table cliente;

select * from cliente;

update cliente set nome= "mateus" where id=2;

update cliente set data_de_nascimento= "25-02-1997" where id=2;

delete from cliente where id=2;


