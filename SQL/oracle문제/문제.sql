--����1. emp ���̺��� �����ȣ, ����̸�, ������ ����Ͻÿ�.
SELECT EMPNO, ENAME, SAL FROM EMP;
--����2. emp ���̺��� �����ȣ, ����̸�, ����, ������ ���ϰ� ���� �÷����� �����ȣ, ����̸�, ����, �������� ����Ͻÿ�.
SELECT EMPNO AS �����ȣ, ENAME AS ����̸�, SAL AS ����, SAl*12 ����  FROM EMP;
--����3. employees ���̺��� ��� �������� �޿��� $300���� ��Ű�� ���ؼ� ���� �����ڸ� ����ϰ� ����� �̸��� SALARY, SALARY+300�� ��� �մϴ�.
SELECT FIRST_NAME| |LAST_NAME, SALARY , SALARY+300 FROM EMPLOYEES;
--����4. EMPLOYEES ���̺��� �̸�(last_name + first_name)�� ������ "KING: 1 Year salary = 60000" �������� ����Ͽ���. 
SELECT FIRST_NAME|| ' ' ||LAST_NAME || ' 1 YEAR SALARY = ' || (SALARY*12) AS RESULT FROM EMPLOYEES;
--����5. EMPLOYEES ���̺��� �Ի����ڰ� 1995�� 1�� 1�� ���Ŀ� �Ի��� ����� ������ �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�
SELECT EMPLOYEE_ID, FIRST_NAME|| ' ' ||LAST_NAME, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID FROM EMPLOYEES WHERE HIRE_DATE > TO_DATE('1995/1/1');
--����6. EMPLOYEES ���̺��� �޿��� 3000���� 5000������ ������ ����, ������, �޿�, �μ���ȣ�� ����϶�.
SELECT FIRST_NAME|| ' ' ||LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY BETWEEN 3000 AND 5000;
--����7. EMPLOYEES ���̺��� �����ȣ�� 144, 176, 200 �� ����� ������ �����ȣ, ����, ������, �޿�, �Ի����ڸ� ����϶�.
SELECT EMPLOYEE_ID, FIRST_NAME|| ' ' ||LAST_NAME, JOB_ID, SALARY, HIRE_DATE FROM EMPLOYEES WHERE EMPLOYEE_ID IN (144, 176, 200);
--����8.emp ���̺� ���� ������ SALESMAN �Ǵ� MANAGER�̸鼭 �޿��� 1,600, 2,975 �Ǵ� 2,850�� �ƴ� ��� ����� �̸�, ���� �� �޿��� ǥ���Ͻÿ�.
SELECT ENAME, JOB, SAL FROM EMP WHERE NOT SAL = 1600 AND NOT SAL = 2975 AND NOT SAL = 2850 AND JOB = 'SALESMAN' OR JOB = 'MANAGER';
--����9.EMPLOYEES ���̺��� �μ����� �ο���, ��� �޿�, �����޿�, �ְ�޿�, �޿��� ���� ���Ͽ� ����϶�.
SELECT 
    DEPARTMENT_ID,
COUNT(DEPARTMENT_ID)AS �ο���, 
    AVG(SALARY)AS ��ձ޿�, 
    MIN(SALARY) AS �����޿�,
    MAX(SALARY) AS �ְ�޿�,
    SUM(SALARY) AS �޿����� FROM EMPLOYEES GROUP BY DEPARTMENT_ID;
--���� 10. EMPLOYEES ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���Ͽ� ����Ͽ���(GROUP BY, HAVING)
SELECT 
DEPARTMENT_ID,
COUNT(DEPARTMENT_ID)AS �ο���, 
SUM(SALARY) AS �޿����� FROM EMPLOYEES GROUP BY DEPARTMENT_ID
HAVING COUNT(DEPARTMENT_ID)>4;


--���� 11. EMPLOYEES ���̺��� ��ü ������ 10000�� �ʰ��ϴ� �� ������ ���ؼ� ������ ���޿� �հ踦 ����϶�. �� job_id�� 'SA '�� �����ϴ� ������ �����ϰ� �� �޿� �հ�� ����(��������) �϶�. 
SELECT 
JOB_ID AS ����, 
SUM(SALARY) AS ���޿��� FROM EMPLOYEES GROUP BY JOB_ID
HAVING SUM(SALARY)>10000 AND NOT JOB_ID LIKE '%SA%'
ORDER BY SUM(SALARY) DESC;


--����12. emp���̺��� ����̸� �� A�� ���Ե� ����̸��� ���ϰ� �� �̸� �� �տ��� 3�ڸ� �����Ͽ� ���
SELECT SUBSTR (ENAME,1,3)
FROM EMP 
GROUP BY ENAME
HAVING ENAME LIKE '%A%';

--���⼭ ���� join����

--����13. ��� ����� �̸�, �μ���ȣ, �μ��̸��� ǥ���Ͻÿ�. (emp, dept)
SELECT EMP.ENAME, EMP.DEPTNO, DEPT.DNAME
FROM EMP
JOIN DEPT
ON DEPT.DEPTNO = EMP.DEPTNO ;


--����14. ������ MANAGER�� ����� ������ �̸�, ����, �μ���, �ٹ��� ������ ����Ͻÿ�. ( emp, dept)
SELECT T1.ENAME, T1. JOB, T2.DNAME,T2.LOC
FROM (SELECT * FROM EMP WHERE EMP.JOB = 'MANAGER') T1
 JOIN DEPT T2
ON T2.DEPTNO = T1.DEPTNO ;


--����15. Ŀ�̼�(emp���̺��� comm �÷��̿�)�� �ް� �޿��� 1,600�̻��� ����� ����̸�, �μ���, �ٹ����� ����Ͻÿ�.( emp, dept)
SELECT T1.SAL, T1.COMM, T1.ENAME, T2.DNAME, T2.LOC
FROM (SELECT * FROM EMP WHERE COMM IS NOT NULL AND SAL>=1600) T1
JOIN DEPT T2
ON T1.DEPTNO = T2.DEPTNO;

--����16. �ٹ����� CHICAGO�� ��� ����� �̸�,����,�μ���ȣ �� �μ��̸��� ǥ���Ͻÿ�. ( emp, dept)
SELECT T1.ENAME, T1.JOB, T1.DEPTNO, T2.DNAME
FROM (SELECT*FROM DEPT WHERE LOC = 'CHICAGO') T2
JOIN EMP T1
ON T1.DEPTNO = T2.DEPTNO;

--���⼭ ���� �������� ����

--����17. emp���̺� ���� �����ȣ�� 7900�� ����� ���� ��¥�� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.
SELECT ENAME, HIREDATE 
FROM (SELECT * FROM EMP WHERE HIREDATE LIKE '%22/12/09%');

--����18. emp���̺� ���� ���ӻ��(mgr)�� KING�� ��� ����� �̸��� �޿��� ����Ͻÿ�.
SELECT ENAME, SAL
FROM (SELECT * FROM EMP WHERE MGR LIKE '%7839%');

--����19. EMPLOYEES ���̺��� (�޿��� ���)���� ���� ����� ������ �����ȣ,�̸�,������,�޿�,�μ���ȣ�� ����Ͽ���
SELECT EMPLOYEE_ID, FIRST_NAME|| ' ' ||LAST_NAME AS NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

--����20. EMPLOYEES ���̺��� (Kochhar�� �޿�)���� ���� ����� ������ �����ȣ,�̸�,������,�޿��� ����϶�.
SELECT EMPLOYEE_ID, FIRST_NAME|| ' ' ||LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'Kochhar');

--���� 21. emp���̺� ���� (BLAKE�� ���� �μ�)�� �ִ� ������� �̸��� �Ի����� ���ϴµ� BLAKE�� �����ϰ� ����Ͻÿ�.
-- (BLAKE�� �������� �� ����)

SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE HIREDATE LIKE '%22/12/09%') AND NOT ENAME = 'BLAKE';



