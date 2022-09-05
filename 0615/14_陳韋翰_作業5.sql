--1. 顯示所有員工之姓名,所屬部門編號,部門名稱及部門所在地點。
SELECT e.ename , e.deptno , d.dname , d.LOC
FROM dept d JOIN emp e ON d.deptno = e.deptno;
--2. 顯示所有有賺取佣金的員工之姓名,佣金金額,部門名稱及部門所在地點。
SELECT e.ename , e.comm , d.dname , d.loc
FROM dept d JOIN emp e ON d.deptno = e.deptno
WHERE comm NOT IN (0);
--3. 顯示姓名中包含有”A”的員工之姓名及部門名稱。
SELECT e.ename , d.dname
FROM dept d JOIN emp e ON d.deptno = e.deptno
WHERE ename LIKE '%A%';
--4. 顯示所有在”DALLAS”工作的員工之姓名,職稱,部門編號及部門名稱
SELECT e.ename , e.job , e.deptno , d.dname
FROM dept d JOIN emp e ON d.deptno = e.deptno
WHERE d.loc = 'DALLAS';
--5. 顯示出表頭名為: Employee, Emp#, Manager, Mgr#,分別表示所有員工之姓名,員工編號,主管
--姓字, 主管的員工編號。
SELECT a.ename Employee , a.empno Emp# , b.ename Manager, b.empno Mgr#
FROM emp a JOIN emp b ON a.mgr = b.empno;
--6. 顯示出SALGRADE資料表的結構,並建立一查詢顯示所有員工之姓名,職稱,部門名稱,薪資及薪
--資等級。
SELECT e.ename , e.job , e.deptno , e.sal , s.grade
FROM emp e JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;
--7. 顯示出表頭名為: Employee, Emp Hiredate, Manager, Mgr Hiredate的資料項,來顯示所有比
--他的主管還要早進公司的員工之姓名,進公司日期和主管之姓名及進公司日期。
SELECT a.ename Employee , a.hiredate 'Emp Hiredate' , b.ename Manager , b.hiredate 'Mgr Hiredate'
FROM emp a JOIN emp b ON a.mgr = b.empno
WHERE a.hiredate < b.hiredate;
--8. 顯示出表頭名為: dname, loc, Number of People, Salary的資料來顯示所有部門之部門名稱,部
--門所在地點,部門員工數量及部門員工的平均薪資,平均薪資四捨五入取到小數第二位。
SELECT d.dname dname , d.loc loc , COUNT(d.dname) 'Number of People' , ROUND(AVG(sal) ,2, 0) Salary 
FROM dept d JOIN emp e ON d.deptno = e.deptno
GROUP BY d.dname , d.loc ;
