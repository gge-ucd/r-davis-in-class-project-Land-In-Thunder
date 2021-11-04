library(tidyverse)
library(ggthemes)
gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

#First calculates mean life expectancy on each continent. Then create a plot that shows how life expectancy has changed over time in each continent. Try to do this all in one step using pipes! (aka, try not to create intermediate dataframes)
?summarize

gapminder %>% group_by(continent, year) %>% summarise(mean_lifeExp = mean(lifeExp)) %>% ggplot() + geom_point(aes(x = year, y = mean_lifeExp, color = continent)) + geom_line(aes(x = year, y = mean_lifeExp, color = continent)) + facet_wrap(~continent) + theme_economist_white()


#Look at the following code and answer the following questions. What do you think the scale_x_log10() line of code is achieving? What about the geom_smooth() line of code?

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = 0.25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

?geom_smooth

#scale_x_log10() is changing the default scale of the x axis to a log10 so that the points are more evenly distributed through the graph. Removal of that item clumps all points towards the bottom left corner

#geom_smooth is creating a smoothed conditional mean which develops a regression line for the data where life expectancy is dependent on gdp per capita. This allows us to see a clear relationship between the two.


#Create a boxplot that shows the life expectency for Brazil, China, El Salvador, Niger, and the United States, with the data points in the backgroud using geom_jitter. Label the X and Y axis with “Country” and “Life Expectancy” and title the plot “Life Expectancy of Five Countries”.
intrest <- c("Brazil", "China", "El Salvador", "Niger", "United States")

gapminder %>%  filter(country %in% intrest) %>% ggplot(aes(x = country, y = lifeExp)) + geom_boxplot() + geom_jitter(alpha = 0.2, color = 'tomato') + theme_tufte() + xlab('Country') + ylab('Life Expectancy') + ggtitle('Life Expectancy of Five Countries') 


