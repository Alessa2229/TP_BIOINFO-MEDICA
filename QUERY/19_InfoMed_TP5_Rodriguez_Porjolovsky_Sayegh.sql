SELECT
m.nombre AS nombre_medico,
COUNT(DISTINCT c.id_paciente) AS total_pacientes
FROM Consultas c
JOIN Medicos m
ON c.id_medico = m.id_medico
GROUP BY m.id_medico, m.nombre
ORDER BY total_pacientes DESC; 
