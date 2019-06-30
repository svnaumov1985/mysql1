DROP FUNCTION IF EXISTS hello;
DELIMITER $$
CREATE FUNCTION hello(_time datetime)
  RETURNS TEXT
BEGIN
	
	SET @Res = "";
	SET @_hour = Hour(_time);
	
	IF (@_hour < 6 AND @_hour >= 0) THEN SET @Res = "Доброй ночи";
	ELSEIF (@_hour >= 6 AND @_hour < 12) THEN SET @Res = "Доброе утро";
	ELSEIF (@_hour >= 12 AND @_hour < 18) THEN SET @Res = "Добрый день";
	ELSEIF (@_hour >= 18) THEN SET @Res = "Доброе вечер";
	END IF;


	RETURN @Res;
	
END;
$$
DELIMITER ;

select hello('2019-01-01 03:00:00')
union
select hello('2019-01-01 06:00:00')
union
select hello('2019-01-01 12:00:00')
union
select hello('2019-01-01 15:00:00')
union
select hello('2019-01-01 19:00:00')
