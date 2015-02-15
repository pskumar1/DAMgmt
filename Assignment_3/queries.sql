--Provide the FULL organization hierarchy for Vice President - Operations [Employee Id: E1003]. Include the Person Addresses as well.
WITH RECURSIVE HIERARCHY (PERSON_ID, EMPLID, FIRST_NAME, LAST_NAME, JOB_TITLE) AS 
 (
	SELECT PERSON_ID, EMPLID,FIRST_NAME, LAST_NAME, JOB_TITLE  FROM HR.PERSON WHERE EMPLID = 'E1003' -- NON RECURSIVE TERM
	UNION ALL
	SELECT A.PERSON_ID, A.EMPLID, A.FIRST_NAME, A.LAST_NAME, A.JOB_TITLE FROM HR.PERSON A INNER JOIN HIERARCHY B ON A.MANAGER_EMPLID = B.EMPLID   --RECURSIVE TERM
 )
 SELECT A.EMPLID, A.FIRST_NAME, A.LAST_NAME, A.JOB_TITLE, C.TYPE_NAME AS ADDRESS_TYPE, B.ADDR_LINE1, B.CITY, B.STATE_CD, B.POSTAL_CD, B.COUNTRY_CD 
  FROM HIERARCHY A 
	INNER JOIN HR.ADDRESS B ON A.PERSON_ID = B.PERSON_ID 
	INNER JOIN HR.TYPE C ON B.ADDR_TYP = C.TYPE_ID ;
 
---------------------------------------------------------------------------------------------------------------------------------------------------------
 
 
--Provide the current cost center data for all workers with data elements - emplid, names, job_title, hire date, cost center eff date, cost center details.
SELECT A.EMPLID, 
	A.FIRST_NAME, 
	A.LAST_NAME, 
	A.JOB_TITLE, 
	A.HIRE_DATE,
	B.EFF_DATE, 
	C.GL_DEPARTMENT, 
	C.GL_LOCATION, 
	C.BUSINESS_UNIT FROM HR.PERSON A 
	INNER JOIN HR.PERSON_COSTCENTER B ON A.PERSON_ID = B.PERSON_ID 
	INNER JOIN FINANCE.COSTCENTER C ON B.COSTCENTER_ID = C.COSTCENTER_ID
WHERE B.END_DATE IS NULL
ORDER BY A.HIRE_DATE

---------------------------------------------------------------------------------------------------------------------------------------------------------
 