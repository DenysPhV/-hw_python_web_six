--Найти средний балл, который ставит определенный преподаватель по своим предметам
SELECT d.name, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g 
JOIN disciplines d ON d.id = g.discipline_id
WHERE g.discipline_id IN (SELECT id FROM disciplines WHERE teacher_id = 2)
GROUP BY g.discipline_id, d.name 
ORDER BY d.name;