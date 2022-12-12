-- 12.9
-- ��ø�������� (������������ ���迡 ���� �񿬰�, ����)���� ��������
 -- �񿬰� : ���������� ���������� ������ ����, JOIN ���Ѵ�.
 -- ���� : ���������� �������� �÷��� ����, JOIN�� �Ѵ�.
 
 -- �񿬰�
 SELECT * FROM ACADEMY_A WHERE STUDENT_NAME = 
 (SELECT STUDENT_NAME 
 FROM ACADEMY_B
 WHERE STUDENT_NO = 1003);
 -- ��ī���� A���̺��� ��Ʃ��Ʈ ������ �Ұ�ȣ �ȿ� �ִ� ���̵��� ������.  WHERE STUDENT_NAME = '���' �� ����.
 -- ��ī���� A,B�� �ƹ��� ���谡 ����, �������� �ȿ��� ���������� ���� ��޵Ǿ� ���� ����
 
  -- ����
  SELECT*FROM ACADEMY_a t1 WHERE STUDENT_NAME=
  (SELECT T2.STUDENT_NAME
  FROM ACADEMY_B T2
  WHERE t2.student_no = t1.student_no
  );
  --student_name�� �Ұ�ȣ �ȿ� �ִ� ����� �����´ٴ� �Ҹ�. 
  -- ���������� ���������� ���踦 ������ ����. ���������� t1�� ������ �ؼ� t1�� �ִ� Į���� ����ϰ� ����.
  -- ��ī���� a,b�� ���踦 ������.
  
  
  -- ������, ������, �����÷� ��������
   -- ������. '=' ���
   -- ���������� 1�� ������ �����͸� ��ȯ�� �� �����. (�񱳿����� =,<,>,<=,>=)
   SELECT * FROM academy_a WHERE STUDENT_NAME = (SELECT STUDENT_NAME FROM ACADEMY_B WHERE STUDENT_NO = 1003);
    -- ������������ �����͸� �� �Ǹ� ��ȯ�Ѵ�. ���������� �ϳ� ������ ��, �������̶� �Ѵ�.
    -- SELECT * FROM academy_a WHERE STUDENT_NAME > (SELECT STUDENT_NAME FROM ACADEMY_B WHERE STUDENT_NO = 1003);
    -- �� ���� �ε�ȣ�� ����� ���� �ִ�.
   
   -- ������ 'IN' ��� - ����? (���� IN(,,,,) �ؼ� ��Ȯ�� ���� ��ġ�ϴ� �ֵ��� �������� �ſ��µ�, �̰Ÿ� �������������� ����Ѵ�!)
   SELECT * FROM academy_a WHERE STUDENT_NAME IN 
   (SELECT STUDENT_NAME FROM ACADEMY_B WHERE STUDENT_NO = 1003
    OR STUDENT_NO = 1004); --> (���, �迬��) �� ���� ������ ��.
   -- �ΰ� �̻��� ���� ��ȯ�� ���� '=' ��� 'IN' �� ����Ѵ�!
   -- SELECT * FROM academy_a WHERE STUDENT_NAME = ///-> SELECT * FROM academy_a WHERE STUDENT_NAME IN
   
   
   -- �����÷� -> �������� �ϳ��� �÷��� �ϳ��� ��, �ƴϸ� ���� ���� ��ȯ�ߴµ�, �̹����� ���� �÷��� ��ȯ�غ���!
   SELECT* FROM ACADEMY_A WHERE (STUDENT_NAME, STUDENT_NO) IN 
   (SELECT STUDENT_NAME, STUDENT_NO FROM ACADEMY_B 
   WHERE STUDENT_NO= 1003 OR STUDENT_NO = 1004);
   -- �������� : �÷��� �ΰ��� ��ȯ�Ѵ�. (�����÷� ��������) -> �ΰ��� ��ȯ�ϸ� �ΰ��� �޾ƾ��Ѵ�.
   -- ? ����, �׷��� ������������ �޴� �÷� �̸��̶� ������������ �޴� �÷��̸��̶� ���ƾ��ϴ°�?
   --> ������ ���ƾ������� �̸��� �޶� �ȴ�. ��� �ߺ��Ǵ� ���̵� + ������������ �̸� + ������������ �̸� �̷��� ���´�.
   
   
-- GROUP BY, HAVING, ORDER BY

SELECT TYPE, COUNT(NAME) AS COUNT FROM GIFT GROUP BY TYPE;
   -- Ÿ������ �׷���. �������� ������ ���ش�. �׷��� �� �÷� �ȿ� �ִ� NAME�� ������ ������.
  
SELECT TYPE, COUNT(NAME) AS COUNT FROM GIFT GROUP BY TYPE 
HAVING COUNT(NAME) >=2; -- ī��Ʈ�� 2 �̻��� ���̵鸸 �������.

-- ������ �Լ�- OVER ����� �߿�! ����ϸ� GROUPBY�� �������� ��� ���ص� ��.
-- RANK 
SELECT STUDENT_NAME, SCORE, RANK() OVER(ORDER BY SCORE DESC) AS RANK
FROM STUDENT_GRADE; -- OVER�� �Է¹��� (���ĵ� SCORE) �����͸� RANKȭ ������.
-- ���� �˰����� 10���� �θ���, �ٷ� 11�� �ƴ϶� 12�� ����. (���� 10�� ���� 12�� ����)
-- �׷���, DENSE_RANK
SELECT STUDENT_NAME, SCORE, DENSE_RANK() OVER(ORDER BY SCORE DESC) AS RANK
FROM STUDENT_GRADE; --10���� �θ��̾ �ڿ� 11�� ���� (���� 10�� ���� 11���� ��������)

SELECT STUDENT_NAME, SCORE, ROW_NUMBER() OVER(ORDER BY SCORE DESC) AS RANK
FROM STUDENT_GRADE; --  ���� 10���ε��� ROW�� ���� ���� �� �ְ� 10���� �ȴ�, �� �������� 11��

SELECT TYPE, SUM(PRICE) AS SUM FROM GIFT GROUP BY TYPE;
-- Ÿ������ ������ �ް�, �³׵��� ������ �ֵ��� ������
SELECT TYPE, PRICE, SUM(PRICE) OVER(PARTITION BY TYPE) 
AS SUM FROM GIFT GROUP BY TYPE; --OVER�� �̹� �׷����� �Ǿ��ֱ� ������ GROUP BY�� ������ �ȵ�.
   
SELECT TYPE, PRICE, SUM(PRICE) OVER(PARTITION BY TYPE) 
AS SUM FROM GIFT TYPE; --��Ƽ�� : ���ε��� �����ֱ�� �ϳ�, �׷����� SUM�� �ٽ� (�� TYPE�� �׷��ε� ���̵��� ������ŭ) ��Ƽ���ؼ� ��������.  
   
SELECT TYPE, AVG(PRICE), MAX(PRICE) AS MAX FROM GIFT GROUP BY TYPE; 
-- Ÿ��, ��հ���, �ִ밡���� �׷����Ͽ� �������.

--VIEW
CREATE OR REPLACE VIEW ACADEMY_ALL AS SELECT*FROM ACADEMY_A; 
 -- ������ ������ ���� ��. // ������ �غ��ϴ� ������ ���̺��� �ƴ�.  
   SELECT*FROM ACADEMY_ALL WHERE STUDENT_NO = 1001; 
   -- �����δ� ������ ���� ���� ��. ���̺�� �ν��ϱ� ������.
   
CREATE OR REPLACE VIEW ACADEMY_STUDENT_NAME AS
SELECT STUDENT_NAME FROM ACADEMY_A;

CREATE OR REPLACE VIEW ACADEMY_STUDENT_NAME AS
SELECT STUDENT_NO FROM ACADEMY_A; -- SELECT�� �ٲٸ� �ٷ� ������ �����ϴ�.
CREATE OR REPLACE VIEW ACADEMY_STUDENT_NAME AS
SELECT STUDENT_NAME FROM ACADEMY_A; -- NAME�� �������� ������ �ٲ�

CREATE OR REPLACE VIEW ACADEMY_JOIN AS
SELECT T1.STUDENT_NO, T1.STUDENT_NAME
FROM ACADEMY_A T1, ACADEMY_B T2
WHERE T1.STUDENT_NO = T2.STUDENT_NO;


insert into academy_all values (1005, '���ϼ�'); -- ��� �÷��� ������ view�� INSERT�� �����ϴ�.
select* from academy_all;
select* from academy_a;
-- academy_all�� �� ���� academy_a���� �����ϰ� ����.
-- ��, ��� �÷��� values�� ���µ�, 

INSERT INTO ACADEMY_STUDENT_NAME VALUES('1005'); 
-- NOT NULL �̶�� ���� ������ �ְ� ���� �־��µ�, CANNOT INSERT NULL �̶�� ���´�.
-- �⺻ PK�� UNIQUE �ϰ� NOT NULL�� ������. 
-- ��, ��ó�� �ϳ��� �÷� �ϳ��� ������ �����׵� valueS�� ������ ��� �÷��� VALUES�� ���� �ϹǷ�,
-- PK�� �ɷ� CANNOT INSERT NULL�̶�� ���� ���´�

-- VIEW �����
DROP VIEW ACADEMY_JOIN;

-- ������
 -- ������ ����
CREATE SEQUENCE EMP_SEQ -- �ְ� ���� �̸� �ۼ�
            INCREMENT BY 1 -- 1�� ���� ��Ű�ڴ�
            START WITH 1 -- 1���� �����ϰڴ�
            MINVALUE 1 -- �ּڰ� 1
            MAXVALUE 9999 -- �ִ� 9999
            NOCYCLE
            NOCACHE
            NOORDER;

            -- ������ �ϳ��� ������Ŵ            
            SELECT EMP_SEQ.NEXTVAL FROM DUAL;

            -- �������� ���� ��            
            SELECT EMP_SEQ.CURRVAL FROM DUAL;
            
            -- ������ �����
            DROP SEQUENCE EMP_SEQ;
            
            
            
            -- ������ ��� (EMP�� ���� �ڵ����� �þ�� �ϰ� ���� ��!)
            INSERT INTO EMP VALUES(EMP_SEQ.NEXTVAL , '�Ѹ�', 10);
            
            SELECT*FROM EMP; -- NO�� �ڵ� �����Ǿ� ������.
            -- �Խ����� �ѹ����� �ϰ� ���� �� �ſ� �����ϰ� ����� �� �ִ�!
            
            -- ������ ���� (�ٴ� �ȵȴ�!)
            ALTER SEQUENCE EMP_SEQ INCREMENT BY 2; -- ���� 2���� �þ�� �Ѵ�.
            
            TRUNCATE TABLE EMP; -- ���̺� �ȿ� �ִ� �����͸� ���� �����ִ�! TRUNCATE!
            
            -- ������ ���� �� ����
            -- �������� ���� ���� ������ �� ����. �ļ��� ���� 6���� �����ִ� NO�� 11���� ������ �� �ְ� �ϰ� ����!
            ALTER SEQUENCE EMP_SEQ INCREMENT BY 4; -- �������� 4�� �ٲٰ�
            SELECT EMP_SEQ.NEXTVAL FROM DUAL;           -- �ѹ� �����Ű��
            ALTER SEQUENCE EMP_SEQ INCREMENT BY 1;  -- �������� 1�� �ٲٰ�
            INSERT INTO EMP VALUES(EMP_SEQ.NEXTVAL , '�Ѹ�', 10); -- VALUES�� ����
                        
             SELECT*FROM EMP; 
            
            
            
            
            