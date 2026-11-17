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

CREATE TABLE MedicoHorarios
(
	IdMedicoHorario CHAR(8) NOT NULL,
	Legajo CHAR(8) NOT NULL,
	Dia VARCHAR(10) NOT NULL,
	HoraDesde TIME(0) NOT NULL,
	HoraHasta TIME(0) NOT NULL,

	CONSTRAINT PK_MedicoHorarios PRIMARY KEY (IdMedicoHorario),

	CONSTRAINT FK_MedicoHorarios_Medicos FOREIGN KEY (Legajo)
		REFERENCES Medicos (Legajo),

	CONSTRAINT CK_MedicoHorarios_Dia CHECK (Dia IN
		('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo')),

	CONSTRAINT CK_MedicoHorarios_Horas CHECK (HoraHasta > HoraDesde)
);
GO

CREATE TABLE Turnos
(
	IdTurno CHAR(8) NOT NULL,
	Legajo CHAR(8) NOT NULL,
	IdPaciente CHAR(8) NOT NULL,
	Fecha DATE NOT NULL,
	Hora TIME(0) NOT NULL,
	Estado VARCHAR(10) NOT NULL DEFAULT 'Pendiente',
	Observacion VARCHAR(500) NULL,
	Activo BIT NOT NULL DEFAULT 1,

	CONSTRAINT PK_Turnos PRIMARY KEY (IdTurno),

	CONSTRAINT FK_Turnos_Medicos FOREIGN KEY (Legajo)
		REFERENCES Medicos (Legajo),

	CONSTRAINT FK_Turnos_Pacientes FOREIGN KEY (IdPaciente)
		REFERENCES Pacientes (IdPaciente),

	CONSTRAINT UQ_Turnos_Medico_Fecha_Hora UNIQUE (Legajo, Fecha, Hora),

	CONSTRAINT CK_Turnos_Estado CHECK (Estado IN ('Pendiente', 'Presente', 'Ausente'))
);
GO

-- Procedimientos almacenados de pacientes
USE clinica
GO

CREATE PROCEDURE spAgregarPaciente
	@IdPaciente CHAR(8),
	@Dni CHAR(15),
	@Nombre VARCHAR(50),
	@Apellido VARCHAR(50),
	@Sexo CHAR(1),
	@Nacionalidad VARCHAR(50),
	@FechaNacimiento DATE,
	@Direccion VARCHAR(100),
	@Email VARCHAR(100),
	@Telefono VARCHAR(20),
	@IdLocalidad CHAR(8)
AS
BEGIN
	INSERT INTO Pacientes
		(IdPaciente, Dni, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento, Direccion, Email, Telefono, IdLocalidad)
	VALUES
		(@IdPaciente, @Dni, @Nombre, @Apellido, @Sexo, @Nacionalidad, @FechaNacimiento, @Direccion, @Email, @Telefono, @IdLocalidad);
END
GO

CREATE PROCEDURE spModificarPaciente
	@Dni CHAR(15),
	@Nombre VARCHAR(50),
	@Apellido VARCHAR(50),
	@Sexo CHAR(1),
	@Nacionalidad VARCHAR(50),
	@FechaNacimiento DATE,
	@Direccion VARCHAR(100),
	@Email VARCHAR(100),
	@Telefono VARCHAR(20),
	@IdLocalidad CHAR(8)
AS
BEGIN
	UPDATE Pacientes
	SET Nombre = @Nombre,
		Apellido = @Apellido,
		Sexo = @Sexo,
		Nacionalidad = @Nacionalidad,
		FechaNacimiento = @FechaNacimiento,
		Direccion = @Direccion,
		Email = @Email,
		Telefono = @Telefono,
		IdLocalidad = @IdLocalidad
	WHERE Dni = @Dni;
END
GO

CREATE PROCEDURE spBajaPaciente
	@Dni CHAR(15)
AS
BEGIN
	UPDATE Pacientes SET Activo = 0 WHERE Dni = @Dni;
END
GO

-- Procedimientos almacenados de médicos y usuarios
USE clinica
GO

CREATE OR ALTER PROCEDURE spAgregarMedico
	@Legajo CHAR(8),
	@Dni CHAR(15),
	@Nombre VARCHAR(50),
	@Apellido VARCHAR(50),
	@Sexo CHAR(1),
	@Nacionalidad VARCHAR(50),
	@FechaNacimiento DATE,
	@Direccion VARCHAR(100),
	@Email VARCHAR(100),
	@Telefono VARCHAR(20),
	@IdLocalidad CHAR(8),
	@IdEspecialidad CHAR(8),
	@Usuario VARCHAR(30) = NULL,
	@Clave VARCHAR(30) = NULL
AS
BEGIN
	INSERT INTO Medicos
		(Legajo, Dni, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento, Direccion, Email, Telefono, IdLocalidad, IdEspecialidad, Usuario, Clave)
	VALUES
		(@Legajo, @Dni, @Nombre, @Apellido, @Sexo, @Nacionalidad, @FechaNacimiento, @Direccion, @Email, @Telefono, @IdLocalidad, @IdEspecialidad, @Usuario, @Clave);
END
GO

CREATE OR ALTER PROCEDURE spModificarMedico
	@Legajo CHAR(8),
	@Dni CHAR(15),
	@Nombre VARCHAR(50),
	@Apellido VARCHAR(50),
	@Sexo CHAR(1),
	@Nacionalidad VARCHAR(50),
	@FechaNacimiento DATE,
	@Direccion VARCHAR(100),
	@Email VARCHAR(100),
	@Telefono VARCHAR(20),
	@IdLocalidad CHAR(8),
	@IdEspecialidad CHAR(8)
AS
BEGIN
	UPDATE Medicos
	SET Dni = @Dni,
		Nombre = @Nombre,
		Apellido = @Apellido,
		Sexo = @Sexo,
		Nacionalidad = @Nacionalidad,
		FechaNacimiento = @FechaNacimiento,
		Direccion = @Direccion,
		Email = @Email,
		Telefono = @Telefono,
		IdLocalidad = @IdLocalidad,
		IdEspecialidad = @IdEspecialidad
	WHERE Legajo = @Legajo;
END
GO

CREATE OR ALTER PROCEDURE spModificarUsuario
	@Legajo CHAR(8),
	@Usuario VARCHAR(30),
	@Clave VARCHAR(30)
AS
BEGIN
	UPDATE Medicos
	SET Usuario = @Usuario,
		Clave = @Clave
	WHERE Legajo = @Legajo;
END
GO

CREATE OR ALTER PROCEDURE spBajaMedico
	@Legajo CHAR(8)
AS
BEGIN
	UPDATE Medicos SET Activo = 0 WHERE Legajo = @Legajo;
END
GO

CREATE PROCEDURE spAgregarHorario
	@IdMedicoHorario CHAR(8),
	@Legajo CHAR(8),
	@Dia VARCHAR(10),
	@HoraDesde TIME(0),
	@HoraHasta TIME(0)
AS
BEGIN
	INSERT INTO MedicoHorarios
		(IdMedicoHorario, Legajo, Dia, HoraDesde, HoraHasta)
	VALUES
		(@IdMedicoHorario, @Legajo, @Dia, @HoraDesde, @HoraHasta);
END
GO

-- Procedimientos almacenados de turnos
USE clinica
GO

CREATE PROCEDURE spCargarAsistencia
	@IdTurno CHAR(8),
	@Estado VARCHAR(10),
	@Observacion VARCHAR(500) = NULL
AS
BEGIN
	UPDATE Turnos
	SET Estado = @Estado,
		Observacion = @Observacion
	WHERE IdTurno = @IdTurno;
END
GO

CREATE PROCEDURE SpAgregarTurno


@IdTurno CHAR(8),
@Legajo CHAR(8),
@IdPaciente CHAR(8),
@Fecha DATE,
@Hora TIME(0)

AS
BEGIN

INSERT INTO Turnos
(
IdTurno,
Legajo,
IdPaciente,
Fecha,
Hora,
Estado
)
VALUES
(
@IdTurno,
@Legajo,
@IdPaciente,
@Fecha,
@Hora,
'Pendiente'
);

END
GO

-- Datos de prueba
USE clinica
GO

INSERT INTO Administradores (IdAdministrador, Usuario, Clave, Nombre, Apellido)
SELECT 'ADM00002', N'lgomez', N'lgomez123', N'Laura', N'Gómez'
UNION SELECT 'ADM00003', N'rfernandez', N'rfernandez123', N'Raúl', N'Fernández'
UNION SELECT 'ADM00004', N'mdiaz', N'mdiaz123', N'Mónica', N'Díaz'
UNION SELECT 'ADM00005', N'jalvarez', N'jalvarez123', N'Javier', N'Álvarez'
UNION SELECT 'ADM00006', N'cmendez', N'cmendez123', N'Cecilia', N'Méndez'
UNION SELECT 'ADM00007', N'gsanchez', N'gsanchez123', N'Gustavo', N'Sánchez'
UNION SELECT 'ADM00008', N'pramirez', N'pramirez123', N'Patricia', N'Ramírez'
UNION SELECT 'ADM00009', N'dcastillo', N'dcastillo123', N'Daniel', N'Castillo'
UNION SELECT 'ADM00010', N'erojas', N'erojas123', N'Elena', N'Rojas'
UNION SELECT 'ADM00011', N'mjuarez', N'mjuarez123', N'Matías', N'Juárez'
UNION SELECT 'ADM00012', N'sluna', N'sluna123', N'Susana', N'Luna'
UNION SELECT 'ADM00013', N'fpereyra', N'fpereyra123', N'Fernando', N'Pereyra'
UNION SELECT 'ADM00014', N'vcampos', N'vcampos123', N'Victoria', N'Campos'
UNION SELECT 'ADM00015', N'nibarra', N'nibarra123', N'Nicolás', N'Ibarra';
GO

INSERT INTO Pacientes (IdPaciente, Dni, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento, Direccion, Email, Telefono, IdLocalidad)
SELECT 'PAC00001', '28456789', N'Lucía', N'García', 'F', N'Argentina', '1981-03-14', N'Av. Mitre 1520', N'lucia.garcia@mail.com', '2214567890', 'LOC00001'
UNION SELECT 'PAC00002', '35123456', N'Tomás', N'Rodríguez', 'M', N'Argentina', '1992-11-02', N'San Martín 455', N'tomas.rodriguez@mail.com', '3514561234', 'LOC00004'
UNION SELECT 'PAC00003', '31234567', N'Valeria', N'Garay', 'F', N'Argentina', '1985-06-20', N'Belgrano 820', N'valeria.garay@mail.com', '3415672345', 'LOC00006'
UNION SELECT 'PAC00004', '22345678', N'Jorge', N'Fernández', 'M', N'Argentina', '1968-02-11', N'Sarmiento 1300', N'jorge.fernandez@mail.com', '2614783456', 'LOC00008'
UNION SELECT 'PAC00005', '33456789', N'Mariana', N'López', 'F', N'Argentina', '1988-09-05', N'Urquiza 250', N'mariana.lopez@mail.com', '3434894567', 'LOC00010'
UNION SELECT 'PAC00006', '52345678', N'Santiago', N'Martínez', 'M', N'Argentina', '2016-04-18', N'Colón 77', N'flia.martinez@mail.com', '2234905678', 'LOC00002'
UNION SELECT 'PAC00007', '53456789', N'Sofía', N'Romero', 'F', N'Argentina', '2018-12-03', N'Rivadavia 940', N'flia.romero@mail.com', '3541016789', 'LOC00005'
UNION SELECT 'PAC00008', '54567890', N'Benjamín', N'Torres', 'M', N'Argentina', '2017-07-22', N'España 610', N'flia.torres@mail.com', '3874127890', 'LOC00012'
UNION SELECT 'PAC00009', '29567890', N'Claudia', N'Benítez', 'F', N'Paraguaya', '1983-01-30', N'Moreno 1450', N'claudia.benitez@mail.com', '2914238901', 'LOC00003'
UNION SELECT 'PAC00010', '37678901', N'Federico', N'Acosta', 'M', N'Argentina', '1994-05-09', N'9 de Julio 330', N'federico.acosta@mail.com', '3424349012', 'LOC00007'
UNION SELECT 'PAC00011', '40789012', N'Camila', N'Herrera', 'F', N'Argentina', '1998-08-14', N'Alem 55', N'camila.herrera@mail.com', '2994450123', 'LOC00014'
UNION SELECT 'PAC00012', '26890123', N'Diego', N'Silva', 'M', N'Uruguaya', '1978-10-27', N'Lavalle 712', N'diego.silva@mail.com', '2604561234', 'LOC00009'
UNION SELECT 'PAC00013', '34901234', N'Florencia', N'Medina', 'F', N'Argentina', '1990-03-03', N'Pellegrini 480', N'florencia.medina@mail.com', '3814672345', 'LOC00016'
UNION SELECT 'PAC00014', '24012345', N'Ricardo', N'Castro', 'M', N'Argentina', '1972-12-19', N'Mitre 2100', N'ricardo.castro@mail.com', '3454783456', 'LOC00011'
UNION SELECT 'PAC00015', '38123456', N'Paula', N'Ruiz', 'F', N'Argentina', '1995-07-07', N'Güemes 165', N'paula.ruiz@mail.com', '3873894567', 'LOC00013';
GO

INSERT INTO Medicos (Legajo, Dni, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento, Direccion, Email, Telefono, IdLocalidad, IdEspecialidad, Usuario, Clave)
SELECT 'MED00001', '25987654', N'Martín', N'Pérez', 'M', N'Argentina', '1975-08-02', N'Belgrano 340', N'mperez@clinica.com', '2234567812', 'LOC00002', 'ESP00001', N'mperez', N'mperez123'
UNION SELECT 'MED00002', '27345678', N'Carla', N'Sosa', 'F', N'Argentina', '1979-04-21', N'Rivadavia 1200', N'csosa@clinica.com', '3415678123', 'LOC00006', 'ESP00001', N'csosa', N'csosa123'
UNION SELECT 'MED00003', '23456123', N'Gabriela', N'Morales', 'F', N'Argentina', '1970-11-15', N'Corrientes 455', N'gmorales@clinica.com', '2216789234', 'LOC00001', 'ESP00003', N'gmorales', N'gmorales123'
UNION SELECT 'MED00004', '30567234', N'Pablo', N'Giménez', 'M', N'Argentina', '1983-02-08', N'Tucumán 980', N'pgimenez@clinica.com', '3517890345', 'LOC00004', 'ESP00003', N'pgimenez', N'pgimenez123'
UNION SELECT 'MED00005', '21678345', N'Alejandro', N'Ríos', 'M', N'Argentina', '1966-06-30', N'Av. Colón 1500', N'arios@clinica.com', '3518901456', 'LOC00004', 'ESP00009', N'arios', N'arios123'
UNION SELECT 'MED00006', '32789456', N'Natalia', N'Vega', 'F', N'Argentina', '1986-09-12', N'Moreno 220', N'nvega@clinica.com', '2619012567', 'LOC00008', 'ESP00009', N'nvega', N'nvega123'
UNION SELECT 'MED00007', '28890567', N'Lorena', N'Ortiz', 'F', N'Argentina', '1981-01-25', N'San Juan 760', N'lortiz@clinica.com', '3430123678', 'LOC00010', 'ESP00002', N'lortiz', N'lortiz123'
UNION SELECT 'MED00008', '26901678', N'Silvina', N'Navarro', 'F', N'Argentina', '1977-05-17', N'Italia 340', N'snavarro@clinica.com', '3411234789', 'LOC00006', 'ESP00004', N'snavarro', N'snavarro123'
UNION SELECT 'MED00009', '29012789', N'Hernán', N'Domínguez', 'M', N'Argentina', '1982-03-04', N'Mitre 1100', N'hdominguez@clinica.com', '3872345890', 'LOC00012', 'ESP00005', N'hdominguez', N'hdominguez123'
UNION SELECT 'MED00010', '24123890', N'Eduardo', N'Suárez', 'M', N'Argentina', '1973-10-10', N'Laprida 615', N'esuarez@clinica.com', '3813456901', 'LOC00016', 'ESP00006', N'esuarez', N'esuarez123'
UNION SELECT 'MED00011', '31234901', N'Verónica', N'Molina', 'F', N'Argentina', '1984-12-01', N'Alsina 90', N'vmolina@clinica.com', '3424567012', 'LOC00007', 'ESP00007', N'vmolina', N'vmolina123'
UNION SELECT 'MED00012', '33345012', N'Lucas', N'Aguirre', 'M', N'Argentina', '1989-07-19', N'Brown 520', N'laguirre@clinica.com', '2915678123', 'LOC00003', 'ESP00008', N'laguirre', N'laguirre123'
UNION SELECT 'MED00013', '27456123', N'Andrea', N'Paz', 'F', N'Argentina', '1980-08-23', N'Roca 430', N'apaz@clinica.com', '2996789234', 'LOC00014', 'ESP00010', N'apaz', N'apaz123'
UNION SELECT 'MED00014', '22567234', N'Ramiro', N'Cabrera', 'M', N'Argentina', '1969-04-02', N'Entre Ríos 310', N'rcabrera@clinica.com', '3457890345', 'LOC00011', 'ESP00011', N'rcabrera', N'rcabrera123'
UNION SELECT 'MED00015', '34678345', N'Julieta', N'Flores', 'F', N'Argentina', '1987-02-14', N'Saavedra 870', N'jflores@clinica.com', '2608901456', 'LOC00009', 'ESP00012', N'jflores', N'jflores123';
GO

INSERT INTO MedicoHorarios (IdMedicoHorario, Legajo, Dia, HoraDesde, HoraHasta)
SELECT 'HOR00001', 'MED00001', 'Lunes', '09:00', '13:00'
UNION SELECT 'HOR00002', 'MED00001', 'Miercoles', '09:00', '13:00'
UNION SELECT 'HOR00003', 'MED00002', 'Martes', '14:00', '18:00'
UNION SELECT 'HOR00004', 'MED00002', 'Jueves', '14:00', '18:00'
UNION SELECT 'HOR00005', 'MED00003', 'Lunes', '08:00', '12:00'
UNION SELECT 'HOR00006', 'MED00003', 'Miercoles', '08:00', '12:00'
UNION SELECT 'HOR00007', 'MED00004', 'Viernes', '09:00', '15:00'
UNION SELECT 'HOR00008', 'MED00005', 'Lunes', '14:00', '19:00'
UNION SELECT 'HOR00009', 'MED00005', 'Miercoles', '14:00', '19:00'
UNION SELECT 'HOR00010', 'MED00006', 'Martes', '08:00', '12:00'
UNION SELECT 'HOR00011', 'MED00006', 'Jueves', '08:00', '12:00'
UNION SELECT 'HOR00012', 'MED00007', 'Martes', '10:00', '14:00'
UNION SELECT 'HOR00013', 'MED00008', 'Jueves', '09:00', '13:00'
UNION SELECT 'HOR00014', 'MED00009', 'Viernes', '14:00', '18:00'
UNION SELECT 'HOR00015', 'MED00010', 'Lunes', '15:00', '19:00'
UNION SELECT 'HOR00016', 'MED00011', 'Miercoles', '08:00', '12:00'
UNION SELECT 'HOR00017', 'MED00012', 'Sabado', '09:00', '13:00'
UNION SELECT 'HOR00018', 'MED00013', 'Martes', '16:00', '20:00'
UNION SELECT 'HOR00019', 'MED00014', 'Jueves', '14:00', '18:00'
UNION SELECT 'HOR00020', 'MED00015', 'Viernes', '08:00', '12:00';
GO

INSERT INTO Turnos (IdTurno, Legajo, IdPaciente, Fecha, Hora, Estado, Observacion)
SELECT 'TUR00001', 'MED00001', 'PAC00001', '2026-09-07', '10:00', 'Presente', N'Control anual, presión normal'
UNION SELECT 'TUR00002', 'MED00001', 'PAC00002', '2026-10-07', '09:00', 'Ausente', NULL
UNION SELECT 'TUR00003', 'MED00001', 'PAC00003', '2026-11-23', '11:00', 'Pendiente', NULL
UNION SELECT 'TUR00004', 'MED00002', 'PAC00004', '2026-09-08', '15:00', 'Presente', N'Electrocardiograma sin alteraciones'
UNION SELECT 'TUR00005', 'MED00002', 'PAC00005', '2026-10-22', '16:00', 'Presente', N'Ajuste de medicación antihipertensiva'
UNION SELECT 'TUR00006', 'MED00003', 'PAC00006', '2026-09-09', '08:00', 'Presente', N'Control de crecimiento normal'
UNION SELECT 'TUR00007', 'MED00003', 'PAC00007', '2026-10-19', '09:00', 'Ausente', NULL
UNION SELECT 'TUR00008', 'MED00004', 'PAC00008', '2026-09-11', '10:00', 'Presente', N'Vacunación al día'
UNION SELECT 'TUR00009', 'MED00005', 'PAC00009', '2026-09-21', '14:00', 'Presente', N'Chequeo general, se piden análisis de sangre'
UNION SELECT 'TUR00010', 'MED00005', 'PAC00010', '2026-11-04', '15:00', 'Ausente', NULL
UNION SELECT 'TUR00011', 'MED00006', 'PAC00011', '2026-10-06', '08:00', 'Presente', N'Cuadro gripal, reposo 48 horas'
UNION SELECT 'TUR00012', 'MED00007', 'PAC00012', '2026-10-20', '11:00', 'Presente', N'Dermatitis leve, crema tópica'
UNION SELECT 'TUR00013', 'MED00008', 'PAC00013', '2026-10-08', '10:00', 'Presente', N'Control ginecológico anual'
UNION SELECT 'TUR00014', 'MED00009', 'PAC00014', '2026-10-23', '14:00', 'Ausente', NULL
UNION SELECT 'TUR00015', 'MED00010', 'PAC00015', '2026-11-09', '16:00', 'Presente', N'Cefaleas frecuentes, se pide resonancia'
UNION SELECT 'TUR00016', 'MED00011', 'PAC00001', '2026-11-11', '09:00', 'Presente', N'Control de agudeza visual'
UNION SELECT 'TUR00017', 'MED00012', 'PAC00002', '2026-11-07', '10:00', 'Presente', N'Limpieza dental'
UNION SELECT 'TUR00018', 'MED00013', 'PAC00003', '2026-11-10', '17:00', 'Ausente', NULL
UNION SELECT 'TUR00019', 'MED00014', 'PAC00004', '2026-11-12', '15:00', 'Presente', N'Control prostático, valores normales'
UNION SELECT 'TUR00020', 'MED00015', 'PAC00005', '2026-11-13', '08:00', 'Presente', N'Control de tiroides'
UNION SELECT 'TUR00021', 'MED00002', 'PAC00006', '2026-11-24', '14:00', 'Pendiente', NULL
UNION SELECT 'TUR00022', 'MED00005', 'PAC00007', '2026-11-25', '16:00', 'Pendiente', NULL
UNION SELECT 'TUR00023', 'MED00006', 'PAC00008', '2026-12-03', '09:00', 'Pendiente', NULL
UNION SELECT 'TUR00024', 'MED00009', 'PAC00009', '2026-11-27', '15:00', 'Pendiente', NULL
UNION SELECT 'TUR00025', 'MED00001', 'PAC00010', '2026-12-02', '10:00', 'Pendiente', NULL;
GO
