CREATE PROCEDURE spCargarAsistencia
@IdTurno char(8),
@Estado VARCHAR(500),
@Observacion VARCHAR(500) = NULL

AS 
BEGIN 
UPDATE Turnos
SET
Estado = @Estado,
Observacion = @Observacion

WHERE IdTurno = @IdTurno

END 
GO