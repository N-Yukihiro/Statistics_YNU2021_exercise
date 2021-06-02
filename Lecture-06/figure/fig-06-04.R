library(ggplot2)
library(dplyr)
data <- bind_rows(
  data.frame(x = 0:20,
             y = dbinom(x = 0:20, size = 20, prob = 0.5),
             prob = "50%"),
  data.frame(x = 0:20,
             y = dbinom(x = 0:20, size = 20, prob = 0.75),
             prob = "75%"))
ggplot(data = data)+
  aes(x = x, y = y, colour = prob) +
  geom_path() +
  geom_vline(xintercept = 15,
             linetype = "dashed") +
  xlab("") +
  ylab("") +
  theme_bw()