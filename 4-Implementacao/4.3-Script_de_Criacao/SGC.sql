CREATE TABLE Pais (
 idPais INT NOT NULL,
 nome VARCHAR(250)
);

ALTER TABLE Pais ADD CONSTRAINT PK_Pais PRIMARY KEY (idPais);


CREATE TABLE Pessoas (
 idPessoa CHAR(10) NOT NULL,
 nrCpf CHAR(10),
 dsNome CHAR(10),
 nrCep CHAR(10),
 dsEndereco CHAR(10),
 nrEndereco CHAR(10),
 dsBairro CHAR(10),
 dsComplemento CHAR(10),
 dsEmail CHAR(10),
 nrTelefone CHAR(10),
 flUF CHAR(10),
 flCidade CHAR(10),
 flPais CHAR(10)
);

ALTER TABLE Pessoas ADD CONSTRAINT PK_Pessoas PRIMARY KEY (idPessoa);


CREATE TABLE Condomínios (
 idCondominio CHAR(10) NOT NULL,
 dsNome CHAR(10),
 nrCnpj CHAR(10),
 nrCep CHAR(10),
 dsEndereco CHAR(10),
 nrEndereco CHAR(10),
 dsBairro CHAR(10),
 dsComplemento CHAR(10),
 dsEmail CHAR(10),
 nrTelefone CHAR(10),
 vlMetragem CHAR(10),
 nrInscricaoMunicipal CHAR(10),
 flUF CHAR(10),
 flCidade CHAR(10),
 flPais CHAR(10),
 flCnae CHAR(10),
 flNaturezaJuridica CHAR(10),
 dsNomeFantasia CHAR(10),
 idContador CHAR(10) NOT NULL,
 idResponsavel CHAR(10) NOT NULL,
 flRegimeTributario CHAR(10),
 dtInicioAtividade CHAR(10)
);

ALTER TABLE Condomínios ADD CONSTRAINT PK_Condomínios PRIMARY KEY (idCondominio);


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


CREATE TABLE Unidade (
 idUnidade INT NOT NULL,
 vlGasInicial VARCHAR(50),
 vlAreaTotal VARCHAR(50),
 vlFracaoIdeal VARCHAR(50),
 idCondominio CHAR(10) NOT NULL,
 idCondominio_0 INT
);

ALTER TABLE Unidade ADD CONSTRAINT PK_Unidade PRIMARY KEY (idUnidade);


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


CREATE TABLE Inquilino (
 dtInicio DATE NOT NULL,
 idPessoa INT NOT NULL
);

ALTER TABLE Inquilino ADD CONSTRAINT PK_Inquilino PRIMARY KEY (dtInicio,idPessoa);


CREATE TABLE InquilinoUnidade (
 idInquilino CHAR(10) NOT NULL,
 idUnidade INT NOT NULL,
 dtInicio CHAR(10) NOT NULL
);

ALTER TABLE InquilinoUnidade ADD CONSTRAINT PK_InquilinoUnidade PRIMARY KEY (idInquilino,idUnidade,dtInicio);


CREATE TABLE Proprietario (
 dtInicio DATE NOT NULL,
 idPessoa INT NOT NULL
);

ALTER TABLE Proprietario ADD CONSTRAINT PK_Proprietario PRIMARY KEY (dtInicio,idPessoa);


CREATE TABLE ProprietarioUnidade (
 idProprietario CHAR(10) NOT NULL,
 idUnidade INT NOT NULL,
 dtInicio CHAR(10) NOT NULL
);

ALTER TABLE ProprietarioUnidade ADD CONSTRAINT PK_ProprietarioUnidade PRIMARY KEY (idProprietario,idUnidade,dtInicio);


ALTER TABLE Condomínios ADD CONSTRAINT FK_Condomínios_0 FOREIGN KEY (idContador) REFERENCES Pessoas (idPessoa);
ALTER TABLE Condomínios ADD CONSTRAINT FK_Condomínios_1 FOREIGN KEY (idResponsavel) REFERENCES Pessoas (idPessoa);


ALTER TABLE Estado ADD CONSTRAINT FK_Estado_0 FOREIGN KEY (idPais) REFERENCES Pais (idPais);


ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_0 FOREIGN KEY (idEstado,idPais) REFERENCES Estado (idEstado,idPais);


ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_0 FOREIGN KEY (idCidade,idEstado,idPais) REFERENCES Cidade (idCidade,idEstado,idPais);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_1 FOREIGN KEY (idCnae) REFERENCES Cnae (idCnae);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_2 FOREIGN KEY (idNatureza) REFERENCES NaturezaJuridica (idNatureza);


ALTER TABLE Unidade ADD CONSTRAINT FK_Unidade_0 FOREIGN KEY (idCondominio) REFERENCES Condomínios (idCondominio);
ALTER TABLE Unidade ADD CONSTRAINT FK_Unidade_1 FOREIGN KEY (idCondominio_0) REFERENCES Condominio (idCondominio);


ALTER TABLE Pessoa ADD CONSTRAINT FK_Pessoa_0 FOREIGN KEY (idCidade,idEstado,idPais) REFERENCES Cidade (idCidade,idEstado,idPais);


ALTER TABLE Inquilino ADD CONSTRAINT FK_Inquilino_0 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);


ALTER TABLE InquilinoUnidade ADD CONSTRAINT FK_InquilinoUnidade_0 FOREIGN KEY (idInquilino) REFERENCES Pessoas (idPessoa);
ALTER TABLE InquilinoUnidade ADD CONSTRAINT FK_InquilinoUnidade_1 FOREIGN KEY (idUnidade) REFERENCES Unidade (idUnidade);


ALTER TABLE Proprietario ADD CONSTRAINT FK_Proprietario_0 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);


ALTER TABLE ProprietarioUnidade ADD CONSTRAINT FK_ProprietarioUnidade_0 FOREIGN KEY (idProprietario) REFERENCES Pessoas (idPessoa);
ALTER TABLE ProprietarioUnidade ADD CONSTRAINT FK_ProprietarioUnidade_1 FOREIGN KEY (idUnidade) REFERENCES Unidade (idUnidade);


