/*
Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DELIMITER //

DROP FUNCTION IF EXISTS sec_to_date_trnsfr//
CREATE FUNCTION sec_to_date_trnsfr (sec INT)
	RETURNS TEXT DETERMINISTIC
	BEGIN 
		DECLARE day INT DEFAULT sec DIV 86400;
        DECLARE out_day INT DEFAULT sec - day * 86400;
        DECLARE hour INT DEFAULT out_day DIV 3600;
        DECLARE out_hour INT DEFAULT out_day - hour * 3600;
        DECLARE min INT DEFAULT out_hour DIV 60;
        DECLARE scnds INT DEFAULT out_hour - min * 60;
        RETURN CONCAT(day, ' days ', hour, ' hours ', min, ' minutes ', scnds, ' seconds');
    END//
 
 CALL sec_to_date_trnsfr (123456)//
 
 /*
 Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
 */
 
 DROP PROCEDURE IF EXISTS even//
 CREATE PROCEDURE even(income INT)
  BEGIN
    DECLARE i INT DEFAULT 2;
    SET @result = '';
    IF (income > 1) THEN
      WHILE i <= (income - 2) DO
       SET @result = CONCAT(@result, i, ', ');
       SET i := i + 2;
      END WHILE; 
      SET @result = CONCAT(@result, i);
      SELECT @result;
    ELSE
      SELECT 'Значение параметра должно быть больше 1.';
    END IF;
  END//
  
  CALL even (10)// 
 
 
 
