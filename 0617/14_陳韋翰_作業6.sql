--1. ��ܩMBlake�P�������Ҧ����u���m�W�M�i���q����C
SELECT ename , hiredate
FROM emp 
WHERE deptno = (SELECT deptno
				FROM emp
				WHERE ename = 'Blake');
--2. ��ܩҦ��bBlake����i���q�����u���m�W�ζi���q����C
SELECT ename , hiredate
FROM emp
WHERE hiredate > (SELECT hiredate
				  FROM emp
				  WHERE ename = 'Blake');
--3. ����~��񤽥q�����~�갪���Ҧ����u�����u�s��,�m�W�M�~��,�è��~��Ѱ���C�ƦC�C
SELECT empno , ename , sal
FROM emp
WHERE sal > ( SELECT AVG(sal)
			  FROM emp)
ORDER BY sal DESC;
--4. ��ܩM�m�W���]�t T ���H�b�ۦP�����u�@���Ҧ����u�����u�s���M�m�W�C
SELECT empno , ename 
FROM emp
WHERE deptno IN ( SELECT deptno
				 FROM emp
				 WHERE ename LIKE '%T%');
--5. ��ܦbDallas�u�@���Ҧ����u���m�W, �����s���M¾�١C
SELECT ename , deptno , job
FROM emp
WHERE deptno = (SELECT deptno
				FROM dept
				WHERE loc = 'Dallas');
--6. ��ܪ��ݩ�King�������u���m�W�M�~��C
SELECT ename ,sal
FROM emp
WHERE mgr = ( SELECT empno
				   FROM EMP 
				   WHERE mgr IS NULL);
--7. ��ܾP�ⳡ����Sales�� �Ҧ����u�������s��,�m�W�M¾�١C
SELECT deptno , ename , job
FROM emp 
WHERE deptno = (SELECT deptno
			    FROM dept
				WHERE dname = 'sales');
--8. ����~��񤽥q�����~���٭n���B�M�W�r���� T ���H�b�ۦP�����W�Z���Ҧ����u�����u�s��,�m�W�M�~��C
SELECT empno , ename , sal
FROM emp
WHERE deptno IN (SELECT deptno
				 FROM emp 
				 WHERE ename LIKE '%T%')
		AND sal > (SELECT AVG(sal)
					  FROM emp);
--9. ��ܩM���Ȩ����������u�������s���M�~�곣�ۦP�����u���m�W,�����s���M�~��C
SELECT e1.ename , e1.deptno , e1.sal
FROM emp e1 JOIN (SELECT*
				  FROM emp
				  WHERE comm > 0) e2 ON e1.empno<>e2.empno AND e1.deptno = e2.deptno AND e1.sal = e2.sal;
--10.��ܩM�bDallas�u�@�����u���~��M�������ۦP�����u���m�W,�����s���M�~��C
SELECT e.ename , e.deptno , e.sal
FROM emp e JOIN (SELECT *
				 FROM emp
				 WHERE deptno = (SELECT deptno
								 FROM dept
								 WHERE LOC = 'Dallas')) d ON e.empno<>d.empno AND e.sal = d.sal AND ISNULL(d.comm,0) = ISNULL(e.comm,0);
--11.����~��M�������MScott�ۦP���Ҧ����u���m�W,�i���q����M�~��C(���n�b���G�����Scott�����)
SELECT e.ename , e.hiredate , e.sal
FROM emp e JOIN (SELECT *
				 FROM emp
				 WHERE ename = 'scott') d ON e.empno<>d.empno AND e.sal = d.sal AND ISNULL(d.comm,0) = ISNULL(e.comm,0);
--12.����~���Ҧ�¾�٬O��Clerk���ٰ������u���m�W,�i���q����M�~��,�ñN���G���~��Ѱ��ܧC��ܡC
SELECT ename , hiredate , sal
FROM emp
WHERE sal > ALL (SELECT sal
				 FROM emp
				 WHERE job = 'Clerk')
ORDER BY sal DESC;