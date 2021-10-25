library(tidyverse)

install.packages('ggthemes')
library(ggthemes)
#Using ggplot package to create scatter plots and box plots

## General format: ggplot(data = <DATA>, mapping = aes(<MAPPINGS>)) + <GEOM_FUNCTION>()

#mapping = aes is for aesthetics 
#geom_point() for scatter plots (continuous x continuous variables)
#geom_boxplot() for boxplots (categorical x continuous variables)
#geom_line() for trend lines

surveys <- read_csv('data/portal_data_joined.csv') %>% filter(complete.cases(.)) #filter --> complete cases to omit all NA's from the surveys table

ggplot(data = surveys) # = a blank canvas

ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length)) #a blank canvas with axes, but not data in plot yet because no geom function

ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length)) + 
  geom_point() #blank canvas + axes + point data

base_plot <- ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length)) #saved base plot so that you can play with new additions in a simpler matter

base_plot + geom_point()


#can add plot elements to make the plot better such as transparency, color, fill
# transparency = alpha
# color = color
# infill = fill

base_plot + geom_point(alpha = 0.2)

base_plot + geom_point(alpha = 0.1, color = 'red')


# Lets try coloring by a categorical (such as species ID)

ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length)) + 
  geom_point(mapping = aes(color = species_id))


#Now we will look at box plots using geom_boxplot() Most useful using categorical by continuous

base_box <- ggplot(data = surveys, mapping = aes(x = species_id, y = weight)) 

base_box + geom_boxplot(color = 'purple') + geom_point()


base_box + geom_boxplot() + geom_jitter(alpha = 0.1, mapping = aes(color = species_id))


yearly_counts <- surveys %>%  count(year, species_id)

ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) + geom_line()


# group by species_id

ggplot(data = yearly_counts, mapping = aes(x = year, y = n, group = species_id)) + geom_line()


#facet to seperate out lines into each their own box using facet_wrap

ggplot(data = yearly_counts, mapping = aes(x = year, y = n, group = species_id)) + geom_line() + facet_wrap(~species_id)


#playing with other parts of facet wrap

ggplot(data = yearly_counts, mapping = aes(x = year, y = n, group = species_id)) + geom_line() + facet_wrap(~species_id, scales = 'free_y')


#can create themes as well using themes_... function

ggplot(data = yearly_counts, mapping = aes(x = year, y = n, group = species_id)) + geom_line() + theme_bw()
