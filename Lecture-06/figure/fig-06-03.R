library(ggplot2)
library(dplyr)
data <- bind_rows(
  data.frame(x = 0:4,
             y = dbinom(x = 0:4, size = 4, prob = 0.5),
             prob = "50%"),
  data.frame(x = 0:4,
             y = dbinom(x = 0:4, size = 4, prob = 0.75),
             prob = "75%"))
ggplot(data = data)+
  aes(x = x, y = y, colour = prob) +
  geom_path() +
  geom_vline(xintercept = 3,
             linetype = "dashed") +
  xlab("") +
  ylab("") +
  theme_bw()