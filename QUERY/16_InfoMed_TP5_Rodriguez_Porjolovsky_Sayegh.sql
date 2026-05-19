SELECT
p.nombre AS nombre_paciente,
c.fecha AS fecha_ultima_consulta,
c.diagnostico
FROM Consultas c
JOIN Pacientes p
ON c.id_paciente = p.id_paciente
WHERE c.fecha = (
SELECT MAX(c2.fecha)
FROM Consultas c2
WHERE c2.id_paciente = c.id_paciente
)
ORDER BY p.nombre; 
