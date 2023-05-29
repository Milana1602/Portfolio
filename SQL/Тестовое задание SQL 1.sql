CREATE TABLE user (id int primary key auto_increment, user_name VARCHAR(30), level_id INT, skill INT);
DESC user;
INSERT  INTO user VALUES(1, "Anton", 1, 900000);
INSERT  INTO user VALUES(2, "Denis", 3, 4000);
INSERT  INTO user VALUES(3, "Petr", 2, 50000);
INSERT  INTO user VALUES(4, "Andrey", 4, 20);
INSERT  INTO user VALUES(5, "Olga", 1, 600000);
INSERT  INTO user VALUES(6, "Anna", 1, 1600000);
CREATE TABLE level(id INT primary KEY, level_name VARCHAR(30));
INSERT  INTO level VALUES(1, "admin");
INSERT  INTO level VALUES(2, "power_user");
INSERT  INTO level VALUES(3, "user");
INSERT  INTO level VALUES(4, "guest");
/*1. Отобрать из таблицы user всех пользователей, у которых level_id=1, skill > 799000 и в имени встречается буква а*/
SELECT id, user_name FROM user
WHERE level_id = 1 AND
skill > 799000 AND
user_name LIKE "a%";
/*2. Удалить всех пользователей, у которых skill меньше 100000*/
DELETE  FROM user WHERE skill < 100000;
/*3. Вывести все данные из таблицы user в порядке убывания по полю skill*/
SELECT * FROM user 
ORDER BY skill DESC;
/*4. Добавить в таблицу user нового пользователя по имени Oleg, с уровнем 4 и skill =10*/
INSERT INTO user VALUES(7,"Oleg", 4, 10);
/*5. Обновить данные в таблице user -  для пользователей с level_id меньше 2 проставить skill 2000000*/
UPDATE user SET skill = 2000000 WHERE level_id < 2;
/*6. Выбрать user_name всех пользователей уровня admin используя подзапрос*/
SELECT user_name
FROM user
where level_id in (
SELECT id
FROM level
WHERE level_name = "admin");
/*7. Выбрать user_name всех пользователей уровня admin используя join*/
SELECT user.user_name
FROM user
JOIN level
ON user.level_id = level.id
WHERE level_id = 1;









