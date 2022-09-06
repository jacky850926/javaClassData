--1. 使用EMP資料表中的員工編號(empno),姓名(ename)及部門編號(deptno)來建立一個EMP_VU view,並將
--姓名(ename)欄位改以EMPLOYEE。
CREATE VIEW EMP_VU (empno , employee , deptno)
AS
	SELECT empno , ename , deptno
	FROM emp;
--2. 顯示EMP_VU view中的資料內容.
SELECT *
FROM EMP_VU;
--3. 使用EMP_VU view來顯示所有員工之姓名及部門編號
SELECT employee , deptno
FROM EMP_VU;
--4. 新建一個名為 DEPT20的view, 包含在部門20的所有員工之員工編號,員工姓名,及部門編號。將View
--中的資料項目命名為 EMPLOYEE_ID, EMPLOYEE, and DEPARTMENT_ID. 並設定不允許使用者透過
--DEPT20 來更改員工所屬的部門編號。
CREATE VIEW DEPT20 ( employee_ID , employee , department_ID )
AS
	SELECT empno , ename , deptno 
	FROM emp
	WHERE deptno = 20
	WITH CHECK OPTION;
--5. 顯示DEPT20 view的欄位定義資料(結構)及其所有資料內容.

--6. 試試看利用DEPT20 view將 Smith 轉調到部門30.
UPDATE DEPT20
SET department_ID = 30
WHERE employee = 'Smith';
--7. 新建一個名為 SALARY_VU的view,包含所有員工之姓名,部門名稱,薪資和薪資等級。將View中的資
--料項目分別命名為 Employee, Department, Salary, Grade。
CREATE VIEW salary_vu (Employee , Department , Salary , Grade )
AS 
	SELECT e.ename , e.deptno , e.sal , s.grade
	FROM emp e JOIN salgrade s ON e.sal BETWEEN s.losal and s.hisal;
--8. 在EMP資料表中利用deptno欄位建立一個non-unique index 命名為emp_deptno_idx。
CREATE INDEX emp_deptno_idx ON emp(deptno);
--9. 新建一個sequence “DEPT_ID_SEQ”給DEPT資料表新增資料時產生部門編號使用,由60號開始,每次增
--加10號,產生的最大號碼設為200號。
CREATE SEQUENCE DEPT_ID_SEQ
AS int
START WITH 60
INCREMENT BY 10
MAXVALUE 200;
--10.使用上題所建的sequence來產生部門編號,新增兩個部門資料(Education and Administration) 到dept資
--料表。
INSERT INTO dept
VALUES (NEXT VALUE FOR DEPT_ID_SEQ , 'Education' ,'Taipei');

INSERT INTO dept
VALUES (NEXT VALUE FOR DEPT_ID_SEQ , 'Administration' , 'New Taipei');
select *
from DEPT
drop sequence dept_id_seq
delete from dept
where deptno = 110;
drop view salary_vu