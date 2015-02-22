Org Hrcy Table
==================

INSTALLATION
------------
### Optional - Create database OrgHrcy first using below
CREATE DATABASE OrgHrcy;
COMMENT ON DATABASE "OrgHrcy" IS 'The Employee Org Hierarchy Database';

### Creation of schema/tables, just execute the orgHirarchy.sql file on the OrgHrcy database, Or, any other database.
psql -f orgHierarchy.sql OrgHrcy


Brief Description about the table
----------------------------------
. **ORG.SUPERVISORY **: 
    This is a supervisory org hierarchy table, basically the **oganization's reporting structure**. 
	Contains basic fields, SUPERVISORY_ID (a SERIAL id), EMPLID, USERID, FIRST_NAME, MIDDLE_NAME, LAST_NAME, HIRE_DATE, JOB_TITLE, REPORTS_TO (references to the SERIAL id).

    This table contains data from the Organization Chart (refer to the **Organization Chart.pdf**)

Queries
----------
**queries.sql** has the queries

1. Provide a single SELECT statement that displays the information in the table,showing who reports to whom, along with the service years..
2. Get the entire hierarchy Of the CFO only [ supervisory_id is 2 ].

