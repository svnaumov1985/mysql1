/* Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/

SELECT 
	count(*),
	weekday(date_ADD(date_sub(birthday_at, INTERVAL YEAR(birthday_at) YEAR), INTERVAL YEAR(curdate()) YEAR)) + 1 as weekday
	
	FROM users
	
	group by weekday