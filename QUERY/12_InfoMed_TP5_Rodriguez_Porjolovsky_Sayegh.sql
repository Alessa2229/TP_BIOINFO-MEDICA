SELECT p.nombre, c.fecha, c.diagnostico
FROM Consultas c
JOIN Pacientes p ON c.id_paciente = p.id_paciente
WHERE strftime('%Y-%m', c.fecha) = '2024-08';
