CREATE TABLE emps
AS
SELECT employee_id,last_name,salary
FROM atguigudb.`employees`;

CREATE TABLE emps_back
AS
SELECT * FROM emps
WHERE 1=2;

SELECT * FROM emps_back;

DELIMITER //
CREATE TRIGGER emps_insert_trigger
AFTER INSERT ON emps
FOR EACH ROW
	BEGIN
		INSERT INTO emps_back(employee_id,last_name,salary)
		VALUES(NEW.employee_id,NEW.last_name,NEW.salary);
	END //
DELIMITER ;

INSERT INTO emps
VALUES(300,'Tom',5600);
SELECT * FROM emps_back;
