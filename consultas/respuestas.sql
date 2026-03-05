-- 1. Encontrar el reporte del crimen
SELECT *
FROM crime_scene_report
WHERE date = 20180115
AND type = 'murder'
AND city = 'SQL City';

-- 2. Encontrar el testigo que vive en la última casa de Northwestern Dr
SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;

-- 3. Encontrar a Annabel en Franklin Ave
SELECT *
FROM person
WHERE name LIKE '%Annabel%'
AND address_street_name = 'Franklin Ave';

-- 4. Leer las entrevistas de los testigos
SELECT *
FROM interview
WHERE person_id IN (14887, 16371);

-- 5. Buscar miembros del gimnasio con membresía Gold cuyo ID empieza por 48Z
SELECT *
FROM get_fit_now_member
WHERE membership_status = 'gold'
AND id LIKE '48Z%';

-- 6. Verificar quién estuvo en el gimnasio el 9 de enero
SELECT *
FROM get_fit_now_check_in
WHERE check_in_date = 20180109
AND membership_id IN ('48Z7A','48Z55');

-- 7. Cruzar personas con sus licencias
SELECT p.id, p.name, dl.plate_number
FROM person p
JOIN drivers_license dl
ON p.license_id = dl.id
WHERE p.id IN (28819, 67318);

-- 8. Entrevista del asesino
SELECT *
FROM interview
WHERE person_id = 67318;

-- 9. Buscar sospechosa final
SELECT *
FROM drivers_license
WHERE gender = 'female'
AND hair_color = 'red'
AND height BETWEEN 65 AND 67
AND car_make = 'Tesla'
AND car_model = 'Model S';

-- 10. Revisar asistentes al concierto
SELECT person_id, COUNT(*)
FROM facebook_event_checkin
WHERE event_name = 'SQL Symphony Concert'
AND date LIKE '201712%'
GROUP BY person_id
HAVING COUNT(*) >= 3;

-- 11. Obtener el nombre final
SELECT *
FROM person
WHERE id = 99716;
