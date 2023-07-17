#compare mass of male vs female characters
#null hypothesis: they are the same
#alt hypothesis: they are not the same
library(tidyverse)
swHumans <- starwars |> filter(species == "Human", mass > 0)
males <- swHumans |> filter(sex == "male")
females <- swHumans |> filter(sex == "female")

t.test(males$mass, females$mass, paired = F, alternative = "two.sided")
?t.test

males$mass
