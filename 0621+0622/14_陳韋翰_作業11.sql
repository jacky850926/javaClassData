--1. ���g�@�ӹw�s�{��SearchByHiredate,���w�s�{�Ǧ���ӿ�J�Ѽ�: @FDate(����U��)��@Tdate(���
--�W��),���榹�w�s�{�ǥi�H��ܶi���q����b@Fdate��@Tdate���������u�s��,�m�W,�����ζi���q
--���,����ɳW�h�p�U:
CREATE PROCEDURE SearchByHiredate
	@Fdate AS datetime2 = '1911-01-01',
	@Tdate AS datetime2 = '2087-12-31'
AS
BEGIN
	SELECT empno , ename , deptno , hiredate
	FROM emp
	WHERE hiredate BETWEEN @Fdate AND @Tdate
END;
--EXEC SearchByHiredate ��2011-01-01�� , ��2011-12-31�� : ��ܶi���q����b�����������u���
EXEC SearchByHiredate '2011-01-01' , '2011-12-31';
--EXEC SearchByHiredate @Fdate = ��2011-06-30�� : ��ܶi���q����b���w����ᤧ���u���
EXEC SearchByHiredate @Fdate = '2011-06-30';
--EXEC SearchByHiredate @Tdate = ��2011-06-30�� : ��ܶi���q����b���w����e�����u���
EXEC SearchByHiredate @Tdate = '2011-06-30';

--2. ���g�@�Ӧ۩w�q���UDFSBH,���۩w�q��Ʀ���ӿ�J�Ѽ�: @FDate(����U��)��@Tdate(����W��),
--���榹�۩w�q��ƥi�H��ܶi���q����b@Fdate��@Tdate���������u�s��,�m�W,�����ζi���q���,
--����ɳW�h�p�U:
CREATE FUNCTION UDFSBH(@Fdate DATE, @Tdate DATE)
RETURNS @datetable TABLE(
	empno int NOT NULL,
	ename NVARCHAR(10),
	deptno int,
	hiredate date NOT NULL
)
AS
BEGIN	
	IF @Fdate = ''
		BEGIN
			SET @Fdate = '1911-01-01'
		END
	IF @Tdate = ''
		BEGIN
			SET @Tdate = '2087-12-31'
		END
	INSERT INTO @datetable
		SELECT empno , ename , deptno , hiredate
		FROM emp
		WHERE hiredate BETWEEN @Fdate AND @Tdate;
	RETURN
END;
--SELECT * FROM UDFSBH(��2011-01-01�� , ��2011-12-31�� ) : ��ܶi���q����b�����������u���
SELECT * FROM UDFSBH('2011-01-01' , '2011-12-31' ) ;
--SELECT * FROM UDFSBH(��2011-06-30��, '' ) : ��ܶi���q����b���w����ᤧ���u���
SELECT * FROM UDFSBH('2011-06-30','') ;
--SELECT * FROM UDFSBH('', ��2011-06-30�� ) :��ܶi���q����b���w����e�����u���
SELECT * FROM UDFSBH('','2011-06-30') ;
