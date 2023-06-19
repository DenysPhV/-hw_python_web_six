--Найти средний балл на потоке (по всей таблице оценок
SELECT ROUND(AVG(g.grade),2) AS average_grade
FROM grades g;