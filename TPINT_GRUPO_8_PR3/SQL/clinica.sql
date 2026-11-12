CREATE DATABASE clinica
GO

USE clinica
GO

CREATE TABLE Provincias
(
	IdProvincia CHAR(8) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,

	CONSTRAINT PK_Provincias PRIMARY KEY (IdProvincia)
);
GO

CREATE TABLE Localidades
(
	IdLocalidad CHAR(8) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	IdProvincia CHAR(8) NOT NULL,

	CONSTRAINT PK_Localidades PRIMARY KEY (IdLocalidad),

	CONSTRAINT FK_Localidades_Provincias FOREIGN KEY (IdProvincia)
		REFERENCES Provincias (IdProvincia)
);
GO

CREATE TABLE Especialidades
(
	IdEspecialidad CHAR(8) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,

	CONSTRAINT PK_Especialidades PRIMARY KEY (IdEspecialidad)
);
GO

INSERT INTO Provincias (IdProvincia, Nombre)
SELECT 'PRV00001', N'Buenos Aires'
UNION SELECT 'PRV00002', N'Catamarca'
UNION SELECT 'PRV00003', N'Chaco'
UNION SELECT 'PRV00004', N'Chubut'
UNION SELECT 'PRV00005', N'Córdoba'
UNION SELECT 'PRV00006', N'Corrientes'
UNION SELECT 'PRV00007', N'Entre Ríos'
UNION SELECT 'PRV00008', N'Formosa'
UNION SELECT 'PRV00009', N'Jujuy'
UNION SELECT 'PRV00010', N'La Pampa'
UNION SELECT 'PRV00011', N'La Rioja'
UNION SELECT 'PRV00012', N'Mendoza'
UNION SELECT 'PRV00013', N'Misiones'
UNION SELECT 'PRV00014', N'Neuquén'
UNION SELECT 'PRV00015', N'Río Negro'
UNION SELECT 'PRV00016', N'Salta'
UNION SELECT 'PRV00017', N'San Juan'
UNION SELECT 'PRV00018', N'San Luis'
UNION SELECT 'PRV00019', N'Santa Cruz'
UNION SELECT 'PRV00020', N'Santa Fe'
UNION SELECT 'PRV00021', N'Santiago del Estero'
UNION SELECT 'PRV00022', N'Tierra del Fuego'
UNION SELECT 'PRV00023', N'Tucumán';
GO

INSERT INTO Localidades (IdLocalidad, Nombre, IdProvincia)
SELECT 'LOC00001', N'La Plata', 'PRV00001'
UNION SELECT 'LOC00002', N'Mar del Plata', 'PRV00001'
UNION SELECT 'LOC00003', N'Bahía Blanca', 'PRV00001'
UNION SELECT 'LOC00004', N'Córdoba', 'PRV00005'
UNION SELECT 'LOC00005', N'Villa Carlos Paz', 'PRV00005'
UNION SELECT 'LOC00006', N'Rosario', 'PRV00020'
UNION SELECT 'LOC00007', N'Santa Fe', 'PRV00020'
UNION SELECT 'LOC00008', N'Mendoza', 'PRV00012'
UNION SELECT 'LOC00009', N'San Rafael', 'PRV00012'
UNION SELECT 'LOC00010', N'Paraná', 'PRV00007'
UNION SELECT 'LOC00011', N'Concordia', 'PRV00007'
UNION SELECT 'LOC00012', N'Salta', 'PRV00016'
UNION SELECT 'LOC00013', N'Tartagal', 'PRV00016'
UNION SELECT 'LOC00014', N'Neuquén', 'PRV00014'
UNION SELECT 'LOC00015', N'San Martín de los Andes', 'PRV00014'
UNION SELECT 'LOC00016', N'San Miguel de Tucumán', 'PRV00023';
GO

INSERT INTO Especialidades (IdEspecialidad, Nombre)
SELECT 'ESP00001', N'Cardiología'
UNION SELECT 'ESP00002', N'Dermatología'
UNION SELECT 'ESP00003', N'Pediatría'
UNION SELECT 'ESP00004', N'Ginecología'
UNION SELECT 'ESP00005', N'Traumatología'
UNION SELECT 'ESP00006', N'Neurología'
UNION SELECT 'ESP00007', N'Oftalmología'
UNION SELECT 'ESP00008', N'Odontología'
UNION SELECT 'ESP00009', N'Clínica Médica'
UNION SELECT 'ESP00010', N'Psiquiatría'
UNION SELECT 'ESP00011', N'Urología'
UNION SELECT 'ESP00012', N'Endocrinología'
UNION SELECT 'ESP00013', N'Gastroenterología'
UNION SELECT 'ESP00014', N'Neumonología'
UNION SELECT 'ESP00015', N'Oncología'
UNION SELECT 'ESP00016', N'Nefrología'
UNION SELECT 'ESP00017', N'Reumatología'
UNION SELECT 'ESP00018', N'Otorrinolaringología'
UNION SELECT 'ESP00019', N'Diabetología'
UNION SELECT 'ESP00020', N'Infectología';
GO

USE clinica
GO

CREATE TABLE Administradores
(
	IdAdministrador CHAR(8) NOT NULL,
	Usuario VARCHAR(30) NOT NULL,
	Clave VARCHAR(30) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,

	CONSTRAINT PK_Administradores PRIMARY KEY (IdAdministrador),
	CONSTRAINT UQ_Administradores_Usuario UNIQUE (Usuario)
);
GO

CREATE TABLE Pacientes
(
	IdPaciente CHAR(8) NOT NULL,
	Dni CHAR(15) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Sexo CHAR(1) NOT NULL,
	Nacionalidad VARCHAR(50) NOT NULL,
	FechaNacimiento DATE NOT NULL,
	Direccion VARCHAR(100) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Telefono VARCHAR(20) NOT NULL,
	IdLocalidad CHAR(8) NOT NULL,
	Activo BIT NOT NULL DEFAULT 1,

	CONSTRAINT PK_Pacientes PRIMARY KEY (IdPaciente),
	CONSTRAINT UQ_Pacientes_Dni UNIQUE (Dni),

	CONSTRAINT FK_Pacientes_Localidades FOREIGN KEY (IdLocalidad)
		REFERENCES Localidades (IdLocalidad),

	CONSTRAINT CK_Pacientes_Sexo CHECK (Sexo IN ('M', 'F'))
);
GO

INSERT INTO Administradores (IdAdministrador, Usuario, Clave, Nombre, Apellido)
SELECT 'ADM00001', N'admin', N'admin123', N'Administrador', N'Principal';
GO

USE clinica
GO

CREATE TABLE Medicos
(
	Legajo CHAR(8) NOT NULL,
	Dni CHAR(15) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Sexo CHAR(1) NOT NULL,
	Nacionalidad VARCHAR(50) NOT NULL,
	FechaNacimiento DATE NOT NULL,
	Direccion VARCHAR(100) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Telefono VARCHAR(20) NOT NULL,
	IdLocalidad CHAR(8) NOT NULL,
	IdEspecialidad CHAR(8) NOT NULL,
	Usuario VARCHAR(30) NULL,
	Clave VARCHAR(30) NULL,
	Activo BIT NOT NULL DEFAULT 1,

	CONSTRAINT PK_Medicos PRIMARY KEY (Legajo),
	CONSTRAINT UQ_Medicos_Dni UNIQUE (Dni),

	CONSTRAINT FK_Medicos_Localidades FOREIGN KEY (IdLocalidad)
		REFERENCES Localidades (IdLocalidad),

	CONSTRAINT FK_Medicos_Especialidades FOREIGN KEY (IdEspecialidad)
		REFERENCES Especialidades (IdEspecialidad),

	CONSTRAINT CK_Medicos_Sexo CHECK (Sexo IN ('M', 'F'))
);
GO

-- El índice filtrado exige QUOTED_IDENTIFIER ON (SSMS lo trae así, sqlcmd no)
SET QUOTED_IDENTIFIER ON
GO

-- UNIQUE común admite un solo NULL; el filtrado deja muchos médicos sin usuario
CREATE UNIQUE INDEX UQ_Medicos_Usuario ON Medicos (Usuario)
	WHERE Usuario IS NOT NULL;
GO

-- DiaSemana: 1 = lunes ... 7 = domingo
CREATE TABLE HorariosMedico
(
	Legajo CHAR(8) NOT NULL,
	DiaSemana TINYINT NOT NULL,
	HoraInicio TINYINT NOT NULL,
	HoraFin TINYINT NOT NULL,

	CONSTRAINT PK_HorariosMedico PRIMARY KEY (Legajo, DiaSemana),

	CONSTRAINT FK_HorariosMedico_Medicos FOREIGN KEY (Legajo)
		REFERENCES Medicos (Legajo),

	CONSTRAINT CK_HorariosMedico_Dia CHECK (DiaSemana BETWEEN 1 AND 7),
	CONSTRAINT CK_HorariosMedico_Horas CHECK (HoraInicio < HoraFin AND HoraFin <= 24)
);
GO
