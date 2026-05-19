SELECT
med.nombre AS nombre_medicamento,
COUNT(*) AS total_recetas,
m.nombre AS nombre_medico,
p.nombre AS nombre_paciente
FROM Recetas r
JOIN Medicamentos med
ON r.id_medicamento = med.id_medicamento
JOIN Medicos m
ON r.id_medico = m.id_medico
JOIN Pacientes p
ON r.id_paciente = p.id_paciente
GROUP BY
med.id_medicamento, med.nombre,
m.id_medico, m.nombre,
p.id_paciente, p.nombre
ORDER BY total_recetas DESC; 
