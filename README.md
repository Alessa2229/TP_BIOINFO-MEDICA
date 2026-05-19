# TP_BIOINFO-MEDICA
### INTEGRANTES
- Milagro Alessandra Rodriguez Camarena
- Thiago Sayegh
- Martin Leonardo Porjolovsky
<br>
<img src="./imagenes_itba/descarga.png" width="250"/>

#### Nombre de la materia: Informática Médica
#### Nombre de profesor: Berrino Eugenia y Piacentino Melina

## Parte 2: Base de datos
### Query 1:
[01_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./01_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)

```sql
CREATE INDEX idx_pacientes_ciudad ON Pacientes(ciudad)
```

### Query 2:
[02_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./02_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)

```sql
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
```
<br>
<img src="./imagenes_itba/query2.png" width="250"/>

### Query 3:
[03_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./03_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)

```sql
SELECT nombre, edad
FROM VistasPacientes
WHERE edad < 18;

```
<br>
<img src="./imagenes_itba/query3.png" width="250"/>
### Query 4:

[04_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./04_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)


```sql
UPDATE Pacientes
SET calle = 'Calle Corrientes',
    numero = '500',
    ciudad = 'Buenos Aires'
WHERE nombre = 'Luciana Gómez';

```
<br>
<img src="./imagenes_itba/query4.png" width="250"/>
### Query 5:

[05_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./05_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)

```sql
SELECT nombre, matricula
FROM Medicos
WHERE especialidad_id = 4;

```
<br>
<img src="./imagenes_itba/query5.png" width="250"/>
### Query 6:

[06_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./06_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)

```sql
SELECT nombre, calle, numero, ciudad
FROM Pacientes
WHERE ciudad = 'Buenos Aires';

```
<br>
<img src="./imagenes_itba/query6.png" width="250"/>

### Query 7:
[07_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./07_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)

```sql
UPDATE Pacientes SET ciudad = 'Buenos Aires' WHERE LOWER(TRIM(ciudad)) LIKE '%buenos%aire%';
UPDATE Pacientes SET ciudad = 'Buenos Aires' WHERE ciudad = 'Buenos Aiers';
UPDATE Pacientes SET ciudad = 'Córdoba' WHERE LOWER(TRIM(ciudad)) LIKE '%c_rdoba%' OR LOWER(TRIM(ciudad)) LIKE '%cordoba%';
UPDATE Pacientes SET ciudad = 'Córdoba' WHERE ciudad = 'Córodba';
UPDATE Pacientes SET ciudad = 'Mendoza' WHERE LOWER(TRIM(ciudad)) LIKE '%mendoza%' OR LOWER(TRIM(ciudad)) LIKE '%mendzoa%';
UPDATE Pacientes SET ciudad = 'Rosario' WHERE LOWER(TRIM(ciudad)) = 'rosario';


```

### Query 8:
[08_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./08_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)
```sql
SELECT ciudad, COUNT(*) AS cantidad_pacientes
FROM Pacientes
GROUP BY ciudad
ORDER BY cantidad_pacientes DESC;

```
<br>
<img src="./imagenes_itba/query8.png" width="250"/>

### Query 9:
[09_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./09_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)
```sql

SELECT p.ciudad, s.descripcion AS sexo, COUNT(*) AS cantidad_pacientes
FROM Pacientes p
JOIN SexoBiologico s ON p.id_sexo = s.id_sexo
GROUP BY p.ciudad, s.descripcion
ORDER BY p.ciudad, s.descripcion;

```
<br>
<img src="./imagenes_itba/query9.png" width="250"

### Query 10:
[010_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./010_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)
```sql
SELECT m.nombre, COUNT(*) AS cantidad_recetas
FROM Recetas r
JOIN Medicos m ON r.id_medico = m.id_medico
GROUP BY m.id_medico, m.nombre
ORDER BY cantidad_recetas DESC; 

```
<br>
<img src="./imagenes_itba/query10.png" width="250"/>



### Query 11:
[11_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./QUERY/11_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)
```sql
SELECT *
FROM Consultas
WHERE id_medico = 3
AND strftime('%Y-%m', fecha) = '2024-08';
```
<br>
<img src="./imagenes_itba/query11.png" width="250"/>

### Query 12:
[12_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./QUERY/12_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)
```sql
SELECT p.nombre, c.fecha, c.diagnostico
FROM Consultas c
JOIN Pacientes p ON c.id_paciente = p.id_paciente
WHERE strftime('%Y-%m', c.fecha) = '2024-08';

```
<br>
<img src="./imagenes_itba/query12.png" width="250"/>

### Query 13:
[13_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./QUERY/13_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)
```sql
SELECT m.nombre, COUNT(*) AS veces_recetado
FROM Recetas r
JOIN Medicamentos m ON r.id_medicamento = m.id_medicamento
WHERE r.id_medico = 2
GROUP BY r.id_medicamento, m.nombre
HAVING COUNT(*) > 1;


```
<br>
<img src="./imagenes_itba/query13.png" width="250"/>

### Query 14:
[14_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./QUERY/14_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)
```sql
SELECT p.nombre, COUNT(*) AS total_recetas
FROM Recetas r
JOIN Pacientes p ON r.id_paciente = p.id_paciente
GROUP BY r.id_paciente, p.nombre
ORDER BY total_recetas DESC;


```
<br>
<img src="./imagenes_itba/query14.png" width="250"/>

### Query 15:
[15_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./QUERY/15_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)
```sql
SELECT m.nombre, COUNT(*) AS total_recetas
FROM Recetas r
JOIN Medicamentos m ON r.id_medicamento = m.id_medicamento
GROUP BY r.id_medicamento, m.nombre
ORDER BY total_recetas DESC
LIMIT 1;


```
<br>
<img src="./imagenes_itba/query15.png" width="250"/>

### Query 16:
[16_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./QUERY/16_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)
```sql
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



```
<br>
<img src="./imagenes_itba/query16.png" width="250"/>

### Query 17:
[17_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./QUERY/17_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)
```sql
SELECT 
    m.nombre AS nombre_medico,
    p.nombre AS nombre_paciente,
    COUNT(*) AS total_consultas
FROM Consultas c
JOIN Medicos m 
    ON c.id_medico = m.id_medico
JOIN Pacientes p 
    ON c.id_paciente = p.id_paciente
GROUP BY 
    m.id_medico, m.nombre,
    p.id_paciente, p.nombre
ORDER BY 
    m.nombre, p.nombre;

```
<br>
<img src="./imagenes_itba/query17.png" width="250"/>

### Query 18:
[18_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./QUERY/18_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)
```sql
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

```
<br>
<img src="./imagenes_itba/query18.png" width="250"/>

### Query 19:
[19InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./QUERY/19_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)
```sql
SELECT
m.nombre AS nombre_medico,
COUNT(DISTINCT c.id_paciente) AS total_pacientes
FROM Consultas c
JOIN Medicos m
ON c.id_medico = m.id_medico
GROUP BY m.id_medico, m.nombre
ORDER BY total_pacientes DESC; 

```
<br>
<img src="./imagenes_itba/query19.png" width="250"/>

### Query 20:
[20_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql](./QUERY/20_InfoMed_TP5_Rodriguez_Porjolovsky_Sayegh.sql)
```sql
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

```
<br>
<img src="./imagenes_itba/query20.png" width="250"/>


