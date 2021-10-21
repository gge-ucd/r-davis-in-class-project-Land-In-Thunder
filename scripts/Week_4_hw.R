library(tidyverse)

surveys <- read_csv('data/portal_data_joined.csv')
str(surveys)

?filter #The filter() function is used to subset a data frame, retaining all rows that satisfy your conditions. To be retained, the row must produce a value of TRUE for all conditions.

# Can create the pipe function %>% by using keyboard shortcut Ctrl + Shift + M --> %>% 

surveys %>% filter(weight>30 & weight<60) %>% head()

!is.na(surveys$weight)#not sure why, but this wasnt as happy as
surveys %>% filter(!is.na(weight)) #this in biggest_critters

?select #Select columns using their names and types
?group_by #group_by() takes an existing tbl and converts it into a grouped tbl where operations are performed "by group".
?summarise

biggest_critters <- surveys %>% filter(!is.na(weight) & !is.na(sex) & !is.na(species)) %>% group_by(species, sex) %>% summarise(max_weight = max(weight))

biggest_critters

?arrange #arrange() orders the rows of a data frame by the values of selected columns.
?desc #Transform a vector into a format that will be sorted in descending order. This is useful within arrange().

biggest_critters %>% arrange(desc(max_weight))


?tally #count observations by group, reduces the data down, but then there is not so much what you can do with the data afterwards --> Another option may be to summarise(count = n(), ... now can add other data exploratories such as ... mean())

surveys %>% filter(is.na(weight)) %>% group_by(species) %>% tally() %>% arrange(desc(n)) #count number of NA Values in weight and then group by various columns to find where NA's Concentrated

surveys %>% filter(is.na(weight)) %>% group_by(plot_id) %>% tally() %>% arrange(desc(n))

surveys %>% filter(is.na(weight)) %>% group_by(sex) %>% tally() %>% arrange(desc(n))

surveys %>% filter(is.na(weight)) %>% group_by(year) %>% tally() %>% arrange(desc(n))

surveys %>% filter(is.na(weight)) %>% group_by(species_id) %>% tally() %>% arrange(desc(n))

surveys %>% filter(is.na(weight)) %>% group_by(genus) %>% tally() %>% arrange(desc(n))

# Weight NA seem to be concentrated in the Dipodomys and Ammospermophilus genus --> and spp_id AH, DM, AB, SS 


surveys_avg_weight <- surveys %>% filter(!is.na(weight)) %>% group_by(species, sex) %>% mutate(avg_weight = mean(weight)) %>% select(species, sex, weight, avg_weight)

surveys_avg_weight %>% mutate(above_average = weight > avg_weight)


