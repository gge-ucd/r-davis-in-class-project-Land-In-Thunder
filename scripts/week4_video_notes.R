#Week 4 Video notes

#Data Manipulation Part 1a

#But first, packages 
# only need to install once, but here is how to do it
# install.packages("tidyverse")

#This script came from installing packages in R video
library(tidyverse)
install.packages("lubridate")
library(lubridate)

#dypler is a relatively intuitive and easy way for manipulating data frame objects

surveys <- read_csv("data/portal_data_joined.csv")