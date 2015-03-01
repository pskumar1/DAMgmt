Activity Definition
====================
Grace Lutheran church is running a non-profit school "Little Lambs" for pre-shool and KG kids to support the low income 
parents in the community.The school is currently needing a simple database to better manage the student and staff data and expand it later, 
when they start introducing higher grades. Additionally, the database can also be used to notify emails/messages to parents for various school/student 
events - for example, notifying about an uninformed absent,snow days, scool holidays, church events etc.

The llschooldb Database has basic student and staff data along with classes, attendance and holiday data.

INSTALLATION
------------

###Create database first using below
createdb llschooldb

###Creation of schema/tables, just execute the schooldb.sql file
psql -f schooldb.sql llschooldb


Brief Description about the tables
----------------------------------
1. **TYPE** 				: Table that contains static data/starter data set of allowable values. For example, Status Types [ ACTIVE, INACTIVE ].
2. **STUDENT**				: Table that contains STUDENT basic data elements.
3. **CONTACTS**				: Table that contains student contacts data.[1 student can have many contacts]
4. **STAFF** 				: Table that contains school staff Data.
5. **CLASSROOM**			: Table that contains association between Classroom-section and Staff(Teachers) Data.
6. **CLASSROOM_STUDENT**    : Table that contains the Student to classroom associations/history [ many-to-many].
7. **ATTENDANCE**           : Table that contains the ROLL CALL data for all students for all the working days.
8. **HOLIDAY_CALENDAR**     : Table - School holiday calendar.Data source is from http://www.sos.arkansas.gov/aboutOffice/Pages/stateHolidayCalendar.aspx 


Model Diagram
-------------
Refer to **schooldb_erd.jpg**


Queries:
----------
**queries.sql** has the sample queries

1. Sample 1 - Provide all active PRE-K (3 AND 4 years) students and their primary contact data. Notice students with missing contact data.
2. Sample 2 - Provide all active students of "PRE-KG 3 YRS" grade ALONG with their class room, TEACHER details.
2. Sample 3 - Provide attendance report of tardy or absent students as on 08/15/2014 - Include basic details like student ids, names, class room, teacher, primary contact phone.


Wireframes:
-----------
Sample wire frames can be found in **wireframes** folder:

1. **StudentData.png**  - Screen that provides the maintenance of student data and also student class associations.
2. **StaffData.png**    - Screen that provides the maintenance of staff data.
3. **ClassRooms.png**   - Screen that provides the creationg and maintenance of Staff Vs class room assignments for a given year.
4. **RollCall.png**     - Screen that provides Student Attendance capturing.
5. **AdminScreen.png**  - Screen that provides some basic preferences and holiday maintenance.


Future Enhancements:
--------------------
1. Add ability to capture the student and staff pictures (bytea type).
2. To support higher grade classes - Add ability to store the student grades for different courses by adding course table, exam table to store student, course and marks.
3. Automatically fetch holiday data and load the table HOLIDAY_CALENDAR from - http://www.sos.arkansas.gov/aboutOffice/Pages/stateHolidayCalendar.aspx.
4. Add a feature for contacts an ability to opt-out from receiving messages etc.