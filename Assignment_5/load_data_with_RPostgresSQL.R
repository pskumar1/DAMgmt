#Install the RPostgresSQL
install.packages('RPostgresSQL')
library(RPostgreSQL)

#Connect to the flights database

# ********* NOTE - PLEASE CHANGE THE USERNAME , PASSWORD and DATABASE AS PER YOUR DB SETUP *************#
username = "postgres"
password = "test123"
database = "flights"

con <- dbConnect(PostgreSQL(), user = username, password = password, dbname = database)

#send the query, and grab the results into the recordset
rs  <- dbSendQuery(con,
                      "SELECT FLIGHTS.ORIGIN AS \"Airport of origin\",
                        FLIGHTS.CARRIER AS \"Carrier\",
                        WEATHER.TEMP AS \"Approximate temperature at scheduled time of departure\",
                        FLIGHTS.DEP_DELAY AS \"Departure Delay\",
                        FLIGHTS.ARR_DELAY AS \"Arrival Delay\",
                        FLIGHTS.AIR_TIME AS \"Air Time in Minutes\",
                        PLANES.SEATS AS \"Seating Capacity of Airplane\"
                      FROM FLIGHTS AS FLIGHTS 
                        INNER JOIN WEATHER AS WEATHER ON FLIGHTS.ORIGIN = WEATHER.ORIGIN 
  					              AND FLIGHTS.YEAR = WEATHER.YEAR 
						              AND FLIGHTS.MONTH = WEATHER.MONTH 
						              AND FLIGHTS.DAY = WEATHER.DAY
						              AND FLIGHTS.HOUR = WEATHER.HOUR
                        INNER JOIN PLANES AS PLANES ON FLIGHTS.TAILNUM = PLANES.TAILNUM 
                      WHERE 
                        FLIGHTS.ORIGIN IN ('JFK','LGA','EWR') 
                        AND FLIGHTS.DEST = 'LAX'
                        AND (to_timestamp(FLIGHTS.YEAR || '-' || FLIGHTS.MONTH || '-' || FLIGHTS.DAY , 'YYYY-MM-DD') 
                         BETWEEN '2013-02-23' AND '2013-03-01')")

#fetch all observations into data frame.
df.flighdata <- fetch(rs, n=-1)

# Clearing the result set
dbClearResult(rs)

# Disconnect
dbDisconnect(con)

# view the data frame
View(df.flighdata)
