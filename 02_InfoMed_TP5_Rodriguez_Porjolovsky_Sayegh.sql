CREATE VIEW VistasPacientes AS
SELECT
    id_paciente,
    nombre,
    fecha_nacimiento,
    ciudad,
    (strftime('%Y', 'now') - strftime('%Y', fecha_nacimiento)
    - CASE
        WHEN strftime('%m-%d', 'now') < strftime('%m-%d', fecha_nacimiento)
        THEN 1
        ELSE 0
      END) AS edad
FROM Pacientes;
