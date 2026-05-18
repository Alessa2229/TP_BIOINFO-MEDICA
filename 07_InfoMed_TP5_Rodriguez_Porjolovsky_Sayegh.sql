UPDATE Pacientes SET ciudad = 'Buenos Aires' WHERE LOWER(TRIM(ciudad)) LIKE '%buenos%aire%';
UPDATE Pacientes SET ciudad = 'Buenos Aires' WHERE ciudad = 'Buenos Aiers';
UPDATE Pacientes SET ciudad = 'Córdoba' WHERE LOWER(TRIM(ciudad)) LIKE '%c_rdoba%' OR LOWER(TRIM(ciudad)) LIKE '%cordoba%';
UPDATE Pacientes SET ciudad = 'Córdoba' WHERE ciudad = 'Córodba';
UPDATE Pacientes SET ciudad = 'Mendoza' WHERE LOWER(TRIM(ciudad)) LIKE '%mendoza%' OR LOWER(TRIM(ciudad)) LIKE '%mendzoa%';
UPDATE Pacientes SET ciudad = 'Rosario' WHERE LOWER(TRIM(ciudad)) = 'rosario';

