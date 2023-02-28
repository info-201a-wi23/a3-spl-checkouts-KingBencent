library(ggplot2)
library(dplyr)

spl_data <- read.csv("C:/Users/krvin/OneDrive/School/info/code/a3-spl-checkouts-KingBencent/Checkouts_by_Title.csv")

highest_avg_checkouts_per_year <- spl_data %>%
  group_by(Title, MaterialType) %>%
  summarize(total_checkouts = sum(Checkouts), num_years = n_distinct(CheckoutYear)) %>%
  filter(num_years >= 5) %>%
  mutate(avg_checkouts_per_year = total_checkouts/num_years) %>%
  arrange(desc(avg_checkouts_per_year)) %>%
  select(Title, MaterialType, avg_checkouts_per_year)

top_15 <- highest_avg_checkouts_per_year %>% head(15)

ggplot(top_15, aes(x=reorder(Title, avg_checkouts_per_year), y=avg_checkouts_per_year, fill=MaterialType)) +
  geom_bar(stat="identity", position="dodge") +
  labs(title="Average Checkouts per Year by Material Type and Title",
       x="Title", y="Average Checkouts per Year",
       fill="MaterialType") +
  theme_minimal() +
  theme(legend.position = "bottom",
        plot.title = element_text(size=15, face="bold"),
        axis.title = element_text(size=11, face="bold"),
        axis.text.x = element_text(angle = 30, vjust = 1, hjust = 1),
        legend.title = element_text(size=11, face="bold"))