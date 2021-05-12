library(dplyr)
library(ggplot2)
expand.grid(1:6, 1:6) %>% 
  as_tibble() %>% 
  ggplot() +
  aes(x = Var1,
      y = Var2) +
  geom_point() +
  scale_x_continuous(breaks = 1:6, name = "1個目のサイコロの目") +
  scale_y_continuous(breaks = 1:6, name = "2個目のサイコロの目") +
  theme_classic(base_size = 20, 
                base_family = "IPAexGothic")