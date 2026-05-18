SELECT m.nombre, COUNT(*) AS cantidad_recetas
FROM Recetas r
JOIN Medicos m ON r.id_medico = m.id_medico
GROUP BY m.id_medico, m.nombre
ORDER BY cantidad_recetas DESC; 
