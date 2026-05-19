SELECT *
FROM Consultas
WHERE id_medico = 3
AND strftime('%Y-%m', fecha) = '2024-08';
