# 00_read_ch_data.R
# Read Companies House company data and save small csv of relevant variables
# Anthony Savagar

require(data.table)
require(tidyverse)

mycols <- rep("NULL", 55) 

mycols[c(2,15)] <- NA 

df <- read.csv("data/BasicCompanyDataAsOneFile-2020-05-01.csv", 
               colClasses = mycols)

write_csv(df,'incorp_date_2020-05-01.csv')