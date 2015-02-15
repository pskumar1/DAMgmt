HRISDB Database
==================

The hrisdb Database has basic employee org info data.

INSTALLATION
------------

###Create database first using below
createdb hrisdb

###Creation of schema/tables, just execute the hrisdb.sql file
psql -f hrisdb.sql hrisdb


Brief Description about the tables
----------------------------------
1. HR.TYPE : Table that contains static data/starter data set of allowable values. For example, Address Types [ HOME, WORK ]
2. HR.PERSON: Table that contains basic worker data.
3. HR.ADDRESS: PERSON related addresses [ home , work ] - 1 to MANY
4. FINANCE.COSTCENTER : A person can have more than 1 cost center, and a cost center can belong with more than one worker. MANY to MANY
5. HR.PERSON_COSTCENTER: Association table that has got the history of Person associations with Finance Cost Centers'


Model [ER Diagram]
-------------------
Refer to hrisdb_model.png


Queries
----------
queries.sql has the sample queries

1. Sample 1 - Provide the FULL active organization hierarchy for Vice President - Operations [Employee Id: E1003]. Include the Person Addresses as well.
2. Sample 2 - Provide the current cost center data for all workers with data elements - emplid, names, job_title, hire date, cost center eff date, cost center details.

