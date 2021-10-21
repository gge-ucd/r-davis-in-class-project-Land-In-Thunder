library(tidyverse)

#Conditional Statements to specify values that you may want to assign to a new column

#ifelse()and case_when()

surveys %>% filter(!is.na(weight))%>% mutate(weight_cat = case_when(weight > mean(weight) ~ 'big', weight < mean(weight) ~ 'small')) %>% select(weight, weight_cat) %>% tail()

data(iris)


str(iris)
# Using the iris data frame (this is built in to R), create a new variable that categorizes petal length into three groups:
#small (less than or equal to the 1st quartile)
#medium (between the 1st and 3rd quartiles)
#large (greater than or equal to the 3rd quartile)
#Hint: Explore the iris data using summary(iris$Petal.Length), to see the petal #length distribution. Then use your function of choice: ifelse() or case_when() to #make a new variable named petal.length.cat based on the conditions listed above. #Note that in the iris data frame there are no NAs, so we don’t have to deal with #them here.
summary(iris$Petal.Length)

is.na(iris$Petal.Length)

iris %>% mutate(Petal.Length.Cat = case_when(Petal.Length <= 1.6 ~ 'small', Petal.Length > 1.6 & Petal.Length<=5.1 ~ 'medium', Petal.Length > 5.1 ~ 'large' )) %>% head(n=10)

#another option with nested ifelse
iris %>%
  mutate(length_cat = ifelse(Petal.Length <= 1.6, "small",
                             ifelse(Petal.Length >= 5.1, "large",
                                    "medium"))) %>% head(n=20)
# if the first statement is true, small, then go to nested. if nested is true, go to large and if still not true, go to medium
                

## Joining Practice


tail_length <- read_csv('data/tail_length.csv')
str(tail_length)
str(surveys)

intersect(colnames(surveys), colnames(tail_length))

combo_dataframe <- left_join(surveys, tail_length, by = 'record_id')



## Pivoting 

str(surveys)


temp_df <- surveys %>% group_by(year,plot_id) %>% tally()

?pivot_wider

pivot_wider(temp_df,id_cols = 'plot_id', names_from = 'year', values_from = 'n')


