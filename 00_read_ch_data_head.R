# 00_read_ch_data_head.R
# Read Companies House company data and save small csv of all variables 
# but limited observations. 
# This gives excel viewable output for sharing.
# Anthony Savagar

require(data.table)
require(tidyverse)

df_full <- read.csv("data/BasicCompanyDataAsOneFile-2020-05-01.csv")

df_head <- head(df_full,5000)

write_csv(df_head,'incorp_date_2020-05-01_head.csv')