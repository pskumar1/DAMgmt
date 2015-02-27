Loading flights data from postgres db into R dataframe
=======================================================

Problem Definition
------------
For flights from any of the three major NYC airports to Los Angeles Intl airport during the period between 2/23/2013 and 3/1/2013, 
please include the following information:
• Airport of origin
• Carrier
• Approximate temperature at scheduled time of departure
• Departure Delay
• Arrival Delay
• Air Time in Minutes
• Seating Capacity of Airplane


Brief Description of the R script
----------------------------------

   The file *load_data_with_RPostgresSQL.R* has R script that does the below:

     1.Install & load the RPostgresSQL package
	 2.Connect to the flights database using 'dbConnect' - * PLEASE CHANGE THE USERNAME, PASSWORD, DBNAME as per your local setup. *
	 3.Send the query to the database using 'dbSendQuery' and assign the results to a recordset.
	 4.Fetch all observations into a dataframe using 'fetch'.
	 5.Clear the result set and Disconnect from database.
	 6.View the dataframe.

Query
-----
**pull_flights_data.sql** has the query used