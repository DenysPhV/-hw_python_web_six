--Список курсов, которые определенному студенту читает определенный преподаватель
SELECT d.name
FROM grades g 
LEFT JOIN disciplines d ON d.id = g.discipline_id 
WHERE g.discipline_id IN (SELECT id FROM disciplines WHERE teacher_id = 1) AND g.student_id = 17
GROUP BY d.name;