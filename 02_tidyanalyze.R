require(tidyverse)
require(lubridate)
# df <- df %>% mutate(date = dmy(IncorporationDate))

df <- read_csv("incorp_date.csv")

df$IncorporationDate <- as.Date(df$IncorporationDate, "%d/%m/%Y")

df$days <- as.numeric(df$IncorporationDate)
# The base date is 1970-01-01
# basedate <- df[ which(df$days >= 0), ]

# 20 Jan 2020 is 18281

newdata <- df[which(df$days >= 18280),]

n_incorp <- newdata %>%
  group_by(IncorporationDate) %>%
  count()

n_incorp <- n_incorp %>% rename(day = IncorporationDate)

total_days <- seq(ymd("2020-01-20"), ymd("2020-03-31"), by = "days")

total_days <- tibble(total_days) %>%
  mutate(n = 0) %>%
  rename(day = total_days)

full_period <- full_join(total_days, n_incorp, by = "day")

full_period <- full_period %>% mutate(ni = replace_na(n.y, 0))

df <- tibble(date = full_period$day, ni = full_period$ni)

p <- ggplot(data = df, aes(x = date, y = ni)) +
  geom_bar(stat = "identity") + ggtitle("UK Daily Company Incorporations") +
  xlab("20-01-20 to 31-03-20 (72 days)") + ylab("Number of Incorporations")
p

ggsave("new_incorp_barplot.pdf")

