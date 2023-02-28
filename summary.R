library("dplyr")
library("ggplot2")

spl_data <- read.csv("C:/Users/krvin/OneDrive/School/info/code/a3-spl-checkouts-KingBencent/Checkouts_by_Title.csv")

total_checkout_type <- spl_data %>%
  group_by(MaterialType, CheckoutYear) %>%
  summarize(total_checkouts = sum(Checkouts))

total_checkout_title <- spl_data %>%
  group_by(Title) %>%
  summarize(Checkouts = sum(Checkouts)) %>%
  arrange(desc(Checkouts))

average_checkouts_per_year_title <- spl_data %>%
  group_by(Title, MaterialType) %>%
  summarize(avg_checkouts_per_year = sum(Checkouts)/n_distinct(CheckoutYear))

over_1k_checkouts <- total_checkout_title %>%
  filter(Checkouts > 1000) %>%
  select(Title, Checkouts) %>%
  arrange(desc(Checkouts))

highest_avg_checkouts_per_year <- spl_data %>%
  group_by(Title) %>%
  summarize(total_checkouts = sum(Checkouts), num_years = n_distinct(CheckoutYear)) %>%
  filter(num_years >= 5) %>%
  mutate(avg_checkouts_per_year = total_checkouts/num_years) %>%
  arrange(desc(avg_checkouts_per_year)) %>%
  select(Title, avg_checkouts_per_year)