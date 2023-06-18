SELECT id, name, email FROM contacts;

SELECT * FROM contacts;

SELECT name, email FROM contacts ORDER BY name DESC;

SELECT id, name, email
FROM contacts
WHERE favorite IS NOT TRUE 
ORDER BY name DESC;

SELECT id, name, email
FROM users 
WHERE age IN (23, 32, 40)
ORDER BY name DESC;

SELECT id, name, email
FROM contacts
WHERE name LIKE '%n' 
ORDER BY name DESC;

SELECT COUNT(user_id) 
FROM contacts;

SELECT min(age) as minAge
FROM users;

SELECT COUNT(user_id) as total_contacts, user_id
FROM contacts
GROUP BY user_id;

SELECT *
FROM contacts
WHERE user_id IN (SELECT id
    FROM users
    WHERE age < 60);

SELECT *
FROM contacts c
LEFT JOIN users u ON u.id = c.user_id 
WHERE u.age < 40;

UPDATE contacts SET user_id = 3 WHERE id = 5;

DELETE FROM contacts WHERE id = 4;

ALTER TABLE contacts ADD telegram VARCHAR(30);

ALTER TABLE contacts DROP COLUMN telegram;

CREATE INDEX contacts_email_ix ON contacts (email);