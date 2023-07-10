avocado <- read.csv("data/avocado.csv")

average_price = avocado$AveragePrice
total_volume = avocado$Total.Volume[]

total_volume = total_volume[total_volume> lowfence & total_volume <highfence]

iqr <- IQR(avocado$Total.Volume)
Q1 <- quantile(avocado$Total.Volume, .25)
Q3 <- quantile(avocado$Total.Volume, .75)

highfence <- Q3+ (1.5* iqr)
lowfence <- Q1 -(1.5 * iqr)


library(ggplot2)
#firstplot
ggplot(data = avocado, aes(x = average_price ) ) + geom_density()

#second plot
ggplot(data = avocado, aes( x = type, y = average_price, color = type) ) + geom_violin() + 
  geom_boxplot(width = 0.25)

#third plot
ggplot(data= avocado, aes(x= total_volume, y= average_price, color = type)) + geom_point()
