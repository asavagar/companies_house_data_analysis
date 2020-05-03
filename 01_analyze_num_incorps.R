# 01_analyze_num_incorps.R
# Analyze daily number of incorporations and produce graph
# Anthony Savagar

require(tidyverse)
require(lubridate)

# Load data ---------------------------

df <- read_csv("incorp_date_2020-05-01.csv")

df$IncorporationDate <- as.Date(df$IncorporationDate, "%d/%m/%Y")

df$days <- as.numeric(df$IncorporationDate)

newdata <- df[which(df$days >= 18262), ]

# Analyze data ---------------------------

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
positive <- full_period[which(full_period$ni > 10), ]

med_incorp <- median(positive$ni)
med_incorp_pre_ld <- median(positive[1:50,]$ni)
med_incorp_post_ld <- median(positive[50:73,]$ni)

mean_incorp <- mean(positive$ni)
mean_incorp_pre_ld <- mean(positive[1:50,]$ni)
mean_incorp_post_ld <- mean(positive[50:73,]$ni)

avg <- t(tibble(med_incorp, med_incorp_pre_ld, med_incorp_post_ld, mean_incorp,
                mean_incorp_pre_ld, mean_incorp_post_ld))

write.table(avg,file="avg_daily_incorp.txt") 
write.csv(avg,file="avg_daily_incorp.csv") 

# Plot data ---------------------------

p <- ggplot(data = full_period, aes(x = date, y = ni)) +
  geom_bar(stat = "identity") +
  geom_hline(aes(yintercept = med_incorp_pre_ld, 
                 color = "Median (pre-lockdown)")) +
  geom_hline(aes(yintercept = med_incorp, 
                 color = "Median (total)")) +
  geom_hline(aes(yintercept = med_incorp_post_ld, 
                 color = "Median (post-lockdown)")) +
  labs(title = "UK Daily Company Incorporations",
     x = "01-01-20 to 30-04-30",
     y = "Number of Incorporations",
     color = NULL)
p

# Save plots ---------------------------

ggsave("new_incorp_barplot.pdf", width = 8, height = 4)
ggsave("new_incorp_barplot.png", width = 8, height = 4)
