library(tidyverse)

head(iris)
head(mtcars)

#sub-setting with square brackets 
iris[1] #Column 1 in list form

iris[[1]] #Column 1 but in vector form

iris[,1] #left of the comma = row, right of the bracket = column therefore this is all rows in column 1

iris[1,1] #row 1 column 1

iris$Sepal.Length[1] #first row value in column sepal length


# ----- For Loops
for(i in 1:10){
  print(i)
}

i

for (i in 1:10) {
  print(iris$Sepal.Length[i])
}

for (i in 1:10) {
  print(iris$Sepal.Length[i])
  print(mtcars$mpg[i])
}

# store output

results <- rep(NA, nrow(mtcars))
results

for (i in 1:nrow(mtcars)) {
  results[i] <- mtcars$wt[i]*100
}

results


# Iteration with map functions

## map takes an input and a function argument

# when to use map vs for loops - Map functions iterrate across columns where for loops usually go down rows.

map(iris, mean) #by default map outputs a list
map_df(iris, mean) #output is a dataframe ## anything that follows the underscore of the map function is an output style
map_df(iris[1:4], mean)

## mapping with 2 arguments with a pre-written function

mtcars
print_mpg <- function(x,y){
  paste(x, 'gets', y, 'miles per gallon')
}

print_mpg

map2_chr(rownames(mtcars), mtcars$mpg, print_mpg)

## Mapping with 2 arguments with an embedded 'anonymous' function

map2_chr(rownames(mtcars), mtcars$mpg, function(x,y) paste(x, 'gets', y, 'miles per gallon'))

#two ways to get to the same thing!
