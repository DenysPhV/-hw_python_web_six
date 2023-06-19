--Найти оценки студентов в отдельной группе по определенному предмету
SELECT s.fullname, g.grade
FROM grades g 
JOIN students s ON s.id = g.student_id 
JOIN disciplines d ON d.id = g.discipline_id 
WHERE s.group_id = 2 AND g.grade = 7
ORDER BY d.name;