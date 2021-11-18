library(tidyverse)
sample_dates_1 <- c("2018-02-01", "2018-03-21", "2018-10-05", "2019-01-01", "2019-02-18")

# Lucky version
str(sample_dates_1)
sort(sample_dates_1)

sample_dates_1 <- as.Date(sample_dates_1)
 str(sample_dates_1)

# Unlucky version
 
 sample_dates_2 <- c("02-01-2018", "03-21-2018", "10-05-2018", "01-01-2019", "02-18-2019")
 
 sample_dates_3 <-as.Date(sample_dates_2) # well that doesn't work

 str(sample_dates_3)

 sample_dates_3 <- as.Date(sample_dates_2, format = '%m-%d-%Y') 
sample_dates_3 


library('lubridate')

sample_dates_1 <- c("2018-02-01", "2018-03-21", "2018-10-05", "2019-01-01", "2019-02-18")

#Something broke here and lost a little progress. Moving onto second video
 for.dec.date <- lubridate::ymd(sample_dates_1)

lubridate::decimal_date(for.dec.date)




#Function Writing

#A Summing Function, with no built in arguments
2+3

my_sum <- function(number1, number2){
        the_sum <- number1 + number2
        return(the_sum)
}

my_sum(number1 = 2, number2 = 3)
my_sum(2,3)

## A summing function again, but with default values for arguments 
my_sum2 <- function(number1 = 2, number2 = 3){
        the_sum <- number1 + number2
        return(the_sum)
}
my_sum2()
my_sum2(number1 = 10)


## Temperature Conversion

F_to_K <- function(tempF){
        K <- ((tempF - 32)*(5/9)) + 273.15
        return(K)
}


F_to_K(80)


## gapmind data set: Average GDP per Capita over a range of years
library(tidyverse)
install.packages('gapminder')
library(gapminder)
summary(gapminder)

#Long form
gapminder %>% 
        filter(country == 'Canada', year %in% 1970:1980) %>% 
        summarize(mean(gdpPercap, na.rm = T))

#Use of Function Writing

avgGDP <- function(cntry, yr.range){
        gapminder %>% 
                filter(country == cntry, year %in% yr.range) %>% 
                summarize(mean(gdpPercap, na.rm = T)) 
}

avgGDP(cntry = 'Iran', 1980:1990)
avgGDP('Zambia', 1980:1990)
