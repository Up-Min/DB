--COMMIT; -- commit을 하기 전까지는 컴퓨터 메모리에만 저장이 되어있었지만, 커밋(insert, update, delete)을 통해 실제 db에 저장을 하게 됨
--
--INSERT INTO EMP VALUES(4, '정지우', 10);
--INSERT INTO EMP VALUES(5, '정죠', 10);
--
--select * from sample;
--select * from EMP;
--
--ROLLBACK; -- 3번행에서 insert를 해도 rollback을 하면 커밋 이후의 시점으로 돌아가게 된다.
--
---- CHECK
--ALTER TABLE EMP MODIFY AGE NUMBER CHECK(AGE IN(10,11));
---- AGE컬럼에 10, 11만 넣겠다는 의미. CHECK라는 제약조건 추가.
--INSERT INTO EMP VALUES(5, '정죠', 12);
----> 제약조건인 10,11이 아닌 값이 들어가기 때문에 에러가 뜬다.
--
----INDEX
--CREATE INDEX EMP_IX01 ON EMP(NAME); -- NAME 컬럼에 인덱싱을 건다.
--CREATE INDEX EMP_IX02 ON EMP (NO, NAME); -- NO, NAME 컬럼에 인덱스를 건다.
---- 여러개의 컬럼에 인덱스를 한꺼번에 검, 인덱스의 이름은 같으면 안됨!
--
---- 저장된 인덱스 활용하여 가져오기
--SELECT * FROM EMP WHERE NAME = '정죠';
--
--CREATE UNIQUE INDEX EMP_1X03 ON EMP(AGE); 
---- 에러발생. AGE안에 들어가는 숫자가 중복되지 않아야하는데(유일한 값이어야하는데),
---- 실제 EMP테이블거는 다 같음!
--CREATE UNIQUE INDEX EMP_1X03 ON EMP(NO); -- 얘는 값이 다 다르기때문에 좋다. 
--
----인덱스 삭제
--DROP INDEX EMP_IX01;
--
--
--SELECT * FROM USER_TABLES;
--SELECT * FROM USER_INDEXES;
--SELECT * FROM USER_VIEWS;

-- 프로시저
--SELECT* FROM GIFT;
--
--CREATE OR REPLACE PROCEDURE 프로시져이름 (파라미터1, 파라미터2....)
--IS
--변수
--BEGIN
--쿼리문
--END 프로시져 이름;


-- 프로시져 생성
--CREATE OR REPLACE PROCEDURE EX_PROC (IN_TYPE IN VARCHAR2, IN_NAME IN VARCHAR2)
--IS
--PRICE NUMBER := 10000; 
--
--BEGIN 
--INSERT INTO GIFT
--VALUES(11, IN_NAME, PRICE, IN_TYPE);
--COMMIT;
--END EX_PROC;

--CREATE OR REPLACE PROCEDURE EX_PROC (IN_TYPE IN VARCHAR2, IN_NAME IN VARCHAR2) -- 매개변수
--IS -- (IS와 BEGIN 사이 변수 넣기)
--PRICE NUMBER := 10000; --변수 선언
--
--BEGIN -- 본격적으로 시작하고 싶은 쿼리문
--INSERT INTO GIFT
--VALUES(11,IN_NAME, PRICE, IN_TYPE);
--COMMIT;
--END EX_PROC;

-- 프로시저 구동
EXEC EX_PROC ('가전제품', 'TV');



