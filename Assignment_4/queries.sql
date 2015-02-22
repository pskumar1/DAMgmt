------------------------------------------------------------------------------------------------------------------------
--	****** QUERIES  *******
------------------------------------------------------------------------------------------------------------------------

--1).Provide a single SELECT statement that displays the information in the table,showing who reports to whom.

SELECT  EmployeeOrg.First_Name || ' ' ||  EmployeeOrg.Last_Name as Employee_Name,
	EmployeeOrg.Job_Title,
	DATE_PART('year', current_date) - DATE_PART('year', EmployeeOrg.Hire_Date) AS Employee_Service_Years,
	SupervisorOrg.First_Name || ' ' || SupervisorOrg.Last_Name as Reports_To,
	SupervisorOrg.Job_Title as Reports_To_JobTitle,
	DATE_PART('year', current_date) - DATE_PART('year', SupervisorOrg.Hire_Date) AS Supervisor_Service_Years
FROM ORG.SUPERVISORY AS EmployeeOrg
	LEFT JOIN ORG.SUPERVISORY AS SupervisorOrg
	ON EmployeeOrg.REPORTS_TO = SupervisorOrg.SUPERVISORY_ID
ORDER BY EmployeeOrg.Supervisory_ID;


----------------------------------------------------------------------

--2).Get the entire hierarchy Of the CFO only [ supervisory_id is 2 ]
WITH RECURSIVE HIERARCHY (SUPERVISORY_ID, EMPLID, FIRST_NAME, LAST_NAME, JOB_TITLE, REPORTS_TO) AS 
 (
    SELECT SUPERVISORY_ID, EMPLID,FIRST_NAME, LAST_NAME, JOB_TITLE,REPORTS_TO  FROM ORG.SUPERVISORY WHERE SUPERVISORY_ID = 2 -- NON RECURSIVE TERM
    UNION ALL
    SELECT A.SUPERVISORY_ID, A.EMPLID, A.FIRST_NAME, A.LAST_NAME, A.JOB_TITLE,A.REPORTS_TO FROM ORG.SUPERVISORY A INNER JOIN HIERARCHY B ON A.REPORTS_TO = B.SUPERVISORY_ID   --RECURSIVE TERM
 )
 SELECT A.EMPLID, A.FIRST_NAME, A.LAST_NAME, A.JOB_TITLE, B.EMPLID AS REPORTS_TO_EMPLID FROM HIERARCHY A INNER JOIN HIERARCHY B ON A.REPORTS_TO = B.SUPERVISORY_ID;
------------------------------------------------------------------------------------------------------------------------