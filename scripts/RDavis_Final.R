library(tidyverse)
library(lubridate)
#Load in data and join data tables

weather <- read_csv('Data/nyc_13_weather.csv') 
planes <- read_csv('Data/nyc_13_planes.csv')  
flights <- read_csv('Data/nyc_13_flights_small.csv') 

int_join <- left_join(flights, planes)

joined <- left_join(int_join, weather) 

# 1 
## Plot the departure delay of flights against the precipitation, and include a simple regression line as part of the plot. Hint: there is a geom_ that will plot a simple y ~ x regression line for you, but you might have to use an argument to make sure it’s a regular linear model. Use ggsave to save your ggplot objects into a new folder you create called “plots”.

plot_flights <- ggplot(joined, mapping = aes(x=dep_delay, y=precip)) + geom_point() + geom_smooth(method='lm', formula= y~x) + theme_bw()  

ggsave(filename = "plots/firstplot.png", plot = plot_flights)


##Create a figure that has date on the x axis and each day’s mean departure delay on the y axis. Plot only months September through December. Somehow distinguish between airline carriers (the method is up to you). Again, save your final product into the “plot” folder.

joined %>%  filter(month %in% 9:12) %>%  group_by(month,day) %>% summarise(mean_dep_delay = mean(dep_delay)) %>% unite(Merged, month:day, remove = F) %>% ggplot(mapping = aes(x=Merged, y = mean_dep_delay)) + geom_point()

