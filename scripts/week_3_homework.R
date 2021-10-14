surveys <- read.csv("data/portal_data_joined.csv")
colnames(surveys)
surveys_base <- surveys[1:60, c(6,9,13)]
colnames(surveys_base)
speciesID_factor <- as.factor(surveys_base[,c(1)])
speciesID_factor
plot_type_factor <- as.factor(surveys_base[,c(3)])
plot_type_factor
surveys_base_naomit <- surveys_base %>% na.omit(surveys_base$weight)
surveys_base_naomit

surveys_new <- surveys_base_naomit[(surveys_base_naomit[,2]>150),]
surveys_new
