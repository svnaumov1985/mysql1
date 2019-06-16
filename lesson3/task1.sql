/*Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.*/

UPDATE users 
	set created_at = now()
	, updated_at = now()