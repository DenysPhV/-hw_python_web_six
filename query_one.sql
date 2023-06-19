--Найти 5 студентов с наибольшим средним баллом по всем предметам
SELECT s.fullname, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g 
LEFT JOIN students s ON s.id = g.discipline_id
GROUP BY s.fullname 
ORDER  BY average_grade DESC
LIMIT 5;