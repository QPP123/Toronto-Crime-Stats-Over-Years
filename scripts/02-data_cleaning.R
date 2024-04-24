#### Preamble ####
# Purpose: Cleans the raw data from City of Toronto Open Data and remove useless information
# Author: Kuiyao Qiao
# Date: 23 April 2024
# Contact: kuiyao.qiao@mail.utoronto.ca
# License: MIT
# Pre-requisites: R 4.3.2, major-crime-indicators.csv

#### Workspace setup ####
# Install and load necessary libraries
if (!requireNamespace("arrow", quietly = TRUE)) {
  install.packages("arrow")
}
library(dplyr)
library(readr)
library(arrow)

#### Clean data ####
# Load data from the CSV file
file_path <- "data/raw_data/major-crime-indicators.csv"
data <- read_csv(file_path)

# Remove unwanted columns
data_cleaned <- select(data,
                       -EVENT_UNIQUE_ID, -REPORT_DATE, -OCC_DATE, -REPORT_DOW, -OCC_DOW, -NEIGHBOURHOOD_158, -HOOD_140, -NEIGHBOURHOOD_140, -UCR_CODE, -UCR_EXT, -OCC_DOY, -REPORT_HOUR, -OCC_HOUR, -REPORT_DOY, -DIVISION, -HOOD_158)

# Ensure the directory exists
dir_path <- "data/analysis_data/"
if (!dir.exists(dir_path)) {
  dir.create(dir_path, recursive = TRUE)
}

#### Save data ####
data_path <- paste0(dir_path, "cleaned_major_crime_data.csv")
write_csv(data_cleaned, data_path)
data_path <- paste0(dir_path, "cleaned_major_crime_data.parquet")
write_parquet(data_cleaned, data_path)