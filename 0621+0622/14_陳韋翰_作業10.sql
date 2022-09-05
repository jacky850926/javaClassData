--1. 顯示所有員工之姓名,部門編號,薪資及該部門最低薪資(以 JOIN 衍生資料表方式撰寫SQL)。
SELECT e.ename , e.deptno , e.sal , minsal
FROM emp e JOIN (SELECT deptno , MIN(sal) minsal FROM emp GROUP BY deptno) d ON e.deptno = d.deptno
--2. 顯示所有員工之姓名,部門編號,薪資及該部門最低薪資(以CTE方式撰寫SQL)。
WITH deptmin AS (
	SELECT deptno  , MIN(sal) minsal
	FROM emp
	GROUP BY deptno
	)
SELECT ename , emp.deptno , sal , minsal
FROM emp join deptmin ON emp.deptno = deptmin.deptno
--3. 顯示所有員工之姓名,部門編號,薪資及該部門最低薪資(以Window Function 方式撰寫SQL)。
SELECT ename , deptno , sal ,
		MIN(sal) OVER (PARTITION BY deptno ORDER BY ename RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)  minsal
FROM emp;

--4. 顯示員工的姓名,進公司日期,檢討薪資的日期(指在進公司工作六個月後的第一個星期一),將該欄命
--名為 REVIEW。
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
--5. 顯示員工的編號,姓名,部門編號,主管及等級 (無主管等級為1,其上有一層主管等級為2,以此類推)。
WITH t1(empno , ename , deptno , mgr , level) AS(
	SELECT empno , ename , deptno , mgr , 1 level
	FROM emp
	where mgr IS NULL
	UNION ALL
	SELECT e.empno , e.ename , e.deptno , e.mgr , t.level+1 level 
	FROM emp e JOIN t1 t ON e.mgr = t.empno
)
SELECT * FROM t1

--6. 顯示員工的編號,姓名,部門編號,薪資及薪資於全公司之排名(有同名則往後會跳過名次)。
SELECT empno , ename , deptno , sal , RANK() OVER (ORDER BY sal DESC) Salary_Rank
FROM emp
--7. 顯示員工的編號,姓名,部門編號,薪資及薪資於該部門之排名(有同名則往後不會跳過名次)。
SELECT empno , ename , deptno , sal , DENSE_RANK() OVER (PARTITION BY deptno ORDER BY sal DESC) Salary_Rank
FROM emp
--8. 顯示所有訂單之編號,訂單日期,訂單金額及累計至此訂單之總銷售額。
SELECT ordid , orderdate , total , SUM(total) OVER (ORDER BY orderdate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) running_total
FROM ord ;
--9. 顯示所有訂單之編號,訂單日期,訂單金額及以年度劃分累計至此訂單之總銷售額。
SELECT ordid , orderdate ,  total , SUM(total) OVER (PARTITION BY DATEPART(Year , orderdate) ORDER BY orderdate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) running_total
FROM ord
ORDER BY orderdate ;
--10.顯示所有訂單之編號,訂單日期及本筆訂單距上筆訂單已經過了多少天。
SELECT ordid , orderdate , DATEDIFF(d , orderdate , LEAD (orderdate) OVER (ORDER BY orderdate )) Previous_Order_Date
FROM ord