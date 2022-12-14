-- 초기화
DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER (
    ID      NUMBER PRIMARY KEY,
    NAME    VARCHAR2(20) NOT NULL,
    ADDRESS VARCHAR2(100)
);
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(1, '둘리', '인천');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(2, '둘리', '서울');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(3, '홍길동','서울');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(4, '또치', '제주도');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(5, '도우너', '');
DROP TABLE ORDERS;
CREATE TABLE ORDERS (
    ORDER_ID    NUMBER PRIMARY KEY,
    SALESMAN_ID NUMBER,
    ORDER_DATE  DATE NOT NULL
);
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES(1001, 2002, '2022-01-01');
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES(1002, 2002, '2022-01-02');
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES(1003, 2002, '2022-01-03');
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES(1004, 2002, '2022-01-04');
DROP TABLE BOOK;
CREATE TABLE BOOK (
    BOOK_NO NUMBER PRIMARY KEY, --도서번호
    TITLE VARCHAR2(100) NOT NULL, --제목
    PUBLISHER VARCHAR2(100), --출판사
    PRICE NUMBER --가격
);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (1, '역사1', '상상마당', 10000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (2, '역사2', '상상마당', 11000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (3, '스프링웹프로젝트', '한빛미디어', 50000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (4, '자바프로그래밍', '생능출판', 25000);
 DROP TABLE CONTACTS;
 CREATE TABLE CONTACTS 
  (
    CONTACT_NO NUMBER PRIMARY KEY,
    FIRST_NAME  VARCHAR2( 255 ) NOT NULL,
    LAST_NAME   VARCHAR2( 255 ) NOT NULL,
    EMAIL       VARCHAR2( 255 ) NOT NULL,
    PHONE       VARCHAR2( 20 )         
  );
INSERT INTO CONTACTS VALUES (1,'이','서연','flor.stone@gmail.com','010-3171-2341');
INSERT INTO CONTACTS VALUES (2,'이','시우','lavera.emerson@gmail.com','010-3171-4111');
INSERT INTO CONTACTS VALUES (3,'김','지호','shyla.ortiz@gmail.com','010-3171-4126');
INSERT INTO CONTACTS VALUES (4,'김','윤서','jeni.levy@naver.com','010-8121-2341');
INSERT INTO CONTACTS VALUES (5,'최','수아','fern.head@naver.com', NULL);
DROP TABLE GIFT;
CREATE TABLE GIFT (
    NO    NUMBER,
    TYPE  VARCHAR2(20),
    NAME  VARCHAR2(20),
    PRICE NUMBER
);
INSERT INTO GIFT VALUES(1,'식품','참치세트',100000);
INSERT INTO GIFT VALUES(2,'생활용품','샴푸세트',200000);
INSERT INTO GIFT VALUES(3,'생활용품','세차용품세트',300000);
INSERT INTO GIFT VALUES(4,'생활용품','주방용품세트',400000);
INSERT INTO GIFT VALUES(5,'운동장비','산악용자전거',500000);
INSERT INTO GIFT VALUES(6,'가전제품','LCD모니터',600000);
INSERT INTO GIFT VALUES(7,'가전제품','노트북',700000);
INSERT INTO GIFT VALUES(8,'가전제품','벽걸이TV',800000);
INSERT INTO GIFT VALUES(9,'가전제품','드럼세탁기',900000);
INSERT INTO GIFT VALUES(10,'가전제품','양쪽문냉장고',1000000);
-- 초기화 끝 -----------------------------

-- 예제1. CUSTOMER 테이블 전체 조회
SELECT * FROM CUSTOMER;

-- 예제2. 컬럼 순서를 변경하여 전체 조회 
SELECT NAME, ID, ADDRESS  FROM CUSTOMER;

-- 예제1. 순정렬하여 전체 조회
SELECT * FROM CUSTOMER ORDER BY ID ASC;

-- 예제2. 역정렬하여 전체 조회
SELECT * FROM CUSTOMER ORDER BY ID DESC;

-- 예제1. GIFT 테이블에서 그룹화하여 선물 조회 
SELECT TYPE FROM GIFT GROUP BY TYPE;

-- 예제2. 그룹화하여 집계된 선물의 건수, 합계 조회 
SELECT TYPE, COUNT(NAME) AS COUNT FROM GIFT GROUP BY TYPE; --건수
SELECT TYPE, SUM(price) AS SUM FROM GIFT GROUP BY TYPE; --합계

-- 비교 연산자
SELECT * FROM CUSTOMER WHERE ID=1;

SELECT * FROM CUSTOMER WHERE ID>1;

SELECT * FROM CUSTOMER WHERE ID<4;

SELECT * FROM CUSTOMER WHERE ID>=1;

SELECT * FROM CUSTOMER WHERE ID<=4;

SELECT * FROM CUSTOMER WHERE ID!=1;

-- 논리 연산자
SELECT * FROM CUSTOMER WHERE NAME='둘리' AND ADDRESS='서울';

SELECT * FROM CUSTOMER WHERE  ADDRESS='인천' OR ADDRESS='서울';

SELECT * FROM CUSTOMER WHERE NOT ADDRESS='서울' ;

--산술 연산자

SELECT ORDER_ID + (SALESMAN_ID * ORDER_ID) FROM ORDERS;
SELECT ORDER_ID * SALESMAN_ID AS HAP FROM ORDERS;
SELECT ORDER_ID / SALESMAN_ID AS NA FROM ORDERS;
SELECT ORDER_ID + SALESMAN_ID AS PLUS FROM ORDERS;
SELECT ORDER_ID - SALESMAN_ID AS MINUS FROM ORDERS;

--합성 연산자

SELECT 'SQL' || '개발자' FROM DUAL;
SELECT '이름:' || NAME || '입니다.' AS INTRO FROM CUSTOMER;

-- 범위 연산자
SELECT * FROM CUSTOMER WHERE ID BETWEEN 2 AND 4; 

SELECT * FROM CUSTOMER WHERE ID NOT BETWEEN 2 AND 4; 

SELECT * FROM CUSTOMER WHERE ID IN(1,2,3);

SELECT * FROM CUSTOMER WHERE ID NOT IN(1,2,3);

-- 패턴 연산자
SELECT * FROM CUSTOMER WHERE NAME LIKE '둘%';

SELECT * FROM CUSTOMER WHERE NAME LIKE '%길%';

SELECT * FROM CUSTOMER WHERE NAME LIKE '%치';

-- 빈값 체크 연산자
SELECT * FROM CUSTOMER WHERE ADDRESS IS NULL;

SELECT * FROM CUSTOMER WHERE ADDRESS IS NOT NULL;

-- 비교/논리 ------------------------------------------------------------------------
-- 퀴즈1. BOOK 테이블에서 가격이 11000원, 25000원 도서를 각각 찾으시오
SELECT * FROM BOOK WHERE PRICE = 11000;
SELECT * FROM BOOK WHERE PRICE = 25000;

-- 퀴즈2. BOOK 테이블에서 30000원 보다 비싼 도서를 찾으시오
SELECT * FROM BOOK WHERE PRICE >30000;

-- 퀴즈3. BOOK 테이블에서 10000이상 30000인 사이인 도서를 찾으시오
SELECT * FROM BOOK WHERE PRICE >=10000 AND PRICE <= 30000;

-- 퀴즈4. BOOK 테이블에서 출판사가 한빛미디어 또는 생능출판인 도서를 찾으시오
SELECT * FROM BOOK WHERE PUBLISHER ='한빛미디어' OR PUBLISHER = '생능출판';

-- 퀴즈5. ORDERS 테이블에서 2020년 1월 2일 이후에 들어온 주문를 찾으시오
SELECT * FROM ORDERS WHERE ORDER_DATE > '2022-01-02';

-- 퀴즈6. ORDERS 테이블에서 2020년 1월 1일에 들어온 주문를 찾으시오
SELECT * FROM ORDERS WHERE ORDER_DATE = '2022-01-01';
-- 범위 ------------------------------------------------------------------------
-- 퀴즈1. BOOK 테이블에서 10000이상 30000이하인 사이인 도서를 찾으시오
SELECT * FROM BOOK WHERE PRICE BETWEEN 10000 AND 30000; 

-- 퀴즈2. CONTACTS 테이블에서 김씨나 최씨 성을 가진 사람을 찾으시오
SELECT * FROM CONTACTS WHERE FIRST_NAME IN ('김','최');

-- 퀴즈3. GIFT 테이블에서 노트북, 벽걸이TV, 양쪽문냉장고를 찾으시오
SELECT * FROM GIFT WHERE NAME IN ('노트북','벽걸이TV','양쪽문냉장고');

-- 퀴즈4. GIFT 테이블에서 생활용품이거나 운동장비인 선물을 찾으시오
SELECT * FROM GIFT WHERE TYPE IN ('생활용품','운동장비');

-- 퀴즈5. GIFT 테이블에서 가격이 300000원과 600000원 사이인 선물을 찾으시오
SELECT * FROM GIFT WHERE PRICE BETWEEN 300000 AND 600000;

-- 패턴/빈값 ------------------------------------------------------------------------
-- 퀴즈1. CONTACTS 테이블에서 전화번호가 2341로 끝나는 사람을 찾으시오
SELECT * FROM CONTACTS WHERE PHONE LIKE '%2341';

-- 퀴즈2. CONTACTS 테이블에서 전화번호가 3171을 포함하는 사람을 찾으시오
SELECT * FROM CONTACTS WHERE PHONE LIKE '%3171%';

-- 퀴즈3. CONTACTS 테이블에서 이메일을 네이버를 사용하면서 전화번호가 없는 사람을 찾으시오
SELECT * FROM CONTACTS WHERE EMAIL LIKE '%@naver.com%' AND PHONE IS NULL;

-- 퀴즈4. GIFT 테이블에서 이름에 용품이 포함된 선물을 찾으시오
SELECT * FROM GIFT WHERE NAME LIKE '%용품%';

-- 퀴즈5. GIFT 테이블에서 이름이 세트로 끝나면서 300000원이하인 선물을 찾으시오
SELECT * FROM GIFT WHERE NAME LIKE '%세트' AND PRICE <=300000;
