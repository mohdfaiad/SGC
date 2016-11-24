CREATE TABLE ContaCorrente (
 idContaCorrente INT NOT NULL,
 idContasReceber INT,
 idLcto INT
);

ALTER TABLE ContaCorrente ADD CONSTRAINT PK_ContaCorrente PRIMARY KEY (idContaCorrente);




