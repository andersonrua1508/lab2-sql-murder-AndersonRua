# lab2-sql-murder-AndersonRua

## Datos

* **Detective**: Anderson Rua
* **Correo**: anderson.rua@udea.edu.co

## Resumen del Caso

Se investigó el asesinato ocurrido el 15 de enero de 2018 en SQL City utilizando consultas SQL sobre la base de datos del caso. A partir del reporte inicial del crimen se identificaron dos testigos, se revisaron sus entrevistas y se siguieron varias pistas hasta encontrar al asesino. Finalmente se descubrió también quién ordenó el crimen.

## Bitácora de Investigación

### Query 1

```sql
SELECT * 
FROM crime_scene_report 
WHERE date = 20180115 
AND city = 'SQL City' 
AND type = 'murder';
```

#### Conclusión

El reporte indica que hay dos testigos: uno vive en la última casa de Northwestern Dr y otro llamado Annabel vive en Franklin Ave.

### Query 2

```sql
SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;
```

#### Conclusión

Se identifica al testigo Morty Schapiro.

### Query 3

```sql
SELECT *
FROM person
WHERE name LIKE '%Annabel%'
AND address_street_name = 'Franklin Ave';
```

#### Conclusión

Se identifica a la testigo Annabel Miller.

### Query 4

```sql
SELECT *
FROM interview
WHERE person_id IN (14887,16371);
```

#### Conclusión

Las entrevistas revelan que el sospechoso es miembro del gimnasio Get Fit Now con membresía Gold y un ID que empieza por 48Z.

### Query 5

```sql
SELECT *
FROM get_fit_now_member
WHERE membership_status = 'gold'
AND id LIKE '48Z%';
```

#### Conclusión

Se encuentran dos posibles sospechosos.

### Query 6

```sql
SELECT *
FROM get_fit_now_check_in
WHERE check_in_date = 20180109
AND membership_id IN ('48Z7A','48Z55');
```

#### Conclusión

Ambos sospechosos estuvieron en el gimnasio el día indicado.

### Query 7

```sql
SELECT p.id, p.name, dl.plate_number
FROM person p
JOIN drivers_license dl
ON p.license_id = dl.id
WHERE p.id IN (28819,67318);
```

#### Conclusión

El sospechoso identificado es Jeremy Bowers.

### Query 8

```sql
SELECT *
FROM interview
WHERE person_id = 67318;
```

#### Conclusión

Jeremy Bowers confiesa que fue contratado por una mujer con cabello rojo, que mide entre 1.65 y 1.70 y conduce un Tesla Model S.

### Query 9

```sql
SELECT *
FROM drivers_license
WHERE gender = 'female'
AND hair_color = 'red'
AND height BETWEEN 65 AND 67
AND car_make = 'Tesla'
AND car_model = 'Model S';
```

#### Conclusión

Se identifican varias posibles sospechosas.

### Query 10

```sql
SELECT person_id, COUNT(*)
FROM facebook_event_checkin
WHERE event_name = 'SQL Symphony Concert'
AND date LIKE '201712%'
GROUP BY person_id
HAVING COUNT(*) >= 3;
```

#### Conclusión

Dos personas asistieron tres veces al concierto.

### Query 11

```sql
SELECT *
FROM person
WHERE id IN (24556,99716);
```

#### Conclusión

La mente maestra detrás del crimen es Miranda Priestly.