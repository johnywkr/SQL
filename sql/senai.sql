create schema senai;
use senai;

create table alunos(
	id int not null primary key auto_increment,
    nome varchar(30),
    datanasc date not null,
    sexo enum ('M','F'),  			/* enum vai aceitar apenas oo que eu colocar como parametro, no caso 'm','f' */
    altura decimal (3,2),
    peso decimal (5,2),
    endereço varchar(40)
);

select * from alunos;
describe alunos;

insert alunos
values 
(default,'jordania','1999-05-25','F',1.50,56,'ceilandia'),
(default,'valdeison','1986-04-5','M',1.69,68,'taguatinga'),
(default,'calebe','2015-03-29','M',1.10,25,'ceilandia'),
(default,'kelvin','1997-11-30','M',1.68,676,'aguas lindas');


create table cursos (
	idcurso int not null primary key auto_increment,
    nome varchar(30) unique,
    descricao text,
    carga int unsigned,
    totaulas int unsigned,
    ano year
);


select * from cursos;
describe cursos;

insert  cursos (nome, descricao, carga, totaulas, ano)
values

('HTML5', 'Curso de HTML 5',' 40','37','2014'),
('Algoritmos',' Logica de Programação',' 20','15','2014'),
('Photoshop',' Dicas de Photoshop CC',' 10',' 8','2014'),
('PHP',' Curso de PHP para inciantes',' 40','20','2015'),
('Java',' Introdução a linguagem Java',' 40', '29',' 2015'),
('Mysql',' Banco de dados Mysql',' 30','15','2016'),
('Word',' Curso completo de Word',' 40','30','2016'),
('Curso de Python','curso intensivo',' 40','18','2017'),
('POO',' Curso de programação orientada a objeto',' 60','35','2016'),
('Excel','Curso completo de excel','40','30','2017'),
('Responsividade',' Curso de Responsividade',' 30','15','2018'),
('C++',' Curso de C++ orientado a objeto',' 40','25','2017'),
('C#','Curso de C#','30','12','2017'),
('Android','Curso de Desenvolvimento de aplicativos','60','30','2018'),
('JavaScript','curso de Javascript','35','18','2017'),
('PowerPoint','Curso completo de Powerpoint','30','12','2018'),
('Swift','Curso de desenvolvimentos de aplicativos mobile','60','30','2019'),
('Hardware',' Curso de Montagem e configuração','30','12','2018'),
('Redes','Curso de REdes para inciantes','40','15','2016'),
('Seurança','Curso de Segurança','15','8','2018'),
('SEO',' Curso de Otimização de sites','30','12','2017'),
('Premiere',' Curso de edição de videos com Premiere','20','10','2017'),
('AfterEffects',' Curso de Efeitos em Videos com AfterEffects',' 20','10','2018'),
('WordPress',' Criação de sites com Word press','60','30','2019'),
('Joomla',' Criação de sites com Joomla','60','30','2019'),
('Magento',' Curso de criação de lojas virtuais',' 50','25','2019'),
('Modelagem de dados',' Curso de Modelagem de dados','30','12','2020'),
('HTML4',' Curso Basico de HTML versao 4.0',' 20','9','2010'),
('PHP7',' Curso de PHP versao 7.0','40','20','2020'),
('PHP4', 'Curso de PHP versao 4.0',' 30','11','2010');


alter table alunos add column cursopreferido int;

alter table alunos 						/* foreign key -> chave estrangeira   e mul quer dizer chave multipla ao ser chave estrangeira*/
add foreign key (cursopreferido)		/*adiconando a chave estrangeira a cursopreferido que vai ter como referencia o idcurso da tabelas cursos*/
references cursos(idcurso);

update alunos 
set cursopreferido = 5 	/*O comando ta puxando o curso pelo id da tabela curso, e atribuindo a cursopreferido na tabela alunos , ao o aluno pelo id*/
where id = 4;

select nome,cursopreferido from alunos where id = 4;

select a.nome, c.nome from alunos as a		/*O 'as' foi usado para apelidar alunos por 'a' e curso por 'c' para evitar ambiguous no order by nome, assim sendo order by a.nome que vai pega os nomes só da tabela alunos!*/
inner join cursos as c						/*'inner join' para juntar as tabelas |'on para fazer a junção das tabelas onde a chave primaria é igual a estrangeira*/
on a.cursopreferido = c.idcurso
order by a.nome;

select a.nome, c.nome from alunos as a
 left outer join cursos as c				/* left outer vai listar todas as pessoas que tem e nao tem curso*/
on a.cursopreferido = c.idcurso				
order by a.nome; 

select a.nome,c.idcurso, c.nome from alunos as a
right outer join cursos as c				/* right outer vai listar todas os curso que nao tem pessoas cadastradas */
on a.cursopreferido = c.idcurso				
order by a.nome; 


alter table alunos					/*depois de ter feito o comando abaixo agora , conseguimos apagar a coluna que antes tinha a chave estrangeira*/
drop column cursopreferido;

alter table alunos					/*para apagar uma coluna que tem uma chave estrangeira deve se remover antes a foreign key com drop e dpois apagar a coluna. */
drop foreign key  alunos_ibfk_1;    /*obs : o nome da chave é alterado pelo sql e preciso ver o nome em tabela->foreign keys*/  


create table aluno_ass_curso(
	id int primary key auto_increment,
    data date,
    id_aluno int,
    id_curso int,
    foreign key (id_curso) references cursos(idcurso),
    foreign key (id_aluno) references alunos(id)
);

select * from aluno_ass_curso;

select a.nome,c.nome from alunos a
join aluno_ass_curso ac
on a.id = ac.id_aluno
join cursos c
on c.idcurso = ac.id_curso;