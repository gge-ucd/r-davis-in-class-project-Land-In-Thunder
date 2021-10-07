set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

# Remove the NA from the number set
hw2 <- na.omit(hw2)

#Check that NA was removed
hw2

#Note that NAs are special values in R and do not behave like other types of data. Good ways to get rid of NAs from a vector are 
# na.omit(hw2)
# hw2[!is.na(hw2)]


#Selecting for numbers between 14 and 38 inclusive

prob1 <- hw2[hw2 >= 14 & hw2 <= 38]
prob1

#Vector multiplication
times3 <- prob1 * 3

times3

#Vector plus 10
plus10 <- 10 + times3
plus10

#Select every other number in the vector using vector recycling 
every_other <- plus10[c(T,F)]
every_other


#Another option for selecting every other 
odds <- seq(from = 1, to = 23, by = 2)

final <- plus10[odds]
final


## Finish HW

