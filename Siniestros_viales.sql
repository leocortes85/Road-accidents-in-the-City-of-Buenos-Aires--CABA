-- Creamos la Base de Datos
DROP DATABASE IF EXISTS siniestros_viales;
CREATE DATABASE IF NOT EXISTS siniestros_viales;

-- Elegimos la Base de Datos creada
USE siniestros_viales;

-- Creamos una tabla para el dataset de Homicidios_hechos
DROP TABLE IF EXISTS  Cruces;
CREATE TABLE IF NOT EXISTS   Cruces (
    Cruce_Id INT PRIMARY KEY,
    Cruce VARCHAR(255)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cruce.csv'
INTO TABLE Cruces
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Cruces;

DROP TABLE IF EXISTS  Tipo_Calle;
CREATE TABLE IF NOT EXISTS   Tipo_Calle ( 
    Tipo_Calle_Id INT PRIMARY KEY,
    Tipo_De_Calle VARCHAR(255)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\tipo_calle.csv'
INTO TABLE Tipo_Calle
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Tipo_Calle;

DROP TABLE IF EXISTS  Sexo;
CREATE TABLE IF NOT EXISTS   Sexo (
    Sexo_Id INT PRIMARY KEY,
    Sexo VARCHAR(20)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sexo.csv'
INTO TABLE Sexo
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Sexo;

DROP TABLE IF EXISTS  Acusado;
CREATE TABLE IF NOT EXISTS   Acusado (
    Acusado_Id INT PRIMARY KEY,
    Acusado VARCHAR(255)
);
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\acusado.csv'
INTO TABLE Acusado
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Acusado;

DROP TABLE IF EXISTS  Victima;
CREATE TABLE IF NOT EXISTS   Victima (
    Victima_Id INT PRIMARY KEY,
    Victima VARCHAR(255)
);
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\victima.csv'
INTO TABLE Victima
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Victima;

DROP TABLE IF EXISTS  Rol;
CREATE TABLE IF NOT EXISTS   Rol (
    Rol_Id INT PRIMARY KEY,
    Rol VARCHAR(255)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\rol.csv'
INTO TABLE Rol
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Rol;

DROP TABLE IF EXISTS  Party;
CREATE TABLE IF NOT EXISTS   Party (
    Participantes_Id INT PRIMARY KEY,
    Participantes VARCHAR(255)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\party.csv'
INTO TABLE Party
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Party;

DROP TABLE IF EXISTS  Rango_Etario;
CREATE TABLE IF NOT EXISTS   Rango_Etario (
    Rango_Etario_Id INT PRIMARY KEY,
    Rango_Etario VARCHAR(50)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\rango_etario.csv'
INTO TABLE Rango_Etario
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Rango_Etario;

DROP TABLE IF EXISTS  Estacion;
CREATE TABLE IF NOT EXISTS   Estacion (
    Estacion_Id INT PRIMARY KEY,
    Estacion VARCHAR(20)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\estacion.csv'
INTO TABLE Estacion
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Estacion;

DROP TABLE IF EXISTS  Barrios;
CREATE TABLE IF NOT EXISTS   Barrios (
    Barrio_Id VARCHAR(255) PRIMARY KEY,
    Barrio VARCHAR(255)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\barrios.csv'
INTO TABLE Barrios
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Barrios;

DROP TABLE IF EXISTS  Comunas;
CREATE TABLE IF NOT EXISTS   Comunas (
    Comuna_Id INT PRIMARY KEY,
    Comuna VARCHAR(255)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\comunas.csv'
INTO TABLE Comunas
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Comunas;

DROP TABLE IF EXISTS Participantes;
CREATE TABLE IF NOT EXISTS  Participantes ( 
    Hechos_Id VARCHAR(255),
    Victima_Id INT,
    Acusado_Id INT,
    Rol_Id INT,
    Sexo_Id INT,
    Edad INT 
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\participantes.csv'
INTO TABLE Participantes
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Participantes;


DROP TABLE IF EXISTS Hechos;
CREATE TABLE IF NOT EXISTS Hechos (
    Hechos_Id VARCHAR(255) PRIMARY KEY,
    Numero_De_Victimas INT,
    Fecha DATE,
    Hora TIME,
    Lugar_Del_Hecho VARCHAR(255),
    Cruce_Id INT,
    Tipo_Calle_Id VARCHAR(255),
    Comuna_Id INT,
    Participantes_Id INT,
    Rango_Etario_Id INT,
    FOREIGN KEY (Cruce_Id) REFERENCES Cruces(Cruce_Id),
    FOREIGN KEY (Tipo_Calle_Id) REFERENCES Tipo_Calle(Tipo_Calle_Id),
    FOREIGN KEY (Comuna_Id) REFERENCES Comunas(Comuna_Id),
    FOREIGN KEY (Participantes_Id) REFERENCES Party(Participantes_Id),
    FOREIGN KEY (Rango_Etario_Id) REFERENCES Rango_Etario(Rango_Etario_Id)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\hechos_main.csv'
INTO TABLE Hechos
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Hechos;

DROP TABLE IF EXISTS Poblacion_Caba;
CREATE TABLE IF NOT EXISTS Poblacion_Caba (
	Año INT,
    Población INT
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\bsas_pop.csv'
INTO TABLE Poblacion_Caba 
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Poblacion_Caba ;

DROP TABLE IF EXISTS Ubicacion;
CREATE TABLE IF NOT EXISTS  Ubicacion (  
    Hechos_Id INT PRIMARY KEY,
    Pos_X DECIMAL(10, 6),
    Pos_Y DECIMAL(10, 6),
    Calle VARCHAR(255),
    Barrio_Id VARCHAR(255),
    FOREIGN KEY (Hechos_Id) REFERENCES Hechos(Hechos_Id),
    FOREIGN KEY (Barrio_Id) REFERENCES Barrios(Barrio_Id)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\ubicacion.csv'
INTO TABLE PUbicacion 
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Ubicacion;

DROP TABLE IF EXISTS  Fecha_Hora;
CREATE TABLE IF NOT EXISTS   Fecha_Hora ( 
    Hechos_Id INT PRIMARY KEY,
    Año INT,
    Mes INT,
    Dia INT,
    Dia_Semana VARCHAR(20),
    Franja_Horaria VARCHAR(20),
    Estacion_Id INT, 
    FOREIGN KEY (Hechos_Id) REFERENCES Hechos(Hechos_Id),
    FOREIGN KEY (Estacion_Id) REFERENCES Estacion(Estacion_Id)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\fecha_hora.csv'
INTO TABLE Fecha_Hora 
FIELDS TERMINATED BY ',' ENCLOSED BY ''	 ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT * FROM Fecha_Hora;



