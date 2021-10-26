library(tidyverse)
surveys <- read_csv('data/portal_data_joined.csv')

#Create a tibble named surveys from the portal_data_joined.csv file. Then manipulate surveys to create a new dataframe called surveys_wide with a column for genus and a column named after every plot type, with each of these columns containing the mean hindfoot length of animals in that plot type and genus. So every row has a genus and then a mean hindfoot length value for every plot type. The dataframe should be sorted by values in the Control plot type column. This question will involve quite a few of the functions you’ve used so far, and it may be useful to sketch out the steps to get to the final result.


#1st need to create a temp data frame tester to group by desired qualities and create a mean hindfoot length for each genus/plot type combo
temp_df <- surveys %>% filter(!is.na(hindfoot_length)) %>%  group_by(genus, plot_type) %>% summarize(mean_hindfoot = mean(hindfoot_length))

#use pivot_wider to rearrange for desired effect and arrange to sort the rows by control hindfoot mean from low to high.
wide_1 <- pivot_wider(temp_df, id_cols = 'genus', names_from = 'plot_type', values_from = mean_hindfoot) %>% arrange(Control)

wide_1


#Using the original surveys dataframe, use the two different functions we laid out for conditional statements, ifelse() and case_when(), to calculate a new weight category variable called weight_cat. For this variable, define the rodent weight into three categories, where “small” is less than or equal to the 1st quartile of weight distribution, “medium” is between (but not inclusive) the 1st and 3rd quartile, and “large” is any weight greater than or equal to the 3rd quartile. (Hint: the summary() function on a column summarizes the distribution). For ifelse() and case_when(), compare what happens to the weight values of NA, depending on how you specify your arguments.

summary(surveys$weight)

ifelse_cond <- surveys %>% mutate(weight_cat = ifelse(weight <= 20.0, 'small', ifelse(weight >= 48.0, 'large', 'medium')))

ifelse_cond

#using the ifelse function it looks as IF weight = NA, then weight_cat = NA. Not the end of the world, but probably best to remove those NA's


ifelse_cond2 <- surveys[!is.na(surveys$weight),] %>% mutate(weight_cat = ifelse(weight <= 20.0, 'small', ifelse(weight >= 48.0, 'large', 'medium')))


#Now to use the case_when() function

summary(surveys$weight)

case_cond <- surveys %>% mutate(weight_cat = case_when(weight<= 20.0 ~ 'small', weight > 20.0 & weight < 48.0 ~ 'medium', weight >= 48.0 ~ 'large' ))

#Using the case_when function with NA seems to be similar to that of ifelse. Maybe I am missing the point, or I do not understand the 'how you specify the arguments part' of the prompt. Regardless probably best to remove those NA's again. I will use a different technique to practice.

case_cond2 <- surveys %>% filter(!is.na(surveys$weight)) %>% mutate(weight_cat = case_when(weight<= 20.0 ~ 'small', weight > 20.0 & weight < 48.0 ~ 'medium', weight >= 48.0 ~ 'large' ))

case_cond2


#HW answers did clear up the NA's thing a bit, but it would be helpful to review in class. I am still not particularly clear.

#I am also not clear on the double bracket and how it ended up with the quartile values. It would be helpful to go over this as well!