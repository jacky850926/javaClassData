--1. �ϥ�EMP��ƪ������u�s��(empno),�m�W(ename)�γ����s��(deptno)�ӫإߤ@��EMP_VU view,�ñN
--�m�W(ename)����HEMPLOYEE�C
CREATE VIEW EMP_VU (empno , employee , deptno)
AS
	SELECT empno , ename , deptno
	FROM emp;
--2. ���EMP_VU view������Ƥ��e.
SELECT *
FROM EMP_VU;
--3. �ϥ�EMP_VU view����ܩҦ����u���m�W�γ����s��
SELECT employee , deptno
FROM EMP_VU;
--4. �s�ؤ@�ӦW�� DEPT20��view, �]�t�b����20���Ҧ����u�����u�s��,���u�m�W,�γ����s���C�NView
--������ƶ��ةR�W�� EMPLOYEE_ID, EMPLOYEE, and DEPARTMENT_ID. �ó]�w�����\�ϥΪ̳z�L
--DEPT20 �ӧ����u���ݪ������s���C
CREATE VIEW DEPT20 ( employee_ID , employee , department_ID )
AS
	SELECT empno , ename , deptno 
	FROM emp
	WHERE deptno = 20
	WITH CHECK OPTION;
--5. ���DEPT20 view�����w�q���(���c)�Ψ�Ҧ���Ƥ��e.

--6. �ոլݧQ��DEPT20 view�N Smith ��ը쳡��30.
UPDATE DEPT20
SET department_ID = 30
WHERE employee = 'Smith';
--7. �s�ؤ@�ӦW�� SALARY_VU��view,�]�t�Ҧ����u���m�W,�����W��,�~��M�~�굥�šC�NView������
--�ƶ��ؤ��O�R�W�� Employee, Department, Salary, Grade�C
CREATE VIEW salary_vu (Employee , Department , Salary , Grade )
AS 
	SELECT e.ename , e.deptno , e.sal , s.grade
	FROM emp e JOIN salgrade s ON e.sal BETWEEN s.losal and s.hisal;
--8. �bEMP��ƪ��Q��deptno���إߤ@��non-unique index �R�W��emp_deptno_idx�C
CREATE INDEX emp_deptno_idx ON emp(deptno);
--9. �s�ؤ@��sequence ��DEPT_ID_SEQ����DEPT��ƪ�s�W��Ʈɲ��ͳ����s���ϥ�,��60���}�l,�C���W
--�[10��,���ͪ��̤j���X�]��200���C
CREATE SEQUENCE DEPT_ID_SEQ
AS int
START WITH 60
INCREMENT BY 10
MAXVALUE 200;
--10.�ϥΤW�D�ҫت�sequence�Ӳ��ͳ����s��,�s�W��ӳ������(Education and Administration) ��dept��
--�ƪ�C
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