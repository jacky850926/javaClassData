--1. �Q�ΤU�C��ƨӷs�� DEPARTMENT ��ƪ�C
CREATE TABLE department
(id INT NOT NULL,
name VARCHAR(24) NOT NULL
);
--2. �Q��DEPT��ƪ������,�N��Ʒs�W��DEPARTMENT ��ƪ�(�u�s�W�۹諸�����)�C
INSERT INTO department
SELECT deptno , dname
FROM dept;
--3. �Q�ΤU�C��ƨӷs�� EMPLOYEE��ƪ�C
CREATE TABLE EMPLOYEE
(id INT NOT NULL,
last_name VARCHAR(24) NOT NULL,
first_name VARCHAR(24),
dept_no INT
);
--4. �NEMPLOYEE��ƪ�last_name��쪺��ƫ��A��אּ varchar(40)�C
ALTER TABLE EMPLOYEE
ALTER COLUMN last_name  VARCHAR(40);
--5. �ϥ�EMP��ƪ����c����EMPNO, ENAME,and DEPTNO���w�q�ӷs��EMPLOYEE2��ƪ�ñN���
--�W�ٳ]�w�� ID, LAST_NAME, and DEPT_ID �C
SELECT empno , ename , deptno
INTO EMPLOYEE2
FROM emp;
EXEC sp_rename 'EMPLOYEE2.empno' , 'ID', 'column';
EXEC sp_rename 'EMPLOYEE2.ename' , 'LAST_NAME', 'column';
EXEC sp_rename 'EMPLOYEE2.deptno' , 'DEPT_ID', 'column';
--6. �R�����EMPLOYEE��ƪ�C
DROP TABLE EMPLOYEE;
--7. �NEMPLOYEE2��ƪ��W��EMPLOYEE�C
EXEC sp_rename 'EMPLOYEE2' , 'EMPLOYEE';
--8. �NEMPLOYEE��ƪ���LAST_NAME���R���C
ALTER TABLE EMPLOYEE
DROP COLUMN LAST_NAME;
--9. �ק�EMPLOYEE��ƪ�,�s�W�@����� SALARY ��ƫ��A�� INT�C
ALTER TABLE EMPLOYEE
ADD SALARY INT;
--10. �ק�EMPLOYEE��ƪ�,�ϥ�ID ���s�W�@��Primary key���������(constraint),�ì��L�R�W�C
ALTER TABLE EMPLOYEE
ADD CONSTRAINT id_pk PRIMARY KEY (id);
--11. �bEMPLOYEE��ƪ�s�W�@�ӥ~����(foreign key)�H�T�O���u���|�Q������@�Ӥ��s�b�������C
ALTER TABLE EMPLOYEE
ADD CONSTRAINT id_deptno_fk
	FOREIGN KEY (id) REFERENCES EMPLOYEE(ID);
