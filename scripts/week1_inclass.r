a <- 1
a <-2
a
letters

#Vector is a collection of things tied to an object name in r - For example "letters" is a vector of the alphabet

(number_vector <- c(23, 32, 45))
# index out a single number in a vector using the []

number_vector[c(2)]
number_vector[2]
number_vector[c(2,2)]

# Index out vector in reverse
number_vector[c(3,2,1)]
rev(number_vector)

#vector of strings
my_string <- c("this", "is", "a", "vector", "of", "strings")
my_string

#ways to look at objects created. 1 - structure, 2 - class
str(my_string)
class(my_string)


# data frame = set of vectors whuch have been aligned into columns = essentially an excell spread sheet

?data.frame
data.frame(my_string)

df <- data.frame(my_string, number_vector)
df

#or

df2 <- data.frame(first_column = number_vector, second_column = my_string)
df2

#note that the vector length did not match so that numbers have started to recycle

#now looking at lists
?list

test_list <- list("first string entry into list", "second string entry into list", df2)
test_list
str(test_list)
test_list[2]


# need to be able to make a vector, a data frame, and a list - Need to be able to index from a vector, data frame, and list
