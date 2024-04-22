#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Kuiyao Qiao
# Date: 28 March 2024
# Contact: kuiyao.qiao@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Simulate data ####
simulate_data <- 
  tibble(
    certainty = floor(runif(n = 1000, min = 0, max = 11)),
    guessed_correct = floor(runif(n = 1000, min = 0, max = 2))
  )

max(simulated_data$certainty) ==10
min(simulated_data$certainty) ==0
unique(simulated_data$certainty) == c(0:1)

max(simulate_data$certainty) == 10
min(simulate_data$certainty) == 0
setequal(unique(simulate_data$certainty), 0:10)