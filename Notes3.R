library(tidyverse)
library(janitor)
library(ggplot2)
library(dplyr)
 # cleaning names ####
clean_names(starwars, "small_camel")
new_wars <- clean_names(starwars, "small_camel")

rename(new_wars, "eye;color" = eyeColor)


starwarsWomen <- filter(starwars, sex == "female")
starwarsWomen <- arrange(starwarsWomen, birth_year)
starwarsWomen <- select(starwarsWomen,name, species)
              

# pipe ####
starwarsWomen <- starwars |>
  filter(sex == "female") |>
  arrange(birth_year) |>
  select(name,species)

#slice_ allows you to take out certain rows


slice_max(starwars, height, n = 2, by = species)



# tidy data ####

table4a

pivot_longer(table4a,
             cols = c('1999','2000'),
             names_to = 'year',
             values_to = 'cases')

table4b

pivot_longer(table4b,
             cols = c('1999','2000'),
             names_to =  'year',
             values_to = "population")





table2

pivot_wider(table2, 
             names_from = type,
             values_from = count)

#separate

table3

separate(table3, 
         rate,
         into = c('cases', 'population')
         sep = '/')

#unite
table5

unite(table5,
      "year",
      c('century', 'year'),
      sep = "")


tidy_table5 <-
  unite(table5,
        "year",
        c('century', 'year'),
        sep = "") |>
  separate( rate,
           into = c('cases', 'population'),
           sep = '/')
tidy_table5




# bind rows





new_data <- data.frame(country = "USA", year = "1999", cases = "1042", population = '2000000')




# ANOVA ####

anova_results <- aov(data = iris, Sepal.Length ~ Species)

TukeyHSD(anova_results)


#is there a sig diff between petal length or width by species

anova_results <- aov(data = iris, Sepal.Length ~ Species)

?aov


anova_results2 <- aov(data = iris, Petal.Length ~ Species)

TukeyHSD(anova_results2)




top3species <- starwars |> summarize(.by = species, 
                                     count = sum(!is.na(species))) |>
  slice_max(count, n=3)


m <- aov(data = top3species, mass ~ species)
summary(m)
TukeyHSD(m)


#chi squared test ####

starwars_clean <- starwars |> filter(!is.na(species),
                                     !is.na((homeworld)))





t <- table(starwars_clean$species, starwars_clean$homeworld)
chisq.test(t)



table(mpg$manufacturer, mpg$class)
table(mpg$cyl, mpg$displ)

t <- table(mpg$year, mpg$drv)



chisqur <- chisq.test(t)

chisqur$p.value
chisqur$residuals

install.packages("corrplot")
library(corrplot)


corrplot(chisqur$residuals
)





# chi sq full analysis


heroes <- read.csv("data/heroes_information.csv")


heroes_clean <-  filter(heroes, Alignment != "-", Gender != "-")

t <- table(heroes_clean$Alignment, heroes_clean$Gender)

ct <- chisq.test(t)
corrplot(ct)
