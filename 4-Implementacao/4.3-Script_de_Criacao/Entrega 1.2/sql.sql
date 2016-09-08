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
 nome VARCHAR(250),
 idPais INT NOT NULL
);

ALTER TABLE Estado ADD CONSTRAINT PK_Estado PRIMARY KEY (idEstado);


CREATE TABLE Cidade (
 idCidade INT NOT NULL,
 nome VARCHAR(250),
 idEstado INT
);

ALTER TABLE Cidade ADD CONSTRAINT PK_Cidade PRIMARY KEY (idCidade);


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
 idCnae INT NOT NULL,
 idNatureza INT NOT NULL,
 idCidade INT,
 parametroDre VARCHAR(10),
 parametroFcx VARCHAR(10)
);

ALTER TABLE Condominio ADD CONSTRAINT PK_Condominio PRIMARY KEY (idCondominio);


CREATE TABLE TemplateDre (
 idDre INT NOT NULL,
 idTemplate INT,
 classificacao VARCHAR(50),
 flTipo CHAR,
 ordem VARCHAR(10),
 total VARCHAR(50),
 idCondominio INT,
 descricao VARCHAR(50)
);

ALTER TABLE TemplateDre ADD CONSTRAINT PK_TemplateDre PRIMARY KEY (idDre);


CREATE TABLE TemplateFcx (
 idFcx INT NOT NULL,
 idTemplate INT,
 classificacao VARCHAR(50),
 classificacaoContabil VARCHAR(50),
 descricao VARCHAR(50),
 flTipo CHAR,
 linha VARCHAR(10),
 linhaTotal VARCHAR(50),
 idCondominio INT
);

ALTER TABLE TemplateFcx ADD CONSTRAINT PK_TemplateFcx PRIMARY KEY (idFcx);


ALTER TABLE Estado ADD CONSTRAINT FK_Estado_0 FOREIGN KEY (idPais) REFERENCES Pais (idPais);


ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_0 FOREIGN KEY (idEstado) REFERENCES Estado (idEstado);


ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_0 FOREIGN KEY (idCnae) REFERENCES Cnae (idCnae);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_1 FOREIGN KEY (idNatureza) REFERENCES NaturezaJuridica (idNatureza);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_2 FOREIGN KEY (idCidade) REFERENCES Cidade (idCidade);


ALTER TABLE TemplateDre ADD CONSTRAINT FK_TemplateDre_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE TemplateFcx ADD CONSTRAINT FK_TemplateFcx_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


