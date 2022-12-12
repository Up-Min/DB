--문제1. emp 테이블에서 사원번호, 사원이름, 월급을 출력하시오.
SELECT EMPNO, ENAME, SAL FROM EMP;
--문제2. emp 테이블에서 사원번호, 사원이름, 월급, 연봉을 구하고 각각 컬럼명은 사원번호, 사원이름, 월급, 연봉으로 출력하시오.
SELECT EMPNO AS 사원번호, ENAME AS 사원이름, SAL AS 월급, SAl*12 연봉  FROM EMP;
--문제3. employees 테이블에서 모든 종업원의 급여를 $300증가 시키기 위해서 덧셈 연산자를 사용하고 결과에 이름과 SALARY, SALARY+300를 출력 합니다.
SELECT FIRST_NAME| |LAST_NAME, SALARY , SALARY+300 FROM EMPLOYEES;
--문제4. EMPLOYEES 테이블에서 이름(last_name + first_name)과 연봉을 "KING: 1 Year salary = 60000" 형식으로 출력하여라. 
SELECT FIRST_NAME|| ' ' ||LAST_NAME || ' 1 YEAR SALARY = ' || (SALARY*12) AS RESULT FROM EMPLOYEES;
--문제5. EMPLOYEES 테이블에서 입사일자가 1995년 1월 1일 이후에 입사한 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라
SELECT EMPLOYEE_ID, FIRST_NAME|| ' ' ||LAST_NAME, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID FROM EMPLOYEES WHERE HIRE_DATE > TO_DATE('1995/1/1');
--문제6. EMPLOYEES 테이블에서 급여가 3000에서 5000사이의 정보를 성명, 담당업무, 급여, 부서번호를 출력하라.
SELECT FIRST_NAME|| ' ' ||LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY BETWEEN 3000 AND 5000;
--문제7. EMPLOYEES 테이블에서 사원번호가 144, 176, 200 인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자를 출력하라.
SELECT EMPLOYEE_ID, FIRST_NAME|| ' ' ||LAST_NAME, JOB_ID, SALARY, HIRE_DATE FROM EMPLOYEES WHERE EMPLOYEE_ID IN (144, 176, 200);
--문제8.emp 테이블 에서 업무가 SALESMAN 또는 MANAGER이면서 급여가 1,600, 2,975 또는 2,850이 아닌 모든 사원의 이름, 업무 및 급여를 표시하시오.
SELECT ENAME, JOB, SAL FROM EMP WHERE NOT SAL = 1600 AND NOT SAL = 2975 AND NOT SAL = 2850 AND JOB = 'SALESMAN' OR JOB = 'MANAGER';
--문제9.EMPLOYEES 테이블에서 부서별로 인원수, 평균 급여, 최저급여, 최고급여, 급여의 합을 구하여 출력하라.
SELECT 
    DEPARTMENT_ID,
COUNT(DEPARTMENT_ID)AS 인원수, 
    AVG(SALARY)AS 평균급여, 
    MIN(SALARY) AS 최저급여,
    MAX(SALARY) AS 최고급여,
    SUM(SALARY) AS 급여의합 FROM EMPLOYEES GROUP BY DEPARTMENT_ID;
--문제 10. EMPLOYEES 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 구하여 출력하여라(GROUP BY, HAVING)
SELECT 
DEPARTMENT_ID,
COUNT(DEPARTMENT_ID)AS 인원수, 
SUM(SALARY) AS 급여의합 FROM EMPLOYEES GROUP BY DEPARTMENT_ID
HAVING COUNT(DEPARTMENT_ID)>4;


--문제 11. EMPLOYEES 테이블에서 전체 월급이 10000을 초과하는 각 업무에 대해서 업무와 월급여 합계를 출력하라. 단 job_id가 'SA '로 시작하는 직원은 제외하고 월 급여 합계로 정렬(내림차순) 하라. 
SELECT 
JOB_ID AS 업무, 
SUM(SALARY) AS 월급여합 FROM EMPLOYEES GROUP BY JOB_ID
HAVING SUM(SALARY)>10000 AND NOT JOB_ID LIKE '%SA%'
ORDER BY SUM(SALARY) DESC;


--문제12. emp테이블에서 사원이름 중 A가 포함된 사원이름을 구하고 그 이름 중 앞에서 3자만 추출하여 출력
SELECT SUBSTR (ENAME,1,3)
FROM EMP 
GROUP BY ENAME
HAVING ENAME LIKE '%A%';

--여기서 부터 join문제

--문제13. 모든 사원의 이름, 부서번호, 부서이름을 표시하시오. (emp, dept)
SELECT EMP.ENAME, EMP.DEPTNO, DEPT.DNAME
FROM EMP
JOIN DEPT
ON DEPT.DEPTNO = EMP.DEPTNO ;


--문제14. 업무가 MANAGER인 사원의 정보를 이름, 업무, 부서명, 근무지 순으로 출력하시오. ( emp, dept)
SELECT T1.ENAME, T1. JOB, T2.DNAME,T2.LOC
FROM (SELECT * FROM EMP WHERE EMP.JOB = 'MANAGER') T1
 JOIN DEPT T2
ON T2.DEPTNO = T1.DEPTNO ;


--문제15. 커미션(emp테이블의 comm 컬럼이용)을 받고 급여가 1,600이상인 사원의 사원이름, 부서명, 근무지를 출력하시오.( emp, dept)
SELECT T1.SAL, T1.COMM, T1.ENAME, T2.DNAME, T2.LOC
FROM (SELECT * FROM EMP WHERE COMM IS NOT NULL AND SAL>=1600) T1
JOIN DEPT T2
ON T1.DEPTNO = T2.DEPTNO;

--문제16. 근무지가 CHICAGO인 모든 사원의 이름,업무,부서번호 및 부서이름을 표시하시오. ( emp, dept)
SELECT T1.ENAME, T1.JOB, T1.DEPTNO, T2.DNAME
FROM (SELECT*FROM DEPT WHERE LOC = 'CHICAGO') T2
JOIN EMP T1
ON T1.DEPTNO = T2.DEPTNO;

--여기서 부터 서브쿼리 문제

--문제17. emp테이블 에서 사원번호가 7900인 사원과 같은 날짜에 입사한 사람의 이름과 입사일을 출력하시오.
SELECT ENAME, HIREDATE 
FROM (SELECT * FROM EMP WHERE HIREDATE LIKE '%22/12/09%');

--문제18. emp테이블 에서 직속상사(mgr)가 KING인 모든 사원의 이름과 급여를 출력하시오.
SELECT ENAME, SAL
FROM (SELECT * FROM EMP WHERE MGR LIKE '%7839%');

--문제19. EMPLOYEES 테이블에서 (급여의 평균)보다 적은 사원의 정보를 사원번호,이름,담당업무,급여,부서번호를 출력하여라
SELECT EMPLOYEE_ID, FIRST_NAME|| ' ' ||LAST_NAME AS NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

--문제20. EMPLOYEES 테이블에서 (Kochhar의 급여)보다 많은 사원의 정보를 사원번호,이름,담당업무,급여를 출력하라.
SELECT EMPLOYEE_ID, FIRST_NAME|| ' ' ||LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'Kochhar');

--문제 21. emp테이블 에서 (BLAKE와 같은 부서)에 있는 사원들의 이름과 입사일을 구하는데 BLAKE는 제외하고 출력하시오.
-- (BLAKE가 여러명일 수 있음)

SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE HIREDATE LIKE '%22/12/09%') AND NOT ENAME = 'BLAKE';



