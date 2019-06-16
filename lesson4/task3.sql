/* (по желанию) Подсчитайте произведение чисел в столбце таблицы */

drop table if exists number;

create table number(
	num int
);

insert into number values
(1),
(2),
(3),
(4),
(5);

/* 1*2*3*4*5 = (3*4*5) + (3*4*5) = 4*5 + 4*5 + 4*5 + 4*5 ... 6(раз) */

select group_concat(number.num separator "*") as val from number into @a;

select concat('select ', @a) into @b;

PREPARE stmt1 FROM @b;
EXECUTE stmt1;