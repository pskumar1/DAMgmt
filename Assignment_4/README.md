Org Hrcy Table
==================

INSTALLATION
------------
### Create database OrgHrcy first using below
(if there is an existing db, please skip this step.)

CREATE DATABASE OrgHrcy;
COMMENT ON DATABASE "OrgHrcy" IS 'The Employee Org Hierarchy Database';

### Creation of schema/tables:

 Just execute the orgHierarchy.sql file on the OrgHrcy database, Or, any other database. This script creates the schema/table and loads the data.
  
  psql -f orgHierarchy.sql OrgHrcy


Brief Description about the table
----------------------------------
. *ORG.SUPERVISORY*: 

    This is a supervisory org hierarchy table, basically the *oganization's reporting structure*. This table Contains basic fields:
	
	SUPERVISORY_ID (a SERIAL id), EMPLID, USERID, FIRST_NAME, MIDDLE_NAME, LAST_NAME, HIRE_DATE, JOB_TITLE, REPORTS_TO (references to the SERIAL id).

    Please refer to the Organization Chart.jpeg to understand the supervisory org hierarchy data loaded into this table.

Queries
----------
**queries.sql** has the queries

1. Provide a single SELECT statement that displays the information in the table,showing who reports to whom, along with the service years..
2. Get the entire hierarchy Of the CFO only [ supervisory_id is 2 ].