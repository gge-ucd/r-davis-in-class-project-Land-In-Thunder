#Talking through the homework
##Load in the packages
library(tidyverse)
## Load the surveys object in
surveys <-read.csv("data/portal_data_joined.csv")
#Some options for selecting
surveys_base <- select(surveys,species_id,weight,plot_type)
# Other Options are
## surveys_base <- surveys[c(1:60),c(3,6,9)] <- this was the option I did on the homework
## surveys_base <- surveys[c('species_id','weight','plot_type')]
## surveys_base <- surveys %>% select(species_id, weight, plot_type)

# next chose the first 60 rows out of surevyes base
surveys_base <- surveys[c(1:60),c(6,9,13)]
surveys_base %>% str()

## another option
#surveys_base <- head(surveys[c(6,9,13)],n = 60)

#an option for better soft coding is to call column rows by name rather than by number ('species_id')

#need to ommit only rows where weight is NA

is.na(surveys_base$weight)
!is.na(surveys_base$weight)

surveys_base %>% na.omit(surveys_base$weight)

surveys_base[!is.na(surveys_base$weight),]

## End Homework Review



##Start in Class work TIDYVERSE

#1. Keep only observations before 1995
surveys_base <- filter(surveys, year < 1995)
surveys_base

#2. Keep year, sex, weight

surveys_base <- select(surveys_base, year, sex, weight)
surveys_base %>% str()
filter()
surveys_base <- filter(surveys,year < 1995) %>% select(year,sex,weight)

surveys_base <- surveys %>% filter(year<1995) %>% select(year,sex,weight)


#3. Introduce the mutate function
?mutate

surveys_hindfoot_half <- surveys %>% filter(!is.na(hindfoot_length)) %>% mutate(hindfoot_half = hindfoot_length/2)%>% select(species_id, hindfoot_half)%>% filter(hindfoot_half <30)
surveys_hindfoot_half                                                              

surveys %>% group_by(species_id) %>% filter(!is.na(hindfoot_length)) %>% summarize(mean(hindfoot_length), min(hindfoot_length), max(hindfoot_length))



group_by(surveys,)