#### Setup ####
library(tidyverse)
library(rstanarm)


#### Read Data ####

analysis_data <- read.csv("data/analysis_data/analysis_data.csv")


#### Model Data ####
#first model
first_model <-
  stan_glm(
    formula = flying_time ~ length + width,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )

# Save
saveRDS(
  first_model,
  file = "models/first_model.rds"
)


#Second model
second_model <-
  stan_glm(
    formula = flying_time ~ length,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )

prior_summary(second_model)


# Save
saveRDS(
  second_model,
  file = "models/second_model.rds"
)
