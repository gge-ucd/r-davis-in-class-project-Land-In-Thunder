library(tidyverse)

surveys_complete <- read_csv('data/portal_data_joined.csv') %>% filter(complete.cases(.))




#Use what you just learned to create a scatter plot of weight and species_id with weight on the Y-axis, and species_id on the X-axis. Have the colors be coded by plot_type. Is this a good way to show this type of data? What might be a better graph?
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) + geom_point(alpha = 0.3, mapping = aes(color = plot_type)) + theme_classic()

#possibly a better option? meeeh
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) + geom_point() + facet_wrap(~plot_type)


ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) + geom_boxplot() + geom_jitter(mapping = aes(color=plot_type)) + theme_classic()



ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato") #notice our color needs to be in quotations 

ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_violin(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato") #notice our color needs to be in quotations
?geom_density()

ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_density(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato") +theme_classic()

ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_violin(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato") + scale_y_log10()

class(surveys_complete$plot_id)

surveys_complete$plot_factor <- as.factor(surveys_complete$plot_id)

surveys_complete %>% filter(species_id == 'NL'| species_id == 'PL') %>% mutate(plot_factor = as.factor(plot_id)) %>% ggplot(mapping = aes(x = species_id, y = hindfoot_length)) + geom_jitter(alpha = 0.3, mapping = aes(color = plot_factor)) + geom_boxplot(alpha = 0.5) + theme_classic()+ labs(x = 'Species ID', y = 'Hindfoot Length', title = 'Boxplot', color = 'Plot ID') + theme(axis.title.x = element_text(angle = 45) )
