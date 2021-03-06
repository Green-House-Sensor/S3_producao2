CREATE DATABASE greenhouse;

USE greenhouse;

-- MY SQL WORKBENCH
CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_razaosocial VARCHAR(45),
    dtNasc DATE,
    tipo CHAR(2),
    CHECK (tipo in('PF', 'PJ')),
    cpf_cnpj VARCHAR(14),
    cep CHAR(8),
    numero INT,
    email VARCHAR(60),
    senha VARCHAR(45),
    fkDependente INT,
    FOREIGN KEY (fkDependente) REFERENCES usuario(idUsuario)
);

CREATE TABLE estufa(
	idEstufa INT PRIMARY KEY AUTO_INCREMENT,
    produto VARCHAR(45),
    tempIdeal DOUBLE,
    umidIdeal DOUBLE,
    lumiIdeal DOUBLE,
    comprimento DOUBLE,
    largura DOUBLE
);


CREATE TABLE acesso(
	idAcesso INT AUTO_INCREMENT,
    fkUsuario INT,
    fkEstufa INT,
    PRIMARY KEY(idAcesso, fkUsuario, fkEstufa),
    momento DATETIME,
    FOREIGN KEY(fkUsuario) REFERENCES usuario(idUsuario),
    FOREIGN KEY(fkEstufa) REFERENCES estufa(idEstufa)
);

CREATE TABLE sensor(
	idSensor INT AUTO_INCREMENT,
    fkEstufa INT,
    PRIMARY KEY (idSensor, fkEstufa),
    localizacao VARCHAR(45),
    FOREIGN KEY(fkEstufa) REFERENCES estufa(idEstufa)
);

CREATE TABLE dado(
	idDado INT AUTO_INCREMENT,
    fkSensor INT,
    PRIMARY KEY(idDado, fkSensor),
    dht11Umidade DOUBLE,
    lm35Temperatura DOUBLE,
    luminosidade DOUBLE,
    momento DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(fkSensor) REFERENCES sensor(idSensor)
);

-- CREATE TABLE dado(
-- 	idDado INT PRIMARY KEY IDENTITY(1,1),
-- 	dht11Umidade DECIMAL,
--     lm35_temperatura DECIMAL,
-- 	luminosidade DECIMAL,
-- 	momento DATETIME DEFAULT CURRENT_TIMESTAMP,
-- 	fkSensor INT FOREIGN KEY REFERENCES Sensor(idSensor)
-- );

select dht11Umidade, lm35Temperatura, luminosidade FROM dado
JOIN sensor ON fkSensor = idSensor 
JOIN estufa ON fkEstufa = idEstufa where fkSensor = 1
                    order by idDado desc limit 7;



INSERT INTO estufa VALUES
(null, 'morango', 20, 50, 500, 10, 50);
INSERT INTO estufa VALUES
(null, 'alface', 20, 50, 500, 10, 50);

INSERT INTO acesso VALUES
(null, 1, 1, '2022-05-20 22:35:35');

INSERT INTO acesso VALUES
(null, 1, 2, '2022-05-20 22:35:35');

INSERT INTO sensor VALUES
(null, 1, '1A'),
(null, 1, '1B'),
(null, 1, '2A'),
(null, 1, '2B');

INSERT INTO sensor VALUES
(null, 2, '1A'),
(null, 2, '1B'),
(null, 2, '2A'),
(null, 2, '2B');

INSERT INTO dado(fkSensor, dht11Umidade, lm35Temperatura, luminosidade) VALUES
(1, 500, 23, 700),
(2, 400, 20, 500),
(3, 700, 21, 600),
(4, 600, 25, 700);

INSERT INTO dado(fkSensor, dht11Umidade, lm35Temperatura, luminosidade) VALUES
(1, 500, 23, 700),
(1, 400, 20, 500),
(1, 700, 21, 600),
(1, 600, 25, 700);

INSERT INTO dado (fkSensor,dht11Umidade,lm35Temperatura, momento)
VALUES
  (1,346,34,"2022-09-20 10:44:09");
  
DESC dado;

-- MYSQL SERVER

-- CREATE TABLE usuario(
-- 	idUsuario INT PRIMARY KEY IDENTITY(1,1),
--     nome_razaosocial VARCHAR(45),
--     dtNasc DATE,
--     tipo CHAR(2),
--     cpf_cnpj VARCHAR(14),
--     CHECK (cpf_cnpj in('PF', 'PJ')),
--     email VARCHAR(60),
--     senha VARCHAR(45),
--     fkDependente INT,
--     FOREIGN KEY (fkDependente) REFERENCES usuario(idUsuario)
-- );

-- CREATE TABLE estufa(
-- 	idEstufa INT PRIMARY KEY IDENTITY(1,1),
--     produto VARCHAR(45),
--     tempIdeal DECIMAL,
--     umidIdeal DECIMAL,
--     lumiIdeal DECIMAL,
--     comprimento DECIMAL,
--     largura DECIMAL
-- );

-- CREATE TABLE acesso(
-- 	idAcesso INT IDENTITY(1,1),
--     fkUsuario INT,
--     fkEstufa INT,
--     PRIMARY KEY(idAcesso, fkUsuario, fkEstufa),
--     momento DATETIME,
--     FOREIGN KEY(fkUsuario) REFERENCES usuario(idUsuario),
--     FOREIGN KEY(fkEstufa) REFERENCES estufa(idEstufa)
-- );

-- CREATE TABLE sensor(
-- 	idSensor INT IDENTITY(1,1),
--     fkEstufa INT,
--     PRIMARY KEY (idSensor, fkEstufa),
--     localizacao VARCHAR(45)
-- );



