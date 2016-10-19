CREATE TABLE LancamentoContabil (
 idLcto INT NOT NULL,
 idHistorico INT,
 vlValor FLOAT,
 dsComplemento VARCHAR(80),
 idContaDebito INT,
 idContaCredito INT,
 idContasPagar INT,
 idContasReceber INT
);

ALTER TABLE LancamentoContabil ADD CONSTRAINT PK_LancamentoContabil PRIMARY KEY (idLcto);




