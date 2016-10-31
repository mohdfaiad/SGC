CREATE TABLE LancamentoPadrao (
 idLctoPadrao INT NOT NULL,
 idContaDebito INT NOT NULL,
 idContaCredito INT,
 idHistorico INT,
 Observacao VARCHAR(200),
 idCondominio INT
);

ALTER TABLE LancamentoPadrao ADD CONSTRAINT PK_LancamentoPadrao PRIMARY KEY (idLctoPadrao);




