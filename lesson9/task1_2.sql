/*Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products 
в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.
(по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
*/

drop table if exists Logs;

create table Logs(
	id BIGINT UNSIGNED,
	name VARCHAR(255),
	updated DATETIME default CURRENT_TIMESTAMP(),
	tablename VARCHAR(255))
	ENGINE=ARCHIVE;
	
DROP TRIGGER IF EXISTS product_logs;

DELIMITER $$
CREATE TRIGGER product_logs AFTER INSERT ON products
FOR EACH ROW 
BEGIN

	INSERT INTO Logs (id, name, tablename) VALUES (NEW.id, NEW.name, "products");
	
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS user_logs;

DELIMITER $$
CREATE TRIGGER user_logs AFTER INSERT ON users
FOR EACH ROW 
BEGIN

	INSERT INTO Logs (id, name, tablename) VALUES (NEW.id, NEW.name, "user");
	
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS catalogs_logs;

DELIMITER $$
CREATE TRIGGER catalogs_logs AFTER INSERT ON catalogs
FOR EACH ROW 
BEGIN

	INSERT INTO Logs (id, name, tablename) VALUES (NEW.id, NEW.name, "catalogs");
	
END$$
DELIMITER ;

INSERT INTO products (NAME, description) VALUES ("Тест1", "Тест2");
INSERT INTO products (NAME, description) VALUES (NULL, "Тест2");

INSERT INTO users (NAME) VALUES ("Даздраперма");

INSERT INTO catalogs (NAME) VALUES (CONCAT(RAND(), "Что то новое"));

SELECT * FROM Logs;
(SELECT name FROM users ORDER BY RAND() LIMIT 1);

drop procedure if exists test;

delimiter $$
CREATE PROCEDURE test()
begin

	SET @i = 1;
	
/* !!!!! ПРИ ЗАПУСКЕ НА 1 000 000 ВИСНЕТ НАГЛУХО. ПРИМЕРНО НА ВТОРОЙ ТЫСЯЧЕ */	
	
	WHILE (@i <= 1000) DO
		
		SET @NAME = (SELECT name FROM users WHERE 1 ORDER BY RAND() LIMIT 1);
		
		insert into users(name) values (@name);
		
		SET @i = @i + 1;
		
	END WHILE;
	
end$$
;
delimiter ;

call test();