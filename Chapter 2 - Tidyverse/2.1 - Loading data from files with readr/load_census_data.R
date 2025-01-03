# This script loads in csv data from the 2021 UK census and saves it as a data frame. 

# loading package dependencies
library(readr)

# generating file path to the census data
filename <- fs::path_package("extdata", "census_2021.csv", package="rbioinfcookbook")

col_names = c("area_code", "country", "region", "area_name", "all_persons", "under_4",
              paste0(seq(5, 85, by=5), "_to_", seq(9, 89, by=5)), 
              "over_90")

# setting data types to columns of interest, defaulting other columns to numeric type
col_types = cols(
  area_code = col_character(), 
  country = col_factor(levels = c("England", "Wales")),
  region = col_factor(levels = c("North East", "Yorkshire Humber", "East Midlands", "West Midlands", "East of England", 
                                 "London", "South East", "South West", "Wales"), ordered = TRUE),
  area_name = col_character(),
  .default = col_number()
)

# reading in data frame from .csv
census_df <- read.csv(filename, skip = 7, col.names = col_names)