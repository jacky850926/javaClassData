--1. 利用下列資料來新建 DEPARTMENT 資料表。
CREATE TABLE department
(id INT NOT NULL,
name VARCHAR(24) NOT NULL
);
--2. 利用DEPT資料表中的資料,將資料新增至DEPARTMENT 資料表中(只新增相對的資料欄)。
INSERT INTO department
SELECT deptno , dname
FROM dept;
--3. 利用下列資料來新建 EMPLOYEE資料表。
CREATE TABLE EMPLOYEE
(id INT NOT NULL,
last_name VARCHAR(24) NOT NULL,
first_name VARCHAR(24),
dept_no INT
);
--4. 將EMPLOYEE資料表中last_name欄位的資料型態更改為 varchar(40)。
ALTER TABLE EMPLOYEE
ALTER COLUMN last_name  VARCHAR(40);
--5. 使用EMP資料表的結構中之EMPNO, ENAME,and DEPTNO之定義來新建EMPLOYEE2資料表並將欄位
--名稱設定為 ID, LAST_NAME, and DEPT_ID 。
SELECT empno , ename , deptno
INTO EMPLOYEE2
FROM emp;
EXEC sp_rename 'EMPLOYEE2.empno' , 'ID', 'column';
EXEC sp_rename 'EMPLOYEE2.ename' , 'LAST_NAME', 'column';
EXEC sp_rename 'EMPLOYEE2.deptno' , 'DEPT_ID', 'column';
--6. 刪除整個EMPLOYEE資料表。
DROP TABLE EMPLOYEE;
--7. 將EMPLOYEE2資料表改名為EMPLOYEE。
EXEC sp_rename 'EMPLOYEE2' , 'EMPLOYEE';
--8. 將EMPLOYEE資料表中的LAST_NAME欄位刪除。
ALTER TABLE EMPLOYEE
DROP COLUMN LAST_NAME;
--9. 修改EMPLOYEE資料表,新增一個欄位 SALARY 資料型態為 INT。
ALTER TABLE EMPLOYEE
ADD SALARY INT;
--10. 修改EMPLOYEE資料表,使用ID 欄位新增一個Primary key的限制條件(constraint),並為他命名。
ALTER TABLE EMPLOYEE
ADD CONSTRAINT id_pk PRIMARY KEY (id);
--11. 在EMPLOYEE資料表新增一個外部鍵(foreign key)以確保員工不會被分派到一個不存在的部門。
ALTER TABLE EMPLOYEE
ADD CONSTRAINT id_deptno_fk
	FOREIGN KEY (id) REFERENCES EMPLOYEE(ID);
