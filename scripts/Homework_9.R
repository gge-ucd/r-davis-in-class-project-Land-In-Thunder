library(tidyverse)
install.packages('lubridate')
library(lubridate)


mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

mloa2 <- mloa %>% filter(rel_humid != -99, temp_C_2m != -999.9, windSpeed_m_s != -99.9)

# Going to first test code with a subset of the dataset, as the large dataset is somewhat tough on my poor old PC! Lets see how it goes

mloa_mini <- mloa2 %>% head(100) 

?with_tz(datetime)
  
mloa_mini_2 <- mloa_mini %>% mutate(datetime = ymd_hm(paste(year,month,day,hour24,min), tz='UTC')) %>% mutate(datetimeLocal = with_tz(datetime, tz = 'Pacific/Honolulu')) 

#I think that all worked so now on to the dypler part
?month()
?hour()
?group_by
mloa_mini_2 %>% mutate(localmonth = month(datetimeLocal),
                    localhour = hour(datetimeLocal)) %>% group_by(localmonth,localhour) %>% summarize(meantemp = mean(temp_C_2m))

#First created two new columns which pulled the month and hour components out of the datetimeLocal column (which had much more info per row than necessary for this assignment). Next the tibble was grouped by local month and hour to summarize the mean temp for each month and hour 

#Seemed to be successful on the subset, so lets try with the big boy

mloa_big <- mloa2 %>% mutate(datetime = ymd_hm(paste(year,month,day,hour24,min), tz='UTC')) %>% mutate(datetimeLocal = with_tz(datetime, tz = 'Pacific/Honolulu'))

mloa_big %>%
  mutate(localmonth = month(datetimeLocal),localhour = hour(datetimeLocal)) %>% group_by(localmonth,localhour)%>% summarize(meantemp = mean(temp_C_2m))

#still seems good, so lets move onto the plot

mloa_big %>%
  mutate(localmonth = month(datetimeLocal),localhour = hour(datetimeLocal)) %>% group_by(localmonth,localhour)%>% summarize(meantemp = mean(temp_C_2m)) %>% ggplot(aes(x = localmonth, y = meantemp)) +
  geom_point(aes(col = localhour)) + scale_color_viridis_c() +
  xlab("Month") +
  ylab("Mean temperature (degrees C)") +
  theme_classic()

#Fin