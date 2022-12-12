-- 12.9
-- 중첩서브쿼리 (메인쿼리와의 관계에 따라 비연관, 연관)으로 나누어짐
 -- 비연관 : 메인쿼리와 서브쿼리에 관련이 없음, JOIN 안한다.
 -- 연관 : 서브쿼리에 메인쿼리 컬럼이 있음, JOIN을 한다.
 
 -- 비연관
 SELECT * FROM ACADEMY_A WHERE STUDENT_NAME = 
 (SELECT STUDENT_NAME 
 FROM ACADEMY_B
 WHERE STUDENT_NO = 1003);
 -- 아카데미 A테이블에서 스튜던트 네임이 소괄호 안에 있는 아이들을 가져옴.  WHERE STUDENT_NAME = '고명석' 과 같음.
 -- 아카데미 A,B는 아무런 관계가 없고, 서브쿼리 안에도 메인쿼리가 일절 언급되어 있지 않음
 
  -- 연관
  SELECT*FROM ACADEMY_a t1 WHERE STUDENT_NAME=
  (SELECT T2.STUDENT_NAME
  FROM ACADEMY_B T2
  WHERE t2.student_no = t1.student_no
  );
  --student_name이 소괄호 안에 있는 사람을 가져온다는 소리. 
  -- 메인쿼리와 서브쿼리가 관계를 가지고 있음. 서브쿼리에 t1을 조인을 해서 t1에 있는 칼럼을 사용하고 있음.
  -- 아카데미 a,b는 관계를 가진다.
  
  
  -- 단일행, 다중행, 다중컬럼 서브쿼리
   -- 단일행. '=' 사용
   -- 서브쿼리가 1건 이하의 데이터를 반환할 때 사용함. (비교연산자 =,<,>,<=,>=)
   SELECT * FROM academy_a WHERE STUDENT_NAME = (SELECT STUDENT_NAME FROM ACADEMY_B WHERE STUDENT_NO = 1003);
    -- 서브쿼리에서 데이터를 한 건만 반환한다. 서브쿼리가 하나 이하일 때, 단일행이라 한다.
    -- SELECT * FROM academy_a WHERE STUDENT_NAME > (SELECT STUDENT_NAME FROM ACADEMY_B WHERE STUDENT_NO = 1003);
    -- 와 같이 부등호를 사용할 수도 있다.
   
   -- 다중형 'IN' 사용 - 주의? (원래 IN(,,,,) 해서 정확한 값을 일치하는 애들을 가져오는 거였는데, 이거를 서브쿼리에서도 사용한다!)
   SELECT * FROM academy_a WHERE STUDENT_NAME IN 
   (SELECT STUDENT_NAME FROM ACADEMY_B WHERE STUDENT_NO = 1003
    OR STUDENT_NO = 1004); --> (고명석, 김연아) 와 같은 역할을 함.
   -- 두개 이상의 값을 반환할 때는 '=' 대신 'IN' 을 사용한다!
   -- SELECT * FROM academy_a WHERE STUDENT_NAME = ///-> SELECT * FROM academy_a WHERE STUDENT_NAME IN
   
   
   -- 다중컬럼 -> 위에서는 하나의 컬럼에 하나의 값, 아니면 여러 값을 반환했는데, 이번에는 여러 컬럼을 반환해보자!
   SELECT* FROM ACADEMY_A WHERE (STUDENT_NAME, STUDENT_NO) IN 
   (SELECT STUDENT_NAME, STUDENT_NO FROM ACADEMY_B 
   WHERE STUDENT_NO= 1003 OR STUDENT_NO = 1004);
   -- 서브쿼리 : 컬럼을 두개를 반환한다. (다중컬럼 서브쿼리) -> 두개를 반환하면 두개를 받아야한다.
   -- ? 질문, 그러면 메인쿼리에서 받는 컬럼 이름이랑 서브쿼리에서 받는 컬럼이름이랑 같아야하는가?
   --> 갯수는 같아야하지만 이름은 달라도 된다. 대신 중복되는 아이들 + 메인쿼리만의 이름 + 서브쿼리만의 이름 이렇게 나온다.
   
   
-- GROUP BY, HAVING, ORDER BY

SELECT TYPE, COUNT(NAME) AS COUNT FROM GIFT GROUP BY TYPE;
   -- 타입으로 그룹핑. 네임으로 갯수를 세준다. 그룹핑 된 컬럼 안에 있는 NAME의 갯수를 세어줌.
  
SELECT TYPE, COUNT(NAME) AS COUNT FROM GIFT GROUP BY TYPE 
HAVING COUNT(NAME) >=2; -- 카운트가 2 이상인 아이들만 출력해줌.

-- 윈도우 함수- OVER 사용이 중요! 사용하면 GROUPBY나 서브쿼리 사용 안해도 됨.
-- RANK 
SELECT STUDENT_NAME, SCORE, RANK() OVER(ORDER BY SCORE DESC) AS RANK
FROM STUDENT_GRADE; -- OVER로 입력받은 (정렬된 SCORE) 데이터를 RANK화 시켜줌.
-- 보면 알겠지만 10등이 두명임, 바로 11이 아니라 12가 나옴. (공동 10등 이후 12등 지정)
-- 그래서, DENSE_RANK
SELECT STUDENT_NAME, SCORE, DENSE_RANK() OVER(ORDER BY SCORE DESC) AS RANK
FROM STUDENT_GRADE; --10등이 두명이어도 뒤에 11이 나옴 (공동 10등 이후 11등을 지정해줌)

SELECT STUDENT_NAME, SCORE, ROW_NUMBER() OVER(ORDER BY SCORE DESC) AS RANK
FROM STUDENT_GRADE; --  공동 10등인데도 ROW를 통해 먼저 온 애가 10등이 된다, 그 다음에는 11등

SELECT TYPE, SUM(PRICE) AS SUM FROM GIFT GROUP BY TYPE;
-- 타입으로 가격을 받고, 걔네들을 합쳐준 애들을 내보냄
SELECT TYPE, PRICE, SUM(PRICE) OVER(PARTITION BY TYPE) 
AS SUM FROM GIFT GROUP BY TYPE; --OVER가 이미 그룹핑이 되어있기 떄문에 GROUP BY를 넣으면 안됨.
   
SELECT TYPE, PRICE, SUM(PRICE) OVER(PARTITION BY TYPE) 
AS SUM FROM GIFT TYPE; --파티션 : 따로따로 보여주기는 하나, 그룹핑한 SUM을 다시 (각 TYPE별 그룹핑된 아이들의 갯수만큼) 파티션해서 나누어줌.  
   
SELECT TYPE, AVG(PRICE), MAX(PRICE) AS MAX FROM GIFT GROUP BY TYPE; 
-- 타입, 평균가격, 최대가격을 그룹핑하여 출력해줌.

--VIEW
CREATE OR REPLACE VIEW ACADEMY_ALL AS SELECT*FROM ACADEMY_A; 
 -- 생성과 수정을 같이 함. // 실제로 준비하는 물리적 테이블이 아님.  
   SELECT*FROM ACADEMY_ALL WHERE STUDENT_NO = 1001; 
   -- 실제로는 동일한 쿼리 쓰면 됨. 테이블로 인식하기 떄문에.
   
CREATE OR REPLACE VIEW ACADEMY_STUDENT_NAME AS
SELECT STUDENT_NAME FROM ACADEMY_A;

CREATE OR REPLACE VIEW ACADEMY_STUDENT_NAME AS
SELECT STUDENT_NO FROM ACADEMY_A; -- SELECT를 바꾸면 바로 수정이 가능하다.
CREATE OR REPLACE VIEW ACADEMY_STUDENT_NAME AS
SELECT STUDENT_NAME FROM ACADEMY_A; -- NAME을 가져오는 구조로 바뀜

CREATE OR REPLACE VIEW ACADEMY_JOIN AS
SELECT T1.STUDENT_NO, T1.STUDENT_NAME
FROM ACADEMY_A T1, ACADEMY_B T2
WHERE T1.STUDENT_NO = T2.STUDENT_NO;


insert into academy_all values (1005, '김하서'); -- 모든 컬럼을 가져온 view는 INSERT가 가능하다.
select* from academy_all;
select* from academy_a;
-- academy_all에 들어간 값이 academy_a에도 동일하게 들어간다.
-- 즉, 모든 컬럼에 values가 들어가는데, 

INSERT INTO ACADEMY_STUDENT_NAME VALUES('1005'); 
-- NOT NULL 이라고 제약 조건을 주고 값을 넣었는데, CANNOT INSERT NULL 이라고 나온다.
-- 기본 PK는 UNIQUE 하고 NOT NULL한 세팅임. 
-- 즉, 얘처럼 하나만 컬럼 하나만 가져온 애한테도 valueS를 넣으면 모든 컬럼에 VALUES가 들어가야 하므로,
-- PK에 걸려 CANNOT INSERT NULL이라는 값이 나온다

-- VIEW 지우기
DROP VIEW ACADEMY_JOIN;

-- 시퀀스
 -- 시퀀스 제작
CREATE SEQUENCE EMP_SEQ -- 주고 싶은 이름 작성
            INCREMENT BY 1 -- 1씩 증가 시키겠다
            START WITH 1 -- 1부터 시작하겠다
            MINVALUE 1 -- 최솟값 1
            MAXVALUE 9999 -- 최댓값 9999
            NOCYCLE
            NOCACHE
            NOORDER;

            -- 시퀀스 하나씩 증가시킴            
            SELECT EMP_SEQ.NEXTVAL FROM DUAL;

            -- 시퀀스의 현재 값            
            SELECT EMP_SEQ.CURRVAL FROM DUAL;
            
            -- 시퀀스 지우기
            DROP SEQUENCE EMP_SEQ;
            
            
            
            -- 시퀀스 사용 (EMP의 값을 자동으로 늘어나게 하고 싶을 때!)
            INSERT INTO EMP VALUES(EMP_SEQ.NEXTVAL , '둘리', 10);
            
            SELECT*FROM EMP; -- NO가 자동 증가되어 들어가있음.
            -- 게시판의 넘버링을 하고 싶을 때 매우 유용하게 사용할 수 있다!
            
            -- 시퀀스 변경 (다는 안된다!)
            ALTER SEQUENCE EMP_SEQ INCREMENT BY 2; -- 값이 2개씩 늘어나게 한다.
            
            TRUNCATE TABLE EMP; -- 테이블 안에 있는 데이터를 전부 지워주는! TRUNCATE!
            
            -- 시퀀스 현재 값 변경
            -- 시퀀스는 현재 값을 변경할 수 없다. 꼼수로 현재 6으로 끝나있는 NO를 11부터 시작할 수 있게 하고 싶음!
            ALTER SEQUENCE EMP_SEQ INCREMENT BY 4; -- 증가량을 4로 바꾸고
            SELECT EMP_SEQ.NEXTVAL FROM DUAL;           -- 한번 실행시키고
            ALTER SEQUENCE EMP_SEQ INCREMENT BY 1;  -- 증가량을 1로 바꾸고
            INSERT INTO EMP VALUES(EMP_SEQ.NEXTVAL , '둘리', 10); -- VALUES를 돌림
                        
             SELECT*FROM EMP; 
            
            
            
            
            