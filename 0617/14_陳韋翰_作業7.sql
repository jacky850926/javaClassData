--1.將資料新增至MY_EMP資料表中，不要列舉欄位
INSERT INTO my_emp
VALUES(1 ,'Patel', ' Ralph' , 'rpatel' , 795  );
--2.
INSERT INTO MY_emp (id , LAST_NAME , FIRST_NAME , USERID, SALARY)
VALUES(2 ,'Dancs' , 'Betty', 'bdancs' , 860);
--3.
INSERT INTO my_emp
VALUES(3 ,'Biri' , 'Ben' , 'bbiri' , 1100),
	  (4 , 'Newman' , 'Chad' , 'cnewman' , 750);
--4.
UPDATE my_emp
SET last_name = 'Drexler'
WHERE id = 3;
--5.
UPDATE my_emp
SET SALARY = 1000
WHERE SALARY < 900;
--6.
DELETE FROM my_emp
WHERE last_name = 'Dancs' AND first_name = 'Betty';
--7.
BEGIN TRANSACTION;
	UPDATE my_emp
	SET SALARY = SALARY * 1.1
SAVE TRANSACTION T1;
	DELETE FROM my_emp;
	SELECT * FROM my_emp;
ROLLBACK TRAN T1;	
COMMIT ;