#principal component analysis ####
library(tidyverse)
head(iris)

iris_num <- select(iris, -Species)
pcas <- prcomp(iris_num, scale = T)
summary(pcas)
pcas$rotation

pcas$x

pca_vals <- as.data.frame(pcas$x)
pca_vals$species <- iris$Species

ggplot(pca_vals, aes(PC1, PC2, color = species)) +
  geom_point()

pca_vals


