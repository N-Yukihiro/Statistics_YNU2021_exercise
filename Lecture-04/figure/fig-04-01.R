library(dplyr)
library(ggplot2)
sense <- 0.8
spec <- 0.999
data.frame(
  inf = seq(0.001, 0.20 ,by = 0.001)
) %>% 
  mutate(pos = (sense * inf) / (sense * inf + (1 - spec) * (1 - inf))) %>% 
  mutate(neg = (spec * (1-inf)) / (spec * (1 - inf) + (1 - sense) * inf)) %>% 
  ggplot(aes(x = inf)) +
  geom_line(aes(y = pos), colour = "red") +
  geom_line(aes(y = neg), colour = "blue") +
  ylab("的中率") +
  xlab("感染率") +
  theme_bw(base_size = 20, base_family = "IPAexGothic")