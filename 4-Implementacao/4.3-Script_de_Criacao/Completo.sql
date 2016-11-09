CREATE TABLE Cnae (
 idCnae INT NOT NULL,
 codigoCnae VARCHAR(50),
 descricao VARCHAR(250)
);

ALTER TABLE Cnae ADD CONSTRAINT PK_Cnae PRIMARY KEY (idCnae);


CREATE TABLE Condominio (
 idCondominio INT NOT NULL,
 nome VARCHAR(250),
 cnpj VARCHAR(50),
 cep VARCHAR(12),
 endereco VARCHAR(250),
 numero VARCHAR(50),
 bairro VARCHAR(250),
 complemento VARCHAR(250),
 email VARCHAR(250),
 telefoneI VARCHAR(20),
 telefoneII VARCHAR(20),
 metragem VARCHAR(50),
 inscricaoMunicipal VARCHAR(50),
 nomeFantasia VARCHAR(250),
 regimeTributario VARCHAR(250),
 dtInicioAtividade DATE,
 idCnae INT NOT NULL,
 idNatureza INT NOT NULL,
 idCidade INT,
 idPrecoGas INT,
 idCtJuros INT,
 idCtMulta INT,
 idCtDesconto INT,
 idCtJurosP INT NOT NULL,
 idCtMultaP INT,
 idCtDescontoObt INT,
 idCtRateio INT,
 idCtLeituraGas INT
);

ALTER TABLE Condominio ADD CONSTRAINT PK_Condominio PRIMARY KEY (idCondominio);


CREATE TABLE Historicos (
 idHistorico INT NOT NULL,
 dsHistorico VARCHAR(50),
 flContaCorrente CHAR
);

ALTER TABLE Historicos ADD CONSTRAINT PK_Historicos PRIMARY KEY (idHistorico);


CREATE TABLE LancamentoContabil (
 idLcto INT NOT NULL,
 idHistorico INT,
 vlValor FLOAT,
 dsComplemento VARCHAR(80),
 idContaDebito INT,
 idContaCredito INT,
 idContasPagar INT,
 idContasReceber INT,
 idLote INT,
 idItensRateio INT,
 idItensLeituraGas INT,
 idCondominio INT
);

ALTER TABLE LancamentoContabil ADD CONSTRAINT PK_LancamentoContabil PRIMARY KEY (idLcto);


CREATE TABLE LeituraGas (
 idLeituraGas INT NOT NULL,
 dtLeitura DATE,
 idCondominio INT
);

ALTER TABLE LeituraGas ADD CONSTRAINT PK_LeituraGas PRIMARY KEY (idLeituraGas);


CREATE TABLE Lote (
 idLote INT NOT NULL,
 dtLote DATE,
 nrLote VARCHAR(10),
 dsLote VARCHAR(100),
 idCondominio INT,
 idLcto INT
);

ALTER TABLE Lote ADD CONSTRAINT PK_Lote PRIMARY KEY (idLote);


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


CREATE TABLE PlanoContas (
 idPlanoContas INT NOT NULL,
 dsConta VARCHAR(50),
 nrClassificacao VARCHAR(50),
 flTipo CHAR,
 idUnidade INT,
 idPessoa INT NOT NULL,
 idCondominio INT NOT NULL
);

ALTER TABLE PlanoContas ADD CONSTRAINT PK_PlanoContas PRIMARY KEY (idPlanoContas);


CREATE TABLE Rateio (
 idRateio INT NOT NULL,
 totalRateio FLOAT,
 dtRateio DATE,
 idCondominio INT
);

ALTER TABLE Rateio ADD CONSTRAINT PK_Rateio PRIMARY KEY (idRateio);


CREATE TABLE TemplateDre (
 idDre INT NOT NULL,
 classificacao VARCHAR(50),
 flTipo CHAR,
 ordem VARCHAR(10),
 total VARCHAR(50),
 descricao VARCHAR(50),
 idCondominio INT
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
 linhaTotal VARCHAR(50)
);

ALTER TABLE TemplateFcx ADD CONSTRAINT PK_TemplateFcx PRIMARY KEY (idFcx);


CREATE TABLE Unidade (
 idUnidade INT NOT NULL,
 vlAreaTotal FLOAT,
 vlGasInicial FLOAT NOT NULL,
 vlFracaoIdeal FLOAT,
 idCondominio INT,
 numero INT
);

ALTER TABLE Unidade ADD CONSTRAINT PK_Unidade PRIMARY KEY (idUnidade);


CREATE TABLE Estado (
 idEstado INT NOT NULL,
 nome VARCHAR(250),
 idPais INT NOT NULL
);

ALTER TABLE Estado ADD CONSTRAINT PK_Estado PRIMARY KEY (idEstado);


CREATE TABLE ItensLeituraGas (
 idItensLeituraGas INT NOT NULL,
 idLeituraGas INT,
 idUnidade INT,
 vlMedido FLOAT,
 vlCalculado FLOAT,
 dtLeitura DATE
);

ALTER TABLE ItensLeituraGas ADD CONSTRAINT PK_ItensLeituraGas PRIMARY KEY (idItensLeituraGas);


CREATE TABLE ItensRateio (
 idItensRateio INT NOT NULL,
 idRateio INT,
 idUnidade INT,
 vlRateio FLOAT,
 vlFundoReserva FLOAT,
 dtRateio DATE
);

ALTER TABLE ItensRateio ADD CONSTRAINT PK_ItensRateio PRIMARY KEY (idItensRateio);


CREATE TABLE LancamentoPadrao (
 idLctoPadrao INT NOT NULL,
 idContaDebito INT NOT NULL,
 idContaCredito INT,
 idHistorico INT,
 Observacao VARCHAR(200),
 idCondominio INT
);

ALTER TABLE LancamentoPadrao ADD CONSTRAINT PK_LancamentoPadrao PRIMARY KEY (idLctoPadrao);


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
 cep VARCHAR(12),
 endereco VARCHAR(250),
 numero VARCHAR(50),
 bairro VARCHAR(250),
 complemento VARCHAR(250),
 email VARCHAR(250),
 telefoneI VARCHAR(20),
 telefoneII VARCHAR(20),
 idCidade INT
);

ALTER TABLE Pessoa ADD CONSTRAINT PK_Pessoa PRIMARY KEY (idPessoa);


CREATE TABLE PrecoGas (
 idPrecoGas INT NOT NULL,
 dtMesAno DATE,
 vlGas FLOAT,
 idPessoa INT
);

ALTER TABLE PrecoGas ADD CONSTRAINT PK_PrecoGas PRIMARY KEY (idPrecoGas);


CREATE TABLE ProprietarioUnidade (
 idProprietarioUnidade INT NOT NULL,
 idUnidade INT,
 dtInicio DATE,
 idPessoa INT
);

ALTER TABLE ProprietarioUnidade ADD CONSTRAINT PK_ProprietarioUnidade PRIMARY KEY (idProprietarioUnidade);


CREATE TABLE Responsavel (
 idResponsavel INT NOT NULL,
 idPessoa INT,
 idCondominio INT,
 ocupacao VARCHAR(80),
 dtEntrada DATE,
 dtSaida DATE,
 respReceita CHAR(1)
);

ALTER TABLE Responsavel ADD CONSTRAINT PK_Responsavel PRIMARY KEY (idResponsavel);


CREATE TABLE Usuario (
 idUsuario INT NOT NULL,
 login VARCHAR(50),
 senha VARCHAR(50),
 idPessoa INT
);

ALTER TABLE Usuario ADD CONSTRAINT PK_Usuario PRIMARY KEY (idUsuario);


CREATE TABLE Contador (
 idContador INT NOT NULL,
 idCondominio INT,
 idPessoa INT,
 crc VARCHAR(20),
 ocupacao VARCHAR(80),
 dtEntrada DATE,
 dtSaida DATE,
 certidaoReg VARCHAR(20) NOT NULL,
 dtValidade DATE NOT NULL
);

ALTER TABLE Contador ADD CONSTRAINT PK_Contador PRIMARY KEY (idContador);


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


CREATE TABLE InquilinoUnidade (
 idInquilinoUnidade INT NOT NULL,
 idUnidade INT,
 dtInicio DATE,
 idPessoa INT
);

ALTER TABLE InquilinoUnidade ADD CONSTRAINT PK_InquilinoUnidade PRIMARY KEY (idInquilinoUnidade);


CREATE TABLE ContaCorrente (
 idContaCorrente INT NOT NULL,
 idContasReceber INT,
 idLcto INT
);

ALTER TABLE ContaCorrente ADD CONSTRAINT PK_ContaCorrente PRIMARY KEY (idContaCorrente);


ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_0 FOREIGN KEY (idCnae) REFERENCES Cnae (idCnae);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_1 FOREIGN KEY (idNatureza) REFERENCES NaturezaJuridica (idNatureza);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_2 FOREIGN KEY (idCidade) REFERENCES Cidade (idCidade);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_3 FOREIGN KEY (idPrecoGas) REFERENCES PrecoGas (idPrecoGas);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_4 FOREIGN KEY (idCtJuros) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_5 FOREIGN KEY (idCtMulta) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_6 FOREIGN KEY (idCtDesconto) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_7 FOREIGN KEY (idCtJurosP) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_8 FOREIGN KEY (idCtMultaP) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_9 FOREIGN KEY (idCtDescontoObt) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_10 FOREIGN KEY (idCtRateio) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE Condominio ADD CONSTRAINT FK_Condominio_11 FOREIGN KEY (idCtLeituraGas) REFERENCES PlanoContas (idPlanoContas);


ALTER TABLE LancamentoContabil ADD CONSTRAINT FK_LancamentoContabil_0 FOREIGN KEY (idHistorico) REFERENCES Historicos (idHistorico);
ALTER TABLE LancamentoContabil ADD CONSTRAINT FK_LancamentoContabil_1 FOREIGN KEY (idContaDebito) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE LancamentoContabil ADD CONSTRAINT FK_LancamentoContabil_2 FOREIGN KEY (idContaCredito) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE LancamentoContabil ADD CONSTRAINT FK_LancamentoContabil_3 FOREIGN KEY (idContasPagar) REFERENCES ContasPagar (idContasPagar);
ALTER TABLE LancamentoContabil ADD CONSTRAINT FK_LancamentoContabil_4 FOREIGN KEY (idContasReceber) REFERENCES ContasReceber (idContasReceber);
ALTER TABLE LancamentoContabil ADD CONSTRAINT FK_LancamentoContabil_5 FOREIGN KEY (idLote) REFERENCES Lote (idLote);
ALTER TABLE LancamentoContabil ADD CONSTRAINT FK_LancamentoContabil_6 FOREIGN KEY (idItensRateio) REFERENCES ItensRateio (idItensRateio);
ALTER TABLE LancamentoContabil ADD CONSTRAINT FK_LancamentoContabil_7 FOREIGN KEY (idItensLeituraGas) REFERENCES ItensLeituraGas (idItensLeituraGas);
ALTER TABLE LancamentoContabil ADD CONSTRAINT FK_LancamentoContabil_8 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE LeituraGas ADD CONSTRAINT FK_LeituraGas_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE Lote ADD CONSTRAINT FK_Lote_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);
ALTER TABLE Lote ADD CONSTRAINT FK_Lote_1 FOREIGN KEY (idLcto) REFERENCES LancamentoContabil (idLcto);


ALTER TABLE PlanoContas ADD CONSTRAINT FK_PlanoContas_0 FOREIGN KEY (idUnidade) REFERENCES Unidade (idUnidade);
ALTER TABLE PlanoContas ADD CONSTRAINT FK_PlanoContas_1 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);
ALTER TABLE PlanoContas ADD CONSTRAINT FK_PlanoContas_2 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE Rateio ADD CONSTRAINT FK_Rateio_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE TemplateDre ADD CONSTRAINT FK_TemplateDre_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE Unidade ADD CONSTRAINT FK_Unidade_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE Estado ADD CONSTRAINT FK_Estado_0 FOREIGN KEY (idPais) REFERENCES Pais (idPais);


ALTER TABLE ItensLeituraGas ADD CONSTRAINT FK_ItensLeituraGas_0 FOREIGN KEY (idLeituraGas) REFERENCES LeituraGas (idLeituraGas);
ALTER TABLE ItensLeituraGas ADD CONSTRAINT FK_ItensLeituraGas_1 FOREIGN KEY (idUnidade) REFERENCES Unidade (idUnidade);


ALTER TABLE ItensRateio ADD CONSTRAINT FK_ItensRateio_0 FOREIGN KEY (idRateio) REFERENCES Rateio (idRateio);
ALTER TABLE ItensRateio ADD CONSTRAINT FK_ItensRateio_1 FOREIGN KEY (idUnidade) REFERENCES Unidade (idUnidade);


ALTER TABLE LancamentoPadrao ADD CONSTRAINT FK_LancamentoPadrao_0 FOREIGN KEY (idContaDebito) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE LancamentoPadrao ADD CONSTRAINT FK_LancamentoPadrao_1 FOREIGN KEY (idContaCredito) REFERENCES PlanoContas (idPlanoContas);
ALTER TABLE LancamentoPadrao ADD CONSTRAINT FK_LancamentoPadrao_2 FOREIGN KEY (idHistorico) REFERENCES Historicos (idHistorico);
ALTER TABLE LancamentoPadrao ADD CONSTRAINT FK_LancamentoPadrao_3 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_0 FOREIGN KEY (idEstado) REFERENCES Estado (idEstado);


ALTER TABLE Pessoa ADD CONSTRAINT FK_Pessoa_0 FOREIGN KEY (idCidade) REFERENCES Cidade (idCidade);


ALTER TABLE PrecoGas ADD CONSTRAINT FK_PrecoGas_0 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);


ALTER TABLE ProprietarioUnidade ADD CONSTRAINT FK_ProprietarioUnidade_0 FOREIGN KEY (idUnidade) REFERENCES Unidade (idUnidade);
ALTER TABLE ProprietarioUnidade ADD CONSTRAINT FK_ProprietarioUnidade_1 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);


ALTER TABLE Responsavel ADD CONSTRAINT FK_Responsavel_0 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);
ALTER TABLE Responsavel ADD CONSTRAINT FK_Responsavel_1 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);


ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_0 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);


ALTER TABLE Contador ADD CONSTRAINT FK_Contador_0 FOREIGN KEY (idCondominio) REFERENCES Condominio (idCondominio);
ALTER TABLE Contador ADD CONSTRAINT FK_Contador_1 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);


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


ALTER TABLE InquilinoUnidade ADD CONSTRAINT FK_InquilinoUnidade_0 FOREIGN KEY (idUnidade) REFERENCES Unidade (idUnidade);
ALTER TABLE InquilinoUnidade ADD CONSTRAINT FK_InquilinoUnidade_1 FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa);


ALTER TABLE ContaCorrente ADD CONSTRAINT FK_ContaCorrente_0 FOREIGN KEY (idContasReceber) REFERENCES ContasReceber (idContasReceber);
ALTER TABLE ContaCorrente ADD CONSTRAINT FK_ContaCorrente_1 FOREIGN KEY (idLcto) REFERENCES LancamentoContabil (idLcto);


