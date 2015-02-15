install.packages('RPostgresSQL')
install.packages('ggplot2')
library(RPostgreSQL)
library(ggplot2)
library(scales)


con <- dbConnect(PostgreSQL(), user= "postgres", password="test123", dbname="flights")
rs_total_delays <- dbSendQuery(con,
                  "select p.year as manufactured_year, round(sum(f.arr_delay)) as total_arr_delay from planes p join flights f on p.tailnum = f.tailnum where
                  f.arr_delay > 0 and p.year is not null  group by manufactured_year order by manufactured_year desc, total_arr_delay")

#fetch observations
df_total_delays <- fetch(rs_total_delays, n=-1)

# Clearing the result set
dbClearResult(rs_total_delays)

#fetch observations
rs_avg_delays <- dbSendQuery(con,
                             "select p.year as manufactured_year, round(avg(f.arr_delay)) as average_arr_delay from planes p join flights f on 
                             p.tailnum = f.tailnum where f.arr_delay > 0 and p.year is not null  group by manufactured_year order by manufactured_year desc, 
                             average_arr_delay")

df_avg_delays <- fetch(rs_avg_delays, n=-1)

# Clearing the result set
dbClearResult(rs_avg_delays)

# Disconnect
dbDisconnect(con)

# Plot the graph for total delays vs manf year
ggplot(data = df_total_delays, aes(x=manufactured_year, y=total_arr_delay)) + geom_point(color="firebrick") + scale_y_continuous(labels=comma) + stat_smooth()

# Plot the graph for avg delays vs manf year
ggplot(data = df_avg_delays, aes(x=manufactured_year, y=average_arr_delay)) + geom_point(color="firebrick") + scale_y_continuous(labels=comma) + stat_smooth()
 