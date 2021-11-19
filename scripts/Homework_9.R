library(tidyverse)
library(lubridate)


mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

mloa2 <- mloa %>% filter(rel_humid != -99, temp_C_2m != -999.9, windSpeed_m_s != -99.9)

mloa_mini <- mloa2 %>% head(100) 


  
mloa_mini_2 <- mloa_mini %>% mutate(datetime = ymd_hm(paste(year,month,day,hour24,min), tz='UTC')) %>% mutate(datetimeLocal = with_tz(datetime, tz = 'Pacific/Honolulu')) %>%  head()

?with_tz(datetime)



