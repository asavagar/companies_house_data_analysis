require(tidyverse)
require(lubridate)

df <- read_csv("incorp_date_2020-05-01.csv")

df$IncorporationDate <- as.Date(df$IncorporationDate, "%d/%m/%Y")

df$days <- as.numeric(df$IncorporationDate)

newdata <- df[which(df$days >= 18262), ]

n_incorp <- newdata %>%
  group_by(IncorporationDate) %>%
  count()

n_incorp <- n_incorp %>% rename(day = IncorporationDate)

total_days <- seq(ymd("2020-01-20"), ymd("2020-04-30"), by = "days")

total_days <- tibble(total_days) %>%
  mutate(n = 0) %>%
  rename(day = total_days)

full_period <- full_join(total_days, n_incorp, by = "day")

full_period <- full_period %>% mutate(ni = replace_na(n.y, 0))

full_period <- tibble(date = full_period$day, ni = full_period$ni)

# Exclude outlier days where registrations take place on weekend
# likely admin error
positive <- full_period[which(full_period$ni > 10), ]

med_incorp <- median(positive$ni)
med_incorp_pre_ld <- median(positive[1:50,]$ni)
med_incorp_post_ld <- median(positive[50:73,]$ni)

p <- ggplot(data = full_period, aes(x = date, y = ni)) +
  geom_bar(stat = "identity") +
  geom_hline(aes(yintercept = med_incorp_pre_ld, 
                 color = "Median (pre-lockdown)")) +
  geom_hline(aes(yintercept = med_incorp, 
                 color = "Median (total)")) +
  geom_hline(aes(yintercept = med_incorp_post_ld, 
                 color = "Median (post-lockdown)")) +
  labs(title = "UK Daily Company Incorporations",
     x = "01-01-20 to 31-04-30",
     y = "Number of Incorporations",
     color = NULL)
p

ggsave("new_incorp_barplot.pdf", width = 8, height = 4)
ggsave("new_incorp_barplot.png", width = 8, height = 4)
