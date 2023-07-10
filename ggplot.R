#install packages
#install.packages("ggplot2")

#load the packages
library(ggplot2)

str(mpg)
ggplot(data = mpg, aes(x= hwy, y= cty ) ) + geom_point() + labs(
  x= "highway mpg",
  y= "city mpg",
  title= "city vs highway mileage"
)

ggplot(data = mpg, aes( x= hwy)) + geom_histogram()

str(iris)

sl <- iris$Sepal.Length

ggplot(data = iris, aes(x= sl)) + geom_histogram()

# we can set number of bars with bins

ggplot(data = iris, aes(x= sl)) + geom_histogram(bins =40)

#we can also change size
ggplot(data = iris, aes(x= sl)) + geom_histogram(binwidth =0.25)

#densityplot

ggplot(data = iris, aes(x= sl)) + geom_density()

#boxplot 
ggplot(data = iris, aes(y= sl, x = Species)) + geom_boxplot()


#violin

ggplot(data = iris, aes(y= sl, x = Species)) + geom_violin(aes(fill=Species)) + geom_boxplot(width = 0.2)

ggplot(data = iris, aes(y= sl, x = Species)) + geom_point() + geom_jitter(width= 0.25)

ggplot(data = iris, aes(y= sl, x = Sepal.Width)) + geom_line(stat = "summary", fun = "mean") + geom_smooth(se = F)


#factor

iris$Species<- factor(iris$Species, c("versicolor","setosa","virginica"))

ggplot(data = iris, aes(y= sl, x = Species)) + geom_point() +

scale_color_manual(values = c("violet","lightpink","red"))









