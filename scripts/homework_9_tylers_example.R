source('functions/livestreamSetup.R')

livestreamSetup(password = 'vulcans',user = 'rdavis',port = 4040)

library(tidyverse)
install.packages('lubridate')
library(lubridate)


# Let’s look at some real data from Mauna Loa to try to format and plot.
# These meteorological data from Mauna Loa were collected every minute for the year 2001.
# This dataset has 459,769 observations for 9 different metrics of wind,
# humidity, barometric pressure, air temperature, and precipitation.
# Download this dataset here.
# Save it to your data/ folder.
# Alternatively, you can read the CSV directly from the R-DAVIS Github:
mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

#Use the README file associated with the Mauna Loa dataset to determine in
#what time zone the data are reported, and how missing values are reported in each column.

#https://github.com/gge-ucd/R-DAVIS/blob/master/data/mauna_loa_README.txt

#1
#With the mloa data.frame, remove observations with missing values in rel_humid,
#temp_C_2m, and windSpeed_m_s.

mloa_sub = mloa %>% filter(rel_humid!=-99,temp_C_2m!=-999.9,windSpeed_m_s!=-99.9)

mloa_mini <- mloa_sub %>% head(100)
#2
#Generate a column called “datetime” using the year, month, day, hour24, and min columns.
mloa_sub %>% mutate(datetime = paste(year,month,day,sep = '-')) %>%
  mutate(datetime = ymd(datetime)) %>% select(datetime)
#this version does both actions at once in the same mutate call
mloa_sub %>% mutate(datetime = ymd(paste(year,month,day,sep = '-'))) %>% select(datetime)

#now let's add in hour24...
mloa_sub %>% mutate(datetime = ymd_h(paste(year,month,day,hour24,sep = '-'))) %>% select(datetime)


#now let's add in min..
mloa_sub %>% mutate(datetime = ymd_hm(paste(year,month,day,hour24,min,sep = '-'))) %>% select(datetime)

#now let's add in min, and we are done with this task
mloa_sub = mloa_sub %>%
  
  mutate(datetime = ymd_hm(paste(year,month,day,hour24,min)))

#Next, create a column called “datetimeLocal” that converts the datetime column
#to Pacific/Honolulu time (HINT: look at the lubridate function called with_tz()).

mloa_sub$datetimeLocal  = with_tz(time = mloa_sub$datetime,tzone = 'Pacific/Honolulu')

#Then, use dplyr to calculate the mean hourly temperature
#each month using the temp_C_2m column and
#the datetimeLocal columns.
#(HINT: Look at the lubridate functions called month() and hour()).
#Finally, make a ggplot scatterplot of the mean monthly temperature,
#with points colored by local hour.
mloa_sub %>% mutate(localmonth = month(datetimeLocal),
                    localhour = hour(datetimeLocal)) %>%
  group_by(localmonth,localhour) %>%
  summarize(meantemp = mean(temp_C_2m)) %>%
  ggplot(aes(x = localmonth,
             y = meantemp)) +
  # Color points by local hour
  geom_point(aes(col = localhour)) +
  # Use a nice color ramp
  scale_color_viridis_c() +
  # Label axes, add a theme
  xlab("Month") +
  ylab("Mean temperature (degrees C)") +
  theme_classic()
