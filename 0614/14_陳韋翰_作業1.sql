--1. �إߤ@�Ӭd�ߨ���ܳ���(dept)��ƪ����Ҧ���ơC

SELECT *
FROM dept;
--2. �إߤ@�Ӭd�ߨ���ܨC�@����u���m�W(name)�B¾��(job)�B�i���q���(hire date)�έ��u�s��
--(employee number ),�ñN�B���u�s����ܦb�̫e���C
SELECT empno,ename,job,hiredate
FROM emp;
--3. �إߤ@�Ӭd�ߨ���ܩҦ����u�Ҿ����¾�٦�����? (���ƪ���ƥu��ܤ@��)
SELECT DISTINCT job
FROM emp;
--4. �إߤ@�Ӭd�ߨ���ܨC�@����u���m�W(name)�B¾��(job)�B�i���q���(hire date)�έ��u�s��
--(employee number ),�ñN�B���u�s����ܦb�̫e���C�ñN��ƪ��Y���s�R�W��:Emp#,
--Employee, Job, Hire Date�C
SELECT empno Emp#,ename Employee,job Job,hiredate 'Hire Date'
FROM emp;
--5. �إߤ@�Ӭd�߱N�m�W(name)��¾��(job)�걵���̭Ӹ�ƶ�(��Ƥ����Q�Τ@�ӪťթM�@�ӳr��
--���Ϲj),�ñN���Y���s�R�W�� Employee and Title�C
SELECT concat(ename,' ,',job) 'Employee and Title'
FROM emp;