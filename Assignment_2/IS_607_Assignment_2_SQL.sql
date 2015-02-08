----------------------------------------------------------------------------------------------------------------
--IS 607 Data Acquisition and Management - Assignment - 2
--Submitted by: Suman Kumar Polavarapu.
--Date: 02-08-2015
----------------------------------------------------------------------------------------------------------------

--1).Which destination in the flights database is the furthest distance away?
	select dest from flights order by distance desc limit 1

	--If we need to both destination code and name
	select f.dest, b.name, f.distance from flights f inner join airports b on f.dest = b.faa order by f.distance desc limit 1

--2.1)What are the different numbers of engines in the planes table?
	select distinct engines from planes order by engines

	--2.2).For each number of engines, which aircraft have the most number of seats?

	--This below query gives the engines, along with their max seats
	select engines,max(seats) as maxseats from planes group by engines

	--Now lets join the results from above with the same table to pull the manufacturer. 
	select distinct p.engines, p.manufacturer, p.seats
	from ( select engines,max(seats) as maxseats
	 from planes group by engines ) as temp 
	inner join planes as p on p.engines = temp.engines and p.seats = temp.maxseats
	order by p.engines,p.manufacturer

--3).What weather conditions are associated with New York City departure delays?
	select f.origin,f.dest,f.flight,f.dep_delay,(f.year || '-' || f.month || '-' || f.day) as dep_date,f.hour,w.temp,w.dewp,w.humid,w.wind_dir,w.wind_speed,
	 w.wind_gust, w.precip,w.pressure,w.visib 
	 from flights f join weather w on f.year = w.year and f.month = w.month and f.day = w.day and f.hour = w.hour and f.origin = w.origin
	where f.dep_delay > 0 and f.origin in ('JFK', 'LGA', 'EWR') order by dep_date desc, f.origin

--4).Are older planes more likely to be delayed?
	--Let’s first try with the total delay for each manufactured year. And then with average delay per manufacture year.
	select p.year as manufacture_year, round(sum(f.arr_delay)) as total_arr_delay 
	from    planes p join flights f on p.tailnum = f.tailnum 
	where f.arr_delay > 0 and p.year is not null 
	group by manufacture_year order by manufacture_year desc, total_arr_delay

	select p.year as manufacture_year, round(avg(f.arr_delay)) as average_arr_delay 
	from    planes p join flights f on p.tailnum = f.tailnum 
	where f.arr_delay > 0 and p.year is not null 
	group by manufacture_year order by manufacture_year desc, average_arr_delay

	--CONCLUSION: After analysing the data with tools like R (Please see the R Script), its concluded that OLDER planes might no causing the delays.

--5).	Ask (and if possible answer) a question that also requires joining information from two or more tables in the
--	flights database, and/or assumes that additional information can be collected in advance of answering your question

	--Question:Identify the top-3 best and worst airlines carriers with respect to arrival delays overall.

	--Answers:
			select	a.carrier,a.name, round(avg(f.arr_delay)) as avg_arr_delay from	airlines a join	flights f
			on a.carrier = f.carrier and f.arr_delay >= 0 group by a.carrier,a.name	order by avg_arr_delay asc limit 3

			select a.carrier,a.name,round(avg(f.arr_delay)) as avg_arr_delay from airlines a
			join flights f on a.carrier = f.carrier and f.arr_delay >= 0 group by a.carrier, a.name order by avg_arr_delay desc limit 3
----------------------------------------------------------------------------------------------------------------