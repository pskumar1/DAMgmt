--For flights from any of the three major NYC airports to Los Angeles Intl airport during the period between 2/23/2013 and
--3/1/2013, please include the following information:
-- • Airport of origin
-- • Carrier
-- • Approximate temperature at scheduled time of departure
-- • Departure Delay
-- • Arrival Delay
-- • Air Time in Minutes
-- • Seating Capacity of Airplane

SELECT FLIGHTS.ORIGIN AS "Airport of origin",
       FLIGHTS.CARRIER AS "Carrier",
       WEATHER.TEMP AS "Approximate temperature at scheduled time of departure",
       FLIGHTS.DEP_DELAY AS "Departure Delay",
       FLIGHTS.ARR_DELAY AS "Arrival Delay",
       FLIGHTS.AIR_TIME AS "Air Time in Minutes",
       PLANES.SEATS AS "Seating Capacity of Airplane"
FROM FLIGHTS AS FLIGHTS 
     INNER JOIN WEATHER AS WEATHER ON FLIGHTS.ORIGIN = WEATHER.ORIGIN 
						     AND FLIGHTS.YEAR = WEATHER.YEAR 
						     AND FLIGHTS.MONTH = WEATHER.MONTH 
						     AND FLIGHTS.DAY = WEATHER.DAY
						     AND FLIGHTS.HOUR = WEATHER.HOUR
     INNER JOIN PLANES AS PLANES ON FLIGHTS.TAILNUM = PLANES.TAILNUM
 WHERE 
     FLIGHTS.ORIGIN IN ('JFK','LGA','EWR') AND 
     FLIGHTS.DEST = 'LAX'
     AND (to_timestamp(FLIGHTS.YEAR || '-' || FLIGHTS.MONTH || '-' || FLIGHTS.DAY , 'YYYY-MM-DD') BETWEEN '2013-02-23' AND '2013-03-01')




      

