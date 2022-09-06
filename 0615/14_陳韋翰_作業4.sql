--1. ��ܩҦ����u���̰��B�̧C�B�`�M�Υ����~��,�̧ǱN���Y�R�W�� Maximum, Minimum, Sum
--�M Average,�бN���G��ܬ��|�ˤ��J����ơC
SELECT MAX(sal) Maximum , MIN(sal) Minimum , CAST(SUM(sal) AS int) Sum ,CAST(ROUND(AVG(sal) , 0)AS int) Average
FROM emp;
--2. ��ܨC��¾�٪��̧C�B�̰��B�`�M�Υ����~���C
SELECT job , MAX(sal) Maximum , MIN(sal) Minimum , SUM(sal) Sum , AVG(sal) Average
FROM emp
GROUP BY job;
--3. ��ܨC��¾�٪��H�ơC
SELECT  job ,COUNT(job) Total 
FROM emp
GROUP BY job;
--4. ��ܸ�ƶ��R�W��Number of Managers�Ӫ�ܾ���D�ު��H�ơC
SELECT COUNT(DISTINCT mgr) 'Number of Managers'
FROM emp;
--5. ��ܸ�ƶ��R�W��DIFFERENCE����ƨӪ�ܤ��q���̰��M�̧C�~�������t�B�C
SELECT MAX(sal)-MIN(sal) DIFFERENCE
FROM emp;
--6. ��ܨC��D�ު����u�s���θӥD�ޤU�ݭ��u�̧C���~��,�ư��S���D�ީM�U�ݭ��u�̧C�~���
--��1000���D��,�åH�U�ݭ��u�̧C�~��@�����ƦC�C
SELECT mgr,MIN(sal) Minsal
FROM emp
WHERE MGR IS NOT NULL
GROUP BY MGR
HAVING MIN(sal)>1000
ORDER BY Minsal DESC;
--7. ��ܦb2010,2011,2012,2013�~�i���q�����u�ƶq,�õ��Ӹ�ƶ��@�ӦX�A���W�١C
SELECT YEAR(hiredate) HYear,COUNT(*) 'Number of people'
FROM emp
WHERE hiredate BETWEEN '2010-01-01' AND '2013-12-31'
GROUP BY YEAR(hiredate);