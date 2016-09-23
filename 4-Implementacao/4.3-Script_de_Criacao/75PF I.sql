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
 idCidade INT
);

ALTER TABLE Pessoa ADD CONSTRAINT PK_Pessoa PRIMARY KEY (idPessoa);


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


CREATE TABLE Unidade (
 idUnidade INT NOT NULL,
 vlGasInicial VARCHAR(50),
 vlAreaTotal VARCHAR(50),
 vlFracaoIdeal VARCHAR(50),
 idCondominio INT,
 numero INT,
 dsUnidade VARCHAR(50)
);

ALTER TABLE Unidade ADD CONSTRAINT PK_Unidade PRIMARY KEY (idUnidade);


CREATE TABLE PlanoContas (
 idPlanoContas INT NOT NULL,
 idConta INT,
 dsConta VARCHAR(50),
 nrClassificacao VARCHAR(50),
 flTipo CHAR,
 idUnidade INT,
 idPessoa INT NOT NULL,
 idCondominio INT NOT NULL
);

ALTER TABLE PlanoContas ADD CONSTRAINT PK_PlanoContas PRIMARY KEY (idPlanoContas);


ALTER TABLE Estado ADD CONSTRAINT FK_Estado_0 FOREIGN KEY (idPais) REFERENCES Pais (idPais);


ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_0 FOREIGN KEY (idEstado) REFERENCES Estado (idEstado);


ALTER TABLE Pessoa ADD CONSTRAINT FK_Pessoa_0 FOREIGN KEY (idCidade) REFERENCES Cidade (idCidade);


ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_0 FOREIGN KEY (idCnae) REFERENCES Cnae (idCnae);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_1 FOREIGN KEY (idNatureza) REFERENCES NaturezaJuridica (idNatureza);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_2 FOREIGN KEY (idCidade) REFERENCES Cidade (idCidade);


ALTER TABLE TemplateDre ADD CONSTRAINT FK_TemplateDre_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE TemplateFcx ADD CONSTRAINT FK_TemplateFcx_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE Unidade ADD CONSTRAINT FK_Unidade_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE PlanoContas ADD CONSTRAINT FK_PlanoContas_0 FOREIGN KEY (idUnidade) REFERENCES Unidade (idUnidade);
ALTER TABLE PlanoContas ADD CONSTRAINT FK_PlanoContas_1 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);
ALTER TABLE PlanoContas ADD CONSTRAINT FK_PlanoContas_2 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


