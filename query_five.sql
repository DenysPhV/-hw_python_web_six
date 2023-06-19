--Найти какие курсы читает определенный преподаватель
SELECT d.name, t.fullname 
FROM disciplines d 
JOIN teachers t ON d.teacher_id = t.id 
WHERE d.id = 5;