#### Preamble ####
# Purpose: Downloads and saves the data from City of Toronto Open Data
# Author: Kuiyao Qiao
# Date: 23 April 2024
# Contact: kuiyao.qiao@mail.utoronto.ca
# License: MIT
# Pre-requisites: R


#### Workspace setup ####
library(opendatatoronto)
library(dplyr)

# Create directory if it does not exist
dir_path <- "data/raw_data/"
if (!dir.exists(dir_path)) {
  dir.create(dir_path, recursive = TRUE)
}

# get package
package <- show_package("major-crime-indicators")
package

# get all resources for this package
resources <- list_package_resources("major-crime-indicators")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
data_path <- paste0(dir_path, "major_crime_indicators.csv")
write.csv(data, data_path, row.names = FALSE)