require(ggplot2)

df <- read.csv("incorp_date.csv")

df$IncorporationDate <- as.Date(df$IncorporationDate, "%d/%m/%Y")

df$days <- as.numeric(df$IncorporationDate)

# The base date is 1970-01-01
# basedate <- df[ which(df$days >= 0), ]
# 20 Jan 2020 is 18281

newdata <- df[ which(df$days >= 18280), ]

q <- ggplot(newdata, aes(IncorporationDate))
q <- q + geom_histogram(colour = "white", bins = 72) + ggtitle("UK Daily Company Incorporations") +
  xlab("Days from 20-01-20 to 31-03-20 (72 days)") + ylab("Number of Incorporations")
q