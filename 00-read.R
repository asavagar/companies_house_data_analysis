require(data.table)

mycols <- rep("NULL", 55) 

mycols[c(2,15)] <- NA 

df <- read.csv("data/BasicCompanyDataAsOneFile-2020-04-01.csv", 
               colClasses = mycols)

write.csv(df,'incorp_date.csv')