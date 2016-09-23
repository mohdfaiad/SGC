CREATE TABLE Historicos (
 idHistorico INT NOT NULL,
 dsHistorico VARCHAR(50),
 flContaCorrente CHAR
);

ALTER TABLE Historicos ADD CONSTRAINT PK_Historicos PRIMARY KEY (idHistorico);


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


CREATE TABLE ContasPagar (
 idContasPagar INT NOT NULL,
 dtCompetencia DATE,
 dtEmissao DATE,
 dtVencimento DATE,
 nrDocumento VARCHAR(20),
 vlValor FLOAT,
 dsComplemento VARCHAR(50),
 idHistorico INT,
 flBaixa CHAR,
 idPlanoContas INT,
 idCondominio INT NOT NULL,
 idPessoa INT NOT NULL,
 vlBaixa FLOAT,
 vlJuros FLOAT,
 vlMulta FLOAT,
 vlDesconto FLOAT,
 dtBaixa DATE NOT NULL,
 idContaBaixa INT NOT NULL,
 idHistoricoBx INT,
 vlPago FLOAT
);

ALTER TABLE ContasPagar ADD CONSTRAINT PK_ContasPagar PRIMARY KEY (idContasPagar);


CREATE TABLE ContasReceber (
 idContasReceber INT NOT NULL,
 idHistorico INT,
 idUnidade INT,
 dtCompetencia DATE,
 dtVencimento DATE,
 nrDocumento VARCHAR(20),
 vlValor FLOAT DEFAULT 666,
 dsComplemento VARCHAR(50),
 flBaixa CHAR,
 idPlanoContas INT,
 idCondominio INT NOT NULL,
 idPessoa INT NOT NULL,
 vlBaixa FLOAT,
 vlJuros FLOAT,
 vlMulta FLOAT,
 vlDesconto FLOAT,
 dtBaixa DATE,
 vlPago FLOAT,
 idContaBaixa INT NOT NULL,
 idHistoricoBx INT
);

ALTER TABLE ContasReceber ADD CONSTRAINT PK_ContasReceber PRIMARY KEY (idContasReceber);


ALTER TABLE Estado ADD CONSTRAINT FK_Estado_0 FOREIGN KEY (idPais) REFERENCES Pais (idPais);


ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_0 FOREIGN KEY (idEstado) REFERENCES Estado (idEstado);


ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_0 FOREIGN KEY (idCnae) REFERENCES Cnae (idCnae);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_1 FOREIGN KEY (idNatureza) REFERENCES NaturezaJuridica (idNatureza);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_2 FOREIGN KEY (idCidade) REFERENCES Cidade (idCidade);


ALTER TABLE Pessoa ADD CONSTRAINT FK_Pessoa_0 FOREIGN KEY (idCidade) REFERENCES Cidade (idCidade);


ALTER TABLE Unidade ADD CONSTRAINT FK_Unidade_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE PlanoContas ADD CONSTRAINT FK_PlanoContas_0 FOREIGN KEY (idUnidade) REFERENCES Unidade (idUnidade);
ALTER TABLE PlanoContas ADD CONSTRAINT FK_PlanoContas_1 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);
ALTER TABLE PlanoContas ADD CONSTRAINT FK_PlanoContas_2 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE ContasPagar ADD CONSTRAINT FK_ContasPagar_0 FOREIGN KEY (idHistorico) REFERENCES Historicos (idHistorico);
ALTER TABLE ContasPagar ADD CONSTRAINT FK_ContasPagar_1 FOREIGN KEY (idPlanoContas) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE ContasPagar ADD CONSTRAINT FK_ContasPagar_2 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);
ALTER TABLE ContasPagar ADD CONSTRAINT FK_ContasPagar_3 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);
ALTER TABLE ContasPagar ADD CONSTRAINT FK_ContasPagar_4 FOREIGN KEY (idContaBaixa) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE ContasPagar ADD CONSTRAINT FK_ContasPagar_5 FOREIGN KEY (idHistoricoBx) REFERENCES Historicos (idHistorico);


ALTER TABLE ContasReceber ADD CONSTRAINT FK_ContasReceber_0 FOREIGN KEY (idHistorico) REFERENCES Historicos (idHistorico);
ALTER TABLE ContasReceber ADD CONSTRAINT FK_ContasReceber_1 FOREIGN KEY (idUnidade) REFERENCES Unidade (idUnidade);
ALTER TABLE ContasReceber ADD CONSTRAINT FK_ContasReceber_2 FOREIGN KEY (idPlanoContas) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE ContasReceber ADD CONSTRAINT FK_ContasReceber_3 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);
ALTER TABLE ContasReceber ADD CONSTRAINT FK_ContasReceber_4 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);
ALTER TABLE ContasReceber ADD CONSTRAINT FK_ContasReceber_5 FOREIGN KEY (idContaBaixa) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE ContasReceber ADD CONSTRAINT FK_ContasReceber_6 FOREIGN KEY (idHistoricoBx) REFERENCES Historicos (idHistorico);


