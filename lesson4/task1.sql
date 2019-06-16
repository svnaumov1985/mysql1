/* Подсчитайте средний возраст пользователей в таблице users
 */


select avg(TIMESTAMPDIFF(month, birthday_at, now()) / 12) from users