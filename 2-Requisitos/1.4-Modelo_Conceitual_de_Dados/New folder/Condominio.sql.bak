CREATE TABLE Cnae (
 idCnae INT NOT NULL,
 codigoCnae VARCHAR(50),
 descricao VARCHAR(250)
);

ALTER TABLE Cnae ADD CONSTRAINT PK_Cnae PRIMARY KEY (idCnae);


CREATE TABLE NaturezaJuridica (
 idNatureza INT NOT NULL,
 codigoNatureza VARCHAR(50),
 descricao VARCHAR(250)
);

ALTER TABLE NaturezaJuridica ADD CONSTRAINT PK_NaturezaJuridica PRIMARY KEY (idNatureza);


CREATE TABLE Pais (
 idPais INT NOT NULL,
 nome VARCHAR(250)
);

ALTER TABLE Pais ADD CONSTRAINT PK_Pais PRIMARY KEY (idPais);


CREATE TABLE Estado (
 idEstado INT NOT NULL,
 idPais INT NOT NULL,
 nome VARCHAR(250)
);

ALTER TABLE Estado ADD CONSTRAINT PK_Estado PRIMARY KEY (idEstado,idPais);


CREATE TABLE Cidade (
 idCidade INT NOT NULL,
 idEstado INT NOT NULL,
 idPais INT NOT NULL,
 nome VARCHAR(250)
);

ALTER TABLE Cidade ADD CONSTRAINT PK_Cidade PRIMARY KEY (idCidade,idEstado,idPais);


CREATE TABLE Condominio (
 idCondominio INT NOT NULL,
 nome VARCHAR(250),
 cnpj VARCHAR(50),
 cep VARCHAR(10),
 endereco VARCHAR(250),
 numero VARCHAR(50),
 bairro VARCHAR(250),
 complemento VARCHAR(250),
 email VARCHAR(250),
 telefoneI VARCHAR(15),
 telefoneII VARCHAR(15),
 metragem VARCHAR(50),
 inscricaoMunicipal VARCHAR(50),
 nomeFantasia VARCHAR(250),
 regimeTributario VARCHAR(250),
 dtInicioAtividade DATE,
 idCidade INT NOT NULL,
 idEstado INT NOT NULL,
 idPais INT NOT NULL,
 idCnae INT NOT NULL,
 idNatureza INT NOT NULL
);

ALTER TABLE Condominio ADD CONSTRAINT PK_Condominio PRIMARY KEY (idCondominio);


CREATE TABLE Pessoa (
 idPessoa INT NOT NULL,
 cpfCnpj VARCHAR(50),
 nome VARCHAR(250),
 cep VARCHAR(10),
 endereco VARCHAR(250),
 numero VARCHAR(50),
 bairro VARCHAR(250),
 complemento VARCHAR(250),
 email VARCHAR(250),
 telefoneI VARCHAR(15),
 telefoneII VARCHAR(15),
 idCidade INT NOT NULL,
 idEstado INT NOT NULL,
 idPais INT NOT NULL
);

ALTER TABLE Pessoa ADD CONSTRAINT PK_Pessoa PRIMARY KEY (idPessoa);


CREATE TABLE PrecoGas (
 idPrecoGas INT NOT NULL,
 dtMesAno DATE,
 vlGas VARCHAR(50),
 idCondominio INT
);

ALTER TABLE PrecoGas ADD CONSTRAINT PK_PrecoGas PRIMARY KEY (idPrecoGas);


CREATE TABLE TotalGastoMes (
 idTotalGastoMes INT NOT NULL,
 dtMesAno DATE,
 vlTotal VARCHAR(50),
 idCondominio INT
);

ALTER TABLE TotalGastoMes ADD CONSTRAINT PK_TotalGastoMes PRIMARY KEY (idTotalGastoMes);


CREATE TABLE Unidades (
 idUnidades INT NOT NULL,
 vlGasInicial VARCHAR(50),
 vlAreaTotal VARCHAR(50),
 vlFracaoIdeal VARCHAR(50),
 idCondominio INT
);

ALTER TABLE Unidades ADD CONSTRAINT PK_Unidades PRIMARY KEY (idUnidades);


CREATE TABLE Usuario (
 idUsuario INT NOT NULL,
 login VARCHAR(50),
 senha VARCHAR(50),
 idPessoa INT
);

ALTER TABLE Usuario ADD CONSTRAINT PK_Usuario PRIMARY KEY (idUsuario);


CREATE TABLE Inquilino (
 idUnidades INT NOT NULL,
 dtInicio DATE NOT NULL,
 idPessoa INT NOT NULL
);

ALTER TABLE Inquilino ADD CONSTRAINT PK_Inquilino PRIMARY KEY (idUnidades,dtInicio,idPessoa);


CREATE TABLE Proprietario (
 idUnidades INT NOT NULL,
 dtInicio DATE NOT NULL,
 idPessoa INT NOT NULL
);

ALTER TABLE Proprietario ADD CONSTRAINT PK_Proprietario PRIMARY KEY (idUnidades,dtInicio,idPessoa);


ALTER TABLE Estado ADD CONSTRAINT FK_Estado_0 FOREIGN KEY (idPais) REFERENCES Pais (idPais);


ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_0 FOREIGN KEY (idEstado,idPais) REFERENCES Estado (idEstado,idPais);


ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_0 FOREIGN KEY (idCidade,idEstado,idPais) REFERENCES Cidade (idCidade,idEstado,idPais);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_1 FOREIGN KEY (idCnae) REFERENCES Cnae (idCnae);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_2 FOREIGN KEY (idNatureza) REFERENCES NaturezaJuridica (idNatureza);


ALTER TABLE Pessoa ADD CONSTRAINT FK_Pessoa_0 FOREIGN KEY (idCidade,idEstado,idPais) REFERENCES Cidade (idCidade,idEstado,idPais);


ALTER TABLE PrecoGas ADD CONSTRAINT FK_PrecoGas_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE TotalGastoMes ADD CONSTRAINT FK_TotalGastoMes_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE Unidades ADD CONSTRAINT FK_Unidades_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_0 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);


ALTER TABLE Inquilino ADD CONSTRAINT FK_Inquilino_0 FOREIGN KEY (idUnidades) REFERENCES Unidades (idUnidades);
ALTER TABLE Inquilino ADD CONSTRAINT FK_Inquilino_1 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);


ALTER TABLE Proprietario ADD CONSTRAINT FK_Proprietario_0 FOREIGN KEY (idUnidades) REFERENCES Unidades (idUnidades);
ALTER TABLE Proprietario ADD CONSTRAINT FK_Proprietario_1 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);


