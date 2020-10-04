# 00_read_ch_data_sample.R
# Read Companies House company data and save 0.1 percent sample.
# Result is small, easy to view, csv.
# Anthony Savagar

require(tidyverse)

df_full <- read.csv("data/BasicCompanyDataAsOneFile-2020-05-01.csv")

# randomly sample 0.1 percent of the data
df_sample <- df_full %>% 
  slice_sample(prop = 0.001)

write_csv(df_sample,'BasicCompanyDataAsOneFile-2020-05-01_sample.csv')