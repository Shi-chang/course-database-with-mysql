CREATE DATABASE test15_pro_func;
USE test15_pro_func;

CREATE TABLE ADMIN(
id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(15) NOT NULL,
pwd VARCHAR(25) NOT NULL
);

DELIMITER //
CREATE PROCEDURE insert_user(IN username VARCHAR(20),IN loginPwd VARCHAR(20))
	BEGIN
		INSERT INTO ADMIN(user_name,pwd)
		VALUES(username,loginpwd);
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE get_phone(IN id INT,OUT NAME VARCHAR(20),OUT phone VARCHAR(20))
	BEGIN
		SELECT b.name ,b.phone INTO NAME,phone
		FROM beauty b
		WHERE b.id = id;
END //
DELIMITER ;

CALL get_phone(1,@name,@phone);
SELECT @name,@phone;

DELIMITER //
CREATE PROCEDURE date_diff(IN birth1 DATETIME,IN birth2 DATETIME,OUT result INT)
	BEGIN
		SELECT DATEDIFF(birth1,birth2) INTO result;
	END //
DELIMITER ;

SET @birth1 = '2000-09-08';
SET @birth2 = '2001-01-03';
CALL date_diff(@birth1,@birth2,@result);
SELECT @result;