--Найти 5 студентов с наибольшим средним баллом по всем предметам
SELECT s.fullname, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g 
LEFT JOIN students s ON s.id = g.discipline_id
GROUP BY s.fullname 
ORDER  BY average_grade DESC
LIMIT 5;

--Найти студента с наивысшим средним баллом по определенному предмету
SELECT d.name, s.fullname, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g 
JOIN students s ON s.id = g.discipline_id
JOIN disciplines d ON d.id = g.discipline_id
WHERE d.id = 8
GROUP BY s.fullname 
ORDER  BY average_grade DESC
LIMIT 1;

--Найти средний балл в группах по определенному предмету
SELECT d.name, gr.name, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g 
JOIN students s ON s.id = g.discipline_id
JOIN disciplines d ON d.id = g.discipline_id
JOIN [groups] gr ON gr.id = s.group_id 
WHERE d.id = 2
GROUP BY gr.name
ORDER  BY average_grade DESC;

--Найти средний балл на потоке (по всей таблице оценок
SELECT ROUND(AVG(g.grade),2) AS average_grade
FROM grades g;

--Найти какие курсы читает определенный преподаватель
SELECT d.name, t.fullname 
FROM disciplines d 
JOIN teachers t ON d.teacher_id = t.id 
WHERE d.id = 8;

--Найти список студентов в определенной группе
SELECT s.fullname, gr.name
FROM students s 
JOIN [groups] gr ON gr.id = s.group_id 
WHERE gr.id = 1;

--Найти оценки студентов в отдельной группе по определенному предмету
SELECT s.fullname, g.grade
FROM grades g 
JOIN students s ON s.id = g.student_id 
JOIN disciplines d ON d.id = g.discipline_id 
WHERE s.group_id = 3 AND g.grade = 12
ORDER BY d.name;

--Найти средний балл, который ставит определенный преподаватель по своим предметам
SELECT d.name, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g 
JOIN disciplines d ON d.id = g.discipline_id
WHERE g.discipline_id IN (SELECT id FROM disciplines WHERE teacher_id = 2)
GROUP BY g.discipline_id, d.name 
ORDER BY d.name;

--Найти список курсов, которые посещает определенный студент
SELECT s.fullname, d.name
FROM grades g 
JOIN students s ON s.id = g.student_id  
JOIN disciplines d ON d.id = g.discipline_id  
WHERE  g.discipline_id = 30
GROUP BY s.fullname, d.name;

--Список курсов, которые определенному студенту читает определенный преподаватель
SELECT d.name
FROM grades g 
JOIN disciplines d ON d.id = g.discipline_id  
WHERE  g.discipline_id  IN (SELECT id FROM disciplines  WHERE teacher_id = 2) AND g.student_id = 17
GROUP BY d.name;
