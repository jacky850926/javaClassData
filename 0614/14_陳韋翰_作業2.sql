--1. ��ܥX�Ҧ����u�~��W�L2850�������u���m�W�M�~��C
SELECT ename,sal
FROM emp
WHERE sal>2850;
--2. ��ܭ��u�s����7566���u���m�W�M�L���ݪ������s���C
SELECT ename , deptno
FROM emp
WHERE empno = 7566;
--3. ����~�ꤣ����1500~2850���������Ҧ����u���m�W�M�~��C
SELECT ename , sal
FROM emp
WHERE sal NOT BETWEEN 1500 AND 2850;
--4. ��ܩ�2011�~2��20��M2011�~5��1�鶡�i�J���q�����u���m�W,¾�٩M�i���q���,�è̶i���q�����
--�p��j�ƧǡC
SELECT ename , job , hiredate
FROM emp
WHERE hiredate BETWEEN '2011-02-20' AND '2011-05-01'
ORDER BY hiredate ASC;
--5. ��ܳ���10�M30�Ҧ����u���m�W�M�L���ݪ������s��,�è̦W�r�̭^��r�����ǱƧǡC
SELECT ename , deptno
FROM emp
WHERE deptno IN (10 , 30)
ORDER BY ename ;
--6. ����~��W�L1500���B���b10���Ρ�30�����u�@���u���m�W�M�~��,����O����Y�R�W��Employee�M
--Monthly Salary�C
SELECT ename Employee , sal 'Monthly Salary'
FROM emp
WHERE sal>1500 AND (deptno IN (10,30));
--7. ��ܩ�2012�~�i���q���Ҧ����u���m�W,¾�٩M�i���q����C
SELECT ename , job ,Hiredate
FROM emp
WHERE hiredate BETWEEN '2012-01-01' AND '2012-12-31';
--8. ��ܨS���D�ު����u���m�W�M¾�١C
SELECT ename , job
FROM emp
WHERE mgr IS NULL;
--9. ��ܩҦ����Ȩ����������u���m�W,�~��M����,�åH�~��M�����@�����ƦC�C
SELECT ename , sal , comm
FROM emp
WHERE comm NOT IN (0) 
ORDER BY sal DESC, comm DESC;
--10.��ܩҦ��W�r�̲ĤT�ӭ^��r����A�����u���m�W�P¾�١C
SELECT ename , job
FROM emp
WHERE ename LIKE '__A%';
--11.��ܦW�r�̦���ӡ�L���B�b30�����u�@�θg�z�O7782�����u���m�W,�g�z���u�s���Ω��ݪ������s���C
SELECT ename , MGR , deptno
FROM emp
WHERE ename LIKE '%LL%';
--12.���¾�٬�Clerk��Analyst�B�~��������1000,3000,5000�����u���m�W,¾�٩M�~��C
SELECT ename  , job , sal
FROM emp
WHERE job IN ('Clerk' , 'Analyst') and sal  NOT IN (1000,3000,5000);
--13.��ܦ������~����1.1���٦h�����u���m�W,�~��M�����C
SELECT ename ,sal , comm
FROM emp
WHERE comm > sal*1.1;