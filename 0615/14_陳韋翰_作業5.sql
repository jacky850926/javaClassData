--1. ��ܩҦ����u���m�W,���ݳ����s��,�����W�٤γ����Ҧb�a�I�C
SELECT e.ename , e.deptno , d.dname , d.LOC
FROM dept d JOIN emp e ON d.deptno = e.deptno;
--2. ��ܩҦ����Ȩ����������u���m�W,�������B,�����W�٤γ����Ҧb�a�I�C
SELECT e.ename , e.comm , d.dname , d.loc
FROM dept d JOIN emp e ON d.deptno = e.deptno
WHERE comm NOT IN (0);
--3. ��ܩm�W���]�t����A�������u���m�W�γ����W�١C
SELECT e.ename , d.dname
FROM dept d JOIN emp e ON d.deptno = e.deptno
WHERE ename LIKE '%A%';
--4. ��ܩҦ��b��DALLAS���u�@�����u���m�W,¾��,�����s���γ����W��
SELECT e.ename , e.job , e.deptno , d.dname
FROM dept d JOIN emp e ON d.deptno = e.deptno
WHERE d.loc = 'DALLAS';
--5. ��ܥX���Y�W��: Employee, Emp#, Manager, Mgr#,���O��ܩҦ����u���m�W,���u�s��,�D��
--�m�r, �D�ު����u�s���C
SELECT a.ename Employee , a.empno Emp# , b.ename Manager, b.empno Mgr#
FROM emp a JOIN emp b ON a.mgr = b.empno;
--6. ��ܥXSALGRADE��ƪ����c,�ëإߤ@�d����ܩҦ����u���m�W,¾��,�����W��,�~����~
--�굥�šC
SELECT e.ename , e.job , e.deptno , e.sal , s.grade
FROM emp e JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;
--7. ��ܥX���Y�W��: Employee, Emp Hiredate, Manager, Mgr Hiredate����ƶ�,����ܩҦ���
--�L���D���٭n���i���q�����u���m�W,�i���q����M�D�ޤ��m�W�ζi���q����C
SELECT a.ename Employee , a.hiredate 'Emp Hiredate' , b.ename Manager , b.hiredate 'Mgr Hiredate'
FROM emp a JOIN emp b ON a.mgr = b.empno
WHERE a.hiredate < b.hiredate;
--8. ��ܥX���Y�W��: dname, loc, Number of People, Salary����ƨ���ܩҦ������������W��,��
--���Ҧb�a�I,�������u�ƶq�γ������u�������~��,�����~��|�ˤ��J����p�ƲĤG��C
SELECT d.dname dname , d.loc loc , COUNT(d.dname) 'Number of People' , ROUND(AVG(sal) ,2, 0) Salary 
FROM dept d JOIN emp e ON d.deptno = e.deptno
GROUP BY d.dname , d.loc ;
