library("dplyr")
library("ggplot2")

spl_data <- read.csv("C:/Users/krvin/OneDrive/School/info/code/a3-spl-checkouts-KingBencent/Checkouts_by_Title.csv")

total_checkout_type <- spl_data %>%
  group_by(MaterialType, CheckoutYear) %>%
  summarize(total_checkouts = sum(Checkouts))

ggplot(total_checkout_type, aes(x = CheckoutYear, y = total_checkouts, fill = MaterialType)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Checkouts by Material Type and Year",
       x = "Year",
       y = "Total Checkouts",
       fill = "Material Type") +
  theme_minimal() +
  theme(legend.position = "bottom",
        plot.title = element_text(size = 20, face = "bold"),
        axis.title = element_text(size = 15, face = "bold"),
        axis.text = element_text(size = 12),
        legend.title = element_text(size = 15, face = "bold"))
