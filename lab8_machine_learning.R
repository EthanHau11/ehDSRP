#load packages
library(tidymodels)
library(tidyverse)
library(yardstick)
library(Metrics)
library(reshape2)

avocado <- read.csv("data/avocado.csv")

view(avocado)

clean_avocado <- select(avocado, AveragePrice, Total.Volume, Total.Bags)
pcas <- prcomp(clean_avocado, scale = T)

pcas
summary(pcas)
pcas$x
pca_val$type <- avocado$type

pca_val <- as.data.frame(pcas$x)


ggplot(pca_val, aes(PC1, PC2, color = type)) +
  geom_point()


pcas
view(pcas)

cor(clean_avocado)

set.seed(71823)

reg_split <- initial_split(clean_avocado, prop = .75)
reg_train <- training(reg_split)
reg_test <- testing(reg_split)


lm_fit <- linear_reg() |>
  set_engine("lm") |> 
  set_mode("regression") |>
  fit(AveragePrice~.,
      data = reg_train)

lm_fit$fit

summary(lm_fit$fit)

reg_results <- reg_test
reg_results$lm_pred <- predict(lm_fit, reg_test)$.pred

yardstick:: mae(reg_results, AveragePrice, lm_pred)

yardstick:: rmse(reg_results, AveragePrice, lm_pred)


forest_reg_fit <- rand_forest() |> 
  set_engine("ranger") |>
  set_mode("regression") |>
  fit(AveragePrice ~., data = reg_train)

forest_reg_fit$fit

reg_results$forest_pred <- predict(forest_reg_fit, reg_test)$.pred
yardstick:: mae(reg_results, AveragePrice, forest_pred)
yardstick:: rmse(reg_results, AveragePrice, forest_pred)

