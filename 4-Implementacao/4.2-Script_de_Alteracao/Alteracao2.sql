CREATE TABLE Historicos (
 idHistorico INT NOT NULL,
 dsHistorico VARCHAR(50),
 flContaCorrente CHAR
);

ALTER TABLE Historicos ADD CONSTRAINT PK_Historicos PRIMARY KEY (idHistorico);


