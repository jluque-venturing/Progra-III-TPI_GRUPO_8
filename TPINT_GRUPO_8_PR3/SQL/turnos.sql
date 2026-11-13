USE clinica

CREATE TABLE turnos 
(
IdTurno CHAR(8) NOT NULL,
Legajo CHAR(8) NOT NULL,
IdPaciente CHAR(8) NOT NULL, 
Fecha DATE NOT NULL, 
Hora TIME(0) NOT NULL,
Estado VARCHAR(500) NULL,
Activo BIT NOT NULL DEFAULT 1,

CONSTRAINT PK_Turnos PRIMARY KEY (IdTurno),

CONSTRAINT FK_Turnos_Medicos FOREIGN KEY (Legajo)
	REFERENCES Medicos (Legajo),

CONSTRAINT FK_Turnos_Pacientes FOREIGN KEY (IdPaciente)
	REFERENCES Pacientes (IdPaciente),

CONSTRAINT UQ_Turnos_Medico_Fecha_Hora UNIQUE (Legajo, Fecha, Hora),

CONSTRAINT CK_Turnos_Estado CHECK (ESTADO IN ('Pendiente', 'Presente', 'Ausente'))

);