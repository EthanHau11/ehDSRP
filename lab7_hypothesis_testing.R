library(tidyverse)
avocado <- read.csv("data/avocado.csv")

view(avocado)

orgo_avocado <- filter(avocado, type == "organic")
con_avocado <- filter(avocado, type == "conventional")

t.test(orgo_avocado$Total.Bags, con_avocado$Total.Bags, paired = F, alternative = "less")

clean_avocado <- filter(avocado,!is.na(AveragePrice))

anova_results <- aov(data = clean_avocado, AveragePrice ~ region)
TukeyHSD(anova_results)

?anova
?summary

head(avocado)

str(avocado)

?table

t <- table(avocado$region, avocado$type)

?mutate
chisq.test(t)
