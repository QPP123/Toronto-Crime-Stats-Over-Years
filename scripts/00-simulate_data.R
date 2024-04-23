#### Preamble ####
# Purpose: Simulates different Major Crimes in a decade
# Author: Kuiyao Qiao
# Date: 28 March 2024
# Contact: kuiyao.qiao@mail.utoronto.ca
# License: MIT
# Pre-requisites: R


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
## This setup will create a structured tabular dataset where each row represents a case of Major Crime in a given year. The dataset was constructed to reflect what might be seen in the Major Crime Indicators in OPEN DATA, i.e., different Crimes in different years. However, to keep the data streamlined, the number has been reduced.

set.seed(1688)  # For reproducibility

# Create a tibble
simulated_data <- tibble(
  id = 1:1000,  # IDs from 1 to 1000
  year = sample(2014:2024, 1000, replace = TRUE),  # Random years between 2014 and 2024
  MCI_CATEGORY = sample(
    c("Assault", "Break and Enter", "Auto Theft", "Theft Over", "Robbery"),
    1000,
    replace = TRUE
  )  # Randomly assigning categories
)

# Arrange the data by id and then by year, both in ascending order
ordered_data <- simulated_data %>%
  arrange(id, year)