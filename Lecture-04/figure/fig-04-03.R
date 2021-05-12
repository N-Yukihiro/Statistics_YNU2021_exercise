library(dplyr)
library(ggplot2)

tate <- function(x){
  chartr("ー", "丨", x) %>%  # 長音符の処理
    strsplit(split="", .) %>% 
    sapply(paste, collapse="\n")
}

expand.grid(1:6, 1:6) %>% 
  as_tibble() %>% 
  mutate(sum = Var1 + Var2)  %>% 
  mutate_at(vars(sum), as.factor) %>% 
  ggplot() +
  aes(x = Var1,
      y = Var2) +
  geom_point() +
  geom_line(aes(colour = sum),
            show.legend = FALSE) +
  scale_x_continuous(breaks = 1:6, name = "1個目のサイコロの目") +
  scale_y_continuous(breaks = 1:6, name = tate("2個目のサイコロの目")) +
  theme_classic(base_size = 20, 
                base_family = "IPAexGothic") +
  theme(axis.title.y = element_text(angle = 0,
                                    vjust= 0.5))