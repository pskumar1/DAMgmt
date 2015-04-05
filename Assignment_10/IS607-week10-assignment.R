# 607-week10-assignment.R
 

install.packages("XML")
library(XML)
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowlPool <- readHTMLTable(theURL, which = 1, header = FALSE, stringsAsFactors = FALSE)
bowlPool

# 1. What type of data structure is bowlpool? 
str(bowlPool)

bowlpool is an R data frame of 3 variables.

# 2. Suppose instead you call readHTMLTable() with just the URL argument,
# against the provided URL, as shown below

theURL <- "http://www.w3schools.com/html/html_tables.asp"
hvalues <- readHTMLTable(theURL)

# What is the type of variable returned in hvalues?
str(hvalues)
Its a list of all tables (data frames)

# 3. Write R code that shows how many HTML tables are represented in hvalues
length(hvalues)


# 4. Modify the readHTMLTable code so that just the table with Number,FirstName, LastName, # and Points is returned into a dataframe
hvalues <- readHTMLTable(theURL, which = 1, header = TRUE, stringsAsFactors = FALSE)


# 5. Modify the returned data frame so only the Last Name and Points columns are shown.
hvalues <- hvalues[,c("Last Name", "Points")]
hvalues


# 6 Identify another interesting page on the web with HTML table values.  
# This may be somewhat tricky, because while
# HTML tables are great for web-page scrapers, many HTML designers now prefer 
# creating tables using other methods (such as <div> tags or .png files).  

url = "http://en.wikipedia.org/wiki/Country_population"
tbls = readHTMLTable(url)


# 7 How many HTML tables does that page contain?

length(tbls)

There are 5 tables.

#Let's read the first table - whic is population of countries

population = readHTMLTable(url, which=1)


# 8 Identify your web browser, and describe (in one or two sentences) 
# how you view HTML page source in your web browser.

Chrome - Click on the Menu button ( this is a square button with 3 horizontal bars located in the top right corner of the browser window), select the Tools submenu.
Click "View Source". The source code will open in a new tab. ( Developer tools option would show the source in the same page)

The other approach is simply right click and choose "Inspect Element" ( we can simply select a piece of code and look for the XPath etc..)


# 9 (Optional challenge exercise)
# Instead of using readHTMLTable from the XML package, use the functionality in the rvest package to perform the same task.  
# Which method do you prefer?  Why might one prefer one package over the other?


population <- url %>%
                html() %>%
                  html_nodes(xpath = '//*[@id="mw-content-text"]/table[1]') %>%
                    html_table(fill = TRUE, header = TRUE,)

str(population)
popdf <- population[[1]]

head(popdf)

#remove the square brackets and text inside the square brackets
popdf$"Country (or dependent territory)" <- gsub("(\\[).*(\\])","", popdf$"Country (or dependent territory)", perl=TRUE)

#remove line breaks from the col names
colnames(popdf) <- gsub("[\r\n]", " ", colnames(popdf))

head(popdf)

# Which method do you prefer?  Why might one prefer one package over the other?

I prefer rvest package, because it makes the scrapping easy from html pages, using XPath expressions and make use of the pipelines composed of simple, easy understood pieces.



