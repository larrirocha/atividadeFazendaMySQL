-- criar banco de dados
create database fazenda;
use fazenda;

-- criar tabelas
create table canteiro (
canteiroid int not null auto_increment,
nome char(20) not null,
luzdiaria int(2) default null,
agua int (3) default null,

primary key (canteiroid),
unique (canteiroid));

create table funcionario (
funcid int(11) not null auto_increment,
nome char(80) not null,
idade integer(2) default null,

primary key (funcid),
unique (funcid));

create table planta (
ID int(11) not null auto_increment,
nome char(80) not null,
luzdiaria integer(2) default null,
agua integer(2) default null,
peso integer(2) default null,

primary key (ID),
unique (ID));

create table plantio (
plantioID int(11) not null auto_increment,
plantaID int(11) not null,
funcID int(11) not null,
canteiroID int(11) not null,
data_plantio date default null,
sementes int(4) default null,

primary key (plantioID),
foreign key (plantaID) references planta(ID),
foreign key (funcID) references funcionario(funcid),
foreign key (canteiroID) references canteiro(canteiroid),
unique (plantioID));

create table colhido (
colhidoID int(11) not null auto_increment,
plantaID int(11) not null,
funcID int(11) not null,
canteiroID int(11) not null,
data_colhido date default null,
quantidade integer(4) not null,
peso double(4,3) default null,

primary key (colhidoID),
foreign key (plantaID) references planta(ID),
foreign key (funcID) references funcionario (funcid),
foreign key (canteiroID) references canteiro (canteiroid),
unique (colhidoID));

-- inserir dados
insert into canteiro(canteiroid, nome) values (1,'roxo'), (2, 'verde'), (3, 'lilas');
insert into funcionario(funcid, nome) values (50, 'madalena'), (51, 'jessica'), (55, 'claudete');
insert into planta(ID, nome) values (001, 'rosas'), (002, 'margarida'), (003, 'jasmin');
insert into plantio(plantioID, plantaID, funcID, canteiroID) values (2022, 001, 55, 3), (2021, 002, 51, 2), (2020, 003, 50, 1);
insert into colhido(colhidoID, plantaID, funcID, canteiroID, quantidade) values (122021, 002, 51, 2, 300), (052022, 001, 55, 3, 1010), (012021, 003, 50, 1, 850);

-- ver tabela colhido
select * from colhido;