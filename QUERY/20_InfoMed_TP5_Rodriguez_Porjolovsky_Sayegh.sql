SELECT
m.nombre AS nombre_medico,
COUNT(*) AS total_consultas_menores
FROM Consultas c
JOIN Medicos m
ON c.id_medico = m.id_medico
JOIN Pacientes p
ON c.id_paciente = p.id_paciente
WHERE
(strftime('%Y', 'now') - strftime('%Y', p.fecha_nacimiento)
- CASE
WHEN strftime('%m-%d', 'now') < strftime('%m-%d', p.fecha_nacimiento)
THEN 1
ELSE 0
END) < 18
GROUP BY m.id_medico, m.nombre
ORDER BY total_consultas_menores DESC; 
