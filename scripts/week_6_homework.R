library(tidyverse)
library(ggthemes)
gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

#First calculates mean life expectancy on each continent. Then create a plot that shows how life expectancy has changed over time in each continent. Try to do this all in one step using pipes! (aka, try not to create intermediate dataframes)
?summarize

gapminder %>% group_by(continent, year) %>% summarise(mean_lifeExp = mean(lifeExp)) %>% ggplot() + geom_point(aes(x = year, y = mean_lifeExp, color = continent)) + geom_line(aes(x = year, y = mean_lifeExp, color = continent)) + facet_wrap(~continent) + theme_economist_white() + theme()
