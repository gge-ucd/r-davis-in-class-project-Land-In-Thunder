##Using Conditional statements to create variables in a dataframe
library(tidyverse)
surveys <- read_csv('data/portal_data_joined.csv')
str(surveys)

#Practice conditional statements
summary(surveys$hindfoot_length)

#function that tests an object and returns true elements
## three parts, the if test, what do you want with yes, and what do you want with no
ifelse(surveys$hindfoot_length<mean(surveys$hindfoot_length,na.rm = T), yes = 'small', no = 'big')

surveys <- mutate(surveys,hindfoot_size = ifelse(surveys$hindfoot_length<mean(surveys$hindfoot_length,na.rm = T), yes = 'small', no = 'big'))




## Joining two dataframes
#load in a second dataset
tail <- read_csv('data/tail_length.csv')
str(tail)
summary(tail$record_id)
summary(surveys$record_id)

#joining --> 4 basic fnc --> inner_join, left_join, right_join, full_join. b/c record_id is same for both columns it is a 1:1 join

surveys_joined <- left_join(surveys,tail,by = 'record_id')


#reshaping from long to wide or wide to short --> pivot_wider and pivot_longer

surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight)) 

surveys_mz

unique(surveys_mz$genus)

wide_survey <- pivot_wider(surveys_mz, names_from = 'plot_id', values_from = 'mean_weight')
dim(wide_survey)
str(wide_survey)


pivot_longer(wide_survey,cols = -genus,names_to = 'plot_id',values_to = 'mean_weight') %>% head()
