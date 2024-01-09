-- Creamos la Base de Datos
CREATE DATABASE siniestros_viales; 

-- Elegimos la Base de Datos creada
USE siniestros_viales;

-- Creamos una tabla para el dataset de Homicidios_hechos

CREATE TABLE Hechos (
    Hechos_Id INT PRIMARY KEY,
    Numero_De_Victimas INT,
    Fecha DATE,
    Hora TIME,
    Lugar_Del_Hecho VARCHAR(255),
    Cruce_Id INT,
    Comuna_Id INT,
    Participantes_Id INT,
    Rango_Etario_Id INT,
    FOREIGN KEY (Cruce_Id) REFERENCES Cruces(Cruce_Id),
    FOREIGN KEY (Comuna_Id) REFERENCES Comunas(Comuna_Id),
    FOREIGN KEY (Participantes_Id) REFERENCES Participantes(Participantes_Id),
    FOREIGN KEY (Rango_Etario_Id) REFERENCES Rango_Etario(Rango_Etario_Id)
);
CREATE TABLE poblacion_caba (
	Año INT,
    Población INT
);

CREATE TABLE Participantes (
    Hechos_Id INT,
    Victima_Id INT,
    Acusado_Id INT,
    Rol_Id INT,
    Sexo_Id INT,
    Edad INT, 
    PRIMARY KEY (Hechos_Id, Victima_Id, Acusado_Id, Rol_Id, Sexo_Id),
    FOREIGN KEY (Hechos_Id) REFERENCES Hechos(Hechos_Id),
    FOREIGN KEY (Rol_Id) REFERENCES Rol(Rol_Id),
    FOREIGN KEY (Sexo_Id) REFERENCES Sexo(Sexo_Id)
);

CREATE TABLE Ubicacion (
    Hechos_Id INT PRIMARY KEY,
    Pos_X DECIMAL(10, 6),
    Pos_Y DECIMAL(10, 6),
    Calle VARCHAR(255),
    Barrio_Id INT,
    FOREIGN KEY (Hechos_Id) REFERENCES Hechos(Hechos_Id),
    FOREIGN KEY (Barrio_Id) REFERENCES Barrios(Barrio_Id)
);

CREATE TABLE Fecha_Hora (
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

CREATE TABLE Cruces (
    Cruce_Id INT PRIMARY KEY,
    Cruce VARCHAR(255)
);

CREATE TABLE Tipo_Calle (
    Tipo_Calle_Id INT PRIMARY KEY,
    Tipo_De_Calle VARCHAR(255)
);

CREATE TABLE Sexo (
    Sexo_Id INT PRIMARY KEY,
    Sexo VARCHAR(20)
);

CREATE TABLE Acusado (
    Acusado_Id INT PRIMARY KEY,
    Acusado VARCHAR(255)
);

CREATE TABLE Victima (
    Victima_Id INT PRIMARY KEY,
    Victima VARCHAR(255)
);

CREATE TABLE Rol (
    Rol_Id INT PRIMARY KEY,
    Rol VARCHAR(255)
);

CREATE TABLE Party (
    Participantes_Id INT PRIMARY KEY,
    Participantes VARCHAR(255)
);

CREATE TABLE Rango_Etario (
    Rango_Etario_Id INT PRIMARY KEY,
    Rango_Etario VARCHAR(50)
);

CREATE TABLE Estacion (
    Estacion_Id INT PRIMARY KEY,
    Estacion VARCHAR(20)
);

CREATE TABLE Barrios (
    Barrio_Id INT PRIMARY KEY,
    Barrio VARCHAR(255)
);

CREATE TABLE Comunas (
    Comuna_Id INT PRIMARY KEY,
    Comuna VARCHAR(255)
);


