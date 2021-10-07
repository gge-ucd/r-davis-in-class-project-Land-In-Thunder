#Start Video 1 "starting with data in R (base R)
# Goals
## using the read.csv() to read in data
## Explore and subset dataframes
##Packages and Base R vs the tidyverse

# Reading in data
surveys <- read.csv("data/portal_data_joined.csv")

## Inspecting the data
nrow(surveys)
ncol(surveys)

#What kind of data is surveys?
class(surveys)

#Look at the top or bottom entries
head(surveys)
tail(surveys)

# Look at the data in its entirety
## can click on the object in the environment or use the code 
View(surveys)

#More about the data

str(surveys)

## $represents the columns , data type of each column and first set of observations 

summary(surveys)
##summarizes each column with min median, mean, max etc...


#Indexing --> using square brackets to subset data out of a vector or dataframe

## Inside the brackets [row,column]

surveys[1,1]
surveys[1,6]

##extracts a vector
surveys[,6]

##maintains dataframe
surveys[6]

surveys[1:3,]


## Special signs for subsetting [:] presents a range, and [-] subtracts

surveys[1:6,]
surveys[-(1:6),-(1:8)]


##Subseting with column name
##output is a dataframe
surveys["species_id"]

colnames(surveys)
##output is a vector
surveys[,"species_id"]

surveys$species_id

#End "Starting with data in R (base R)

#Start "Starting with data in R (tidyverse)

# Loading the tidyverse
#install.packages("tidyverse")

library(tidyverse)

#this is a tibble
surveys_t <- read_csv("data/portal_data_joined.csv")
surveys_t

class(surveys_t)

#this is a data.frame
surveys

#subsetting in tibbles is a bit different
surveys_t[,1]
#still a tibble rather than a vector

## END VIDEO LECURE FROM WEEK 3







