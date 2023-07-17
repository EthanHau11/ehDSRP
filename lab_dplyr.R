library(tidyverse)

avocado <- read.csv("data/avocado.csv")

view(avocado)


#arrange
bags <- arrange(avocado, desc(Total.Bags))
view(bags)

#filter
Volume <- filter(avocado, Total.Volume > 10000)
view(Volume)

#select
Type_of_Cado <- select(avocado, X4046, X4225, X4770, type, region )
view(Type_of_Cado)

#mutate

new_avocado <- mutate(avocado,
       Price_Peso = AveragePrice *17.05,
       volume_M = Total.Volume/ 1000000)
view(new_avocado)


US <- filter(avocado, region == "TotalUS", grepl(12, Date), grepl(0,Date))
view(US)
#summarize
#?summarize

summary <- summarize(avocado, 
          AveragerPrice = mean(AveragePrice),
          .by = region)
view(summary)

ggplot(US, aes(x = year, y = AveragePrice)) + geom_point() 







