--CREATE TABLE EMP (
--    NO NUMBER,
--    NAME VARCHAR2(20),
--    AGE NUMBER
--);


--CREATE TABLE ORDERS(
--    ORDER_ID NUMBER PRIMARY KEY,
--    SALESMAN_ID NUMBER,
--    ORDER_DATE DATE NOT NULL -- ��¥���� DATE ����
--)

-- QUIZ 1.
--CREATE TABLE CATEGORIES(
--    CATEORY_ID NUMBER PRIMARY KEY,
--    CATEGORY_NAME VARCHAR2(100) NOT NULL
--);
-- QUIZ 2.
--CREATE TABLE LOCATION(
--    LOCATION_ID NUMBER PRIMARY KEY,
--    ADDRESS VARCHAR2(255) NOT NULL,
--    POSTAL_CODE VARCHAR2(20),
--    CITY VARCHAR2(50) 
--);


--INSERT
--INSERT INTO customer(ID, NAME, ADDRESS) VALUES(1, '�Ѹ�', '��õ');
--INSERT INTO customer VALUES(2, '�Ѹ�', '��õ'); 
--INSERT INTO CUSTOMER (ID, NAME) VALUES(3, '��ġ'); 
--INSERT INTO CUSTOMER (ID, NAME) VALUES(4,  '��ġ' ); 
--INSERT INTO CUSTOMER (ID, ADDRESS) VALUES(5, '����'); 
--INSERT INTO CUSTOMER VALUES (5, '�Ѹ�', '');
--INSERT INTO CUSTOMER VALUES(6,'ȫ�浿',NULL);
--INSERT INTO CUSTOMER (ID, NAME) VALUES(3, 'ȫ�浿'); -- 
--INSERT INTO CUSTOMER (ID) VALUES(6);

--CREATE TABLE CUSTOMER(
--    ID NUMBER PRIMARY KEY,
--    NAME VARCHAR2(20) NOT NULL,
--    ADDRESS VARCHAR2(10),
--    ADDRESS CHAR(10)
--); -- CUSTOMER NAME VARCHAR20 - �ѱ� 6�� �Է� ����? 
--
--INSERT INTO CUSTOMER VALUES(7, 'ȫ�浿ȫ�浿', NULL);
--
--select * from nls_database_parameters where parameter = 'NLS_CHARACTERSET';

--NUMBER (P : �ִ� ��ȿ �ڸ���, S: �Ҽ� �ڸ���) ���� ���� ����!
--IF
--NUMBER(3) -> 3BYTE ���, (���� 3�ڸ�)
--NUMBER(5,2) -> ��ü 5�ڸ� Ȯ��, ���� 3�ڸ� �Ҽ��� ���� 3�ڸ��ļ� �ݿø��ؼ� 2��° �ڸ����� ǥ��
--NUMBER(5,-1) -> ��ü 5�ڸ� Ȯ��, ���� 3�ڸ� �Ҽ��� ���� ù�ڸ��� �ݿø� ��)
-- �ڸ����� 5�ڸ��� �Ѿ���� ������ �ȴ�. 5�ڸ��� �Ѿ�� �Ǹ� �ڿ� �ִ� �ڸ��� �߸��� ��.

--FLOAT
--�Ǽ������� �Ҽ��� �����͸� ������. 
--FLOAT(3) -> 3BYTE��� (�Ҽ����� ������ 3�ڸ�)

CREATE TABLE EMP2(
    EMPNO NUMBER (5) NOT NULL, -- 5�ڸ� ����
    NUM1 NUMBER(6), --5�ڸ��� ����
    NUM2 NUMBER(6,2), -- 5�ڸ��� ���� 
    -- (������ 3�ڸ�, �Ҽ����� 2�ڸ�, ����ΰ�쿡�� �Ҽ��� ���� 3��° �ڸ����� �ݿø� 12345.11 << �̷��� �� ��.)
    NUM3 NUMBER(5,-3)  -- 5�ڸ��� ���� ( -1��° �ڸ� ���� �� �ؿ� �ڸ����� �ݿø� ��. ��, 1�� �ڸ�(�Ҽ��� ���� ù�ڸ�) ���� �ݿø� ��)
);

INSERT INTO EMP2 VALUES(12345, 144343, 114.1443, 1124450.1567);


--DATE, TIMESTAMP
--
--DATE : ���� �������� ����, ��, �� , ��, ��, �ʱ��� �Է� ����.
--TIMESTAMP : ����, ��, ��, ��, ��, ��, �и���, �ð��� �Է� ����.


-- ALTER - �÷��� �߰��ϰų� ����, �Ӽ��� ������.
--�÷� ������ �߰�(ADD), �÷��� ����(RENAME), �÷� ũ�� ����(MODIFY), 

--ALTER TABLE CUSTOMER ADD GENDER VARCHAR2(9); -- �÷��߰�
--ALTER TABLE CUSTOMER RENAME COLUMN GENDER TO GEN; -- �÷��� ����
--ALTER TABLE CUSTOMER RENAME COLUMN GEN TO GENDER; -- �÷��� ����
--ALTER TABLE CUSTOMER MODIFY GENDER VARCHAR2(100); -- �÷� VARCHAR2 ũ�� ����
--ALTER TABLE CUSTOMER MODIFY GENDER VARCHAR2(100) DEFAULT 'NONE' NOT NULL;
-- ���̺� ũ�� ����, ����Ʈ, NOT NULL ����.
--ALTER TABLE CUSTOMER DROP COLUMN GENDER;  -- �÷� ����
--INSERT INTO CUSTOMER VALUES(8, 'ȫ�浿', '��õ', 'TEST');

--ALTER TABLE CUSTOMER MODIFY GENDER NUMBER; --������ Ÿ�� ����
--COMMENT ON COLUMN customer.gender IS '����'; -- ���� �ޱ�


-- 12.7 quiz
ALTER TABLE EMP ADD SALARY NUMBER;
ALTER TABLE EMP MODIFY SALARY NOT NULL;
COMMENT ON COLUMN emp.age IS '�ڸ�Ʈ' ;
COMMENT ON COLUMN emp.NAME IS '�ڸ�Ʈ' ;
COMMENT ON COLUMN emp.SALARY IS '�ڸ�Ʈ' ;
COMMENT ON COLUMN emp.NO IS '�ڸ�Ʈ' ;

ALTER TABLE ORDERS ADD CUSTOMER_NAME VARCHAR(50) NOT NULL;
ALTER TABLE ORDERS MODIFY SALESMAN_ID VARCHAR(50);
ALTER TABLE ORDERS RENAME COLUMN SALESMAN_ID TO SALESMAN_NAME;
ALTER TABLE ORDERS MODIFY ORDER_DATE NULL;

COMMENT ON COLUMN orders.customer_name IS '�ڸ�Ʈ';
COMMENT ON COLUMN orders.order_date IS '�ڸ�Ʈ';
COMMENT ON COLUMN orders.order_id IS '�ڸ�Ʈ';
COMMENT ON COLUMN orders.salesman_name IS '�ڸ�Ʈ';

-- ���̺� ����
DROP TABLE EMP;
DROP TABLE EMP2;
DROP TABLE ORDERS;
DROP TABLE LOCATION;
DROP TABLE CUSTOMER;
DROP TABLE CATEGORIES;

INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES (1001, 1002, SYSDATE); -- ����ð� SYSDATE
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES (1002, 1003, '2022-10-13'); -- Ư���ð��� ���� �� ����
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES (1003, 1002, TO_DATE('2022-10-13', 'YYYY-MM-DD')); --TO_DATE, ������ ��¥�� ���� �ۼ�
INSERT INTO ORDERS(ORDER_ID, SALESMAN_ID, ORDER_DATE) VALUES (1004, 1002, TO_DATE('2022-10-13 12:00:00', 'YYYY-MM-DD HH24:MI:SS')); --TO_DATE, ������ ��¥�� ���� �ۼ� (�ʱ���!)

--QUIZ 1
CREATE TABLE BOOK(
BOOK_NO NUMBER PRIMARY KEY,
TITLE VARCHAR2(100),
PUBLISHER VARCHAR2(100),
PRICE NUMBER
);

--QUIZ 2
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (1, '����1', '��󸶴�', 30000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (2, '����2', '��󸶴�', 30000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (3, '��������������Ʈ', '�Ѻ��̵��', 50000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (4, '�ڹٰ��ߵ���', '��������', '');

--QUIZ 3
INSERT INTO EMP (NO, NAME, AGE) VALUES('','','');
INSERT INTO EMP (NO, NAME, AGE) VALUES('1','','');
INSERT INTO EMP (NO, NAME, AGE) VALUES('','����','10');
INSERT INTO EMP (NO, NAME, AGE) VALUES('1','����',10);
INSERT INTO EMP (NO, NAME, AGE) VALUES(1,'����',10);

--QUIZ 4
CREATE TABLE CONTACT(
CONTACT_NO   NUMBER PRIMARY KEY,
FIRST_NAME     VARCHAR2(100),
LAST_NAME      VARCHAR2(100),
EMAIL             VARCHAR2(100),
PHONE            VARCHAR2(100)
);

INSERT INTO CONTACT (CONTACT_NO, FIRST_NAME, LAST_NAME,EMAIL,PHONE) VALUES(1, '��','����','flor.stone@gmail.com','010-3171-2341');
INSERT INTO CONTACT (CONTACT_NO, FIRST_NAME, LAST_NAME,EMAIL,PHONE) VALUES(2, '��','�ÿ�','lavera.emerson@gmail.com','010-3171-4111');
INSERT INTO CONTACT (CONTACT_NO, FIRST_NAME, LAST_NAME,EMAIL,PHONE) VALUES(3, '��','��ȣ','shyla.ortiz@gmail.com','010-3171-4126');
INSERT INTO CONTACT (CONTACT_NO, FIRST_NAME, LAST_NAME,EMAIL,PHONE) VALUES(4, '��','����','jeni.levy@gmail.com','010-8121-2341');
INSERT INTO CONTACT (CONTACT_NO, FIRST_NAME, LAST_NAME,EMAIL,PHONE) VALUES(5, '��','����','fern.head@gmail.com','');

--QUIZ 5
CREATE TABLE CALENDER(
MONTH       NUMBER,
DAY_WEEK    DATE,
DAY            DATE
);

ALTER TABLE CALENDER ADD MONTH NUMBER;
ALTER TABLE CALENDER MODIFY MONTH VARCHAR2(10);
ALTER TABLE CALENDER MODIFY DAY_WEEK VARCHAR2(10);
ALTER TABLE CALENDER MODIFY DAY VARCHAR2(10);

INSERT INTO CALENDER (MONTH, DAY_WEEK, DAY) VALUES('1', '��', '1');
INSERT INTO CALENDER (MONTH, DAY_WEEK, DAY) VALUES('1', '��', '2');
INSERT INTO CALENDER (MONTH, DAY_WEEK, DAY) VALUES('1', 'ȭ', '3');
INSERT INTO CALENDER (MONTH, DAY_WEEK, DAY) VALUES('1', '��', '4');
INSERT INTO CALENDER (MONTH, DAY_WEEK, DAY) VALUES('1', '��', '5');
INSERT INTO CALENDER (MONTH, DAY_WEEK, DAY) VALUES('1', '��', '6');
INSERT INTO CALENDER (MONTH, DAY_WEEK, DAY) VALUES('1', '��', '7');

--QUIZ 6
CREATE TABLE GIFTSET(
NO NUMBER PRIMARY KEY,
NAME VARCHAR2(100),
PRICE NUMBER
);

INSERT INTO GIFTSET (NO, NAME, PRICE) VALUES(1, '��ġ��Ʈ', 10000);
INSERT INTO GIFTSET (NO, NAME, PRICE) VALUES(2, '��Ǫ��Ʈ', 20000);
INSERT INTO GIFTSET (NO, NAME, PRICE) VALUES(3, '������ǰ��Ʈ', 30000);
INSERT INTO GIFTSET (NO, NAME, PRICE) VALUES(4, '�ֹ��ǰ��Ʈ', 40000);
INSERT INTO GIFTSET (NO, NAME, PRICE) VALUES(5, '��ǿ뼼Ʈ', 50000);
INSERT INTO GIFTSET (NO, NAME, PRICE) VALUES(6, 'LCD�����', 60000);
INSERT INTO GIFTSET (NO, NAME, PRICE) VALUES(7, '��Ʈ��', 70000);
INSERT INTO GIFTSET (NO, NAME, PRICE) VALUES(8, '������ TV', 80000);
INSERT INTO GIFTSET (NO, NAME, PRICE) VALUES(9, '�巳��Ź��', 90000);
INSERT INTO GIFTSET (NO, NAME, PRICE) VALUES(10, '���ʹ������', 1000000);

--UPDATE

--UPDATE ���̺� �̸� SET �ٲ��÷� = ������ �� WHERE �÷� = ���� ��.
 --UPDATE CUSTOMER SET ADDRESS = '����' -- �̷��� �ϸ� ADDRESS ��ü�� '����'�� �ٲ�� ��.
UPDATE CUSTOMER SET ADDRESS = '����' WHERE ID = 2; -- CUSTOMER���� 'ID'�� '2'�� �÷��� ���� �ٲ�.

-- SET �� 2�� ���ÿ� �ֱ�
 UPDATE CUSTOMER SET NAME = '����', ADDRESS = '���ֵ�' WHERE ID = 3; 
 -- SET �ڿ� �ٲ��÷� = ������ ��, �ٲ��÷� = ������ �� �ΰ��� �־ �ΰ� ���� �Ѳ����� �ٲ� �� �־���.

-- DATE�� ORDER DATE �� ���� ���� ��¥�� �ٲٱ� 
UPDATE ORDERS SET ORDER_DATE = SYSDATE WHERE ORDER_ID=1002;

UPDATE ORDERS SET ORDER_DATE = SYSDATE WHERE SALESMAN_ID=1002;
 -- SALESMAN_ID �� ���� ��� ���̵��� ���ÿ� �ٲ�, �� �ϳ��� �����Ǿ��ִ°� �ƴ϶� ������ �� �ٲٰ� �������� ���� �پ��ϰ� ��� ����


--DELETE 

--DELETE FROM ���̺� �̸� WHERE �÷� = Ư����
DELETE FROM CUSTOMER WHERE ID=4; -- CUSTOMER �ȿ��� ID�� 4���� �ָ� ����
DELETE FROM CUSTOMER WHERE NAME='�Ѹ�'; -- CUSTOMER �ȿ��� NAME�� '�Ѹ�'�� �ֵ��� ����
DELETE FROM CUSTOMER; -- CUSTOMER ��ü �� ����

-- ���ǹ��� AND.
DELETE FROM ORDERS WHERE ORDER_ID = 1001 AND SALESMAN_ID = 2002;
-- ORDER_ID�� 1001, SALESMAN_ID�� 2002�ΰ�� ���ش�.

--QUIZ1
UPDATE BOOK SET TITLE = '�ڹٰ��ߵ���' WHERE BOOK_NO = 4;
--QUIZ 2
UPDATE BOOK SET PRICE = 30000 WHERE PUBLISHER = '��󸶴�';
--QUIZ 3
UPDATE CUSTOMER SET NAME = '�Ѹ�', ADDRESS = '��õ';

--DELETE QUIZ 1
DELETE FROM BOOK WHERE TITLE = '����2' AND PUBLISHER = '��󸶴�';
--QUIZ 2
DELETE FROM BOOK WHERE BOOK_NO = '3'; 
--QUIZ 3
DELETE FROM BOOK WHERE PRICE IS NULL; 
--QUIZ 4
DELETE FROM BOOK 

DROP TABLE CUSTOMER;
CREATE TABLE CUSTOMER (
    ID      NUMBER PRIMARY KEY,
    NAME    VARCHAR2(20) NOT NULL,
    ADDRESS VARCHAR2(100)
);
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(1, '�Ѹ�', '��õ');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(2, '�Ѹ�', '����');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(3, 'ȫ�浿','����');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(4, '��ġ', '���ֵ�');
INSERT INTO CUSTOMER(ID, NAME, ADDRESS) VALUES(5, '�����', '');
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
    BOOK_NO NUMBER PRIMARY KEY, --������ȣ
    TITLE VARCHAR2(100) NOT NULL, --����
    PUBLISHER VARCHAR2(100), --���ǻ�
    PRICE NUMBER --����
);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (1, '����1', '��󸶴�', 10000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (2, '����2', '��󸶴�', 11000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (3, '��������������Ʈ', '�Ѻ��̵��', 50000);
INSERT INTO BOOK (BOOK_NO, TITLE, PUBLISHER, PRICE) VALUES (4, '�ڹ����α׷���', '��������', 25000);
 DROP TABLE CONTACTS;
 CREATE TABLE CONTACTS 
  (
    CONTACT_NO NUMBER PRIMARY KEY,
    FIRST_NAME  VARCHAR2( 255 ) NOT NULL,
    LAST_NAME   VARCHAR2( 255 ) NOT NULL,
    EMAIL       VARCHAR2( 255 ) NOT NULL,
    PHONE       VARCHAR2( 20 )         
  );



--==== SELECT===== ----
--SELECT * FROM ���̺��̸�

SELECT * FROM CUSTOMER; -- ��� �÷��� �� �����´�

SELECT NAME FROM CUSTOMER; -- �ش� �÷��� �����´�.

SELECT ID, NAME FROM CUSTOMER; -- ���� ������� ��µȴ�.

-- SELECT ORDER BY (����)
--SELECT * FROM ���̺��̸� ORDER BY �÷� ASC -> ������
--SELECT * FROM ���̺��̸� ORDER BY �÷� DESC -> ������

SELECT * FROM CUSTOMER ORDER BY ID ASC; -- ��������
SELECT * FROM CUSTOMER ORDER BY ID DESC; -- ��������
SELECT * FROM CUSTOMER ORDER BY ADDRESS DESC;  -- NULL���� �׻� �� �������� ����.

-- �׷�ȭ
--SELECT * FROM ���̺��̸� GROUP BY �׷�ȭ �� �÷�
SELECT * FROM GIFT;
SELECT NAME FROM GIFT GROUP BY NAME;

SELECT NAME AS CUS FROM CUSTOMER; -- CUS��� ��Ī�� �ٿ��� �׷�ȭ �����ְ� ��.
SELECT TYPE, SUM(PRICE) AS SUM FROM GIFT GROUP BY TYPE; -- �׷�ȭ �� ���̵��� �ջ�� ���� ��� SUM�̶�� ��Ī�� �ٿ��� ���ش�.
-- TYPE�� 
SELECT TYPE, COUNT(TYPE) AS COUNT FROM GIFT GROUP BY TYPE; -- �׷�ȭ �� ���̵��� ������ ��� COUNT ��� ��Ī�� �ٿ��� ���ش�.
SELECT TYPE, COUNT(NAME) AS COUNT FROM GIFT GROUP BY TYPE;
-- TYPE�� NAME�� ������ GIFT���� �����ͼ�, COUNT�� ��Ī�� �ٿ��ش�. �̰� TYPE���� �׷�ȭ �����ش�



-- WHERE ���ǰ˻�
-- �񱳿�����, ��������, ��������� -> �ڹٿ� ������.
-- ���ڿ� ���ڸ� ������ �� ����ϴ� �ռ�������

-- �񱳿�����
SELECT * FROM CUSTOMER WHERE ID = 1;
SELECT * FROM CUSTOMER WHERE ID > 1; -- ID 2,3,4,5 ���
SELECT * FROM CUSTOMER WHERE ID < 4; -- ID 1,2,3 ���
SELECT * FROM CUSTOMER WHERE ID >= 1;
SELECT * FROM CUSTOMER WHERE ID  <= 4;
SELECT * FROM CUSTOMER WHERE ID  !=1;

SELECT * FROM CUSTOMER WHERE NAME  = '�Ѹ�'; -- NAME �� '�Ѹ�'�� �ֵ� ���
SELECT * FROM CUSTOMER WHERE NAME > '�Ѹ�'; -- �Ѷ󺸴� ���� �ֵ� (��,��,�� ����)
SELECT * FROM CUSTOMER WHERE NAME < '�Ѹ�'; -- �Ѹ����� �Ʒ��� �ֵ� (��,��,�� ����)

SELECT * FROM ORDERS WHERE ORDER_DATE = '22/01/01'; -- 1�� 1���� �ֵ� 
SELECT * FROM ORDERS WHERE ORDER_DATE > '22/01/01'; -- 1�� 1�� ������ �ֵ�

SELECT * FROM CUSTOMER WHERE NAME = '�Ѹ�' AND ADDRESS = '����'; -- �Ѹ��鼭 ������ �ָ� ���
SELECT * FROM CUSTOMER WHERE ADDRESS = '��õ' OR ADDRESS = '����'; -- ADDRESS�� ��õ Ȥ�� ������ �ָ� ���
SELECT * FROM CUSTOMER WHERE NOT ADDRESS = '����'; -- ADDRESS�� ������ �ƴ� �ָ� ��� 
-- �ٵ�, �� NULL ���� �ִ� �ȳ�����? �׳� ���� ��� �ƿ� ���������� �ʴ´�! �ƿ� ����!

SELECT * FROM ORDERS;
SELECT ORDER_ID + SALESMAN_ID FROM ORDERS;  -- �� ID���� ���� ���, ��Ī�� ������ �ȵ�� AS�� ��Ī�� �����ָ� ��.
SELECT ORDER_ID + SALESMAN_ID AS PLUS FROM ORDERS; 
SELECT (ORDER_ID + SALESMAN_ID) * ORDER_ID AS PLUS FROM ORDERS; -- () �̿��� �켱���� ����

--||

SELECT NAME AS INTRO FROM CUSTOMER;
SELECT '�̸� : ' || NAME || '�Դϴ�.' AS INTRO FROM CUSTOMER;
-- �ڹ��� +�� �����ϴ� ||, ���ڿ� ������ ������.

-- 53������
-- SELECT QUIZ1.
SELECT TITLE,PRICE FROM BOOK WHERE PRICE = 11000;
SELECT TITLE,PRICE FROM BOOK WHERE PRICE = 25000;
--QUIZ 2. 
SELECT TITLE,PRICE FROM BOOK WHERE PRICE > 30000;
--QUIZ 3.
SELECT TITLE,PRICE FROM BOOK WHERE PRICE > 10000 AND PRICE <=30000;
--QUIZ 4. 
SELECT TITLE,PUBLISHER FROM BOOK WHERE PUBLISHER = '�Ѻ��̵��' OR PUBLISHER = '��������' ;
--QUIZ 5.
SELECT * FROM ORDERS WHERE ORDER_DATE > '2022/01/02';
    -- �� �ϳ��� ���
    SELECT * FROM ORDERS WHERE ORDER_DATE > TO_DATE('2022/01/02','YYYY/MM/DD');
    -- ����
    SELECT * FROM ORDERS WHERE ORDER_DATE < SYSDATE;
--QUIZ 6.
SELECT * FROM ORDERS WHERE ORDER_DATE > '2022/01/01';

-- ���� ������
-- BETWEEN , NOT BETWEEN, IN, NOT IN

SELECT * FROM CUSTOMER WHERE ID BETWEEN 2 AND 4; -- ID ���� 2�� 4 ������ ���̵��� �ҷ��´�.
SELECT * FROM CUSTOMER WHERE ID NOT BETWEEN 2 AND 4; -- ID ���� 2�� 4 ����'�� �ƴ�' ���̵��� �ҷ��´�.
SELECT * FROM CUSTOMER WHERE ID IN (1,2,3); -- ID�� ���� 1,2,3�� ���̵��� �ҷ��´�.
SELECT * FROM CUSTOMER WHERE ID NOT IN (1,2,3); -- ID�� ���� 1,2,3'�� �ƴ�' ���̵��� �ҷ��´�.

-- ���Ͽ����� LIKE, �ش� ���ڿ��� �����ϸ� �˻��Ѵ�.
 SELECT * FROM CUSTOMER WHERE NAME LIKE '��%'; -- '��'�� �����ϴ� ���� ���
 SELECT * FROM CUSTOMER WHERE NAME LIKE '%��%'; -- '�߰��� ����' ���� ���� ���
 SELECT * FROM CUSTOMER WHERE NAME LIKE '%ġ'; -- 'ġ'�� ������ ���� ���

-- �� üũ ������
-- IS NULL
-- IS NOT NULL

SELECT * FROM CUSTOMER WHERE ADDRESS IS NULL; -- ADDRESS ���� NULL�� ���̸� ���
SELECT * FROM CUSTOMER WHERE ADDRESS IS NOT NULL; -- ADDRESS ���� NULL�� �ƴ� ���̸� ���.

-- 55������
--QUIZ 1
SELECT * FROM BOOK WHERE PRICE BETWEEN 10000 AND 30000;
--2
SELECT * FROM CONTACT WHERE FIRST_NAME IN ('��','��');
--3
SELECT * FROM GIFT WHERE NAME IN ('��Ʈ��','������ TV','���ʹ������');
--4
SELECT*FROM GIFT WHERE TYPE IN ('��Ȱ��ǰ','����');
--5
SELECT*FROM GIFT WHERE PRICE BETWEEN 300000 AND 600000;

--57 ������
--QUIZ 1
SELECT*FROM CONTACT WHERE PHONE LIKE '%2341';
--2
SELECT*FROM CONTACT WHERE PHONE LIKE '%3171%';
--3
SELECT*FROM CONTACT WHERE EMAIL LIKE '%@naver.com' and PHONE IS NULL;
--4
SELECT*FROM GIFT WHERE TYPE LIKE '%��ǰ'; 
--5
SELECT*FROM GIFT WHERE NAME LIKE '%��Ʈ%' AND PRICE<=300000;


--�Լ� : ����� �������ִ� ���̵�.
-- �����Լ� CHR, LOWER UPPER LTRIM RTRIM TRIM

-- DUAL ����?
SELECT CHR(65) FROM DUAL; -- �빮�� A ���.
SELECT LOWER ('JENNIE') FROM DUAL; -- �ҹ��� jennie ���
SELECT UPPER (EMAIL) FROM CONTACT; -- EMAIL�ȿ� �ִ� �ҹ��ڵ� �빮�ڷ� ��ȯ

SELECT LTRIM ('   JENNIE') FROM DUAL; -- ���ʿ� �ִ� ���� ����
SELECT LTRIM ('����ũ', '��') FROM DUAL; -- '��ũ' ���,  (�߰� ���� �������) ���ʺ��� ��ġ�ϴ� �ܾ� ���� �� �¸� ������
SELECT RTRIM ('JENNIE       ') FROM DUAL; -- ������ �ִ� ���� ����
SELECT RTRIM ('����ũ', '��ũ') FROM DUAL; -- '��' ���.
SELECT TRIM ('           JEN   NIE              ') FROM DUAL; -- ���ʿ� �ִ� ���� ����, ���ڿ� ���̿� �ִ� ������ ���� ����.
SELECT TRIM (LEADING '��' FROM '����ũ') FROM DUAL; -- '����ũ' ���, ���ڿ��� ���� �� ���ʿ������� �񱳸� �ؼ�, �´� ���ڸ� ������. 
-- �ڿ������� ���ϰ� ���� ���
SELECT TRIM (TRAILING 'ũ' FROM '����ũ') FROM DUAL; --'����' ���, �ڿ������� ���Ÿ� ��.
SELECT TRIM (BOTH '��' FROM '����ũ��') FROM DUAL; -- '����ũ' ���, �յ� ���ʿ��� Ȯ���ϰ� ������.

SELECT SUBSTR('����ũ����', 3,2)FROM DUAL ; -- '��ũ' ���, ������, �߶��� ����. '��'���� 2���ϱ� '��ũ'�� �߶� ������
SELECT SUBSTR('����ũ����', 3)FROM DUAL ; -- '��ũ����' ���. �ϳ��� ���� ��� ���������� �������� �߶� ������.

SELECT LENGTH('����ũ����') FROM DUAL; -- ���ڿ��� ���� 4 ���
SELECT REPLACE('����ũ����', '����','����') FROM DUAL;  -- '����ũ����' ���. �־��� ���ڿ�����, Ư�� ����, �ٸ� ������ �ٲ�.
SELECT REPLACE('����ũ����', '����') FROM DUAL; -- '����ũ' ���, �ٲ� ���� ���� ��� �׳� �ܼ��� �����⸸ ��.
-- �������
SELECT REPLACE(LAST_NAME, '��') FROM CONTACT; -- '��' ���, '��' �� �ִ� ���̰� ������ ��.
SELECT REPLACE(LAST_NAME, '��', '��') FROM CONTACT; -- '���' ���, '��' �� '��'�� ��ü ��.


-- ======================================================12/ 8 ���� ==========================================================

-- ABS, SIGN, ROUND, TRUNC, CEIL, FLOOD, MOD
SELECT ABS(-1) FROM DUAL; -- ���� ���밪 ��ȯ
SELECT SIGN(-1) FROM DUAL; 

SELECT ROUND (163.37, 1) FROM DUAL; -- 163.37�� �Ҽ� ù°�ڸ� ������ ��Ÿ����, �������� �ݿø��ϰڴٴ� �ǹ�, 163.4 ��ȯ
SELECT ROUND (163.37, -2) FROM DUAL; -- 163.37�� 100�� �ڸ��� ��Ÿ���� 10�� �ڸ����� �ݿø��ϰڴٴ� �ǹ�, 200 ��ȯ
SELECT TRUNC(54.29, 1) FROM DUAL; -- 54.2������ ��Ÿ���� �������� �����ڴٴ� �ǹ�. 54.2 ��ȯ
SELECT TRUNC(54.29, -2) FROM DUAL; -- 100�� �ڸ��� ��Ÿ���� �������� �����ڴٴ� �ǹ�. 0 ��ȯ.
SELECT CEIL(54.29) FROM DUAL; -- �Ҽ����� �� ������ ������ �ø����ְڴٴ� �ǹ�. 55 ��ȯ
SELECT FLOOR(54.29) FROM DUAL; -- �Ҽ����� ������ ����. 54 ��ȯ.
SELECT MOD (15,7) FROM DUAL;  -- 15�� 7�� ���� ���� �������� ��ȯ��. 1 ��ȯ.
-- MOD�� 2��° ���� 0�� ��� 1��° ���� �״�� ���� ��.

-- ��¥ (EXTRACT, ADD_MONTHS)
SELECT EXTRACT(YEAR FROM SYSDATE) AS YEAR FROM DUAL; -- 2022�� ���. (���� �ý��� �⵵���� �⿡ �ش�Ǵ� ������ ��ȯ)
SELECT EXTRACT(YEAR FROM ORDER_DATE) AS YEAR FROM ORDERS;
SELECT EXTRACT(MONTH FROM ORDER_DATE) AS MON FROM ORDERS;
SELECT EXTRACT(DAY FROM ORDER_DATE) AS DA FROM ORDERS;

SELECT ADD_MONTHS(TO_DATE('2021-12-31', 'YYYY-MM-DD'), -1) FROM DUAL; -- 21/11/30 ��ȯ.  ADD_MONTHS(��¥ ����, +-�� �Ⱓ) ���·� ��. 
-- 11���� 31���� ���� ������, 11���� ������ ���� 11�� 30���� ��ȯ�ȴ�.
SELECT ADD_MONTHS(TO_DATE('2021-12-31', 'YYYY-MM-DD'), +1) FROM DUAL; -- 22/1/31 ��ȯ. 


-- ����� ����ȯ �Լ� (TO_NUMBER, TO_CHAR, TO_DATE)
SELECT TO_NUMBER ('1234') FROM DUAL; -- 1234 ��ȯ. 
SELECT TO_NUMBER ('������') FROM DUAL; -- ������
SELECT TO_CHAR(1234) FROM DUAL;
SELECT TO_CHAR(SYSDATE) FROM DUAL; -- ��¥���� �ƴ�, ���������� ��¥�� ��Ÿ��.
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL; -- ������ ���·� ��¥�� ��Ÿ��.
SELECT TO_DATE('2022-12-31', 'YYYY-MM-DD') FROM DUAL;

-- NULL ���� �Լ� (NVL, NULLIF, COALESCE)
SELECT NAME, NVL(ADDRESS,  '�ּҾ���') FROM CUSTOMER; -- ADDRESS ���� NULL �� ��� '�ּҾ���' ���� ��ü�Ǿ� ��ȯ ��.
SELECT NAME, NULLIF (ADDRESS, '��õ') FROM CUSTOMER; -- ADDRESS���� '��õ' �� ��� 'NULL'�� ��ü�Ǿ� ��ȯ ��.

SELECT NAME, COALESCE(NAME, ADDRESS) FROM CUSTOMER; -- NULL�� �ƴ� ���� ���� ��ȯ�Ѵ�. ��, NAME�� ���� NULL�� �ƴϱ� ������ NAME���� �״�� ������.
SELECT NAME, COALESCE(ADDRESS, NAME) FROM CUSTOMER; -- ������ ����� (������ �ٲ�� �״�� �����Ѵ�)


--DECODE, CASE (IF, ELSE IF�� �����ϴ�!)
SELECT ID, DECODE(ID, 1, 'BLUE', 2, 'RED', 3,'YELLOW',4,'BLACK',5,'WHITE') FROM CUSTOMER; 
    -- ID���� 1�̸� ���, 2���� ����, 3�̸� ���ο�, 4�� ��, 5�� ȭ��Ʈ -> �� ELSE������ ����ϰ� ����
SELECT ID, 
    CASE WHEN ID = 1 THEN 'BLUE'
     WHEN ID = 2 THEN 'RED'
      WHEN ID = 3 THEN 'YELLOW'
       WHEN ID = 4 THEN 'BLACK'
        ELSE 'WHITE'
        END
FROM CUSTOMER;
    
-- �Լ� QUIZ
 -- 1 : 3
 SELECT MOD(-15,0) FROM DUAL; 
 -- 2 : 1
 -- 3 : 3
 -- 4 : 2
-- 5 
SELECT NAME, 
 CASE WHEN NAME = '�Ѹ�' THEN 'BLUE'
 WHEN NAME = '��ġ' THEN 'RED'
 ELSE 'WHITE'
 END
 FROM CUSTOMER;
 
 -- �⺻Ű /  �ܷ�Ű (PK, FK - �θ��ڽ�!)
 
    -- �μ�(�θ�) ���̺� ����
    CREATE TABLE DEPT(
        DEPT_NO NUMBER PRIMARY KEY, -- �μ� ��ȣ (PK)
        DEPT_NAME VARCHAR2(20) NOT NULL, -- �μ���
        DEPT_ADDRESS VARCHAR2(100)   -- �μ��ּ�
    );
 
 INSERT INTO DEPT VALUES (1, '�λ��', '');
 INSERT INTO DEPT VALUES (2, '������', '');
 INSERT INTO DEPT VALUES (3, 'ȫ����', '');
 INSERT INTO DEPT VALUES (4, '���ߺ�', '');
 
 SELECT * FROM DEPT;
    
    -- ���(�ڽ�) ���̺� ����
    CREATE TABLE EMP(
        EMP_NO NUMBER PRIMARY KEY, -- �����ȣ (PK)
        EMP_NAME VARCHAR2(20) NOT NULL, -- �����
        DEPT_NO NUMBER NOT NULL, -- �μ���ȣ
        CONSTRAINT FK_DEPT_NO FOREIGN KEY(DEPT_NO) REFERENCES DEPT(DEPT_NO)
--  CONSTRAINT FK_�����Ϸ��� �÷��̸� FOREIGN KEY(�ڽ� ���̺� FK �����Ϸ��� �÷� �̸�) REFERENCES �θ����̺� (�����Ϸ��� �÷� �̸�)
    );   
    
INSERT INTO EMP VALUES(1001, '����ȭ', 3); -- DEPT_NO �μ���ȣ �����ϴ� ����, �μ����̺��� DEPT_NO�ȿ� ���� �ʴ� �����ʹ� ���� �� ����.
INSERT INTO EMP VALUES(1002, '����', 1);
INSERT INTO EMP VALUES(1003, '���', 2);
INSERT INTO EMP VALUES(1004, '���', 4); -- FK�� �����ϴ� ���� ���� ���, ������ ���ϴ�. ���Ἲ �������� ����. �ذ��Ϸ��� �θ� ���̺� �����ϴ� ���� �߰������ ��.

UPDATE EMP SET DEPT_NO = 10 WHERE EMP_NAME = '����ȭ'; -- ���Ἲ ��������. UPDATE �Ҷ��� ���� ���� DEPT_NO�� �������ϸ�! 
UPDATE EMP SET DEPT_NO = 4 WHERE EMP_NAME = '����ȭ';
DELETE FROM DEPT WHERE DEPT_NO = 1;  --��������. DEPT_NO=1�� ���̸� �ڽ� ���̺��� ����ϰ� �ֱ� ������!

DELETE FROM EMP WHERE DEPT_NO = 1;
DELETE FROM DEPT WHERE DEPT_NO = 1; -- ���������� �� �ȴ�. ������� �÷��� �ڽ����̺��� ���� �����, �θ����̺��� �������ϱ�!

DROP TABLE EMP; -- 2. �׷��� �����ϰ� �ִ� �ڽ� ���̺��� ���� ��������Ѵ�.
DROP TABLE DEPT; -- 1. �����ǰ� �ִ� �ڷᰡ �ֱ� ������, �θ� ���̺��� ���� ���ټ��� ����.

DROP TABLE DEPT CASCADE CONSTRAINTS; -- �������� �� �����ϰ� �θ����̺��� ���� ���� �� �ִ�.

-- QUIZ
CREATE TABLE TEST_CLASS(
CLASS_NO NUMBER PRIMARY KEY,
CLASS_NAME VARCHAR2(20)
);
 
 INSERT INTO TEST_CLASS VALUES(1001, '����');
 INSERT INTO TEST_CLASS VALUES(1002, '����');
 
 CREATE TABLE TEST_STUDENT(
STUDENT_NO NUMBER PRIMARY KEY,
STUDENT_NAME VARCHAR2(20)
);

 INSERT INTO TEST_STUDENT VALUES(2001, '����ȭ');
 INSERT INTO TEST_STUDENT VALUES(2002, '����');
INSERT INTO TEST_STUDENT VALUES(2003, '���');

CREATE TABLE TEST_CLASS_STUDENT(
CS_NO NUMBER PRIMARY KEY,
CLASS_NO NUMBER,
STUDENT_NO NUMBER,
CONSTRAINT FK_CLASS_NO FOREIGN KEY(CLASS_NO) REFERENCES TEST_CLASS(CLASS_NO),
CONSTRAINT FK_STUDENT_NO FOREIGN KEY(STUDENT_NO) REFERENCES TEST_STUDENT(STUDENT_NO)
);

INSERT INTO TEST_CLASS_STUDENT VALUES(1, 1001, 2001);
INSERT INTO TEST_CLASS_STUDENT VALUES(2, 1002, 2001);
INSERT INTO TEST_CLASS_STUDENT VALUES(3, 1001, 2002);
INSERT INTO TEST_CLASS_STUDENT VALUES(4, 1002, 2002);
INSERT INTO TEST_CLASS_STUDENT VALUES(5, 1002, 2003);

---------------- ¯ �߿��� JOIN ------------------
-- INNER, EQUI, FULL OUTER, LEFT OUTER, RIGHT OUTER JOIN

-- ������ �ֱ�
CREATE TABLE ACADEMY_A( -- �п��� ����� �л����� ����
STUDENT_NO NUMBER PRIMARY KEY,
STUDENT_NAME VARCHAR(20) NOT NULL
);

DROP TABLE ACADEMY_A;

CREATE TABLE ACADEMY_B(
STUDENT_NO NUMBER PRIMARY KEY,
STUDENT_NAME VARCHAR(20) NOT NULL
);

INSERT INTO ACADEMY_B VALUES(1005, '����ȯ');
INSERT INTO ACADEMY_B VALUES(1006, '������');
INSERT INTO ACADEMY_B VALUES(1003, '���');
INSERT INTO ACADEMY_B VALUES(1004, '�迬��'); 
-- ACADEMY_A, ACADEMY_B�� ���� ��ġ�� ������ (���, �迬��) �� ����.
-- ��ġ�� �����͵��� �̿��Ͽ� ���̺��� ���� �� �ִ�. �̰��� �ٷ� JOIN.

--EQUI JOIN
SELECT*
FROM ACADEMY_A T1, ACADEMY_B T2
WHERE T1.STUDENT_NO = T2.STUDENT_NO; -- '=' ���·� JOIN�� ����� �� ���� (��ƿ� ���� ���� ������ ��!)
-- STUDENY_NO �� ������ �� ���̸� ����ϰ� ��.

SELECT T1.STUDENT_NO, T1.STUDENT_NAME --> ����, ��Ī�� ���̱� ���� ���� SELECT���� ���� �������°� �����Ѱ�?
FROM SELECT NAME, NVL(ADDRESS,  '') FROM CUSTOMER;
WHERE T1.STUDENT_NO = T2.STUDENT_NO; 
-- T1.STUDENT_NO, T1.STUDENT_NAME 2���� ��� �� ����.

--NON-EQUI JOIN
SELECT * FROM ACADEMY_A T1, ACADEMY_B T2
WHERE T1.STUDENT_NO >= t2.student_no; 
-- ���ų� ū ����̱� ������, 1003�ΰ��� ���� ���, T1�� ���� �� Ŭ ���, 1004 �ΰ��� ������� 3���� ���̽��� ���´�.

-- INNER JOIN
SELECT * 
FROM ACADEMY_A T1 
JOIN ACADEMY_B T2
ON(T1.STUDENT_NO = T2.STUDENT_NO); -- EQUI JOIN�� ������ ���·� �����.

-- LEFT JOIN
SELECT *
FROM ACADEMY_A T1
LEFT JOIN ACADEMY_B T2
ON(T1.STUDENT_NO = T2.STUDENT_NO) 
ORDER BY T1.STUDENT_NO; 
-- LEFT, �� T1�� ���� ��� �����µ�, T2�� �ȳ��´�.

--RIGHT JOIN
SELECT *
FROM ACADEMY_A T1
RIGHT JOIN ACADEMY_B T2
ON(T1.STUDENT_NO = T2.STUDENT_NO) 
ORDER BY T1.STUDENT_NO; 

 --OUTER JOIN -> ������.
SELECT T1.STUDENT_NO, T1.STUDENT_NAME, T2.STUDENT_NO, T2.STUDENT_NAME 
FROM ACADEMY_A T1
FULL OUTER JOIN ACADEMY_B T2
ON(T1.STUDENT_NO = T2.STUDENT_NO) 
ORDER BY T1.STUDENT_NO; 
 
 -- NATURAL JOIN
 SELECT*
 FROM ACADEMY_A T1
 NATURAL JOIN ACADEMY_B T2; -- ���� �̸��� �÷����� ��� ������ �������� ��. ������ش�.
 
 
 
 --- QUIZ
  DROP TABLE EMP;
DROP TABLE DEPT;
CREATE TABLE DEPT (
    DEPT_NO      NUMBER PRIMARY KEY,
    DEPT_NAME    VARCHAR2(20) NOT NULL
);
CREATE TABLE EMP (
    EMP_NO      NUMBER PRIMARY KEY,
    EMP_NAME    VARCHAR2(20) NOT NULL,
    DEPT_NO NUMBER NOT NULL,
    CONSTRAINT FK_DEPT_NO FOREIGN KEY(DEPT_NO) REFERENCES DEPT (DEPT_NO)
);
INSERT INTO DEPT VALUES (1, '�λ��');
INSERT INTO DEPT VALUES (2, '������');
INSERT INTO DEPT VALUES (3, 'ȫ����');
INSERT INTO EMP VALUES (1001, '����ȭ', 3);
INSERT INTO EMP VALUES (1002, '����', 1);
INSERT INTO EMP VALUES (1003, '���', 2);

-- QUIZ 1
SELECT P1. DEPT_NAME, P2. EMP_NAME FROM DEPT P1 JOIN EMP P2 ON (P1.DEPT_NO = P2.DEPT_NO);

-- QUIZ 2
SELECT P1.STUDENT_NO, P2.STUDENT_NAME, P3.CLASS_NAME FROM TEST_CLASS_STUDENT P1 
LEFT JOIN TEST_STUDENT P2 ON (P1.STUDENT_NO = P2.STUDENT_NO)
LEFT JOIN TEST_CLASS P3 ON (P1.CLASS_NO = P3.CLASS_NO) ORDER BY STUDENT_NO;


CREATE TABLE ACADEMY_C (
    STUDENT_NO NUMBER PRIMARY KEY,
    STUDENT_NAME VARCHAR2(20) NOT NULL
);
INSERT INTO ACADEMY_C VALUES (1004, '�迬��');
INSERT INTO ACADEMY_C VALUES (1006, '������');
INSERT INTO ACADEMY_C VALUES (1001, '����ȭ');
INSERT INTO ACADEMY_C VALUES (1007, '����ȭ');
SELECT * FROM ACADEMY_A A LEFT JOIN ACADEMY_B B  ON A.STUDENT_NO = B.STUDENT_NO RIGHT JOIN ACADEMY_C C ON A.STUDENT_NO = C.STUDENT_NO ORDER BY STUDENT_NO;



--���տ����� UNION ALL, UNION, INTERSECT, MINUS
-- UNION ALL
SELECT*FROM ACADEMY_A
UNION ALL 
SELECT* FROM ACADEMY_B; -- �ߺ��Ǵ� �� 1003, 1004�� �ι� ���� ���·� ����

--UNION 
SELECT*FROM ACADEMY_A
UNION
SELECT* FROM ACADEMY_B; -- �ߺ��Ǵ� �� 1003, 1004�� ���� �� ���·� ����

--INTERSECT
SELECT*FROM ACADEMY_A
INTERSECT
SELECT* FROM ACADEMY_B; -- �ߺ��Ǵ� �� 1003, 1004 �� ����

--MINUS
SELECT*FROM ACADEMY_A
MINUS
SELECT* FROM ACADEMY_B; -- A���̺��� B���̺�� �ߺ��Ǵ� �� 1003, 1004 ���� ����

-- ���տ����ڴ� ���̺� ������ ��ġ�ؾ��Ѵ� (�÷��� �̸�, ���� ��)


-- ��������
 -- ��Į�� �������� (SELECT�ȿ� �� SELECT)
SELECT T1.STUDENT_NO,
(SELECT T2.STUDENT_NAME
FROM ACADEMY_B T2
WHERE T2.STUDENT_NO = T1.STUDENT_NO) AS NAME
FROM ACADEMY_A T1;
-- A STUDENT�� STUDENT_NO�� ������ ���¿��� (���, �迬���� �̸���(A STUDENT_NO�� B STUDENT_NO�� ���� ���̵���) �����´�)
-- �÷���� ����ϱ� ������ �ݵ�� �ϳ��� �÷��� �����;� �Ѵ� (���� SELECT ���� ������ ��)!!!


 --�ζ��� �� (FROM �ȿ� SELECT)
 SELECT T1.STUDENT_NO, T2.STUDENT_NAME
 FROM ACADEMY_A T1, 
 (SELECT STUDENT_NO, STUDENT_NAME
 FROM ACADEMY_B) T2 -- ACADEMY_B�� �ִ� STUDENT_NO, STUDENT_NAME�� �����´�.
 -- ACADEMY_B�� �ִ°� ���� �ΰ� �÷��ۿ� ���� ������, ��ǻ� ACADEMY_B T2�� �����ϴ�.
 WHERE T1.STUDENT_NO = T2.STUDENT_NO;
 -- 
 
 