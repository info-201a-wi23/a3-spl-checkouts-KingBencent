library("dplyr")
library("ggplot2")

spl_data <- read.csv("C:/Users/krvin/OneDrive/School/info/code/a3-spl-checkouts-KingBencent/Checkouts_by_Title.csv")

total_checkout_title <- spl_data %>%
  group_by(Title) %>%
  summarize(Checkouts = sum(Checkouts)) %>%
  arrange(desc(Checkouts))

over_1k_checkouts <- total_checkout_title %>%
  filter(Checkouts > 1000) %>%
  select(Title, Checkouts) %>%
  arrange(desc(Checkouts)) %>%
  head(10)

ggplot(over_1k_checkouts, aes(x=reorder(Title, Checkouts), y=Checkouts)) +
  geom_col(fill = "skyblue") +
  coord_flip() +
  labs(title = "Top 10 Titles", 
       x = "Title", y = "Total Checkouts") +
  theme_minimal() +
  theme(plot.title = element_text(size=20, face="bold"),
        axis.title = element_text(size=15, face="bold"),
        axis.text = element_text(size=12))
