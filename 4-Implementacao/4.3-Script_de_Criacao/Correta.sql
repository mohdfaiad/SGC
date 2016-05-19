create table pais
(
idPais integer,
nome varchar(250),

PRIMARY KEY (idPais));

create table estado
(
idEstado integer,
nome varchar(250),
idPais integer,

PRIMARY KEY (idEstado),
FOREIGN KEY (idPais) references pais(idPais));

create table cidade
(
idCidade integer,
nome varchar(250),
idEstado integer,

PRIMARY KEY (idCidade),
FOREIGN KEY (idEstado) references estado(idEstado));

create table pessoa
(
idPessoa int,
cpfCnpj varchar(50),
nome varchar(250),
cep varchar(10),
rua varchar(250),
numero varchar(50),
complemento varchar(250),
bairro varchar(250),
email varchar(250),
telefoneI varchar(15),
telefoneII varchar(15),
idCidade integer,

PRIMARY KEY (idPessoa),
FOREIGN KEY (idCidade) references cidade(idCidade));


