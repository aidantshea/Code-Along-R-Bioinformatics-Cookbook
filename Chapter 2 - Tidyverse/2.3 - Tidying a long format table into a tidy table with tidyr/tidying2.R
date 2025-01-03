# This script performs the opposite operation to 2.2, pivoting a long format table
# into one with more columns and less row.

library(rbioinfcookbook)
library(tidyr)

df = treatments
wide_df = df |>
  pivot_wider(
    names_from = measurement,
    values_from = value
  )