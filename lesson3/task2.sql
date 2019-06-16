/*Таблица users была неудачно спроектирована. 
Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения */

alter table users add column _created_at DATETIME ;
alter table users add column _updated_at DATETIME ;

	/*select
	date(created_at),
	time(created_at)

	from users

*/

update users
	set _created_at = created_at,
		 _updated_at = updated_at
	
	/*, _updated_at = str_to_date(updated_at, '%Y-%m-%d %H:') 
	*/	
;
	
alter table users drop COLUMN created_at,
						drop COLUMN updated_at ;


alter table users CHANGE _created_at  created_at DATETIME,
						CHANGE _updated_at  updated_at DATETIME;

