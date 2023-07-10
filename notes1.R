#cmd shift enter to run all lines
number <- 5
number
number + 6
number <- number + 1
number
#comment 
# Header ####

ls() #print names of all variables in the environment
# Different types of R objects ####
number <- 5
decimal <- 1.5
letter <- "d"
word <- "Hi"

Logic <- TRUE
#or
Logic2 <- T

## types of variables 
class(number)
class(decimal) #numeric

class(letter)
class(word)#character

class(logic)#logic

#more variations in types

typeof(number)
typeof(decimal)

#we can change the type of a variable

as.character(number)
#number doesn't change in the environment

as.integer(decimal)


round(decimal)


?round #tells you about the function


round(22/7, digits = 4)

ceiling(22/7) #ceiling always rounds up
floor(22/7) #always rounds down

#NA values

NA+5

#naming variables

name <- "ethan"
NAME <- "ethan"
N.A.M.E <- "ethan"
n_a_m_e <- "ethan"

# cant use conditionals % | / < > ! \ 
# cant use numbers in front of word
# cant use operators or commas or spaces

#good naming conventions

camelCase <- "capital letters for the first letter of every word"
snake_case <- "underscore between every word"


# object manipulation

number
number+7

decimal
number+ decimal

number
paste(name,"hau is very cool") #concatenates character vectors
paste0(name, "hau") #no spaces
paste(name, number)#we can combine name and numbers

paste(name, "is", number, "feet tall")


?grep #global regular expression print
food <- "watermelon"
grepl("me", food) # T or F if pattern is in word
#substituting things in words
sub("me","you",food)

rm("number")#removes an object from the environment

#vectors ####



rangeOfVals <- 5:10
rangeOfVals

seq(2,10,2)
seq(from=2, to=10, by=2)#can put parameters out of order if named

rep(3,5)
rep(c(1,2),5)

letters <- c("a", "b", "c")
paste("a","b","c") #paste is different

letters <- c(letters,letter)
letters<- c("x", letters, "w")

numbers <- 1:20

FiveNums <- sample(numbers,5)
FiveNums<- sort(Fivenums)
rev(FiveNums)

FifteenNums <- sample(numbers, 15, replace =T)
FifteenNums <- sort(FifteenNums)
length(FifteenNums)
unique(FifteenNums)
table(FifteenNums) #counts the values that you got

FifteenNums +5

nums1 <- c(1,2,3)
nums2 <- c(4,5,6)

nums3 <- c(nums1,nums2)
nums3+nums1 #values are repeated to add together

sum(nums3+1)
sum(nums3)+1

#vector indexing

numbers
numbers[1]
numbers[5]
numbers[c(1,2,3,4,5)]
numbers[c(12,3,4,5)]

#datasets ####
?mtcars
#observations are rows. variables are columns

mtcars #prints dataset in console
View(mtcars) #views it in a new tab
summary(mtcars) #statistics of data
str(mtcars) #preview of the structure of dataset
names(mtcars)#names of variables
heads(mtcars, 5) #preview the first number of rows

#pull out individual varibles as vectors

mpg <- mtcars[,1] #blank means all
mtcars[2,] #second row
mtcars[,1:3] #first 3 columns

#using names to pull out columns
mtcars$gear
mtcars[,c("gear","mpg")] #pull out the gear and mpg columns

sum(mtcars$gear)

#stat####
View(iris)

first5 <- iris[1:5,1]

mean(first5)
irisMean <- mean(iris[,1])

median(iris$Sepal.Length)

range(first5)
max(iris$Sepal.Length)- min(iris$Sepal.Length)

var(first5)
var(iris$Sepal.Length)

sd(first5)

sigma <- sd(iris$Sepal.Length)

IQR(first5)
IQR(iris$Sepal.Length)
quantile(first5,.25)#Q1
quantile(first5,.75)#Q3


(irisMean-3) * sigma

#subsetting vectors

first5
first5 < 4.75
first5[first5<4.75] #removes values < 4.75

sl <- iris$Sepal.Length

upper <- mean(sl) + 3*sd(sl)
lower <- mean(sl) - 3*sd(sl)

values <- c(first5, 3,9)

values[values < upper & values > lower]

mean(c(1,2,3,NA), na.rm=T)

     