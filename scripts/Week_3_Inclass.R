#reading in spreadsheets

surveys <- read.csv("data/portal_data_joined.csv")

head(surveys)
str(surveys)
summary(surveys)

#unique() used to determine the number of unique
unique(surveys$species)
length(unique(surveys$species))



## Subsetting from a data frame
surveys[1,2] #row 1, column 2


surveys_200 <- surveys[200,]
surveys_200

nrow(surveys)
surveys_last <- surveys[34786,]
surveys_last
tail(surveys)


nrow(surveys)/2
34786/2
surveys_middle <- surveys[nrow(surveys)/2,]
surveys_middle
str(surveys_middle)

head(surveys)

final <- surveys[1:6,]
final

nrow(surveys)

final2 <- surveys[-(7:nrow(surveys)),]
final2
