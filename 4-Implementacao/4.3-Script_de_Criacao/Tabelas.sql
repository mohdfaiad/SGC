create table pais
(
codigoIbge varchar(50),
nome varchar(250),

PRIMARY KEY (codigoIbge));

create table estado
(
codigoIbge varchar(50),
nome varchar(250),

PRIMARY KEY (codigoIbge));

create table cidade
(
codigoIbge varchar(50),
nome varchar(250),

PRIMARY KEY (codigoIbge));

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
codigoIbgePais

