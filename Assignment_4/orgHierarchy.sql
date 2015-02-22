-----------------------------------------------------------------------------------------------------------------
--Optional - CREATE the database with below in psql & execute the rest from pgAdmin Or psql for that db.
--Name: orghrcy; Database Owner: postgres

--CREATE DATABASE OrgHrcy;
--COMMENT ON DATABASE "OrgHrcy" IS 'The Employee Org Hierarchy Database';

--EXECUTE THE BELOW TO CREATE THE ORG HIERARCHY TABLE.

-----------------------------------------------------------------------------------------------------------------
--Create ORG Schema
DROP SCHEMA IF EXISTS ORG CASCADE ;
CREATE SCHEMA ORG;

--Create the supervisory org table. An org can have many custom orgs and hirarchies, this one is specifically the 'reporting hierarchy' a.k.a 'supervisor organization hierarchy'.
DROP TABLE IF EXISTS ORG.SUPERVISORY;


CREATE TABLE ORG.SUPERVISORY (
   SUPERVISORY_ID	       SERIAL         PRIMARY KEY ,
   EMPLID         	       VARCHAR(10)    UNIQUE NOT NULL,
   USERID        	       VARCHAR(10)    UNIQUE NOT NULL,
   FIRST_NAME    	       VARCHAR(30)    NOT NULL,
   MIDDLE_NAME    	       VARCHAR(30)    NULL,
   LAST_NAME      	       VARCHAR(30)    NOT NULL,
   HIRE_DATE      	       DATE           NOT NULL,
   JOB_TITLE	  	       VARCHAR(60)    NOT NULL,
   REPORTS_TO		       INTEGER	      NULL  REFERENCES ORG.SUPERVISORY(SUPERVISORY_ID)
);
COMMENT ON TABLE ORG.SUPERVISORY IS 'Table that contains a Supervisory Org Hierarchy';

INSERT INTO ORG.SUPERVISORY (EMPLID, USERID, FIRST_NAME, MIDDLE_NAME, LAST_NAME, HIRE_DATE, JOB_TITLE, REPORTS_TO) 
                  VALUES ('E1001','JMARK01', 'JOHN', NULL, 'MARK', '1995-10-05', 'President & CEO', NULL),
			 ('E1002','DMEE01', 'DAVE', NULL, 'MEE', '1992-01-05', 'Chief Financial Officer', 1),
			 ('E1003','PWALT01', 'PAUL', NULL, 'WALTON', '1998-02-05', 'Chief Operations Officer', 1),
			 ('E2001','JHUDS01', 'JAMES', 'D', 'HUDSON', '2005-02-05', 'Chief Information Officer', 1),
			 ('E2115','AJACK01', 'AMY', NULL, 'JACKSON', '2010-10-15', 'Administrative Assistent', 1),
			 ('E2101','JARTH01', 'JASON', NULL, 'ARTHUR', '2009-01-10', 'Vice President - Finance', 2),
			 ('E2007','JTHOM01', 'JOSE', NULL, 'THOMAS', '2006-09-11', 'Vice President - Human Resources', 2),
			 ('E1004','DBEAR01', 'DAVID', 'J', 'BEAR', '1999-03-31', 'Vice President - Operations', 3),
			 ('E2015','TMART01', 'TOM', 'K', 'MARTIN', '2007-03-31', 'Vice President - Information Systems', 4),
			 ('E2102','SJACK01', 'SHERRY', 'M', 'JACKSON', '2009-04-01', 'Finance Manager', 6),
			 ('E2103','RHUNT01', 'ROSIE', NULL , 'HUNT', '2009-10-01', 'Pricing Manager', 6),
			 ('E2008','BWALT01', 'BLAKE', NULL , 'WALTON', '2006-11-01', 'Human Resources Manager', 7),
			 ('E1006','TCHEN01', 'TIMOTHY', NULL , 'CHENEY', '1999-05-01', 'Operations Manager', 8),
			 ('E2018','AMILL01', 'ALEX', NULL , 'MILLER', '2007-06-01', 'Information Systems Manager', 9),
			 ('E2020','STHUR01', 'SHAWN', NULL , 'THURMAN', '2007-08-12', 'Information Systems Manager', 9),
			 ('E2200','RWELC01', 'ROBERT', NULL , 'WELCH', '2012-08-12', 'Account Rep - I', 10),
			 ('E2221','MHILL01', 'MEGAN', 'P' , 'HILL', '2013-07-31', 'Recruiter', 12),
			 ('E2226','PHARM01', 'PAUL', NULL , 'HARMER', '2014-01-31', 'Fleet Manager', 13),
			 ('E3001','BPENN01', 'BRIAN', NULL , 'PENN', '2014-12-01', 'Project Manager', 14),
			 ('E3002','RKUMA01', 'RAM', NULL , 'KUMAR', '2014-12-15', 'Senior Programmer', 14),
			 ('E2901','LPAUL01', 'LAURA', NULL , 'PAUL', '2014-01-15', 'Tech Lead', 15),
			 ('E3015','SKIRK01', 'SAM', 'J' , 'KIRK', '2015-01-15', 'Programmer', 15);
