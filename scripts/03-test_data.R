#### Preamble ####
# Purpose: Tests that do not have any incorrect data in the analysis data,Including data, text
# Author: Kuiyao Qiao
# Date: 23 April 2024
# Contact: kuiyao.qiao@mail.utoronto.ca
# License: MIT
# Pre-requisites: # 00-simulate_data.R
                  # 01-download_data.R
                  # 02-data_cleaning.R


#### Workspace setup ####
library(dplyr)
library(readr)

#### Test data ####

# Load data
data_path <- "data/analysis_data/cleaned_major_crime_data.csv"
data <- read_csv(data_path)

# Define test functions
test_report_year <- function(df) {
  all(df$REPORT_YEAR >= 2014 & df$REPORT_YEAR <= 2024)
}

test_report_month <- function(df) {
  valid_months <- c("January", "February", "March", "April", "May", "June", 
                    "July", "August", "September", "October", "November", "December")
  all(df$REPORT_MONTH %in% valid_months)
}

test_report_day <- function(df) {
  all(df$REPORT_DAY >= 1 & df$REPORT_DAY <= 31)
}

test_mci_category <- function(df) {
  valid_categories <- c("Assault", "Break and Enter", "Auto Theft", "Theft Over", "Robbery")
  all(df$MCI_CATEGORY %in% valid_categories)
}

test_id_non_negative <- function(df) {
  all(df$`_id` >= 0)
}

# Execute tests
test_1_result <- test_report_year(data)
test_2_result <- test_report_month(data)
test_3_result <- test_report_day(data)
test_4_result <- test_mci_category(data)
test_5_result <- test_id_non_negative(data)