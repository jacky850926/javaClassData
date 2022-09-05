--1. 撰寫一個預存程序SearchByHiredate,此預存程序有兩個輸入參數: @FDate(日期下限)及@Tdate(日期
--上限),執行此預存程序可以顯示進公司日期在@Fdate及@Tdate之間之員工編號,姓名,部門及進公司
--日期,執行時規則如下:
CREATE PROCEDURE SearchByHiredate
	@Fdate AS datetime2 = '1911-01-01',
	@Tdate AS datetime2 = '2087-12-31'
AS
BEGIN
	SELECT empno , ename , deptno , hiredate
	FROM emp
	WHERE hiredate BETWEEN @Fdate AND @Tdate
END;
--EXEC SearchByHiredate ‘2011-01-01’ , ’2011-12-31’ : 顯示進公司日期在兩日期間之員工資料
EXEC SearchByHiredate '2011-01-01' , '2011-12-31';
--EXEC SearchByHiredate @Fdate = ‘2011-06-30’ : 顯示進公司日期在指定日期後之員工資料
EXEC SearchByHiredate @Fdate = '2011-06-30';
--EXEC SearchByHiredate @Tdate = ‘2011-06-30’ : 顯示進公司日期在指定日期前之員工資料
EXEC SearchByHiredate @Tdate = '2011-06-30';

--2. 撰寫一個自定義函數UDFSBH,此自定義函數有兩個輸入參數: @FDate(日期下限)及@Tdate(日期上限),
--執行此自定義函數可以顯示進公司日期在@Fdate及@Tdate之間之員工編號,姓名,部門及進公司日期,
--執行時規則如下:
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
--SELECT * FROM UDFSBH(‘2011-01-01’ , ’2011-12-31’ ) : 顯示進公司日期在兩日期間之員工資料
SELECT * FROM UDFSBH('2011-01-01' , '2011-12-31' ) ;
--SELECT * FROM UDFSBH(’2011-06-30’, '' ) : 顯示進公司日期在指定日期後之員工資料
SELECT * FROM UDFSBH('2011-06-30','') ;
--SELECT * FROM UDFSBH('', ’2011-06-30’ ) :顯示進公司日期在指定日期前之員工資料
SELECT * FROM UDFSBH('','2011-06-30') ;
