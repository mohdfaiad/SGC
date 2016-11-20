CREATE TABLE Rateio (
 idRateio INT NOT NULL,
 totalRateio FLOAT,
 dtRateio DATE,
 idCondominio INT
);

ALTER TABLE Rateio ADD CONSTRAINT PK_Rateio PRIMARY KEY (idRateio);


CREATE TABLE ItensRateio (
 idItensRateio INT NOT NULL,
 idRateio INT,
 idUnidade INT,
 vlRateio FLOAT,
 vlFundoReserva FLOAT,
 dtRateio DATE
);

ALTER TABLE ItensRateio ADD CONSTRAINT PK_ItensRateio PRIMARY KEY (idItensRateio);




ALTER TABLE ItensRateio ADD CONSTRAINT FK_ItensRateio_0 FOREIGN KEY (idRateio) REFERENCES Rateio (idRateio);


