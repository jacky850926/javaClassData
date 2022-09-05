--1. ��ܩҦ����u���m�W,�����s��,�~��θӳ����̧C�~��(�H JOIN �l�͸�ƪ�覡���gSQL)�C
SELECT e.ename , e.deptno , e.sal , minsal
FROM emp e JOIN (SELECT deptno , MIN(sal) minsal FROM emp GROUP BY deptno) d ON e.deptno = d.deptno
--2. ��ܩҦ����u���m�W,�����s��,�~��θӳ����̧C�~��(�HCTE�覡���gSQL)�C
WITH deptmin AS (
	SELECT deptno  , MIN(sal) minsal
	FROM emp
	GROUP BY deptno
	)
SELECT ename , emp.deptno , sal , minsal
FROM emp join deptmin ON emp.deptno = deptmin.deptno
--3. ��ܩҦ����u���m�W,�����s��,�~��θӳ����̧C�~��(�HWindow Function �覡���gSQL)�C
SELECT ename , deptno , sal ,
		MIN(sal) OVER (PARTITION BY deptno ORDER BY ename RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)  minsal
FROM emp;

--4. ��ܭ��u���m�W,�i���q���,�˰Q�~�ꪺ���(���b�i���q�u�@���Ӥ�᪺�Ĥ@�ӬP���@),�N����R
--�W�� REVIEW�C
--SET DATEFIRST 1;
--SELECT ename , hiredate ,IIF(DATEPART(weekday,hiredate) = 1, DATEADD(DAY,7,DATEADD(month,6,hiredate)) , DATEADD(month , 6 , hiredate)) review
--FROM emp

SET DATEFIRST 1;
with t1(n,date,name) AS(
	SELECT 1 , DATEADD( month , 6 , hiredate ) , ename 
	FROM emp
	UNION ALL
	SELECT n+1 , DATEADD(day , 1 , date) , name 
	FROM t1
	WHERE n < 7
)
SELECT e.ename , e.hiredate , t.date REVIEW  
FROM t1 t JOIN emp e on e.ename = t.name
WHERE DATEPART(WEEKDAY, date) = 1
--5. ��ܭ��u���s��,�m�W,�����s��,�D�ޤε��� (�L�D�޵��Ŭ�1,��W���@�h�D�޵��Ŭ�2,�H������)�C
WITH t1(empno , ename , deptno , mgr , level) AS(
	SELECT empno , ename , deptno , mgr , 1 level
	FROM emp
	where mgr IS NULL
	UNION ALL
	SELECT e.empno , e.ename , e.deptno , e.mgr , t.level+1 level 
	FROM emp e JOIN t1 t ON e.mgr = t.empno
)
SELECT * FROM t1

--6. ��ܭ��u���s��,�m�W,�����s��,�~����~�������q���ƦW(���P�W�h����|���L�W��)�C
SELECT empno , ename , deptno , sal , RANK() OVER (ORDER BY sal DESC) Salary_Rank
FROM emp
--7. ��ܭ��u���s��,�m�W,�����s��,�~����~���ӳ������ƦW(���P�W�h���ᤣ�|���L�W��)�C
SELECT empno , ename , deptno , sal , DENSE_RANK() OVER (PARTITION BY deptno ORDER BY sal DESC) Salary_Rank
FROM emp
--8. ��ܩҦ��q�椧�s��,�q����,�q����B�β֭p�ܦ��q�椧�`�P���B�C
SELECT ordid , orderdate , total , SUM(total) OVER (ORDER BY orderdate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) running_total
FROM ord ;
--9. ��ܩҦ��q�椧�s��,�q����,�q����B�ΥH�~�׹����֭p�ܦ��q�椧�`�P���B�C
SELECT ordid , orderdate ,  total , SUM(total) OVER (PARTITION BY DATEPART(Year , orderdate) ORDER BY orderdate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) running_total
FROM ord
ORDER BY orderdate ;
--10.��ܩҦ��q�椧�s��,�q�����Υ����q��Z�W���q��w�g�L�F�h�֤ѡC
SELECT ordid , orderdate , DATEDIFF(d , orderdate , LEAD (orderdate) OVER (ORDER BY orderdate )) Previous_Order_Date
FROM ord