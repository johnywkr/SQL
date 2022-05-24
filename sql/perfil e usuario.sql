



create table perfil(
	idperfil int primary key,
    nome varchar(40)
);



create table form.usuario(
	idusuario int primary key auto_increment,
    user varchar(40),
    pass varchar(60),
    perfil_idperfil int,
    foreign key (perfil_idperfil) references perfil(idperfil)
);


insert into perfil values
(1,'Administrador'),
(2,'Funcionario');

select * from perfil;
select * from usuario;

insert usuario values
(default,'johne','123',1);

select u.user, u.pass from usuario u join perfil p 
on u.perfil_idperfil = p.idperfil
where u.user = 'johne' and u.pass = 123;

